# File Watchers
RubyMine uses a nice orderly data format for their file watcher configurations. **You can export one as thus:**

    Preferences -> Project Settings -> File Watchers -> Export (small button with a purple right-facing arrow)
    
The configuration data is completely documented in the [rubymine.yml]() file (as well as my default settings).

Right now I'm building these configuration files using Slim templates of my own device; the solution is pretty hacky at the moment but I'm shaping it into a legit project scaffolding system based on Slim and YAML...

The objectives listed below will be fully attainable with some more work... Luckily, Rubymine uses a very straightforward protocol for their configuration files. I've already had success, for instance, with programmatically installing file watcher configurations into a project.

### Some objectives
- Set up file watcher in this directory to keep YAML/XML files mirrored at all times.
- Find out a way to install these files into a RubyMine project so watchers can be loaded programmatically.
- **Advanced:** figure out a way to implement dynamic configurations, e.g. setting the path to a gem executable based on your actual system settings. It shouldn't be too difficult to write a basic generator script for file watchers to accomplish this.

---
#### WATCHERS
**You can use the XML files in this directory as File Watchers by importing them via Rubymine's GUI.**

- **slim** - Compiles [Slim](http://slim-lang.com/) templates into HTML.