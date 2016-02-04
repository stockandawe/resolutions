import React from 'react';
import ReactDOM from 'react-dom';
import ExampleReactComponent from 'components/example_react_component' ;
import globals from 'globals';

module.exports = function () {
  // register components
  RESOLUTIONS.react.registerComponent('ExampleReactComponent', ExampleReactComponent);

  // load react components from DOM
  findReactNodes().each((i, elem) => {
    let $elem = $(elem),
        componentName = $elem.data('options').name;

    ReactDOM.render(
      React.createElement(RESOLUTIONS.react.components[componentName]),
      elem
    );
  })

  console.log('App is loaded');
}

function findReactNodes() {
  if($) {
    return $("div[data-integration-name='react-component']");
  } else {
    console.error("jQuery is not loaded");
  }
}
