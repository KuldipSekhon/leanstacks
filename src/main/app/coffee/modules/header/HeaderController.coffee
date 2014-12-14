LeanStacksApp.module 'Header', (Header, LeanStacksApp, Backbone, Marionette, $, _) ->

  # Define the Controller for the Header module
  class HeaderController extends Marionette.Controller

    show: ->
      logger.debug "HeaderController.show"
      headerView = new Header.HeaderView()
      LeanStacksApp.headerRegion.show headerView


  # Create an instance
  controller = new HeaderController()


  # When the module is initialized...
  Header.addInitializer ->
    logger.debug "Header initializer"
    controller.show()
