Meteor.publish 'user', ->
	Meteor.users.find this.userId

Meteor.publish 'users', ->
	Meteor.users.find {}, {fields: {profile: 1, emails: 1}}
