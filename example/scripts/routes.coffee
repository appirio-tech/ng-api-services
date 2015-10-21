'use strict'

config = ($stateProvider) ->
  states = {}

  states['user-v3-api'] =
    url         : '/'
    title       : 'user-v3-api'
    controller  : 'UserV3Controller as vm'
    templateUrl : 'views/api.html'

  states['authorizations'] =
    url         : '/authorizations'
    title       : 'authorizations'
    controller  : 'AuthorizationsController as vm'
    templateUrl : 'views/api.html'

  states['messages-api'] =
    url         : '/messages-api'
    title       : 'MessagesAPI'
    controller  : 'MessagesAPIController as vm'
    templateUrl : 'views/api.html'

  states['steps-api'] =
    url         : '/steps-api'
    title       : 'StepsAPI'
    controller  : 'StepsAPIController as vm'
    templateUrl : 'views/api.html'

  states['submissions-api'] =
    url         : '/submissions-api'
    title       : 'SubmissionsAPI'
    controller  : 'SubmissionsAPIController as vm'
    templateUrl : 'views/api.html'

  states['threads-api'] =
    url         : '/threads-api'
    title       : 'ThreadsAPI'
    controller  : 'ThreadsAPIController as vm'
    templateUrl : 'views/api.html'

  states['work-api'] =
    url         : '/work-api'
    title       : 'WorkAPI'
    controller  : 'WorkAPIController as vm'
    templateUrl : 'views/api.html'

  states['submit-work-api'] =
    url         : '/submit-work-api'
    title       : 'SubmitWorkAPI'
    controller  : 'SubmitWorkAPIController as vm'
    templateUrl : 'views/api.html'

  states['project-estimates-api'] =
    url         : '/project-estimates-api'
    title       : 'ProjectEstimatesAPI'
    controller  : 'ProjectEstimatesAPIController as vm'
    templateUrl : 'views/api.html'

  for key, state of states
    $stateProvider.state key, state

config.$inject = ['$stateProvider']

angular.module('example').config(config).run()


