var browser = require('cordova/platform');

var AlertMessagesProxy = {
    echo: function () {
        alert("HALLO");
    }
};
module.exports = AlertMessagesProxy;

require("cordova/exec/proxy").add("AlertMessages", module.exports);