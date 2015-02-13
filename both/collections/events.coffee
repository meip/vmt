@Events = new Meteor.Collection('events');

Schemas.Events = new SimpleSchema
  title:
    type: String

  location:
    type: String

  description:
    type: String
    autoform:
      rows: 5

  gameCode:
    type: Number
    regEx: /[0-9]{1,3}/

  organizerCode:
    type: Number
    regEx: /[0-9]{1,3}/

  startDate:
    type: Date
    autoValue: ->
      if this.isInsert
        new Date()

  endDate:
    type: Date
    autoValue: ->
      if this.isInsert
        new Date()

  deadlineDate:
    type: Date
    autoValue: ->
      if this.isInsert
        new Date()

  helpertasks:
    type: [String]
    regEx: SimpleSchema.RegEx.Id
    optional: true
    autoform:
      options: ->
        _.map Helpertasks.find().fetch(), (helpertask)->
          label: helpertask.title
          value: helpertask._id


  owner:
    type: String
    regEx: SimpleSchema.RegEx.Id
    autoValue: ->
      if this.isInsert
        Meteor.userId()
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

Events.attachSchema(Schemas.Events)