# Customize the Renderer to use Namespacing
Backbone.Marionette.Renderer.render = (template, data) ->
  LeanStacksTemplates[template](data)


# Create the Application
window.LeanStacksApp = new Backbone.Marionette.Application


# Navigate to a route
LeanStacksApp.navigate = (route, options) ->
  logger.debug "LeanStacksApp.navigate route: #{ route }"
  options || ( options = {} )
  Backbone.history.navigate route, options
  LeanStacksApp.vent.trigger 'navigate', route


# Retrieve the current route
LeanStacksApp.getCurrentRoute = () ->
  Backbone.history.fragment


# Create the top-level Regions
LeanStacksApp.addRegions
  headerRegion  : '#header-region'
  contentRegion : '#content-region'
  dialogRegion  : '#dialog-region'
  footerRegion  : '#footer-region'


# Application start Callback Function
LeanStacksApp.on 'start', (options) ->
  # Initialize the Router
  logger.debug "Backbone.history.start"
  Backbone.history.start()

  # Launch the Default View
  if LeanStacksApp.getCurrentRoute() is ''
    LeanStacksApp.execute 'content:home'


# Start the Application
$ ->
  # Configure log4javascript Library
  window.logger = log4javascript.getLogger()
  consoleAppender = new log4javascript.BrowserConsoleAppender()
  consoleAppender.setLayout new log4javascript.PatternLayout '%d{HH:mm:ss} %-5p - %m'
  window.logger.addAppender consoleAppender

  # Start Marionette Application
  logger.debug "LeanStacksApp.start"
  LeanStacksApp.start()
