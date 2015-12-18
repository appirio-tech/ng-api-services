'use strict'

transformResponse = (response) ->
  parsed = JSON.parse response

  parsed?.result?.content || []

srv = ($resource, API_URL) ->
  url = API_URL + '/v3/inboxes/project'

  methods =
    get:
      method: 'GET'
      transformResponse: transformResponse

    query:
      method: 'GET'
      isArray: true
      transformResponse: transformResponse


  $resource url, {}, methods

srv.$inject = ['$resource', 'API_URL']

angular.module('appirio-tech-ng-api-services').factory 'InboxesProjectAPIService', srv