require "java"
require "pathname"

PROJECT_ROOT = Pathname.new(File.expand_path("../..", File.dirname(__FILE__)))

# Load up what we need to run a simple jme3 app:
$CLASSPATH << PROJECT_ROOT + "lib/java/jme3/jMonkeyEngine3.jar"
java_import "com.jme3.app.SimpleApplication"
java_import "com.jme3.material.Material"
java_import "com.jme3.math.Vector3f"
java_import "com.jme3.scene.Geometry"
java_import "com.jme3.scene.shape.Box"
java_import "com.jme3.math.ColorRGBA"

# Directories containing our compiled classes get added to the class path...
$CLASSPATH << PROJECT_ROOT + "package/classes/java"
$CLASSPATH << PROJECT_ROOT + "package/classes/ruby"

# And directories containing our source code get added to the load path...
$: << PROJECT_ROOT + "src/ruby"
$: << PROJECT_ROOT + "src/java"

# Use require to pull in our own ruby files
# and java_import to pull in our own java classes
require "ruby_player"
java_import "JavaPlayer"

class Main < SimpleApplication
  def simpleInitApp

    # The typical "Hello World" jme code, ported straight from:
    # http://jmonkeyengine.org/wiki/doku.php/jme3:beginner:hello_simpleapplication
    box = Box.new(Vector3f::ZERO, 1, 1, 1)
    geometry = Geometry.new("Box", box)
    material = Material.new(self.asset_manager, "Common/MatDefs/Misc/Unshaded.j3md")
    material.set_color("Color", ColorRGBA::Blue)
    geometry.material = material
    self.root_node.attach_child(geometry)

    # Example of using our own ruby and java classes:
    java_player = JavaPlayer.new # from src/java/JavaPlayer.java
    ruby_player = RubyPlayer.new # from src/ruby/ruby_player.rb
    
    # Output will display in the console (not the game window).
    puts java_player.greeting
    puts ruby_player.greeting
  end
end

main = Main.new
main.start
