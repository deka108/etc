# Python

## Version Management

Preferred Tool: [pyenv](https://github.com/pyenv/pyenv)

How to Install: `brew install pyenv`

## Installing Python

`pyenv install 3.7 2.7 && pyenv global 3.7 2.7`

## Dependency Management

Preferred Tool: [pipenv](https://github.com/pypa/pipenv)

How to Install: `pip install pipenv` (so that I can change pipenv versions easily)

Notes:

- For packages that is installed globally, use `pip`
- For packages that are installed local to a project, use `pipenv`

### Debugging failed installations in Pipenv

https://pipenv.readthedocs.io/en/latest/diagnose/

```pipenv --rm # Deletes the virtualenv
pipenv lock --clear # Removes cache
pipenv clean # Clean unused packages

rm -rf ~/Library/Caches/pipenv
rm -rf ~/.cache/pipenv
rm Pipfile.lock
```

## IDE

Preferred ATool: [PyCharm](https://www.jetbrains.com/pycharm/)

How to Install:

| Version | Install Command |
| --- | --- |
| Community Edition | `brew cask install pycharm-ce` |
| Ultimate | `brew cask install pycharm` |

https://www.jetbrains.com/pycharm/download/#section=mac

## Exploration / Interactive Tools

|  Tool  | Install Command |
| --- | --- |
| [IPython](https://ipython.org/) | `pipenv install ipython` |
| [Jupyter Lab](https://jupyter.org/hub) | `pipenv install jupyterlab` |
| [Jupyter Notebook](https://jupyter.org/documentation) | `pipenv install jupyter` |

## Data Science Tools

|  Usage  |  Tools  |
| --- | --- |
| Maths and statistics | , , statsmodels |
| Visualizations | matplotlib, seaborn, plotly |
| Machine Learning Models | scikit-learn |
| Neural Network | tensorflow, keras, pytorch |
| Interactive Visualizations | Dash-plotly |

## Common Libraries

### Maths and Statistics

| Package | How to install |
| --- | --- |
| [numpy](http://www.numpy.org/) | `pipenv install numpy` |
| [scipy](https://www.scipy.org/) | `pipenv install scipy` |
| [statsmodels](https://www.statsmodels.org/stable/index.html) | `pipenv install statsmodels` |

### Data Processing and Wrangling

| Package | How to install |
| --- | --- |
| [pandas](https://pandas.pydata.org/) | `pipenv install pandas` |
| [pyspark](https://spark.apache.org/docs/latest/) | See below |

### Visualizations

| Package | How to install |
| --- | --- |
| [matplotlib](https://matplotlib.org/) | `pipenv install matplotlib` |
| [seaborn](https://seaborn.pydata.org/) | `pipenv install seaborn` |
| [plotly](https://plot.ly/) | `pipenv install plotly` |

### Machine Learning

| Package | How to install |
| --- | --- |
| [scikit-learn](https://scikit-learn.org/) | `pipenv install scikit-learn` |

### Neural Network

| Package | How to install |
| --- | --- |
| [tensorflow](https://www.tensorflow.org/) | `pipenv install tensorflow` |
| [keras](https://keras.io/) | `pipenv install keras` |
| [pytorch](https://pytorch.org/) | `pipenv install torch torchvision` |

### Interactive Dashboard and Visualizations

| Package | How to install |
| --- | --- |
| [Dash Plotly](https://plot.ly/products/dash/) | `pipenv install dash dash-html-components dash-core-components dash-table dash-daq` |

### [pyspark](https://spark.apache.org/docs/latest/)

Ensure that [python](#installing-python) and [spark](../java/README.md#jvm\-based-language-and-framework) is installed

Documentations:

- https://spark.apache.org/docs/latest/api/python/index.html

#### pyspark explorations

To explore and run pyspark, we have two options:

##### Exploration with [Apache Zeppelin](https://zeppelin.apache.org/)

1. Install Apache Zeppelin: `brew install apache-zeppelin`
2. Run Zeppelin: `zeppelin-daemon.sh start`

##### Exploration with Jupyter Notebook

 1. Ensure you've [installed jupyter / jupyterlab](#exploration-tools)
 2. Follow [this instruction](https://blog.sicara.com/get-started-pyspark-jupyter-guide-tutorial-ae2fe84f594f) to setup pyspark with jupyter

[This article](http://queirozf.com/entries/comparing-interactive-solutions-for-running-apache-spark-zeppelin-spark-notebook-and-jupyter-scala) compare and contrast the benefits and disadvantages of using either Apache Zeppelin or Jupyter Notebook

## Testing

Preferred Tool: [pytest](https://docs.pytest.org/en/latest/)

How to Install: `pipenv install --dev pytest`

## Server-side Development

### Framework and Tools

|  Tool  |  Usage  |
| --- | --- |
| [Marshmallow](https://github.com/marshmallow-code/marshmallow) | a Marshalling library for converting complex datatypes to and from native Python datatypes  |
| [webargs](https://github.com/marshmallow-code/webargs) | Library for parsing and validating HTTP request arguments, used in conjunction with Marshmallow |

### [Flask](http://flask.pocoo.org/)

|  Tool  |  Usage  |
| --- | --- |
| [Flask-RESTPlus](https://github.com/noirbizarre/flask-restplus) | Flask extension for building REST APIs |
| [flasgger](https://github.com/rochacbruno/flasgger) | Integrate [OpenAPI specs](https://github.com/OAI/OpenAPI-Specification) and Swagger UI for Flask APIs |
| [pytest-flask](https://pytest-flask.readthedocs.io/en/latest/) | Testing flask apps |

References:

| Documentation | Resources |
| --- | --- |
| Flask Testing | http://flask.pocoo.org/docs/1.0/testing/#the-testing-skeleton |
| Creating flask extensions - useful for modularizing the APIs and testing | http://flask.pocoo.org/docs/1.0/extensiondev/ |
| Scaling applications: using API namespaces or blueprints | https://flask-restplus.readthedocs.io/en/stable/scaling.html |

### WSGI HTTP Server

Preferred Tool: https://gunicorn.org/