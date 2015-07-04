@AdminConfig =
	name: Config.name
	collections:
		Events: {
			color: 'blue'
			icon: 'trophy'
			auxCollections: ['Helpertasks']
			tableColumns: [
				{label: 'Title', name: 'title'}
				{label: 'Location', name: 'location'}
				{label: 'Start Date', name: 'startDate'}
				{label: 'End Date', name: 'endDate'}
				{label: 'Helpertasks', name: 'helpertaskDescription()', collection: 'Helpertasks', collection_property: 'description'}
			]
		}
		Helpertasks: {
			color: 'yellow'
			icon: 'tasks'
			auxCollections: ['Events', 'HelpertaskTypes']
			tableColumns: [
				{label: 'Event', name: 'event', collection: 'Events', collection_property: 'title'}
				{label: 'Start Time', name: 'startTime'}
				{label: 'End Time', name: 'endTime'}
				{label: 'HelpertaskType', name: 'helpertaskType()', template: 'helpertaskTypeCell'}
				{label: '# Pers.', name: 'numPersons'}
			]
		}
		Teams: {
			color: 'green'
			icon: 'users'
			auxCollections: ['Users']
			tableColumns: [
				{label: 'Title', name: 'title'}
			]
		}
		HelpertaskTypes: {
			color: 'red'
			icon: 'pencil'
			tableColumns: [
				{label: 'Title', name: 'title'}
				{label: 'Description', name: 'description'}
				{label: 'Skills', name: 'skills', collection: 'Skills', collection_property: 'title'}
			]
		}
		Skills: {
			color: 'red'
			icon: 'pencil'
			auxCollections: ['HelpertaskTypes']
			tableColumns: [
				{label: 'Title', name: 'title'}
				{label: 'Description', name: 'description'}
			]
		}
	dashboard:
		homeUrl: '/dashboard'
	autoForm:
		omitFields: ['createdAt', 'updatedAt']
