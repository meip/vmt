Meteor.methods
  memberImport: ->
    console.log "Start with members import"
    HTTP.call 'GET', 'http://demo.webling.ch/export/member.csv', {auth: "demo:webling"}, (error, result) ->
      if !error
        console.log "API - Webling success"
        console.log result
        csv = result.content
        parsed = Baby.parse csv
        console.log parsed
      else
        console.log error
      return
