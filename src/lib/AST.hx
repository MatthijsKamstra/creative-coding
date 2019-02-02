package lib;

class AST {}

// ____________________________________ extending typedef ____________________________________
@:enum abstract ShapeType(String) {
	var CIRCLE = 'circle';
	var RECTANGLE = 'rectangle';
	var SQUARE = 'square';
}

typedef Base = {
	@:optional var _id:Int;
	@:optional var _type:String; // make possible to switch draw
	// [mck] perhaps enum? ShapeType
}

typedef Dimensions = {
	@:optional var width:Float;
	@:optional var height:Float;
	@:optional var rotation:Float; // not sure about this
};

typedef Position = {
	var x:Float;
	var y:Float;
};

typedef Appearance = {
	@:optional var color:Int;
	@:optional var colour:String;
	@:optional var alpha:Float;
};

// point
typedef Point = {
	var x:Float;
	var y:Float;
};

// ____________________________________ shape typedef  ____________________________________

typedef Circle  = {
	> Base,
	> Position,
	> Appearance,
	@:optional var radius:Float;
	@:optional var size:Float;
};

typedef Oval  = {
	> Base,
	> Position,
	> Appearance,
	> Dimensions,
};

typedef Square = {
	> Base,
	> Position,
	> Appearance,
	@:optional var rotation:Float;
	@:optional var size:Float; // width and height are the same
}
typedef Rectangle = {
	> Base,
	> Position,
	> Appearance,
	> Dimensions,
};

typedef LineNew = {
	> Base,
	> Appearance,
	var x1:Float;
	var y1:Float;
	var x2:Float;
	var y2:Float;
	@:optional var point1:Point;
	@:optional var point2:Point;
	@:optional var pointArray:Array<Point>;
	@:optional var lineWeight:Int;
	@:optional var strokeColor:Int;
	@:optional var strokeWeight:Int;
	@:optional var lineEnd:String;
};

// create a Ball typedef
typedef Ball = {
	> Circle,
	var speed_x:Float;
	var speed_y:Float;
	// var colour:String;
};

// create a Line typedef
typedef Line = {
	@:optional var _type:String; // make possible to switch draw
	@:optional var _id:Int;
	var x1:Float;
	var y1:Float;
	var x2:Float;
	var y2:Float;
	@:optional var stroke:Int;
	@:optional var colour:String;
	@:optional var radius:Float;
};

typedef AnimateObj = {
	@:optional var _id:Int;
	@:optional var x:Float;
	@:optional var y:Float;
	@:optional var size:Float;
	@:optional var color:String;
	@:optional var width:Int;
	@:optional var height:Int;
	@:optional var rotation:Int;
	@:optional var alpha:Float;
	@:optional var type:String; // make possible to switch draw
};
