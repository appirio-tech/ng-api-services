'use strict'

SubmissionDetailAPIController = (SubmissionDetailAPIService) ->
  vm = this

  activate = ->
    params =
      workId      : 'workId'
      submissionId: 'submissionId'

    resource = SubmissionDetailAPIService.get params, (data) ->
      vm.get = data

    vm

  activate()

SubmissionDetailAPIController.$inject = ['SubmissionDetailAPIService']

angular.module('example').controller 'SubmissionDetailAPIController', SubmissionDetailAPIController
