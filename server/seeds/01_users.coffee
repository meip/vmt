createUser = (email, password, role, name, logo) ->
  adminEmail = email
  admin = Meteor.users.findOne('emails.address': adminEmail)
  if !admin?
    console.log 'Creating ' + name + ' account.'
    userId = Accounts.createUser(
      email: adminEmail
      password: password
      profile:
        firstName: name
        avatar: logo
        birthday: new Date 1989, 12, 15
        phones: [
            countryCode: 41
            number: 123456789
          ,
            countryCode: 41
            number: 123456789
        ]
    )
    if userId
      Roles.addUsersToRoles userId, [role]
      Meteor.users.update {_id: userId}, $set:
        'enabled': true
  else
    console.log name + ' account exists.'
  return

Meteor.startup ->
  createUser 'admin@fbriders.ch', 'admin', 'admin', 'admin', 'logo.svg'
  createUser 'planer@fbriders.ch', 'planer', 'planer', 'planer', 'logo.svg'
  createUser 'member@fbriders.ch', 'member', 'member', 'member', 'logo.svg'
  return