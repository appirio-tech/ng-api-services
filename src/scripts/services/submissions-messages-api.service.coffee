'use strict'

transformResponse = (response) ->
  parsed = JSON.parse response

  parsed?.result?.content || []

srv = ($resource, API_URL) ->
  url = API_URL + '/v3/projects/:projectId/steps/:stepId/submissions/:submissionId/files/:fileId/threads/:threadId/messages'

  params =
    projectId:    '@projectId'
    submissionId: '@submissionId'
    threadId:     '@threadId'

  methods =
    get:
      method: 'GET'

    query:
      method: 'GET'
      isArray: true

    post:
      method: 'POST'

    patch:
      method: 'PATCH'

    put:
      method: 'PUT'

  $resource url, {}, methods

srv.$inject = ['$resource', 'API_URL']

angular.module('appirio-tech-ng-api-services').factory 'SubmissionsMessagesAPIService', srv