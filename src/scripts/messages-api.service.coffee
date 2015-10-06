'use strict'

transformResponse = (response) ->
  parsed = JSON.parse response

  parsed?.result?.content || []

srv = ($resource, API_URL) ->
  url = API_URL + '/v3/threads/:threadId/messages'

  params =
    threadId: '@threadId'

  methods =
    put:
      method: 'PUT'

  $resource url, {}, methods

srv.$inject = ['$resource', 'API_URL']

angular.module('appirio-tech-ng-api-services').factory 'MessagesAPIService', srv
