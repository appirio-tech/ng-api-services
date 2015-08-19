'use strict'

SubmissionAPIController = (SubmissionAPIService) ->
  vm = this

  activate = ->
    params =
      workId: '133'
      phase : '123'

    resource = SubmissionAPIService.get params, (data) ->
      vm.get = data

    vm

  activate()

SubmissionAPIController.$inject = ['SubmissionAPIService']

angular.module('example').controller 'SubmissionAPIController', SubmissionAPIController
