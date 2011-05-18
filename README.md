# jMonkeyEngine 3 with JRuby

This is an example/template for game programming using [jMonkeyEngine 3][1]
with [JRuby][2]. Including multi-platform packaging using [Rawr][3].

[1]: http://jmonkeyengine.com/
[2]: http://www.jruby.org/
[3]: http://rawr.rubyforge.org/

The sample code is adapted and expanded from
[the "Hello SimpleApplication" tutorial on the jme wiki](http://jmonkeyengine.org/wiki/doku.php/jme3:beginner:hello_simpleapplication)

## Important directories:

    jme3-jruby-template
    |
    |__lib
    |  |
    |  |__java # => Put third-party java libraries here
    |
    |__package
    |  |
    |  |__classes
    |     |
    |     |_java # => Where your own java classes get compiled to
    |
    |__src
       |
       |__java # => Source code for your own java classes
       |
       |__ruby
          |
          |__lib # => The bulk of your ruby code should live here
          |
          |__main.rb # => The file that actually gets run
        
## Running the sample code:

The sample code displays a blue box. You can walk around with the wasd keys
and look around with the mouse. As an example of mixing ruby and java, it also
includes code to print messages to the console from a ruby class and a java
class. See `src/ruby/main.rb` for the juicy details.

First, install [JRuby][1] and [Rawr][3]. I'll leave the specifics up to you,
but I highly recommend [rvm](https://rvm.beginrescueend.com/).

To run the code directly with jruby:

    rake rawr:compile
    jruby src/ruby/main.rb

## TODO:

When running the code as a jar or windows/osx executable, it chokes on
`require "mygame/ruby_player"`. Need to fix that and add packaging to the
usage instructions.
