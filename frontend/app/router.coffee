window.Router = new class
	constructor: ->
		window.onhashchange = => @reload()
		@hashMap = {}

	register: (route, render) ->
		@hashMap[route] = render

	reload: ->
		if window.location.hash == ''
			window.location.hash = '#index'
			return @reload()
		location = window.location.hash.slice(1).split('/')
		found = false
		console.log '[router]', 'page', location, @hashMap

		for routeHash, render of @hashMap
			route = routeHash.split('/').slice(1)

			if route.length isnt location.length
				continue
			args = []
			for i in [0...route.length]
				if route[i] == '*'
					args.push location[i]
				else if route[i] != location[i]
					args = false
					break
			if args is false
				continue

			found = true
			progressBar = progressJs('#progressBar').start()
			progressBar.set 16
			progressBar.autoIncrease 4, 200
			Data.current = null
			result = await render ...args
			console.log result
			$("#container").html result.html
			if result.title
				$('title').html result.title + ' - OpenXueHai'
			else
				$('title').html 'OpenXueHai'
			progressBar.set 92
			if result.onLoad
				result.onLoad $('#container')
			await Util.sleep(300)
			progressBar.end()

		if not found
			$('#container').html '404 Not Found'
