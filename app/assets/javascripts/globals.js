var RESOLUTIONS = {
  react: {
    components: {},
    registerComponent: function(name, component) {
      RESOLUTIONS.react.components[name] = component;
    }
  }
}
