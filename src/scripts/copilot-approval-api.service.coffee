'use strict'

srv = ($resource, API_URL) ->
  url     = API_URL + '/v3/copilots/:copilotId/projects/:projectId/approved'
  params  =
    copilotId: '@copilotId'
    projectId: '@projectId'

  methods =
    post:
      method           :'POST'
      isArray          : false
      transformResponse: transformResponse

  $resource url, params, methods

srv.$inject = ['$resource', 'API_URL']

angular.module('appirio-tech-timeline').factory 'CopilotApprovalAPIService', srv