@Skills = new Meteor.Collection('skills');

Schemas.Skills = new SimpleSchema

  title:
    type: String

  description:
    type: String
    autoform:
      rows: 5

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

Skills.attachSchema(Schemas.Skills)

Skills.helpers helperTasksTypes: ->
  HelpertaskTypes.find skill: @_id