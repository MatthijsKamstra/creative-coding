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
// easy access to typedef
import AST;

// syntactic sugar to extend CanvasRenderingContext2D
using CanvasTools;


/**
 * a lot of balls bouncin of the walls, no trail
 * draw lines beteen
 */
class CC004 extends CCBase implements ICCBase {

	var maxBalls = 200;
	var sizeBall = 3;
	var ballArray : Array<Ball> = [];

	public function new(ctx:CanvasRenderingContext2D) {
		super(ctx);
	}

	override function init(){
		trace('${toString()} :: init()');
		for (i in 0...maxBalls){
			ballArray.push( createBall() );
		}
	}

	override function draw(){
		moveBall();
		ctx.clearRect(0, 0, width, height);
		ctx.background(0,0,0);
		drawBall();
	}

	function createBall() : Ball{
		var ball : Ball = {
			x: random(sizeBall/2, w-(sizeBall/2)),
			y: random(sizeBall/2, h-(sizeBall/2)),
			speed_x: random(-0.5, 0.5),
			speed_y: random(-0.5, 0.5),
			size: sizeBall,
			colour: rgb(255,255,255),
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
				// b.colour = rgb(randomInt(55),randomInt(255),0);
			}
			if (bounce(b.y, 0 ,h, b.size)) {
				b.speed_y *=-1;
				// b.colour = rgb(0, randomInt(255),randomInt(55));
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