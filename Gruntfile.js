// Generated on 2014-02-06 using generator-angular 0.7.1
'use strict';

var fs = require('fs');

module.exports = function (grunt) {

  // Load grunt tasks automatically
  require('load-grunt-tasks')(grunt);

  // Time how long tasks take. Can help when optimizing build times
  require('time-grunt')(grunt);

  grunt.registerTask('clean-after-filerev', function() {
    var summary = grunt.filerev.summary;
    for (var file in summary) {
      if (summary.hasOwnProperty(file)) {
          grunt.log.writeln('removing: ' + file);
          fs.unlinkSync(file);
      }
    }
  });

  // Define the configuration for all the tasks
  grunt.initConfig({

    // Project settings
    yeoman: {
      // configurable paths
      app: require('./bower.json').appPath || 'app',
      dist: 'dist'
    },

    'node-inspector': {
      dev: {
        'web-host': 'localhost',
        'web-port': '3000'
      }
    },

    nodemon: {
      dev: {
        script: 'app.coffee',
        options: {
          args: ['dev'],
          nodeArgs: ['--nodejs', '--debug'],
          env: {
            NODE_ENV: 'development',
            PORT: '3000',
            HOST: 'localhost'
          },
          ext: 'js,coffee',
          ignore: [
            'node_modules/**',
            'app/**' // don't restart when client side scripts change
          ]
        }
      }
    },

    // Watches files for changes and runs tasks based on the changed files
    watch: {
      coffee: {
        files: ['<%= yeoman.app %>/scripts/**/*.{coffee,litcoffee,coffee.md}'],
        tasks: ['newer:coffee:dist']
      },
      coffeeTest: {
        files: ['test/spec/{,*/}*.{coffee,litcoffee,coffee.md}'],
        tasks: ['newer:coffee:test', 'karma']
      },
      compass: {
        files: ['<%= yeoman.app %>/styles/{,*/}*.{scss,sass}'],
        tasks: ['compass:server', 'autoprefixer']
      },
      gruntfile: {
        files: ['Gruntfile.js']
      }
      // livereload: {
      //   options: {
      //     livereload: '<%= connect.options.livereload %>'
      //   },
      //   files: [
      //     '<%= yeoman.app %>/{,*/}*.html',
      //     '.tmp/styles/{,*/}*.css',
      //     '.tmp/scripts/{,*/}*.js',
      //     '<%= yeoman.app %>/images/{,*/}*.{png,jpg,jpeg,gif,webp,svg}'
      //   ]
      // }
    },

    // // The actual grunt server settings
    // connect: {
    //   options: {
    //     port: 9000,
    //     // Change this to '0.0.0.0' to access the server from outside.
    //     hostname: 'localhost',
    //     livereload: 35729
    //   },
    //   livereload: {
    //     options: {
    //       open: true,
    //       base: [
    //         '.tmp',
    //         '<%= yeoman.app %>'
    //       ]
    //     }
    //   },
    //   test: {
    //     options: {
    //       port: 9001,
    //       base: [
    //         '.tmp',
    //         'test',
    //         '<%= yeoman.app %>'
    //       ]
    //     }
    //   },
    //   dist: {
    //     options: {
    //       base: '<%= yeoman.dist %>'
    //     }
    //   }
    // },

    // Replace masks with actual values
    // replace: {
    //   all: {
    //     options: {
    //       patterns: [
    //         {
    //           json: grunt.file.readJSON('settings-dev.json')
    //         }
    //       ]
    //     },
    //     files: [
    //       {src: ['app-settings.coffee.template'], dest: 'app-settings.coffee'}
    //     ]
    //   }
    // },

    // Make sure code styles are up to par and there are no obvious mistakes
    jshint: {
      options: {
        jshintrc: '.jshintrc',
        reporter: require('jshint-stylish')
      },
      all: [
        'Gruntfile.js'
      ]
    },

    // Empties folders to start fresh
    clean: {
      dist: {
        files: [{
          dot: true,
          src: [
            '.tmp',
            '<%= yeoman.dist %>/*',
            '!<%= yeoman.dist %>/.git*'
          ]
        }]
      },
      server: '.tmp'
    },

    // Add vendor prefixed styles
    autoprefixer: {
      options: {
        browsers: ['last 1 version']
      },
      dist: {
        files: [{
          expand: true,
          cwd: '.tmp/styles/',
          src: '{,*/}*.css',
          dest: '.tmp/styles/'
        }]
      }
    },

    // Automatically inject Bower components into the app
    bowerInstall: {
      dist: {
        src: ['views/partials/*.html']
      }
    },

    // Compiles CoffeeScript to JavaScript
    coffee: {
      options: {
        sourceMap: true,
        sourceRoot: ''
      },
      dist: {
        files: [
        // {
        //   expand: true,
        //   src: ['**/*.coffee', '!app/bower_components/**'],
        //   dest: 'dist',
        //   ext: '.js'
        // },
        {
          expand: true,
          cwd: '<%= yeoman.app %>/scripts',
          src: '**/*.coffee',
          dest: '.tmp/scripts',
          ext: '.js'
        }]
      },

      distServer: {
        options: {
          sourceMap: false
        },
        files: [{
          expand: true,
          src: [
            '**/*.coffee',
            '!app/**',
            '!test/**',
            '!node_modules/**'
          ],
          dest: 'dist',
          ext: '.js'
        }]
      },

      test: {
        files: [{
          expand: true,
          cwd: 'test/spec',
          src: '{,*/}*.coffee',
          dest: '.tmp/spec',
          ext: '.js'
        }]
      }
    },


    // Compiles Sass to CSS and generates necessary files if requested
    compass: {
      options: {
        sassDir: '<%= yeoman.app %>/styles',
        cssDir: '.tmp/styles',
        generatedImagesDir: '.tmp/images/generated',
        imagesDir: '<%= yeoman.app %>/images',
        javascriptsDir: '<%= yeoman.app %>/scripts',
        fontsDir: '<%= yeoman.app %>/styles/fonts',
        importPath: '<%= yeoman.app %>/bower_components',
        httpImagesPath: '/images',
        httpGeneratedImagesPath: '/images/generated',
        httpFontsPath: '/styles/fonts',
        relativeAssets: false,
        assetCacheBuster: false,
        raw: 'Sass::Script::Number.precision = 10\n'
      },
      dist: {
        options: {
          generatedImagesDir: '<%= yeoman.dist %>/images/generated'
        }
      },
      server: {
        options: {
          // debugInfo: true
        }
      }
    },

    // Renames files for browser caching purposes
    rev: {
      dist: {
        files: {
          src: [
            '<%= yeoman.dist %>/scripts/{,*/}*.js',
            '<%= yeoman.dist %>/styles/{,*/}*.css',
            '<%= yeoman.dist %>/images/{,*/}*.{png,jpg,jpeg,gif,webp,svg}',
            '<%= yeoman.dist %>/styles/fonts/*'
          ]
        }
      }
    },

    // Reads HTML for usemin blocks to enable smart builds that automatically
    // concat, minify and revision files. Creates configurations in memory so
    // additional tasks can operate on them
    // useminPrepare: {
    //   html: '<%= yeoman.app %>/index.html',
    //   options: {
    //     dest: '<%= yeoman.dist %>'
    //   }
    // },
    useminPrepare: {
      html: [
        'dist/views/partials/scripts.html',
        'dist/views/partials/styles.html'
      ],
      options: {
        root: '.',
        dest: 'dist'
      }
    },

    // Performs rewrites based on rev and the useminPrepare configuration
    // usemin: {
    //   html: ['<%= yeoman.dist %>/{,*/}*.html'],
    //   css: ['<%= yeoman.dist %>/styles/{,*/}*.css'],
    //   options: {
    //     assetsDirs: ['<%= yeoman.dist %>']
    //   }
    // },
    usemin: {
      html: [
        'dist/views/partials/scripts.html',
        'dist/views/partials/styles.html'
      ], // copy first, then update copied version
      // css: ['<%= yeoman.dist %>/styles/{,*/}*.css'],
      options: {
        // assetsDirs: ['dist']
      }
    },

    // // The following *-min tasks produce minified files in the dist folder
    imagemin: {
      dist: {
        files: [{
          expand: true,
          cwd: '<%= yeoman.app %>/images',
          src: '{,*/}*.{png,jpg,jpeg,gif}',
          dest: '<%= yeoman.dist %>/images'
        }]
      }
    },
    svgmin: {
      dist: {
        files: [{
          expand: true,
          cwd: '<%= yeoman.app %>/images',
          src: '{,*/}*.svg',
          dest: '<%= yeoman.dist %>/images'
        }]
      }
    },
    // Not necessary since compiled jade files are already minimized
    // htmlmin: {
    //   dist: {
    //     options: {
    //       collapseWhitespace: true,
    //       collapseBooleanAttributes: true,
    //       removeCommentsFromCDATA: true,
    //       removeOptionalTags: true
    //     },
    //     files: [{
    //       expand: true,
    //       cwd: '<%= yeoman.dist %>',
    //       src: ['*.html', 'views/{,*/}*.html'],
    //       dest: '<%= yeoman.dist %>'
    //     }]
    //   }
    // },

    filerev: {
      dist: {
        expand: true,
        src: [
          'dist/scripts/*.js',
          'dist/styles/*.css'
        ]
      }
    },

    // Allow the use of non-minsafe AngularJS files. Automatically makes it
    // minsafe compatible so Uglify does not destroy the ng references
    ngmin: {
      dist: {
        files: [{
          expand: true,
          cwd: '.tmp/concat/scripts',
          src: '*.js',
          dest: '.tmp/concat/scripts'
        }]
      }
    },

    // jade: {
    //   options: {
    //     client: true
    //   },
    //   dist: {
    //     files: [{
    //       expand: true,
    //       src: 'views/**/*.jade',
    //       dest: 'dist',
    //       ext: '.html'
    //     }]
    //   }
    // },

    // jadeUsemin: {
    //   dist: {
    //     options: {
    //       uglify: true
    //     },
    //     files: {
    //       src: [
    //         'views/layout.jade'
    //       ]
    //     }
    //   }
    // },

    script_tags: {
      options: {
        root: 'scripts'
      },
      dist: {
        files: {
          'views/partials/scripts.html': ['.tmp/**/*.js']
        }
      }
    },

    // Replace Google CDN references
    // cdnify: {
    //   dist: {
    //     html: ['<%= yeoman.dist %>/*.html']
    //   }
    // },

    cdnify: {
      dist: {
        options: {
          // cdn: require('cdnjs-cdn-data'),
          componentsPath: 'app/bower_components'
        },
        html: ['dist/views/{,*/}*.html']
      }
    },

    cdn_nobuild: {
      test: {
        options: {
        },
        files: [{
          expand: true,
          src: ['dist/views/{,*/}*.html'],
          dest: '.'
        }],
      }
    },

    // Copies remaining files to places other tasks can use
    copy: {
      dist: {
        files: [{
          expand: true,
          dot: true,
          cwd: '<%= yeoman.app %>',
          dest: '<%= yeoman.dist %>',
          src: [
            '*.{ico,png,txt}',
            '.htaccess',
            '*.html',
            'views/{,*/}*.html',
            'bower_components/**/*',
            'images/{,*/}*.{webp}',
            'fonts/*'
          ]
        }, {
          expand: true,
          cwd: '.tmp/images',
          dest: '<%= yeoman.dist %>/images',
          src: ['generated/*']
        }]
      },
      styles: {
        expand: true,
        cwd: '<%= yeoman.app %>/styles',
        dest: '.tmp/styles/',
        src: '{,*/}*.css'
      },
      views: {
        expand: true,
        src: ['views/**/*.{jade,html}'],
        dest: 'dist'
      }
    },

    // Run some tasks in parallel to speed up the build process
    concurrent: {
      options: {
        limit: 6
      },
      server: [
        'coffee:dist',
        'compass:server'
      ],
      test: [
        'coffee',
        'compass'
      ],
      dist: [
        'coffee',
        'compass:dist',
        'imagemin',
        'svgmin'
      ],
      debug: {
        tasks: [
          'node-inspector',
          'nodemon',
          'watch'
        ],
        options: {
          logConcurrentOutput: true
        }
      }
    },

    // By default, your `index.html`'s <!-- Usemin block --> will take care of
    // minification. These next options are pre-configured if you do not wish
    // to use the Usemin blocks.
    // cssmin: {
    //   dist: {
    //     files: {
    //       '<%= yeoman.dist %>/styles/main.css': [
    //         '.tmp/styles/{,*/}*.css',
    //         '<%= yeoman.app %>/styles/{,*/}*.css'
    //       ]
    //     }
    //   }
    // },
    // uglify: {
    //   dist: {
    //     files: {
    //       '<%= yeoman.dist %>/scripts/scripts.js': [
    //         '<%= yeoman.dist %>/scripts/scripts.js'
    //       ]
    //     }
    //   }
    // },
    // concat: {
    //   dist: {}
    // },

    // Test settings
    // Server side code
    mochaTest: {
      unit: {
        src: ['test/server/**/*.coffee']
      },
      options: {
        reporter: 'spec',
        require: [
          'coffee-script/register'
        ]
      }
    },

    // Client side code
    karma: {
      unit: {
        frameworks: ['mocha'],
        //configFile: 'karma.conf.js',
        singleRun: true,
        browsers: ['PhantomJS'],
        options: {
          files: ['test/client/**/*.coffee']
        }
      }
    }
  });


  grunt.registerTask('serve', function (target) {
    if (target === 'dist') {
      return grunt.task.run(['build', 'connect:dist:keepalive']);
    }

    grunt.task.run([
      'clean:server',
      // 'replace',
      'bowerInstall',
      'concurrent:server',
      'script_tags',
      'autoprefixer',
      'concurrent:debug'
    ]);
  });

  grunt.registerTask('test', [
    'clean:server',
    'concurrent:test',
    'autoprefixer',
    'mochaTest:unit'
    //'karma:unit'
  ]);

  grunt.registerTask('build', [
    'clean:dist',
    'bowerInstall',
    'useminPrepare',
    'concurrent:dist',
    'autoprefixer',
    'concat',
    'ngmin',
    'copy:dist',
    'cdnify',
    'cssmin',
    'uglify',
    'rev',
    'usemin',
    'coffee:distServer'
    // 'htmlmin' - no need when use jade
  ]);

  grunt.registerTask('useminAndRev', [
    'clean',
    'compass',
    'coffee:distServer',
    'coffee:dist',
    'copy:views',
    'cdnify',
    'cdn_nobuild',
    'useminPrepare',
    'concat',
    'uglify',
    'cssmin',
    'filerev',
    'usemin',
    'clean-after-filerev'
  ]);

  grunt.registerTask('default', [
    'newer:jshint',
    'test',
    'build'
  ]);
};
