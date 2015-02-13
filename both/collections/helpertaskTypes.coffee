@HelpertaskTypes = new Meteor.Collection('helpertaskTypes');

Schemas.HelpertaskTypes = new SimpleSchema

  title:
    type: String

  description:
    type: String
    autoform:
      rows: 5

  minimumAge:
    type: Number
    regEx: /[0-9]{1,2}/

  skills:
    type: [String]
    regEx: SimpleSchema.RegEx.Id
    optional: true
    autoform:
      options: ->
        _.map Skills.find().fetch(), (skill)->
          label: skill.title
          value: skill._id

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

HelpertaskTypes.attachSchema(Schemas.HelpertaskTypes)