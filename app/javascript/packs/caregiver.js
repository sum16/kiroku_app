require('jquery')
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

var jQuery = require('jquery')
global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;


import "../caregiver/customer_form.js"
import "../caregiver/entries_form.js"
import "../caregiver/messages.js";

