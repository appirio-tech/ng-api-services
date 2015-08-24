'use strict'

transformResponse = (response) ->
  parsed = JSON.parse response

  parsed?.result?.content || []

srv = ($resource, API_URL) ->
  url = API_URL + '/v3/copilots/:userId/projects/:projectId'

  params =
    userId: '@userId'
    projectId: '@projectId'

  methods =
    query:
      method           :'GET'
      isArray          : true
      transformResponse: transformResponse
    put:
      method           :'PUT'
      isArray          : false
      transformResponse: transformResponse
    post:
      method           :'POST'
      isArray          : false
      transformResponse: transformResponse

  $resource url, {}, methods

srv.$inject = ['$resource', 'API_URL']

angular.module('appirio-tech-ng-api-services').factory 'CopilotProjectDetailsAPIService', srv