# Javascript

## Version Management

Preferred Tool: [nvm](https://github.com/creationix/nvm)

Installation and Setup:

```bash
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

# This loads nvm, should be added to ~/.zshrc or ~/.bashrc or ~/custom.zsh
export NVM_DIR="${XDG_CONFIG_HOME/:-$HOME/.}nvm" [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
```

## Installing Node.js

`nvm install node && nvm use node`

## Dependency Management

Preferred Tool: [yarn](https://github.com/yarnpkg/yarn)

How to Install: `brew install yarn --ignore-dependencies`

## IDE

Preferred Tool: [Visual Studio Code](https://code.visualstudio.com/)

## Frontend

### React

#### Scaffolding Tool

|  Usage  |  Tool  |
| --- | --- |
| Simple toolkit for static HTML/JS/CSS | [Eleventy](https://www.11ty.dev/docs/) |
| Toolkit that produce static HTML/JS/CSS bundles, backend agnostic | [Create React App](https://github.com/facebook/create-react-app) |
| Toolkit for producng Server Rendering React apps | [Next.js](https://github.com/zeit/next.js/) |
| Toolkit for mostly static React apps | [Gatsby](https://www.gatsbyjs.org/) |

#### State Management

| Usage | Tool |
| --- | --- |
| Predictable state container for JavaScript apps | [Redux](https://github.com/reduxjs/redux) |
| Declarative Routing | [React-Router](https://github.com/ReactTraining/react-router) |
| Selector library | [Reselect](https://github.com/reduxjs/reselect) | 
| Asynchronous Actions | [Redux-Saga](https://github.com/redux-saga/redux-saga) |

### Data Visualizations

Preferred Tools:

- [HighCharts](https://github.com/highcharts/highcharts)
- [Plotly.js](https://github.com/plotly/plotly.js/)