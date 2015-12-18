require 'appirio-tech-ng-work-constants'
require 'angular-resource'
require 'angular-ui-router'
require './scripts/ng-api.module'

requireContextFiles = (files) ->
  paths = files.keys()

  for path in paths
    files path

services  = require.context './scripts/services/', true, /^(.*\.(coffee$))[^.]*$/igm

requireContextFiles services
