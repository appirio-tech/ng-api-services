text = null

describe 'submission-detail-api', ->
  beforeEach (done) ->
    browser.get 'http://localhost:9999/#/submission-detail-api'

    $('p').getInnerHtml().then (value) ->
      text = value

      done()

  it 'should have some text', ->
    expect(text.length).to.be.ok
