'use strict'

transformResponse = (response) ->
  parsed = JSON.parse response

  parsed?.result?.content || {}

srv = ($resource, API_URL) ->
  url = API_URL + '/v3/threads/:id'

  params  =
    id          : '@id'
    subscriberId: '@subscriberId'

  actions =
    query:
      method           :'GET'
      isArray          : false
      transformResponse: transformResponse
    get:
      method           :'GET'
      isArray          : false
      transformResponse: transformResponse

  $resource url, params, actions

srv.$inject = ['$resource', 'API_URL']

angular.module('appirio-tech-ng-api').factory 'ThreadsAPIService', srv
