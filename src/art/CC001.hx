package art;

// quick and dirty import for Haxe JavaScript
import js.Browser.*;
import js.html.*;

//	quick and dirtier way to create Globals
import Global.*;

//  syntactic sugar to extend CanvasRenderingContext2D
using CanvasTools;

class CC001 extends CCBase implements ICCBase {

	public function new(ctx:CanvasRenderingContext2D) {
		super(ctx);
	}

	override function draw(){
		trace('draw: ${toString()}');
		ctx.background(0,0,0);
		ctx.fillColour(255,255,255);
		ctx.fillCircle(w/2, h/2, 100);
		pause();
	}
}