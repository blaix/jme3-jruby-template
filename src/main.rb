# This is what turns on the java magic:
require "java"

# We're going to add some stuff to the java class path,
# this constant will make our lives easier.
require "pathname"
PROJECT_ROOT = Pathname.new(File.expand_path("..", File.dirname(__FILE__)))

# jme3 provides an "all-in-one" jar that includes all its assets and
# dependencies. Put it on the classpath and you will have access to everything
$CLASSPATH << PROJECT_ROOT + "lib/java/jme3/jMonkeyEngine3.jar"

# Our own java and ruby classes (under src) get compiled to these directories:
$CLASSPATH << PROJECT_ROOT + "package/classes/java"
$CLASSPATH << PROJECT_ROOT + "package/classes/ruby"

# Ruby's load path isn't as sexy as java's classpath, which means we still
# need to explicitely require our ruby classes for them to be available (just
# like vanilla ruby). Our java classes will "just work" (assuming you don't
# mind typing out the full package name - otherwise you can use `java_import`)
require "lib/mygame/ruby_player"

# We have access to all the jme3 classes since jMonkeyEngine3.jar is on our
# classpath. Here we use java_import on the classes we're going to use so we
# don't have to type out the whole package name every time.
java_import com.jme3.app.SimpleApplication
java_import com.jme3.material.Material
java_import com.jme3.math.Vector3f
java_import com.jme3.scene.Geometry
java_import com.jme3.scene.shape.Box
java_import com.jme3.math.ColorRGBA
# We could do the same thing with our own java classes if we want.
# For example: java_import com.mygame.JavaPlayer

class Main < SimpleApplication
  
  # JRuby lets you use ruby-style method names for java methods, which means
  # we should be able to use simple_init_app here, but it seemed buggy. So
  # we should stick with java-style camel-casing when overriding methods
  # defined in jme java classes. Oh well.
  def simpleInitApp

    # Draw a blue box. Look around with mouse. Move around with wasd.
    # This is straight out of the first tutorial on the jme3 wiki:
    # http://jmonkeyengine.org/wiki/doku.php/jme3:beginner:hello_simpleapplication
    # but updated to use ruby-style method calls.
    box = Box.new(Vector3f::ZERO, 1, 1, 1)
    geometry = Geometry.new("Box", box)
    material = Material.new(self.asset_manager, "Common/MatDefs/Misc/Unshaded.j3md")
    material.set_color("Color", ColorRGBA::Blue)
    geometry.material = material
    self.root_node.attach_child(geometry)

    # Example of using our own ruby and java classes.
    # These are defined under src/java and src/lib
    # I avoided using include/java_import to show the conventional
    # relationship between file paths and namespaces.
    java_player = com.mygame.JavaPlayer.new
    ruby_player = Mygame::RubyPlayer.new
    
    # Output will display in the console (not the game window).
    puts java_player.greeting
    puts ruby_player.greeting
  end
end

# There is no automatically-executed main method in ruby,
# so we need to explicitely call .start outside of our class.
main = Main.new
main.start
