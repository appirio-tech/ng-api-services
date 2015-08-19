text = null

describe 'authorizations', ->
  beforeEach (done) ->
    browser.get 'http://localhost:9999/#/authorizations'

    $('p').getInnerHtml().then (value) ->
      text = value

      done()

  it 'should have some text', ->
    expect(text.length).to.be.ok
