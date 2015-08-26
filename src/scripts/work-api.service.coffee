'use strict'

transformResponse = (response) ->
  parsed = JSON.parse response

  parsed?.result?.content || []

srv = ($resource, API_URL) ->
  url = API_URL + '/v3/work/:id'

  params =
    id: '@id'

  methods =
    put:
      method           :'PUT'
      isArray          : false
      transformResponse: transformResponse
    post:
      method           :'POST'
      isArray          : false
      transformResponse: transformResponse
    get:
      method           :'GET'
      isArray          : true
      transformResponse: transformResponse

  $resource url, {}, methods

srv.$inject = ['$resource', 'API_URL']

angular.module('appirio-tech-ng-api-services').factory 'WorkAPIService', srv
