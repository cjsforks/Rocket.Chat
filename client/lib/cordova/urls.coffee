Meteor.startup ->
	return unless Meteor.isCordova
	platform = device.platform.toLowerCase()

	# Handle click events for all external URLs
	$(document).on 'deviceready', ->
		$(document).on 'click', (e) ->
			$link = $(e.target).closest('a[href]')
			return unless $link.length > 0
			url = $link.attr('href')

			if /^https?:\/\/.+/.test(url) is true
				switch platform
					when 'ios'
						window.open url, '_system'
					when 'android'
						navigator.app.loadUrl url, {openExternal: true}
				e.preventDefault()