LeanStacksApp.module 'Content', (Content, LeanStacksApp, Backbone, Marionette, $, _) ->

  # Define the Router for the Content module
  class ContentRouter extends Marionette.AppRouter

    appRoutes:
      'home': 'showHome'
      'about': 'showAbout'
      'books': 'showBooks'

  # Define the Controller for the Content module
  class ContentController extends Marionette.Controller

    showHome: ->
      logger.debug "ContentController.showHome"
      LeanStacksApp.navigate 'home'
      homeView = new Content.HomeView
      LeanStacksApp.contentRegion.show homeView

    showAbout: ->
      logger.debug "ContentController.showAbout"
      LeanStacksApp.navigate 'about'
      aboutView = new Content.AboutView
      LeanStacksApp.contentRegion.show aboutView

    showBooks: ->
      logger.debug "ContentController.showBooks"
      LeanStacksApp.navigate 'books'
      booksView = new Content.BooksView
      LeanStacksApp.contentRegion.show booksView


  # Create an instance
  controller = new ContentController


  # When the module is initialized...
  Content.addInitializer ->
    logger.debug "Content initializer"
    router = new ContentRouter
      controller: controller
    controller.showHome()


  # Handle Application Messaging
  LeanStacksApp.commands.setHandler 'content:home', ->
    controller.showHome()

  LeanStacksApp.commands.setHandler 'content:about', ->
    controller.showAbout()

  LeanStacksApp.commands.setHandler 'content:books', ->
    controller.showBooks()
