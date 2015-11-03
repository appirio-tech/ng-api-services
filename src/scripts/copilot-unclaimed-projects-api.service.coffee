'use strict'

transformResponse = (response) ->
  parsed = JSON.parse response

  parsed?.result?.content || []

transformIdOnlyResponse = (response) ->
  parsed = JSON.parse response

  id: parsed?.result?.content

srv = ($resource, API_URL) ->
  url = API_URL + '/v3/projects/copilot/unclaimed'

  methods =
    put:
      method           :'PUT'
      transformResponse: transformIdOnlyResponse

    post:
      method           :'POST'
      transformResponse: transformIdOnlyResponse

    get:
      transformResponse: transformResponse

    query:
      isArray: true
      transformResponse: transformResponse

  $resource url, params, methods

srv.$inject = ['$resource', 'API_URL']

angular.module('appirio-tech-ng-api-services').factory 'CopilotUnclaimedProjectsAPIService', srv