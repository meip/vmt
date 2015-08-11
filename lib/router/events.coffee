Router.map ->
  @route "eventdetail",
    path: "/event/:_id"
    waitOn: ->
      [
        Meteor.subscribe 'events'
      ]
    data: ->
      events: Events.find().fetch()

  @route "eventjoin",
    path: "/event/:_id/join"
    waitOn: ->
      [
        Meteor.subscribe 'events'
      ]
    data: -> Events.findOne({_id: this.params._id})

  @route "eventplan",
    path: "/event/:_id/plan"
    waitOn: ->
      [
        Meteor.subscribe 'events'
      ]
    data: ->
      events: Events.find().fetch()