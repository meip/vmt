Meteor.startup ->
  _.forEach skillsSeed, (seed) ->
    existingSkill = Skills.findOne('title': seed.title)
    if !existingSkill?
      console.log seed.title
      Skills.insert(seed)
    else
      console.log seed.title + " Skill exists."

  return

skillsSeed = [
  {title: "Schiedsrichter", description: "Schiedsrichter"},
  {title: "Führerschein Auto", description: "Führerschein Auto"},
  {title: "Führerschein Lieferwagen", description: "Führerschein Lieferwagen"}
]