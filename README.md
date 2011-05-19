# jMonkeyEngine 3 with JRuby

This is an example/template for game programming using [jMonkeyEngine 3][1]
with [JRuby][2]. Including multi-platform packaging using [Rawr][3].

[1]: http://jmonkeyengine.com/
[2]: http://www.jruby.org/
[3]: http://rawr.rubyforge.org/

## Getting started:

Take a look at `src/main.rb`. It's a port of
[the "Hello SimpleApplication" tutorial on the jme wiki](http://jmonkeyengine.org/wiki/doku.php/jme3:beginner:hello_simpleapplication)
with additional code to illustrate using your own ruby and java classes alongside each other.

### Running the sample code:

The sample code draws a blue box, lets you walk around with the wasd keys,
look around with the mouse, and hit `ESC` to exit. It also prints some
messages to the console to illustrate calling your own custom ruby and java
classes.

Make sure you have [JRuby][1] and [Rawr][3]. I'll leave the specifics up to you,
but I highly recommend using [rvm](https://rvm.beginrescueend.com/).

To run the code directly with jruby:

    rake rawr:compile
    jruby src/ruby/main.rb
    
*You only need the compile step if you have java code under `src/java` (which we do).*

Or to package and run the app as a jar:

    rake rawr:jar
    java -jar package/jar/jme3-jruby-template.jar

Or to package and run the app as an OS X .app:

    rake rawr:bundle:app
    open package/osx/jme3-jruby-template.app
    
Or to package and run the app as a Windows .exe:

    rake rawr:bundle:exe
    package/windows/jme3-jruby-template.exe

## Important files/directories:

    jme3-jruby-template
    |
    |__lib
    |  |
    |  |__java # => Third-party java libraries (jars)
    |  |
    |  |__ruby # => Third-party ruby libraries (unpacked gems)
    |
    |__package
    |  |
    |  |__classes
    |     |
    |     |__java # => *.class files compiled from the *.java files under src/java
    |     |
    |     |__ruby # => *.class files compiled from the *.rb files under src/ruby
    |
    |__src
       |
       |__java # => Your own java source code lives here
       |
       |__ruby # => Your own ruby source code lives here
          |
          |__main.rb # => The file that gets executed on startup

## TODO:

* using gems...
