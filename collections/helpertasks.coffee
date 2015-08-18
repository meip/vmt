@Helpertasks = new Meteor.Collection('helpertasks');

Schemas.Helpertasks = new SimpleSchema
  description:
    type: String
    autoform:
      rows: 5

  startTime:
    type: Date

  endTime:
    type: Date

  numPersons:
    type: Number
    regEx: /[0-9]{1,3}/

  helpertaskType:
    type: String
    regEx: SimpleSchema.RegEx.Id
    autoform:
      options: ->
        _.map HelpertaskTypes.find().fetch(), (helpertaskType)->
          label: helpertaskType.title
          value: helpertaskType._id

  event:
    type: String
    regEx: SimpleSchema.RegEx.Id
    autoform:
      options: ->
        _.map Events.find().fetch(), (event)->
          label: event.title
          value: event._id

  owner:
    type: String
    regEx: SimpleSchema.RegEx.Id
    autoValue: ->
      if this.isInsert
        try
          Meteor.userId()
        catch error
          Meteor.users.findOne('emails.address': 'admin@fbriders.ch')._id
    autoform:
      options: ->
        _.map Meteor.users.find().fetch(), (user)->
          label: user.emails[0].address
          value: user._id

  createdAt:
    type: Date
    autoValue: ->
      if this.isInsert
        new Date()

  updatedAt:
    type: Date
    optional: true
    autoValue: ->
      if this.isUpdate
        new Date()

Helpertasks.attachSchema(Schemas.Helpertasks)

Helpertasks.helpers
  helpertaskTypeTitle: ->
    HelpertaskTypes.findOne(this.helpertaskType).title
  eventData: ->
    Events.findOne(this.event)
