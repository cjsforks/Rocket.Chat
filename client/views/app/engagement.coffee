Template.engagement.onCreated ->
	@engagementType = new ReactiveVar 'newEngagement'

Template.engagement.helpers
	engagementType: ->
		t = Template.instance().engagementType?.get()
		console.log 'engagementType', t
		t

Template.engagement.events

	'click div.engagement': (e,t)->
		console.log 'click', e, t
		x = Math.floor 3*Math.random()
		t = ['newEngagement', 'boostEngagement', 'silenceEngagement'][x]
		console.log 't', t
		Template.instance().engagementType.set t

