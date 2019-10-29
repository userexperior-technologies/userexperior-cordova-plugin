cordova.define('cordova/plugin_list', function(require, exports, module) {
  module.exports = [
    {
      "id": "userexperior-cordova-plugin.UserExperiorPlugin",
      "file": "plugins/userexperior-cordova-plugin/www/UserExperiorPlugin.js",
      "pluginId": "userexperior-cordova-plugin",
      "clobbers": [
        "UserExperior"
      ]
    }
  ];
  module.exports.metadata = {
    "cordova-plugin-whitelist": "1.3.4",
    "userexperior-cordova-plugin": "0.2.1"
  };
});