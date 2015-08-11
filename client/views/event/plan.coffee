Template.eventsplan.events
  'click .js-plan-foo': ->
    Meteor.call 'eventImport'
  'click .js-plan-edit': ->
    Meteor.call 'editEvent', this

