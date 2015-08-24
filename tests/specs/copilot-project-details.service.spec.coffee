'use strict'

srv      = null
callResponse  = null

describe 'CopilotProjectDetailsAPIService', ->
  beforeEach inject (CopilotProjectDetailsAPIService) ->
    srv = CopilotProjectDetailsAPIService

  it 'should have a put method', ->
    expect(srv.put).to.be.ok
