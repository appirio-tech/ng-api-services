'use strict'

srv   = null
steps = []
step  = {}

describe 'StepsAPIService', ->
  beforeEach inject (StepsAPIService) ->
    srv = StepsAPIService

  it 'should be created successfully', ->
    expect(srv).to.exist

  it 'should have a query method', ->
    expect(srv.query).to.exist

  describe 'StepsAPIService.query', ->
    beforeEach inject ($httpBackend) ->
      params =
        projectId: 'abc'

      srv.query params, (response) ->
        steps = response

      $httpBackend.flush()

    it 'should return steps data', ->
      expect(steps.length).to.be.above 0

  it 'should have a get method', ->
    expect(srv.get).to.exist

  describe 'StepsAPIService.get', ->
    beforeEach inject ($httpBackend) ->
      params =
        projectId: 'abc'
        stepId   : 'abc'

      srv.get params, (response) ->
        step = response

      $httpBackend.flush()

    it 'should return a step', ->
      expect(typeof step.id).to.equal 'string'

  it 'should have a patch method', ->
    expect(srv.patch).to.exist

  describe 'StepsAPIService.updateRanks', ->
    beforeEach inject ($httpBackend) ->
      params =
        projectId: 'abc'
        stepId   : 'abc'

      srv.patch params, (response) ->
        step = response

      $httpBackend.flush()

    it 'should return a step', ->
      expect(typeof step.id).to.equal 'string'