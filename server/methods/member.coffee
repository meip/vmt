Meteor.methods
  memberImport: ->
    console.log "Start with members import"
    HTTP.call 'GET', 'http://demo.webling.ch/export/member.csv', {auth: "demo:webling"}, (error, result) ->
      if !error
        console.log "API - Webling success"
        # console.log result
        csv = result.content
        parsed = Baby.parse csv
        _.forEach _.rest(parsed.data), (importMember) ->
          firstname = importMember[1]
          lastname = importMember[2]
          email = importMember[8]
          phone = parsePhone(importMember[7])
          birthday = parseSwissDate(importMember[11])
          console.log 'Importing ' + firstname + ' ' + lastname + ' '  + email + ' ' + phone + ' ' + birthday
          existing = Meteor.users.findOne('emails.address': email)
          if !existing?
            console.log 'Importing ' + firstname + ' ' + lastname + ' account.'
            try
              userId = Accounts.createUser(
                email: email
                profile:
                  firstName: firstname
                  lastName: lastname
                  birthday: birthday
                  phones: [
                    countryCode: 41
                    number: phone
                  ]
              )
              if userId
                Meteor.users.update({_id: userId}, $set:
                  'enabled': true
                )
            catch error
              console.log error
          console.log importMember

        return parsed
      else
        console.log error
      return

parseSwissDate = (input) ->
  parts = input.split('.')
  # new Date(year, month [, day
  new Date(parts[2], parts[1] - 1, parts[0])

parsePhone = (input) ->
  input = input.substr(1).replace(/\s/g, '')