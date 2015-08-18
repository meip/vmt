Router.map ->
  @route "home",
    path: "/"
    layoutTemplate: "homeLayout"
    onBeforeAction: () ->
      if (Meteor.userId())
        this.redirect('dashboard')
      else
        this.next();

  @route "dashboard",
    path: "/dashboard"
    waitOn: ->
      [
        subs.subscribe 'events'
      ]
    data: ->
      eventsData: Events.find().fetch()

  @route "memberimport",
    path: "/member/import"
    waitOn: ->
      [
        Meteor.subscribe 'users'
      ]
    data: ->
      members: Meteor.users.find().fetch()

Router.waitOn ->
  [
    Meteor.subscribe 'users'
    Meteor.subscribe 'events'
    Meteor.subscribe 'helpertasks'
    Meteor.subscribe 'helpertaskTypes'
    Meteor.subscribe 'skills'
  ]