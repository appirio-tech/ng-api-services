'use strict'

transformSingle = (response) ->
  parsed = JSON.parse response

  parsed?.result?.content || {}

transformMultiple = (response) ->
  parsed = JSON.parse response

  parsed?.result?.content || []

updateRanks = (data) ->
  if data?.hasOwnProperty 'rankedSubmissions'
    rankedSubmissions = data.rankedSubmissions
  else
    rankedSubmissions = data

  transformedData =
    param:
      details:
        rankedSubmissions: rankedSubmissions

  JSON.stringify transformedData

confirmRanks = (data) ->
  if data?.hasOwnProperty 'customerConfirmedRanks'
    customerConfirmedRanks = data.customerConfirmedRanks
  else
    customerConfirmedRanks = data

  transformedData =
    param:
      details:
        customerConfirmedRanks: customerConfirmedRanks

  JSON.stringify transformedData

acceptFixes = (data) ->
  if data?.hasOwnProperty 'customerAcceptedFixes'
    customerAcceptedFixes = data.customerAcceptedFixes
  else
    customerAcceptedFixes = data

  transformedData =
    param:
      details:
        customerAcceptedFixes: customerAcceptedFixes

  JSON.stringify transformedData

srv = ($resource, API_URL) ->
  url = API_URL + '/v3/projects/:projectId/steps/:stepId'

  params =
    projectId: '@projectId'
    stepId   : '@stepId'

  methods =
    get:
      transformResponse: transformSingle
    query:
      transformResponse: transformMultiple
      isArray          : true
    updateRanks:
      method: 'PATCH'
      transformRequest : updateRanks
      transformResponse: transformSingle
    confirmRanks:
      method: 'PATCH'
      transformRequest : confirmRanks
      transformResponse: transformSingle
    acceptFixes:
      method: 'PATCH'
      transformRequest : acceptFixes
      transformResponse: transformSingle


  $resource url, params, methods

srv.$inject = ['$resource', 'API_URL']

angular.module('appirio-tech-ng-api-services').factory 'StepsAPIService', srv