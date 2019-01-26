package;

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
