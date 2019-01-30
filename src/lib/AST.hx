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
	@:optional var id:Int;
	var x:Float;
	var y:Float;
	var speed_x:Float;
	var speed_y:Float;
	var size:Float;
	var colour:String;
};

typedef AnimateObj = {
	@:optional var _id : Int;
	@:optional var x:Float;
	@:optional var y:Float;
	@:optional var size:Float;
	@:optional var color:String;
	@:optional var width:Int;
	@:optional var height:Int;
	@:optional var rotation:Int;
	@:optional var alpha:Int;
};
