Router.map ->
  @route "eventEdit",
    path: "/event/:_id"
    waitOn: ->
      [
        Meteor.subscribe 'events'
      ]
    data: -> Events.findOne({_id: this.params._id})

  @route "eventList",
    path: "/events"
    waitOn: ->
      [
        Meteor.subscribe 'events'
      ]
    data: ->
      events: Events.find().fetch()