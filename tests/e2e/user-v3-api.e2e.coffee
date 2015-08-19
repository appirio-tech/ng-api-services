text = null

describe 'UserV3APIService', ->
  beforeEach (done) ->
    browser.get 'http://localhost:9999/#/'

    $('p').getInnerHtml().then (value) ->
      text = value

      done()

  it 'should have some text', ->
    expect(text.length).to.be.ok
