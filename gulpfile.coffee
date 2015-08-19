configs =
  __dirname : __dirname

configs.templateCache = []

configs.templateCache.push
  fileName: 'example-templates.js'
  files : [
    '.tmp/views/*.html'
  ]
  root  : 'views/'
  module: 'example'

configs.fixture =
  files: [
    'swagger/**/*.json'
    'apiary/**/*.json'
  ]

### END CONFIG ###
loadTasksModule = require __dirname + '/node_modules/appirio-gulp-tasks/load-tasks.coffee'

loadTasksModule.loadTasks configs
