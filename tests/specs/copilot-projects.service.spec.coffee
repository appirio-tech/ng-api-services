'use strict'

srv      = null
work  = null

describe 'CopilotProjectsAPIService', ->
  beforeEach inject (CopilotProjectsAPIService) ->
    srv = CopilotProjectsAPIService

  it 'should have a get method', ->
    expect(srv.get).to.be.isFunction

  describe 'CopilotProjectsAPIService.get', ->
    beforeEach inject ($httpBackend) ->
      params =
        workId: '123'

      srv.get(params).$promise.then (response) ->
        work = response

      $httpBackend.flush()

    it 'work should be ok', ->
      expect(work).to.be.ok