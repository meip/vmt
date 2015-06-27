# These values get propagated through the app
# E.g. The 'name' and 'subtitle' are used in seo.coffee

@Config =

	# Basic Details
	name: 'VMT'
	title: ->
			TAPi18n.__ 'configTitle'
	subtitle: ->
			TAPi18n.__ 'configSubtitle'
	logo: ->
		'<b>' + @name + '</b>'
	footer: ->
		@name + ' - Copyright ' + new Date().getFullYear()

	# Emails
	emails:
		from: 'no-reply@' + Meteor.absoluteUrl()
		contact: 'hello' + Meteor.absoluteUrl()

	# Username - if true, users are forced to set a username
	username: false
	
	# Localisation
	defaultLanguage: 'en'
	dateFormat: 'D/M/YYYY'

	# Meta / Extenrnal content
	privacyUrl: Meteor.absoluteUrl()
	termsUrl: Meteor.absoluteUrl()

	# For email footers
	legal:
		address: 'Postfach 317, 8630 Rüti'
		name: 'FB Riders'
		url: 'http://www.fbriders.ch'

	about: 'http://philippmeier.ch'
	blog: 'http://philippmeier.ch/blog'

	socialMedia:
		twitter:
			url: 'http://twitter.com/vilibm'
			icon: 'twitter'
		github:
			url: 'http://github.com/meip'
			icon: 'github'
		info:
			url: 'http://philippmeier.ch'
			icon: 'link'

	#Routes
	homeRoute: '/'
	publicRoutes: ['home']
	dashboardRoute: '/dashboard'