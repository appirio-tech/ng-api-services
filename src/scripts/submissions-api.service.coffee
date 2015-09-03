'use strict'

transformSingle = (response) ->
  parsed = JSON.parse response

  parsed?.result?.content || {}

transformMultiple = (response) ->
  parsed = JSON.parse response

  parsed?.result?.content || []

srv = ($resource, API_URL) ->
  url = API_URL + '/v3/projects/:projectId/steps/:stepId/submissions/:submissionId'

  params =
    projectId   : '@projectId'
    stepId      : '@stepId'
    submissionId: '@submissionId'

  methods =
    get:
      transformResponse: transformSingle
    query:
      transformResponse: transformMultiple
      isArray          : true

  $resource url, params, methods

srv.$inject = ['$resource', 'API_URL']

angular.module('appirio-tech-ng-api-services').factory 'SubmissionsAPIService', srv