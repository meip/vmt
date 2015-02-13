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

  createdAt:
    type: Date

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
)

Meteor.users.attachSchema Schemas.User

# Export schemas
@StarterSchemas = Schemas