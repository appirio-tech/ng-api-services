text = null

describe 'final-fixes-api', ->
  beforeEach (done) ->
    browser.get 'http://localhost:9999/#/final-fixes-api'

    $('p').getInnerHtml().then (value) ->
      text = value

      done()

  it 'should have some text', ->
    expect(text.length).to.be.ok
