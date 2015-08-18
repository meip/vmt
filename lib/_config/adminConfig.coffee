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
				{
					label: 'Event',
					data: 'eventData().title',
					collection: 'Events',
					collection_property: 'title',
					template: 'eventEditCell',
				}
				{label: 'Start Time', name: 'startTime'}
				{label: 'End Time', name: 'endTime'}
				{label: 'HelpertaskType', data: 'helpertaskTypeTitle()', name: 'helpertaskTypeTitle()', collection: 'HelpertaskTypes', collection_property: 'title'}
				{label: '# Pers.', name: 'numPersons'}
			]
			extraFields: ['event', 'helpertaskType', 'eventData()']
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
			auxCollections: ['Skills']
			tableColumns: [
				{label: 'Title', name: 'title'}
				{label: 'Description', name: 'description'}
				{label: 'Skills', name: 'SkillsTitles()', collection: 'Skills', collection_property: 'title'}
			]
			extraFields: ['skills']
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
