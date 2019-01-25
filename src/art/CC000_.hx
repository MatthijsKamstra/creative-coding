package art;

// quick and dirty import for Haxe JavaScript
import js.Browser.*;
import js.html.*;

// easy access to Globals
import Global.*;
// easy access to the utils
import util.MathUtil.*;
import util.ColorUtil.*;
import util.AnimateUtil.*;

// syntactic sugar to extend CanvasRenderingContext2D
using CanvasTools;

class CC000 extends CCBase implements ICCBase {

	public function new(ctx:CanvasRenderingContext2D) {
		super(ctx);
	}

	override function init(){
		var w03 = w*0.3;
		var h03 = h*0.3;
		var size = 200;

		ctx.strokeWeight(100);
		ctx.line(w03, h03, w03+size, h03+size);
		ctx.line(w03+size, h03, w03, h03+size);
	}

	override function draw(){
		trace('draw: ${toString()}');
	}
}