var resolutions = require('resolutions');
import { version } from 'modules/example_module';
import ExampleReactComponent from 'components/example_react_component';
import React from 'react';
import TestUtils from 'react-addons-test-utils';

describe('example test', function() {

  it('tests something', function() {
    expect(true).toEqual(true);
  });

  it('allows requiring a module', function() {
    expect(version).toEqual('0.1');
  });

  it('loads a simple react component', function() {
    var exampleComponent = TestUtils.renderIntoDocument(
        <ExampleReactComponent />
    );

    var h1 = TestUtils.findRenderedDOMComponentWithTag(
        exampleComponent, 'h1'
    );

    expect(h1.getDOMNode().textContent).toEqual("This is an example component");
  });

});
