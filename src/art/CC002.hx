package art;

// quick and dirty import for Haxe JavaScript
import js.Browser.*;
import js.html.*;

//	quick and dirtier way to create Globals
import lib.Global.*;
import lib.util.ColorUtil.*;

//  syntactic sugar to extend CanvasRenderingContext2D
using lib.CanvasTools;

class CC002 extends CCBase implements ICCBase {

	public function new(ctx:CanvasRenderingContext2D) {
		super(ctx);
	}

	override function draw(){
		trace('draw: ${toString()}');
		// ctx.triangle(Math.floor(w/2), 100, Math.floor(w/3), 300, Math.floor(w/3)*2, 300);
		ctx.fillColour(LIME.r, LIME.g, LIME.b);
		// ctx.fillColour(255,255,255);
		ctx.fillEllipse(w/2,h/2,100,200);
		pause();
	}
}