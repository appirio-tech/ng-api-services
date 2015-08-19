text = null

describe 'threads-api', ->
  beforeEach (done) ->
    browser.get 'http://localhost:9999/#/threads-api'

    $('p').getInnerHtml().then (value) ->
      text = value

      done()

  it 'should have some text', ->
    expect(text.length).to.be.ok
