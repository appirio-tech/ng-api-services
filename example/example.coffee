require 'appirio-tech-api-schemas'
require './styles/main.scss'
require './scripts/example.module'
require './scripts/routes'

requireContextFiles = (files) ->
  paths = files.keys()

  for path in paths
    files path

controllers = require.context './scripts/controllers/', true, /^(.*\.(coffee$))[^.]*$/igm

requireContextFiles controllers

exampleNav = require './nav.jade'

document.getElementById('example-nav').innerHTML = exampleNav()

views = require.context './views/', true, /^(.*\.(jade$))[^.]*$/igm

templateCache = ($templateCache) ->
  viewPaths = views.keys()

  for viewPath in viewPaths
    viewPathClean = viewPath.split('./').pop()

    # TODD: bug if .jade occurs more often than once
    viewPathCleanHtml = viewPathClean.replace '.jade', '.html'

    $templateCache.put "views/#{viewPathCleanHtml}", views(viewPath)()

angular.module('example').run templateCache
