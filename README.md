# RubyMine resources
In this repo you will find resources for [RubyMine](http://www.jetbrains.com/ruby/), my primary software development tool.

#### *Compatibility and relevance of these materials is only assured for RubyMine 8.0*

- ### [File Watchers](/file-watchers)

    Learn about the File Watcher feature, generate/install configurations using included script
  
- ## Plugins
    List of my currently installed plugins (highlighted items are paid/premium).
      
    #### JetBrains
    - Apache config (.htaccess) support
    - Chef integration
    - File Watchers
    - Ini4Idea
    - LiveEdit
    - NodeJS
    - Polymer & Web Components
  
    #### User-contributed
    - ***MultiMarkdown***
    - BashSupport
    - .gitignore support
    - Bitbucket
    - CodeGlance
    - String Manipulation
    - Erlang
    - Require.js plugin
    - nginx Support
    - EditorConfig
    - Inspection-JS
    - Spell Checker English Dictionary
    - CamelCase
    - coffeescript-idea
    - PMIP - Poor Mans IDE Plugin
    - LiveTemplatePreview
    - Spell Checker English Dictionary
    - String Manipulation
    - Webmaster

- ## Configuration and IDE settings (OS X)
    Information here is taken mainly from the [official JetBrains documentation][1].
    
    **Note:** `<VERSION>` represents the RubyMine release version in a single string where first digit is the **major** version, and the second is the **minor** version, e.g. `80` for version `8.0.x`.
    
    #### Java Virtual Machine settings
    Settings for the JVM used by RubyMine are defined in the file `$RUBYMINE_HOME/bin/rubymine.vmoptions`. To override the defaults, create a `rubymine.vmoptions` file in the config dir, which is located at `~/Library/Preferences/RubyMine<VERSION>/` by default (or at location specified by `idea.config.path`). The ENV variable `RUBYMINE_VM_OPTIONS` may also be used to specify a path to the `.vmoptions` file, but its unknown if this is supported currently.
    
    | Setting                       | Description                                                      | Default |
    |-------------------------------|------------------------------------------------------------------|---------|
    | `-XX:InitialHeapSize`         | Initial memory allocation for JVM heap                           | `128m`  |
    | `-XX:MaxHeapSize`             | Max memory allocation for JVM heap                               | `512m`  |
    | `-XX:PermSize`                | Initial memory allocation for JVM permanent heap (class objects) | `64m`   |
    | `-XX:MaxPermSize`             | Max memory allocation for JVM permanent heap (class objects)     | `64m`   |
    | `-XX:ReservedCodeCacheSize`   | Max memory allocated to the code cache                           | `32m`   |
    | `-XX:+UseCodeCacheFlushing`   | Automatically flushes code cache if full                         | `true`  |
    | `-XX:+UseCompressedOops`      | Enables optimization for 64-bit machines                         | `true`  |
    | `-XX:+DoEscapeAnalysis`       | Performance optimization                                         |         |
    | `-XX:+UseFastAccessorMethods` | Performance optimization                                         |         |
    | `-XX:+UseStringCache`         | Enables caching of commonly-used strings                         |         |
    | `-XX:+UseCompressedStrings`   | Performance optimization                                         |         |
    | `-XX:+OptimizeStringConcat`   | Performance optimization                                         |         |
    | `-XX:+UseParNewGC`            | Performance optimization for multi-core machines                 | `false` |
    
    *See [this blog post][2] for more info about JVM configuration options.*
    
    #### Global IDE settings (IDEA properties)
    System settings for RubyMine are defined in the file `$RUBYMINE_HOME/bin/idea.properties`. To override the defaults, create an `idea.properties` file in the config dir, which is located at `~/Library/Preferences/RubyMine<VERSION>/` by default (or at location specified by `idea.config.path`). The file location may also be specified using either of the ENV variables `RUBYMINE_PROPERTIES` and `IDEA_PROPERTIES`.
    
    | Property                                  | Description                                                   |
    |-------------------------------------------|---------------------------------------------------------------|
    | `idea.home`                               | `IDE installation location`                                   |
    | `idea.config.path`                        | `IDE config directory location`                               |
    | `idea.system.path`                        | `IDE cache directory location`                                |
    | `idea.plugins.path`                       | `IDE plugin directory location`                               |
    | `idea.log.path`                           | `IDE log directory location`                                  |
    | `idea.max.intellisense.filesize`          | Maximum size (`Kb`) of file to provide code assistance for |
    | `idea.popup.weight`                       | Defauts to `heavy`. Set to `medium` to prevent popup issues.  |
    | `idea.use.default.antialiasing.in.editor` | Force default system antialiasing to be used                  |
    | `idea.jars.nocopy` | Disables copying of library JAR files                  |
    | `idea.no.launcher` | Configure to use special launcher for running processes within IDE |
    | `idea.cycle.buffer.size` | Restrict console output to specified value (`Kb`) |
    | `idea.use.default.antialiasing.in.editor` | Force default system antialiasing to be used                  |
    |                                           |                                                               |
    
    idea.popup.weight=heavy
    idea.dynamic.classpath=false
    swing.bufferPerWindow=false
    CVS_PASSFILE=~/.cvspass
    idea.smooth.progress=false
    idea.max.intellisense.filesize=2500
    apple.awt.fullscreencapturealldisplays=false
    idea.cycle.buffer.size=1024
    com.apple.mrj.application.live-resize=false
    java.endorsed.dirs=
    sun.java2d.noddraw=true
    idea.jars.nocopy=true
    sun.java2d.pmoffscreen=false
    idea.use.default.antialiasing.in.editor=false
    idea.no.jre.check=true
    idea.fatal.error.notification=disabled
    apple.awt.graphics.UseQuartz=true
    idea.no.launcher=false
    sun.java2d.d3d=false
    apple.laf.useScreenMenuBar=true

    ### Environment variables used by RubyMine
    | Variable | Description | Default |
    |-----------------------------------------------------|----------------------------------------------|-------------------------------------------------|
    | `RUBYMINE_HOME`, `IDE_HOME` | Location of IDE installation folder | `/Applications/RubyMine<VERSION>.app/Contents/` |
    | `RUBYMINE_JDK`, `IDEA_JDK`, `JDK_HOME`, `JAVA_HOME` | Location of the Java VM to use with RubyMine | `$JAVA_HOME` |
    | `RUBYMINE_PROPERTIES`, `IDEA_PROPERTIES` | Location of the global IDE settings file | `idea.properties.file` |
    
    ### Important files and directories
    
    **Global IDE configuration**
    
    **User IDE/Project settings**
    
    | Description               | File path                                         | Configuration value |
    |---------------------------|---------------------------------------------------|---------------------|
    | Main product directory    | `~/.RubyMine<VERSION>`                            | `idea.home`         |
    | Settings and config files | `~/Library/Preferences/RubyMine<VERSION>`         | `idea.config.path`  |
    | Plugins                   | `~/Library/Application Support/RubyMine<VERSION>` | `idea.plugins.path`  |
    | Caches, logs, history     | `~/Library/Caches/RubyMine<VERSION>`              | `idea.system.path`  |
    | Logs                      | `~/Library/Logs/RubyMine<VERSION>`                | `idea.log.path`  |
    |                           |                                                   |                     |
    
    **Project settings**


[1]: https://www.jetbrains.com/ruby/help/
[2]: https://blog.codecentric.de/en/2012/07/useful-jvm-flags-part-4-heap-tuning/
