package art;

// quick and dirty import for Haxe JavaScript
import js.Browser.*;
import js.html.*;

// even quick and dirtier way to create Globals
import Global.*;

class CC000 extends CCBase implements ICCBase {

	public function new(ctx:CanvasRenderingContext2D) {
		super(ctx);
	}

	override function draw(){
		trace('draw: ${toString()}');
	}
}