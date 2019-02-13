package art;

/**
 * short description what this does
 */
class CC033 extends CCBase implements ICCBase {

	var shapeArray : Array<Circle> = [];
	var grid : GridUtil = new GridUtil();

	var cellsize = 150;
	var _rotation = 0.0;
	var _speed = 0.5;
	// var delaycounter = 0.0;
	// var totalCounter = 100;

	public function new(ctx:CanvasRenderingContext2D) {
		super(ctx);
		description = '';
		window.addEventListener("mousemove", onMouseMoveHandler);

	}

	function arrowConverter(size):Array<Point>{
		var _w = size;
		var _h = size;
		var pointArray : Array<Point> = [];
		pointArray.push({x:_w/2,y:0});
		pointArray.push({x:_w,y:_h/2});
		pointArray.push({x:_w-(_w/4),y:_h/2});
		pointArray.push({x:_w-(_w/4),y:_h});
		pointArray.push({x:(_w/4),y:_h});
		pointArray.push({x:(_w/4),y:_h/2});
		pointArray.push({x:0,y:_h/2});
		return pointArray;
	}


	function arrowDraw(pointArray: Array<Point>, pos:Point){

		ctx.save();
		ctx.translate(pos.x+cellsize/2, pos.y+cellsize/2);
		ctx.rotate(radians(_rotation) );

		ctx.beginPath();
		ctx.fillColourRGB(WHITE);
		for ( i in 0 ... pointArray.length ) {
			var _point = pointArray[i];
			_point.x -= cellsize/2;
			_point.y -= cellsize/2;
			if(i==0){
				ctx.moveTo(_point.x, _point.y);
			} else {
				ctx.lineTo(_point.x, _point.y);
			}
		}
		ctx.fill();
		ctx.closePath();
		ctx.restore();


	}

	function drawShape(){
		ctx.clearRect(0,0,w,h);
		ctx.backgroundObj(BLACK);

		if (isDebug) {
			ShapeUtil.gridField(ctx, grid);
		}
		for ( i in 0 ... grid.array.length ) {
			var gridPoint : Point = grid.array[i];
			var pointArray : Array<Point> = arrowConverter(cellsize);
			// arrowDraw(pointArray, gridPoint);
		}

		// if(Math.round(_rotation) == 360) _rotation = 0;
		// if(Math.round(_rotation) == 0 || Math.round(_rotation) == 180) {
		// 	delaycounter ++;
		// 	if(delaycounter >= totalCounter){
		// 		delaycounter = 0;
		// 		_rotation += _speed;
		// 	}
		// 	return;
		// }
		// _rotation += _speed;


	}



	// ____________________________________ override ____________________________________

	override function setup(){
		trace('setup: ${toString()}');

		isDebug = true;

		// grid.setDimension(w*2.1, h*2.1);
		// grid.setNumbered(3,3);
		grid.setCellSize(cellsize);
		// grid.setIsCenterPoint(true);


	}

	override function draw(){
		// trace('draw: ${toString()}');
		drawShape();
		// stop();
	}

	// ____________________________________ handler ____________________________________

	function onMouseMoveHandler(e:js.html.MouseEvent) {
		trace(e.clientX, e.clientY);
		var point:Point = {
			x: e.clientX,
			y: e.clientY
		}


		var firstP = grid.array[0];

		var angle = lib.util.MathUtil.angle(point.x, point.y, firstP.x, firstP.y);
		trace(angle);


		// for (j in 0...shapeArray.length) {
		// 	var b2 = shapeArray[j];
		// 	if (point == b2)
		// 		continue;
		// 	var currentDistance = distance(point.x, point.y, b2.x, b2.y);
		// 	// trace('-----\n ${line} / ${b2} -- ${currentDistance}');
		// 	if (currentDistance < maxDistance) {

		// 		console.log('minRadius: $minRadius');
		// 		console.log('maxRadius: $maxRadius');
		// 		console.log('(maxRadius / minRadius): ($maxRadius / $minRadius) -> ${(maxRadius / minRadius)}');
		// 		console.log('(maxDistance / currentDistance): ($maxDistance / $currentDistance) -> ${(maxDistance / currentDistance)}');

		// 		// var alpha:Float = 0.8 - (currentDistance / maxDistance); // 0.5
		// 		// b2.radius = alpha;
		// 		// b2.radius = minRadius + ((maxRadius / minRadius) * (maxDistance / currentDistance));
		// 		// b2.radius = maxRadius - (minRadius + ((currentDistance/maxDistance) * (maxRadius-minRadius))) ;
		// 		b2.radius = maxRadius - ((currentDistance/maxDistance) * (maxRadius-minRadius)) ;
		// 	} else {
		// 		b2.radius = minRadius;
		// 	}
		// }
	}

	function onAnimateHandler(circle:Circle) {
		// GoJs.to(circle, 5).x(w/2).y(h/2).ease(lets.easing.Sine.easeInOut).onComplete(onAnimateHandler, [circle]);
	}

}