exports.applySettings = (app) ->
  app.set 'port', process.env.PORT or 3000
  app.set 'host', process.env.HOST or 'http://localhost'
  app.set 'facebook appId', '395890997221796'
  app set 'facebook appSecret', '369387dff5eb55fff0edfdb162a7b870'

