# File Watchers
The RubyMine 'file watcher' system is highly configurable, and allows for one or more 'watchers' to be defined using a straightforward XML format, as well as imported/exported in this format. More specific information can be found within [the schema file](file-watchers/schema.yml).

### Configuration protocol (v6.3.3)

The fundamental XML schema for watcher configurations is a `TaskOptions` element which contains a list of `option` elements, each defining a unique setting via `name` and `value` attributes. They may exist as standalone or as a collection within their parent element, which is determined by the type of configuration file. Example:

```xml
<TaskOptions isEnabled="">
  <option name="" value=""/>
  ...
</TaskOptions>
```

**Importing / Exporting**

When using the GUI to import or export watchers, they are simply wrapping in a parent `TaskOptions` element.

```xml
<TaskOptions>
  ...
</TaskOptions>
```

**Project-level configuration**

File watchers for a project can be defined within the file `.idea/watcherTasks.xml`, enumerated within the following structure:

```xml
<project version="4">
  <component name="ProjectTaskOptions">
    ...
  </component>
</project>

```

** IDE defaults**

RubyMine stores default watcher settings for the current user in `~/Library/Preferences/RubyMine60/options/watcherDefaultTasks.xml` using the following schema:

```xml
<application>
  <component name="ApplicationTaskOptions">
    ...
  </component>
</application>

```

## Generator script
Using Slim templates, I created a script that generates file watcher config XML from simple YAML files, which 


---

### Some objectives
- Set up file watcher in this directory to keep YAML/XML files mirrored at all times.
- Find out a way to install these files into a RubyMine project so watchers can be loaded programmatically.
- **Advanced:** figure out a way to implement dynamic configurations, e.g. setting the path to a gem executable based on your actual system settings. It shouldn't be too difficult to write a basic generator script for file watchers to accomplish this.

---
#### WATCHERS
**You can use the XML files in this directory as File Watchers by importing them via Rubymine's GUI.**

- **slim** - Compiles [Slim](http://slim-lang.com/) templates into HTML.

---

**TODO:**

- spread the word [here](https://www.jetbrains.com/ruby/help/file-watchers.html)