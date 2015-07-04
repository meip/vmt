Meteor.startup ->
  _.forEach helpertasksSeed, (seed, index) ->
    existingHelpertask = Helpertasks.findOne({'startTime': seed.startTime, 'endTime': seed.endTime, 'numPersons': seed.numPersons})
    if !existingHelpertask?
      switch index%4
        when 1 then seed.helpertaskType = HelpertaskTypes.findOne('title': "Schiedsrichter Senioren")._id
        when 2 then seed.helpertaskType = HelpertaskTypes.findOne('title': "Aufbauen Spielfeld")._id
        when 3 then seed.helpertaskType = HelpertaskTypes.findOne('title': "Abbauen Spielfeld")._id
        else seed.helpertaskType = HelpertaskTypes.findOne('title': "Schiedsrichter Junioren")._id
      switch index%4
        when 1 then seed.event = Events.findOne('title': "Hallenturnier Wetzikon")._id
        when 2 then seed.event = Events.findOne('title': "Turnier Grünigen")._id
        when 3 then seed.event = Events.findOne('title': "Turnier Stallikon")._id
        else seed.event = Events.findOne('title': "Turnier Uster")._id
      Helpertasks.insert(seed)
    else
      console.log seed.description + " Helpertask exists."
  return

helpertasksSeed = [
  {startTime: new Date(2015, 5, 15, 8, 0, 0), endTime: new Date(2015, 5, 15, 16, 0, 0), numPersons: 3, description: "Testtask"},
  {startTime: new Date(2015, 5, 15, 8, 0, 0), endTime: new Date(2015, 5, 15, 16, 0, 0), numPersons: 3, description: "Testtask" },
  {startTime: new Date(2015, 5, 15, 8, 0, 0), endTime: new Date(2015, 5, 15, 16, 0, 0), numPersons: 3, description: "Testtask" },
  {startTime: new Date(2015, 5, 15, 8, 0, 0), endTime: new Date(2015, 5, 15, 16, 0, 0), numPersons: 3, description: "Testtask" },
  {startTime: new Date(2015, 5, 15, 8, 0, 0), endTime: new Date(2015, 5, 15, 16, 0, 0), numPersons: 3, description: "Testtask" },
  {startTime: new Date(2015, 5, 15, 8, 0, 0), endTime: new Date(2015, 5, 15, 16, 0, 0), numPersons: 8, description: "Testtask" },
  {startTime: new Date(2015, 5, 15, 8, 0, 0), endTime: new Date(2015, 5, 15, 16, 0, 0), numPersons: 7, description: "Testtask" },
  {startTime: new Date(2015, 5, 15, 8, 0, 0), endTime: new Date(2015, 5, 15, 16, 0, 0), numPersons: 2, description: "Testtask" },
  {startTime: new Date(2015, 5, 15, 8, 0, 0), endTime: new Date(2015, 5, 15, 16, 0, 0), numPersons: 5, description: "Testtask" },
  {startTime: new Date(2015, 6, 15, 8, 0, 0), endTime: new Date(2015, 6, 15, 16, 0, 0), numPersons: 3, description: "Testtask" },
  {startTime: new Date(2015, 6, 15, 8, 0, 0), endTime: new Date(2015, 6, 15, 16, 0, 0), numPersons: 8, description: "Testtask" },
  {startTime: new Date(2015, 6, 15, 8, 0, 0), endTime: new Date(2015, 6, 15, 16, 0, 0), numPersons: 4, description: "Testtask" },
  {startTime: new Date(2015, 6, 15, 8, 0, 0), endTime: new Date(2015, 6, 15, 16, 0, 0), numPersons: 2, description: "Testtask" },
  {startTime: new Date(2015, 6, 15, 8, 0, 0), endTime: new Date(2015, 6, 15, 16, 0, 0), numPersons: 1, description: "Testtask" },
  {startTime: new Date(2015, 6, 15, 8, 0, 0), endTime: new Date(2015, 6, 15, 16, 0, 0), numPersons: 6, description: "Testtask" },
  {startTime: new Date(2015, 6, 15, 8, 0, 0), endTime: new Date(2015, 6, 15, 16, 0, 0), numPersons: 9, description: "Testtask" },
  {startTime: new Date(2015, 6, 15, 8, 0, 0), endTime: new Date(2015, 6, 15, 16, 0, 0), numPersons: 1, description: "Testtask" },
  {startTime: new Date(2015, 6, 15, 8, 0, 0), endTime: new Date(2015, 6, 15, 16, 0, 0), numPersons: 4, description: "Testtask" },
  {startTime: new Date(2015, 7, 15, 8, 0, 0), endTime: new Date(2015, 7, 15, 16, 0, 0), numPersons: 3, description: "Testtask" },
  {startTime: new Date(2015, 7, 15, 8, 0, 0), endTime: new Date(2015, 7, 15, 16, 0, 0), numPersons: 4, description: "Testtask" },
  {startTime: new Date(2015, 7, 15, 8, 0, 0), endTime: new Date(2015, 7, 15, 16, 0, 0), numPersons: 5, description: "Testtask" },
  {startTime: new Date(2015, 7, 15, 8, 0, 0), endTime: new Date(2015, 7, 15, 16, 0, 0), numPersons: 1, description: "Testtask" },
  {startTime: new Date(2015, 7, 15, 8, 0, 0), endTime: new Date(2015, 7, 15, 16, 0, 0), numPersons: 3, description: "Testtask" },
  {startTime: new Date(2015, 7, 15, 8, 0, 0), endTime: new Date(2015, 7, 15, 16, 0, 0), numPersons: 2, description: "Testtask" },
  {startTime: new Date(2015, 7, 15, 8, 0, 0), endTime: new Date(2015, 7, 15, 16, 0, 0), numPersons: 6, description: "Testtask" },
  {startTime: new Date(2015, 7, 15, 8, 0, 0), endTime: new Date(2015, 7, 15, 16, 0, 0), numPersons: 9, description: "Testtask" },
  {startTime: new Date(2015, 7, 15, 8, 0, 0), endTime: new Date(2015, 7, 15, 16, 0, 0), numPersons: 11, description: "Testtask" },
  {startTime: new Date(2015, 8, 15, 8, 0, 0), endTime: new Date(2015, 8, 15, 16, 0, 0), numPersons: 8, description: "Testtask" },
  {startTime: new Date(2015, 8, 15, 8, 0, 0), endTime: new Date(2015, 8, 15, 16, 0, 0), numPersons: 4, description: "Testtask" },
  {startTime: new Date(2015, 8, 15, 8, 0, 0), endTime: new Date(2015, 8, 15, 16, 0, 0), numPersons: 3, description: "Testtask" },
  {startTime: new Date(2015, 8, 15, 8, 0, 0), endTime: new Date(2015, 8, 15, 16, 0, 0), numPersons: 1, description: "Testtask" },
  {startTime: new Date(2015, 8, 15, 8, 0, 0), endTime: new Date(2015, 8, 15, 16, 0, 0), numPersons: 2, description: "Testtask" },
  {startTime: new Date(2015, 8, 15, 8, 0, 0), endTime: new Date(2015, 8, 15, 16, 0, 0), numPersons: 7, description: "Testtask" },
  {startTime: new Date(2015, 8, 15, 8, 0, 0), endTime: new Date(2015, 8, 15, 16, 0, 0), numPersons: 5, description: "Testtask" },
  {startTime: new Date(2015, 8, 15, 8, 0, 0), endTime: new Date(2015, 8, 15, 16, 0, 0), numPersons: 6, description: "Testtask" },
  {startTime: new Date(2015, 8, 15, 8, 0, 0), endTime: new Date(2015, 8, 15, 16, 0, 0), numPersons: 2, description: "Testtask" },
  {startTime: new Date(2015, 9, 15, 8, 0, 0), endTime: new Date(2015, 9, 15, 16, 0, 0), numPersons: 3, description: "Testtask" },
  {startTime: new Date(2015, 9, 15, 8, 0, 0), endTime: new Date(2015, 9, 15, 16, 0, 0), numPersons: 5, description: "Testtask" },
  {startTime: new Date(2015, 9, 15, 8, 0, 0), endTime: new Date(2015, 9, 15, 16, 0, 0), numPersons: 2, description: "Testtask" },
  {startTime: new Date(2015, 9, 15, 8, 0, 0), endTime: new Date(2015, 9, 15, 16, 0, 0), numPersons: 1, description: "Testtask" },
  {startTime: new Date(2015, 9, 15, 8, 0, 0), endTime: new Date(2015, 9, 15, 16, 0, 0), numPersons: 6, description: "Testtask" },
  {startTime: new Date(2015, 9, 15, 8, 0, 0), endTime: new Date(2015, 9, 15, 16, 0, 0), numPersons: 7, description: "Testtask" },
  {startTime: new Date(2015, 9, 15, 8, 0, 0), endTime: new Date(2015, 9, 15, 16, 0, 0), numPersons: 8, description: "Testtask" },
  {startTime: new Date(2015, 9, 15, 8, 0, 0), endTime: new Date(2015, 9, 15, 16, 0, 0), numPersons: 2, description: "Testtask" },
  {startTime: new Date(2015, 9, 15, 8, 0, 0), endTime: new Date(2015, 9, 15, 16, 0, 0), numPersons: 3, description: "Testtask"}
]


