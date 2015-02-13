AdminConfig =
  name: Config.name
  collections:
    Events: {
      color: 'blue'
      icon: 'trophy'
      auxCollections: ['Helpertasks']
      tableColumns: [
        {label: 'User', name: 'owner', collection: 'Users'}
        {label: 'Helpertasks', name: 'helpertasks', collection: 'Helpertasks', collection_property: 'comment'}
      ]
    }
    Helpertasks: {
      color: 'yellow'
      icon: 'tasks'
      auxCollections: ['Events']
      tableColumns: [
        {label: 'User', name: 'owner', collection: 'Users'}
        {label: 'Event', name: 'event', collection: 'Events', collection_property: 'title'}
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

if Meteor.isClient
  window.AdminConfig = AdminConfig
else if Meteor.isServer
  global.AdminConfig = AdminConfig