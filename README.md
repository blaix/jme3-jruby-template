# jMonkeyEngine 3 with JRuby

This is an example/template for game programming using [jMonkeyEngine 3][1]
with [JRuby][2]. Including multi-platform packaging using [Rawr][3].

[1]: http://jmonkeyengine.com/
[2]: http://www.jruby.org/
[3]: http://rawr.rubyforge.org/

The sample code is adapted and expanded from
[the "Hello SimpleApplication" tutorial on the jme wiki](http://jmonkeyengine.org/wiki/doku.php/jme3:beginner:hello_simpleapplication)

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
    |     |__java # => *.class files compiled from the *.java files under src/
    |     |
    |     |__ruby # => *.class files compiled from the *.rb files under src/
    |
    |__src
       |
       |__java # => Source code for your java classes
       |
       |__lib # => Source code for your ruby classes
       |
       |__main.rb # => The file that gets executed on startup

The meat of your app is under `src`. This is where your own ruby and java
source code lives. Third-party code lives under `lib` (not to be confused with
`src/lib`), and everything gets compiled to `package` (customizable in
`build_configuration.rb`).

## Running the sample code:

The sample code displays a blue box. You can walk around with the wasd keys
and look around with the mouse. Hit `ESC` to quit. As an example of mixing
ruby and java, it also includes code to print messages to the console from a
ruby class and a java class. See `src/ruby/main.rb` for the juicy details.

First, install [JRuby][1] and [Rawr][3]. I'll leave the specifics up to you,
but I highly recommend [rvm](https://rvm.beginrescueend.com/).

To run the code directly with jruby:

    rake rawr:compile
    jruby src/ruby/main.rb
    
You only need the compile step if you have java code under `src`.

To package and run the app as a jar:

    rake rawr:jar
    java -jar package/jar/jme3-jruby-template.jar

To package and run the app as an OS X .app:

    rake rawr:bundle:app
    open package/osx/jme3-jruby-template.app
    
To package and run the app as a Windows exe:

    rake rawr:bundle:exe
    package/osx/jme3-jruby-template.exe

## TODO:

* using gems...
