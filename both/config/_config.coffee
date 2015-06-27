@Config =
	name: 'VMT'
	title: ->
			TAPi18n.__ 'configTitle'
	subtitle: ->
			TAPi18n.__ 'configSubtitle'
	logo: ->
		'<b>' + @name + '</b>'
	footer: ->
		@name + ' - Copyright ' + new Date().getFullYear()
	emails:
		from: 'noreply@' + Meteor.absoluteUrl()
	about: 'http://philippmeier.ch'
	blog: 'http://philippmeier.ch/blog'
	username: false
	homeRoute: '/dashboard'
	socialMedia:
		[
			['http://philippmeier.ch','link']
			['http://twitter.com/vilibm','twitter']
			['http://github.com/meip','github']
		]

Avatar.options =
	customImageProperty: 'profile.picture'

Meteor.startup ->
	if Meteor.isClient
		TAPi18n.setLanguage('en')
