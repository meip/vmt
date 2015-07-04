Meteor.startup ->
  _.forEach eventsSeed, (seed) ->
    existingEvent = Events.findOne('title': seed.title)
    if !existingEvent?
      console.log seed.title
      Events.insert(seed)
    else
      console.log seed.title + " Event exists."
  return

eventsSeed = [
  {title: "Hallenturnier Wetzikon", description: "Testspiel", startDate: new Date(2015, 5, 15), deadlineDate: new Date(2015, 4, 15), location: "Wetzikon", gameCode: -1, organizerCode: -1 },
  {title: "Turnier Grünigen", description: "Testspiel", startDate: new Date(2015, 6, 15), deadlineDate: new Date(2015, 5, 15), location: "Grünigen", gameCode: -1, organizerCode: -1 },
  {title: "Turnier Stallikon", description: "Testspiel", startDate: new Date(2015, 7, 15), deadlineDate: new Date(2015, 6, 15), location: "Stallikon", gameCode: -1, organizerCode: -1 },
  {title: "Turnier Uster", description: "Testspiel", startDate: new Date(2015, 8, 15), deadlineDate: new Date(2015, 7, 15), location: "Uster", gameCode: -1, organizerCode: -1 },
  {title: "Turnier Rapperswil", description: "Testspiel", startDate: new Date(2015, 9, 15), deadlineDate: new Date(2015, 8, 15), location: "Rapperswil", gameCode: -1, organizerCode: -1 }
]