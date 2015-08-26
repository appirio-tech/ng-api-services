'use strict'

SubmitWorkAPIController = (SubmitWorkAPIService) ->
  vm = this

  activate = ->
    params =
      id : 123

    resource = SubmitWorkAPIService.get params, (data) ->
      vm.get = data

    vm

  activate()

SubmitWorkAPIController.$inject = ['SubmitWorkAPIService']

angular.module('example').controller 'SubmitWorkAPIController', SubmitWorkAPIController