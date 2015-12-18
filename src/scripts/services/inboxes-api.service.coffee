'use strict'

transformResponse = (response) ->
  parsed = JSON.parse response

  parsed?.result?.content || {}

srv = ($resource, API_URL) ->
  url = API_URL + '/v3/inboxes/:threadId'

  params =
    threadId:    '@threadId'

  methods =
    get:
      method: 'GET'
      transformResponse: transformResponse

    post:
      method: 'POST'
      transformResponse: transformResponse

    patch:
      method: 'PATCH'
      transformResponse: transformResponse

    put:
      method: 'PUT'
      transformResponse: transformResponse

  $resource url, {}, methods

srv.$inject = ['$resource', 'API_URL']

angular.module('appirio-tech-ng-api-services').factory 'InboxesAPIService', srv