Schemas.UserProfile = new SimpleSchema(
  firstName:
    type: String
    optional: true

  lastName:
    type: String
    optional: true

  birthday:
    type: Date
    optional: true

  phones:
    type: [Object]
    optional: true

  "phones.$.countryCode":
    type: Number
    regEx: /[0-9]{1,3}/

  "phones.$.number":
    type: Number
    regEx: /[0-9]{5,14}/
)

Schemas.User = new SimpleSchema(
  username:
    type: String
    regEx: /^[a-z0-9A-Z_]{3,15}$/
    optional: true

  emails:
    type: [Object]
    optional: true

  "emails.$.address":
    type: String
    regEx: SimpleSchema.RegEx.Email

  "emails.$.verified":
    type: Boolean

  teams:
    type: [String]
    regEx: SimpleSchema.RegEx.Id
    optional: true
    autoform:
      options: ->
        _.map Teams.find().fetch(), (team)->
          label: team.title
          value: team._id

  profile:
    type: Schemas.UserProfile
    optional: true

  services:
    type: Object
    optional: true
    blackbox: true

  roles:
    type: [String]
    blackbox: true
    optional: true

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
)

Meteor.users.attachSchema Schemas.User

# Export schemas
@StarterSchemas = Schemas

TabularTables.Members = new Tabular.Table
  name: "MembersList"
  collection: Meteor.users
  columns: [
    {data: "_id",                 title: "User ID"}
    {data: "profile.firstName",   title: "Firstname"}
    {data: "profile.lastName",    title: "Lastname"}
    {data: "profile.birthday",    title: "Birthday", render: (val, type, doc) ->
      if (val instanceof Date)
        moment(val).calendar();
      else
        return val;
    }
  ]