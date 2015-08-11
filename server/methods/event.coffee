Meteor.methods
	eventImport: ->
		console.log "Start with events import"
		HTTP.call 'GET', 'https://api-v2.swissunihockey.ch/api/clubs/377/statistics', {}, (error, result) ->
			if !error
				console.log "API - Clubs success"

				teams =_.map result.data.data.regions[0].rows, (team) ->
					team_id: team.team_id
					team_name: team.cells[0].text

				_.forEach teams, (team) ->
					console.log team

				_.map teams, (team) ->

			else
				console.log error
			return
	eventDelete: (event) ->
		console.log 'delete ' + event.title
