LeanStacksApp.module 'Header', (Header, LeanStacksApp, Backbone, Marionette, $, _) ->

  class Header.HeaderView extends Backbone.Marionette.ItemView

    template: 'header'

    className: 'container'

    ui:
      navigation: '.js-nav'

    events:
      'click @ui.navigation': 'onNavigationClicked'

    onNavigationClicked: (e) ->
      #e.preventDefault()
      #e.stopPropagation()
      @$el.find('li.active').each ->
        $(@).removeClass 'active'
      $(e.target).parent().addClass 'active'
      commandName = $(e.target).attr 'data-nav-target'
      LeanStacksApp.execute commandName
