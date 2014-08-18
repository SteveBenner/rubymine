# File Watchers
RubyMine uses a nice orderly data format for their file watcher configurations. You can export it as thus:

    Preferences -> Project Settings -> File Watchers -> Export (small button with a purple right-facing arrow)
    
I've been using the [gorgeous](https://github.com/mislav/gorgeous) gem to convert exported watcher files to YAML. It works well, although converting from YAML to XML doesn't. Still, it's a great start.

### Some objectives
- Set up file watcher in this directory to keep YAML/XML files mirrored at all times.
- Find out a way to install these files into a RubyMine project so watchers can be loaded programmatically.
- **Advanced:** figure out a way to implement dynamic configurations, e.g. setting the path to a gem executable based on your actual system settings. It shouldn't be too difficult to write a basic generator script for file watchers to accomplish this.

---
#### WATCHERS
- **slim** - Compiles [Slim](http://slim-lang.com/) templates into HTML.