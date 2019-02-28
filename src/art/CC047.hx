package art;

/**
 * short description what this does
 */
class CC047 extends CCBase implements ICCBase {
	var shapeArray:Array<Circle> = [];
	var grid:GridUtil = new GridUtil();
	// sizes
	var _radius = 150;
	var _cellsize = 150;
	var _max = 1;
	// colors
	var _color0:RGB = null;
	var _color1:RGB = null;
	var _color2:RGB = null;
	var _color3:RGB = null;
	var _color4:RGB = null;
	// settings
	var panel1:QuickSettings;
	// mouse stuff
	var _follow:Circle;
	var _leader:Circle;
	// mouse settings
	var isClear:Bool = true;
	var isClearDefault:Bool = true;
	var isAuto:Bool = false;
	var isAutoDefault:Bool = false;
	var momentumx = 0.0;
	var momentumy = 0.0;
	var speed = 6.0; // default: 3, quicker: 1, slower: 6
	var defaultSpeed = 6.0;
	var bounce = 0.9; // default: 0.75, less bounce: 0.5, more bounce: 0.9
	var defaultBounce = 0.75;

	public function new(ctx:CanvasRenderingContext2D) {
		description = 'Mouse trailer with elasticy';
		type = [CCType.ANIMATION, CCType.IMAGE, CCType.INTERACTIVE];

		createQuickSettings();

		super(ctx);
	}

	// ____________________________________ settings ____________________________________
	function createQuickSettings() {
		// demo/basic example
		panel1 = QuickSettings.create(10, 10, "Elastic mouse")
			.setGlobalChangeHandler(untyped drawShape) // .addHTML("Check the best settings", "Sometimes I need a quick quote, to post on Instagram")

			.addHTML('Speed and Bounce', '<b>speed</b> changes the speed of the movement (1=high, 9=slow),<br><b>bounce</b> the elasticy (0.5=less, 0.9=more)')

			.addRange('Speed', 0.0, 100.0, defaultSpeed, 1.0, function(value) setSpeed(value))
			.addRange('Bounce', 0.0, 0.99, defaultBounce, 0.01, function(value) setBounce(value))

			.addBoolean('Auto', isAutoDefault, function(value) setAutomatic(value))
			.addBoolean('Clear', isClearDefault, function(value) setClear(value))

			.addButton('Reset', function(e) setReset())

			.saveInLocalStorage('store-data-${toString()}');
	}

	function setBounce(value) {
		bounce = value;
	}

	function setSpeed(value) {
		speed = value;
	}

	function setClear(is:Bool) {
		isClear = is;
	}
	function setAutomatic(isAutomatic:Bool) {
		isAuto = isAutomatic;
		if (isAuto) {
			onAnimateHandler();
		} else {
			if (go != null) {
				go.stop();
			}
		}
	}

	function setReset() {
		speed = defaultSpeed;
		bounce = defaultBounce;
		isAuto = isAutoDefault;
		panel1.setValue('Speed', defaultSpeed);
		panel1.setValue('Bounce', defaultBounce);
		panel1.setValue('Auto', isAutoDefault);
	}

	// ____________________________________ shapes ____________________________________
	function createShape(i:Int) {
		var shape:Circle = {
			_id: '$i',
			_type: 'circle',
			x: w / 2,
			y: h / 2,
			radius: _radius,
		}
		return shape;
	}

	var counter = 0;
	var leaderX = w / 2;
	var leaderY = h / 2;
	var go:GoJs;
	var padding = 50;

	function onAnimateHandler() {
		if (_leader == null){
			trace('no leader');
			GoJs.timer(1).onComplete(onAnimateHandler);
			return;
		}

		var xpos = random(padding, w-(padding*2));
		var ypos = random(padding, h-(padding*2));

		// trace('GO: xpos: $xpos, ypos: $ypos, _leader.x: ${_leader.x}, _leader.y: ${_leader.y}');

		go = GoJs.to(_leader, random(0.1, 0.5))
			.x(xpos)
			.y(ypos)
			.ease(lets.easing.Sine.easeInOut)
			.onComplete(onAnimateHandler);
	}

	function drawShape() {
		if (!isAuto && mouseX == null)
			return;

		if(isClear){
		ctx.clearRect(0, 0, w, h);
		ctx.backgroundObj(WHITE);

		}

		if (isAuto) {
			// if(counter >= 50){
			// 	counter = 0;
			// }
			// if(counter == 0){
			// 	leaderX = randomInt(0,w);
			// 	leaderY = randomInt(0,h);
			// }
			// counter++;
			// ctx.fillColourRGB(RED);
			// ctx.circleFill(leaderX, leaderY, 2);

			leaderX = _leader.x;
			leaderY = _leader.y;

			ctx.fillColourRGB(RED);
			// ctx.circleFill(leaderX, leaderY, 2);
			ShapeUtil.registerPoint(ctx,leaderX, leaderY);
		} else {
			leaderX = mouseX;
			leaderY = mouseY;
		}

		// follow the mouse in a more elastic way
		// by using momentum
		var distx:Float = _follow.x - leaderX;
		var disty:Float = _follow.y - leaderY;
		momentumx -= distx / speed;
		momentumy -= disty / speed;

		// dampen the momentum a little
		momentumx *= bounce;
		momentumy *= bounce;

		// go get that mouse!
		_follow.x += momentumx;
		_follow.y += momentumy;

		ctx.fillColourRGB(BLACK);
		ctx.circleFill(_follow.x, _follow.y, 10);
	}

	// ____________________________________ setup ____________________________________
	override function setup() {
		trace('setup: ${toString()}');

		var colorArray = lib.util.ColorUtil.niceColor100SortedString[randomInt(lib.util.ColorUtil.niceColor100SortedString.length - 1)];
		_color0 = hex2RGB(colorArray[0]);
		_color1 = hex2RGB(colorArray[1]);
		_color2 = hex2RGB(colorArray[2]);
		_color3 = hex2RGB(colorArray[3]);
		_color4 = hex2RGB(colorArray[4]);

		isDebug = true;

		_follow = createShape(0);
		_leader = createShape(1);
	}

	// ____________________________________ draw ____________________________________
	override function draw() {
		// trace('draw: ${toString()}');
		drawShape();
		// stop();
	}
}
