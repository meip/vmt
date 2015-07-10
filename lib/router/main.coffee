Router.map ->
  @route "home",
    path: "/"
    layoutTemplate: "homeLayout"

  @route "dashboard",
    path: "/dashboard"
    waitOn: ->
      [
        subs.subscribe 'events'
      ]
    data: ->
      events: Events.find().fetch()

  @route "eventsplan",
    path: "/events/plan"
    waitOn: ->
      [
        Meteor.subscribe 'events'
      ]
    data: ->
      events: Events.find().fetch()

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
    Meteor.subscribe 'user'
    Meteor.subscribe 'events'
    Meteor.subscribe 'helpertasks'
    Meteor.subscribe 'helpertaskTypes'
    Meteor.subscribe 'skills'
  ]