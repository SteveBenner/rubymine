# File Watcher resources
The JetBrains plugin `File Watchers` provides support for running external processes which activate based on file changes. RubyMine offers pre-defined templates for common transpilers such as Sass/CoffeeScript/etc, **but also supports custom File Watcher configurations**. File Watchers can be added to a project via the GUI, or explicitly as `XML` config files.

## Templates
The [`templates`](templates/) directory contains my custom File Watcher definitions in YAML format. Using the included `fw-gen.rb` script, these can be installed into a RubyMine project directly, or converted to `XML` files which can be imported manually.

**NOTE:** requires `slim` gem.

### Usage
*todo*

### Configuration reference
*Taken from [official JetBrains documentation][3]*

| Option | Description |
|-------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `name` | Name of the File Watcher item |
| `description` | Description of the File Watcher |
| `program` | Command to run on file change (normally path of an executable) |
| `arguments` | Argument string passed to the program (must be shell-escaped) |
| `fileExtension` | Type of file to monitor for changes |
| `workingDir` | Directory in which to run the program (*default: parent directory of modified file*) |
| `output` | Colon-separated list of paths where transpiled files are outputted to |
| `immediateSync` | File Watcher will trigger on change to source code when `true`, and on file save or frame deactivation when `false` |
| `trackOnlyRoot` | File Watcher will trigger only for root file importing changed file when `true`, and will trigger for all files which import changed file when `false` |
| `exitCodeBehavior` | Determines if console is shown based on output from File Watcher (*default: `ERROR`; alt: `ALWAYS`, `NEVER`*) |
| `checkSyntaxErrors` | When `true`, File Watcher will not trigger on files containing syntax errors |
| `outputFromStdout` | When `true`, File Watcher output is generated from program `stdout` (*default: `false`*) |
| `passParentEnvs` | When `true`, all `ENV` variables are carried over to child process of File Watcher |
| `scopeName` | Specifies files which File Watcher is applied to (*default: `Project Files`; alt: `Project Production Files`, `Project Test Files`, `Changed Files`, `Default`*) |
| `outputFilters` |  Specifies which portion of output to highlight and/or hyperlink |
| `envs` | Set `ENV` variables for program |

### There are 3 *File Watchers* XML configuration protocols
A *File Watcher* definition is represented in JetBrains `xml` configuration files with a `TaskOptions` element. Such an element may be used in several different types of configuration file. *See the [*File Watcher* configuration definition](#jetbrains-file-watcher-xml-configuration-definition) for specific details.*

1. **One or more *File Watcher* definitions may be imported or exported via `xml` config file, using the GUI**

    In the IDE preferences, under `Tools` -> `File Watchers`, one or more *File Watchers* may be imported into the current project or exported via `xml` configuration file. The format is very simple, consisting only of a single `TaskOptions` parent element.
      
    ```xml
    <TaskOptions>
      <!-- one or more File Watcher items -->
    </TaskOptions>
    ```

2. **Project-wide *File Watcher* configuration file**

    The *File Watcher* definitions for a JetBrains project are stored under the local `.idea/` folder, within the file `watcherTasks.xml`. By editing this file, one can manually configure a project's *File Watchers*. The `xml` format is as follows, with given values:
    
    ```xml
    <project version="4">
      <component name="ProjectTasksOptions">
        <!-- one or more File Watcher items -->
      </component>
    </project>
    ```

3. **IDE Default Watchers**

    There is a configuration file `~/Library/Preferences/RubyMine60/options/watcherDefaultTasks.xml` which appears to store the 'watcher' configurations used as templates when creating a new File Watcher via the preference pane. Manually adding data to this file produces no results, so whether or not it has any use remains to be seen. The 'watchers' are wrapped in the following XML:
    
    ```xml
    <application>
      <component name="ApplicationTaskOptions">
        ...
      </component>
    </application>
    ```

### JetBrains *File Watcher* XML configuration definition
The data representation of a *File Watcher* is a `<TaskOptions>` element containing one or more `<option>` elements that correspond exactly with the fields and controls in the GUI interface. Because the format is so intuitive, [writing a script to generate my own configurations proved quite simple][3]. Below is the complete example XML for a single 'watcher'; for documentation and default values, see [this file][2].

```xml
<TaskOptions>
  <option name="arguments" value="" />
  <option name="checkSyntaxErrors" value="true" />
  <option name="description" value="" />
  <option name="exitCodeBehavior" value="ERROR" />
  <option name="fileExtension" value="" />
  <option name="immediateSync" value="true" />
  <option name="name" value="" />
  <option name="output" value="" />
  <option name="outputFilters">
    <array>
      <FilterInfo>
        <option name="description" value="" />
        <option name="name" value="" />
        <option name="regExp" value="" />
      </FilterInfo>
    </array>
  </option>
  <option name="outputFromStdout" value="true" />
  <option name="passParentEnvs" value="true" />
  <option name="program" value="" />
  <option name="scopeName" value="Project Files" />
  <option name="trackOnlyRoot" value="false" />
  <option name="workingDir" value="" />
  <envs>
    <env name="" value="" />
  </envs>
</TaskOptions>
```



[1]: https://www.jetbrains.com/ruby/help/using-file-watchers.html
[2]: /file-watchers/schema.yml
[3]: https://www.jetbrains.com/ruby/help/new-watcher-dialog.html