'use strict'

updateRanks = (data) ->
  if data?.hasOwnProperty 'rankedSubmissions'
    rankedSubmissions = data.rankedSubmissions
  else
    rankedSubmissions = data

  transformedData =
    rankedSubmissions: rankedSubmissions

  JSON.stringify transformedData

confirmRanks = (data) ->
  if data?.hasOwnProperty 'customerConfirmedRanks'
    customerConfirmedRanks = data.customerConfirmedRanks
  else
    customerConfirmedRanks = data

  transformedData =
    customerConfirmedRanks: customerConfirmedRanks

  JSON.stringify transformedData

acceptFixes = (data) ->
  if data?.hasOwnProperty 'customerAcceptedFixes'
    customerAcceptedFixes = data.customerAcceptedFixes
  else
    customerAcceptedFixes = data

  transformedData =
    customerAcceptedFixes: customerAcceptedFixes

  JSON.stringify transformedData

srv = ($resource, API_URL) ->
  url = API_URL + '/v3/projects/:projectId/steps/:stepId'

  params =
    projectId: '@projectId'
    stepId   : '@stepId'

  methods =
    updateRanks:
      method: 'PATCH'
      transformRequest : updateRanks
    confirmRanks:
      method: 'PATCH'
      transformRequest : confirmRanks
    acceptFixes:
      method: 'PATCH'
      transformRequest : acceptFixes


  $resource url, params, methods

srv.$inject = ['$resource', 'API_URL']

angular.module('appirio-tech-ng-api-services').factory 'StepsAPIService', srv