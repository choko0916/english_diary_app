// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "@nathanvda/cocoon"
import jquery from "jquery"
window.$ = jquery
window.jQuery = jquery
import "controllers"
import "./custom/layout.js";
