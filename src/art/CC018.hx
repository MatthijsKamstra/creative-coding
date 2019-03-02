package art;

/**
 * short description what this does
 */
class CC018 extends CCBase implements ICCBase {

	var shapeArray : Array<Circle> = [];
	var grid = new GridUtil();

	var _size = 75;

	public function new(ctx:CanvasRenderingContext2D) {
		super(ctx);
		description = '';
	}

	function createShape(i:Int, point:Point){
		var shape : Circle = {
			_id: '$i',
			_type: 'circle',
			x: point.x,
			y: point.y,
			radius: random (5,(_size/2)),
		}
		onYoYoHandler(shape);
		return shape;
	}

	function drawShape(){

		if (isDebug) {
			ShapeUtil.gridField(ctx, grid);
		}
		ctx.fillColourRGB(BLACK);
		for ( i in 0 ... shapeArray.length ) {
			var circle : Circle = shapeArray[i];
			ctx.circle(circle.x, circle.y, circle.radius);
		}
	}

	function onYoYoHandler(circle:Circle){
		Go.to(circle, random(0.1,2)).prop('radius',random (5,(_size/2)) ).yoyo().ease(Sine.easeInOut).onComplete(onYoYoHandler, [circle]);
	}


	override function setup(){
		trace('setup: ${toString()}');

		// isDebug = true;

		grid.setCellSize(_size);
		grid.setIsCenterPoint(true);

		// trace(grid.cellHeight);
		// trace(grid.cellWidth);

		for ( i in 0 ... grid.array.length ) {
			var point : Point = grid.array[i];
			shapeArray.push(createShape(i, point));
		}

	}

	override function draw(){
		// trace('draw: ${toString()}');
		ctx.clearRect(0,0,w,h);
		// ctx.backgroundObj(BLACK);

		drawShape();

		// stop();
	}
}