'use strict'

srv = ($resource, API_URL) ->
  url = API_URL + '/v3/projects/:projectId/steps/:stepId/submissions/:submissionId'

  params =
    projectId   : '@projectId'
    stepId      : '@stepId'
    submissionId: '@submissionId'

  $resource url, params

srv.$inject = ['$resource', 'API_URL']

angular.module('appirio-tech-ng-api-services').factory 'SubmissionsAPIService', srv