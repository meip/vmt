Template.eventEdit.helpers
  eventFormSchema: ->
    Schemas.Events
  fullcalendarOptions: () ->
    id: 'helpertaskForm'
    height: 300,
    lang: 'de',
    defaultView: 'basicWeek'
    events: [
      {
        title  : 'event1',
        start  : '2015-04-05',
        end    : '2015-04-14'
      }
      {
        title  : 'event2',
        start  : '2015-06-05',
        end    : '2015-07-27'
      }
      {
        title  : 'event3',
        start  : '2015-07-07',
        end    : '2015-08-27'
      }
    ]

Template.eventEdit.onRendered ->
  fc = this.$('.fc')
  fc.fullCalendar('render')
