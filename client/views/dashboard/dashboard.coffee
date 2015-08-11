Template.dashboard.events
  'click .js-event-plan-delete': ->
    Meteor.call 'eventDelete', this

