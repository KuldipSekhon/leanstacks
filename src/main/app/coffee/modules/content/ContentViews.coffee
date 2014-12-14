LeanStacksApp.module 'Content', (Content, LeanStacksApp, Backbone, Marionette, $, _) ->

  class Content.HomeView extends Backbone.Marionette.ItemView

    template: 'home'

    className: 'container'


  class Content.AboutView extends Backbone.Marionette.ItemView

    template: 'about'

    className: 'container'


  class Content.BooksView extends Backbone.Marionette.ItemView

    template: 'books'

    className: 'container'
