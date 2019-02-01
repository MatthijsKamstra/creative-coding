package lib;

class AST {}

// point
typedef Point = {
	@:optional var _id:Int;
	var x:Float;
	var y:Float;
};

// create a Ball typedef
typedef Ball = {
	@:optional var _id:Int;
	var x:Float;
	var y:Float;
	var speed_x:Float;
	var speed_y:Float;
	var size:Float;
	var colour:String;
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
