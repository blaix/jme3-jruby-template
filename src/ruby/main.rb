require "java"
require "pathname"

PROJECT_ROOT = Pathname.new(File.expand_path("../..", File.dirname(__FILE__)))
$CLASSPATH << PROJECT_ROOT + "lib/java/jme3/jMonkeyEngine3.jar"

# Our own java classes will be compiled to this directory.
$CLASSPATH << PROJECT_ROOT + "package/classes/java"

# Our ruby code will be compiled as java classes here
$CLASSPATH << PROJECT_ROOT + "package/classes/ruby/ruby/lib"

# Our own ruby code should be under this directory...
$: << PROJECT_ROOT + "src/ruby/lib"

# ...for example, our ruby player class!
require "mygame/ruby_player"

java_import com.jme3.app.SimpleApplication
java_import com.jme3.material.Material
java_import com.jme3.math.Vector3f
java_import com.jme3.scene.Geometry
java_import com.jme3.scene.shape.Box
java_import com.jme3.math.ColorRGBA

class Main < SimpleApplication
  
  # You should be able to use simple_init_app here but it seemed buggy. So stick
  # with java-style camel-casing when overriding methods defined in jme java
  # classes. Oh well.
  def simpleInitApp

    # Draw a blue box. Look around with mouse. Move around with wasd.
    box = Box.new(Vector3f::ZERO, 1, 1, 1)
    geometry = Geometry.new("Box", box)
    material = Material.new(self.asset_manager, "Common/MatDefs/Misc/Unshaded.j3md")
    material.set_color("Color", ColorRGBA::Blue)
    geometry.material = material
    self.root_node.attach_child(geometry)

    # Example of using your own ruby and java classes.
    # Use include (ruby) and java_import (java) to access without namespaces.
    java_player = com.mygame.JavaPlayer.new
    ruby_player = Mygame::RubyPlayer.new
    
    # Output will display in the console (not the game window).
    puts java_player.greeting
    puts ruby_player.greeting
  end
end

main = Main.new
main.start
