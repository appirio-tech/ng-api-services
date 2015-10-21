'use strict'

transformIdOnlyResponse = (response) ->
  parsed = JSON.parse response

  id: parsed?.result?.content

srv = ($resource, API_URL) ->
  url = API_URL + '/v3/projects/:id/estimates'

  params =
    id: '@id'

  methods =
    post:
      method           :'POST'
      transformResponse: transformIdOnlyResponse

  $resource url, params, methods

srv.$inject = ['$resource', 'API_URL']

angular.module('appirio-tech-ng-api-services').factory 'ProjectEstimatesAPIService', srv