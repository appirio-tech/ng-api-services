'use strict'

srv  = null
submissions = {}

describe 'SubmissionsAPIService', ->
  beforeEach inject (SubmissionsAPIService) ->
    srv = SubmissionsAPIService

  it 'should be created successfully', ->
    expect(srv).to.exist

  it 'should have a query method', ->
    expect(srv.query).to.exist

  describe 'SubmissionsAPIService.query', ->
    beforeEach inject ($httpBackend) ->
      params =
        projectId: 'abc'
        stepId   : 'abc'

      srv.query params, (response) ->
        submissions = response

      $httpBackend.flush()

    it 'should return submissions data', ->
      expect(submissions.length).to.be.above 0