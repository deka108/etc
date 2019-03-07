#!/usr/bin/env bash

PY_VERSION=3.7.1
PROGRAMS=(pyenv pipenv git gcloud docker kubectl cookiecutter envsubst jq)
GIT_INFO="Ensure you've connected your github account with ssh per this article:
https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/"

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
bold=`tput bold`

unameOut=`uname -s`
case $unameOut in
    Linux*)     machine=linux;;
    Darwin*)    machine=mac;;
    *)          >&2 echo "UNKNOWN:${unameOut}"; exit 1; ;;
esac

install_gcloud(){
    curl https://sdk.cloud.google.com | bash
    exec -l $SHELL
    gcloud init
}

setup_package(){
    case $1 in
        pyenv)
            if [[ -z `pyenv versions | grep ${PY_VERSION}` ]]; then
                echo "Installing python..."
                pyenv install ${PY_VERSION}
            fi;
            pyenv global ${PY_VERSION};
            ;;
        gcloud)
            gcloud auth application-default print-access-token > /dev/null 2>&1 || gcloud auth login
            gcloud components update
            [[ -n ${GCP_PROJECT_ID} ]] && {
                gcloud config set project ${GCP_PROJECT_ID}
            }
            ;;
        git)
            if ! ls ~/.ssh/id_* &> /dev/null; then
                >&2 echo "Error: ${GIT_INFO}"; exit 1;
            fi
            ;;
        pipenv) pip install pipenv --upgrade ;;
    esac
}

setup_mac(){
    if ! command -v "brew" > /dev/null 2>&1; then
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi

    for program in "${PROGRAMS[@]}"; do
        if ! command -v "$program" > /dev/null 2>&1; then
            echo "$program is not yet installed"
            case $program in
                gcloud) install_gcloud ;;
                kubectl) gcloud components install kubectl ;;
                cookiecutter) pip install cookiecutter --upgrade;;
                git) brew install git && echo ${GIT_INFO} ;;
                envsubst) brew install gettext && brew link --force gettext ;;
                pipenv) pip install pipenv ;;
                *) brew install ${program} ;;
            esac
        fi
       setup_package ${program}
    done
}

setup_linux(){
    for program in "${PROGRAMS[@]}"; do
        if ! command -v "$program" > /dev/null 2>&1; then
            echo "$program is not yet installed"

            case $program in
                gcloud) install_gcloud ;;
                kubectl) gcloud components install kubectl ;;
                pyenv)
                    curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash;
                    echo 'export PATH="~/.pyenv/bin:$PATH"' >> ~/.bashrc;
                    echo 'eval "$(pyenv init -)"' >> ~/.bashrc;
                    echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc;
                    source ~/.bashrc;
                    pyenv update;
                    export PATH="~/.pyenv/bin:$PATH";
                    eval "$(pyenv init -)";
                    eval "$(pyenv virtualenv-init -)";
                    ;;
                envsubst) sudo apt-get update && sudo apt-get install -y gettext-base;;
                git) sudo apt-get update && sudo apt-get install -y git && echo ${GIT_INFO};;
                pipenv) pip install pipenv ;;
                cookiecutter) pip install cookiecutter --upgrade;;
                jq) sudo apt-get install jq ;;
                docker)
                    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -;
                    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable";
                    sudo apt-get update;
                    apt-cache policy docker-ce;
                    sudo apt-get install -y docker-ce;
            esac
        fi
        setup_package ${program}
    done
}

if [[ ${machine} == mac ]]; then
    echo "Setting up required packages on mac: ${PROGRAMS}..."
    setup_mac
elif [[ ${machine} == linux ]]; then
    echo "Setting up required packages on linux: ${PROGRAMS}..."
    setup_linux
fi

printf "\n"
echo "Your development workspace is ${green}setup${reset} successfully!"
printf "\n"
echo "To start developing your project: "
echo "- If you haven't created your project, create a new delphi project by running \`${bold}${green}make create-project${reset}\`"
echo "- After the project is created, \`${green}${bold}cd${reset}\` to the root directory of the project that you want \
to develop then run \`${green}${bold}make setup-project${reset}\`."
