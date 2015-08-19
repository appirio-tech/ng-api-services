'use strict'

transformResponse = (response) ->
  parsed = JSON.parse response

  parsed?.result?.content || {}

srv = ($resource, API_URL) ->
  url = API_URL + '/v3/users/:id'

  params =
    id: '@id'

  actions =
    get:
      method           :'GET'
      isArray          : false
      transformResponse: transformResponse

    post:
      method: 'POST'

   $resource url, params, actions

srv.$inject = ['$resource', 'API_URL']

angular.module('appirio-tech-ng-api-services').factory 'UserV3APIService', srv