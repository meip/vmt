Template.memberimport.events
  'click .js-import-member': ->
    Meteor.call 'memberImport'