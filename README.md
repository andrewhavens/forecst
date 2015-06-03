Forecst
=======

Simple status bar app written in RubyMotion.

It uses the Forecast.io API to send notifcations at set intervals that contain the coming hours weather forecast.

### Note about release.

There are definitely some areas where it can be improved and I aim to do this over the next few weeks. (check out that #menu method :|)

I've open sourced it because it was never put up on the MAS (Mac App Store) and some people might get something
from it.

Feel free to send PR's if you would like.

### Troubleshooting

If you run into this error when trying to run the app:

```
Undefined symbols for architecture x86_64:
  "_NSVariableStatusItemLength", referenced from:
      _MREP_AD6BF057C6F540AB8877D69D592DB035 in status_menu.rb.o
ld: symbol(s) not found for architecture x86_64
clang: error: linker command failed with exit code 1 (use -v to see invocation)
rake aborted!
Command failed with status (1): [/usr/bin/clang++ -o "./build/MacOSX-10.10-...]
/Library/RubyMotion/lib/motion/project/builder.rb:342:in `build'
/Library/RubyMotion/lib/motion/project/app.rb:78:in `build'
/Library/RubyMotion/lib/motion/project/template/osx.rb:43:in `block (2 levels) in <top (required)>'
/Library/RubyMotion/lib/motion/project/template/osx.rb:61:in `block in <top (required)>'
```

Then you will need to set the deployment target to 10.9 in the `Rakefile`:

    app.deployment_target = "10.9"

This is due to an Apple bug. See [RM-877](http://hipbyte.myjetbrains.com/youtrack/issue/RM-887) for more info.
