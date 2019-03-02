package art;

// quick and dirty import for Haxe JavaScript
import js.Browser.*;
import js.html.*;

// easy access to Globals
import Sketch.Global.*;
// easy access to the utils
// import MathUtil.*;
// import ColorUtil.*;
// import lib.util.AnimateUtil.*;
// easy access to typedef
// import lib.AST;

// syntactic sugar to extend CanvasRenderingContext2D
// using lib.CanvasTools;


/**
 * maximum nr balls bouncing around and changing color when bounce, with trail
 */
class CC003 extends CCBase implements ICCBase {

	var maxBalls = 10;
	var sizeBall = 20;
	var ballArray : Array<Ball> = [];

	public function new(ctx:CanvasRenderingContext2D) {
		super(ctx);
	}

	/**
	 * create balls that bounce of the border of the canvas
	 */
	override public function setup(){
		trace('setup: ${toString()}');
		ctx.background(255,255,255, 0.2);
		for (i in 0...maxBalls){
			ballArray.push( createBall() );
		}
	}

	override function draw(){
		moveBall();
		drawBall();
	}

	function createBall() : Ball{
		var ball : Ball = {
			x: random(sizeBall/2, w-(sizeBall/2)),
			y: random(sizeBall/2, h-(sizeBall/2)),
			speed_x: random(-5, 5),
			speed_y: random(-5, 5),
			size: sizeBall,
			colour: rgb(randomInt(55),randomInt(255),0)
		}
		return ball;
	}

	function moveBall(){
		for ( i in 0 ... ballArray.length ) {
			var b = ballArray[i];
			b.x = b.x + b.speed_x;
			b.y = b.y + b.speed_y;
			if (bounce(b.x, 0, w, b.size)) {
				b.speed_x *=-1;
				b.colour = rgb(randomInt(55),randomInt(255),0);
			}
			if (bounce(b.y, 0 ,h, b.size)) {
				b.speed_y *=-1;
				b.colour = rgb(0, randomInt(255),randomInt(55));
			}
		}
	}

	function drawBall(){
		for ( i in 0 ... ballArray.length ) {
			var b = ballArray[i];
			ctx.fillStyle = b.colour;
			ctx.fillCircle(b.x, b.y, b.size);
			// ctx.fillEllipse(b.x, b.y, b.size, b.size);
		}
	}

}