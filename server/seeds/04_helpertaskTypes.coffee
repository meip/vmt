Meteor.startup ->
  _.forEach helpertaskTypesSeed, (seed, index) ->
    existingHelpertaskType = HelpertaskTypes.findOne('title': seed.title)
    if !existingHelpertaskType?
      seed.skills = []
      switch index%4 # the 4th element doesnt need a skill
        when 1 then seed.skills.push(Skills.findOne('title': "Schiedsrichter")._id)
        when 2 then seed.skills.push(Skills.findOne('title': "Führerschein Auto")._id)
        when 3 then seed.skills.push(Skills.findOne('title': "Führerschein Lieferwagen")._id)
      console.log seed.title
      HelpertaskTypes.insert(seed)
    else
      console.log seed.title + " HelpertaskType exists."

  return

helpertaskTypesSeed = [
  {title: "Grill", description: "Grill", minimumAge: 0 },
  {title: "Aufbauen Festbänke", description: "Aufbauen Festbänke", minimumAge: 0 },
  {title: "Abbauen Festbänke", description: "Abbauen Festbänke", minimumAge: 0 },
  {title: "Aufbauen Spielfeld", description: "Aufbauen Spielfeld", minimumAge: 0 },
  {title: "Abbauen Spielfeld", description: "Abbauen Spielfeld", minimumAge: 0 },
  {title: "Taxi Dienst", description: "Taxi Dienst", minimumAge: 18 },
  {title: "Alkohol Ausschank", description: "Alkohol Ausschank", minimumAge: 18 },
  {title: "Schiedsrichter Junioren", description: "Schiedsrichter Junioren", minimumAge: 16 },
  {title: "Schiedsrichter Senioren", description: "Schiedsrichter Senioren", minimumAge: 18 }
]