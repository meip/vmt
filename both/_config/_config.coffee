@Config =
	name: 'VMT'
	title: 'Volunteer Management Tool'
	subtitle: 'Organize volunteers for your events.'
	logo: ->
		'<b>' + @name + '</b>'
	footer: ->
		@name + ' - Copyright ' + new Date().getFullYear()
	emails:
		from: 'noreply@' + Meteor.absoluteUrl()
	username: false
	homeRoute: '/'
	dashboardRoute: '/dashboard'
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
	publicRoutes: ['home']