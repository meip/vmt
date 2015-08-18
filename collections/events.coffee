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

Events.attachSchema(Schemas.Events)

Events.helpers
  helpertaskDescription: ->
    Helpertasks.findOne(@doc)?.description

TabularTables.Events = new Tabular.Table
  name: "EventsList"
  collection: Events
  columns: [
    {data: "id",          title: "Event ID"}
    {data: "title",       title: "Title"}
    {data: "location",    title: "Locaiton"}
    {data: "description", title: "Description"}
    {data: "gameCode",    title: "Game Code"}
    {data: "startDate",   title: "Start Date"}
    {data: "endDate",     title: "End Date"}
    {
      tmpl: Meteor.isClient && Template.editEventButton
    }
  ]