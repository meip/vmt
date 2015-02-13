Meteor.publish 'events', ->
  Events.find()

Meteor.publish 'helpertasks', ->
  Helpertasks.find()

Meteor.publish 'helpertaskTypes', ->
  HelpertaskTypes.find()

Meteor.publish 'skills', ->
  Skills.find()