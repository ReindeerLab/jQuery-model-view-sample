global.$ = global.jQuery = require 'jquery'
bootstrap = require 'bootstrap'
indexView = require './view/index-view.coffee'

$ ->
  indexView()
