typedef InstaLikes = {
	@:optional var _id:String;
	var x:Float;
	var y:Float;
	var width:Float;
	var height:Float;
	@:optional var speed:Float;
	@:optional var angle:Float;
	@:optional var radius:Float;
	@:optional var alpha:Float;
	@:optional var count:Int;
	@:optional var percentage:Float;
};

typedef InstaFollower = {
	> InstaLikes,
	var img:js.html.Image;
	var name:String;
	var src:String;
	var i:Int;
	@:optional var id:String;
};

typedef InstaObj = {
	@:optional var id:String;
	var name:String;
	var src:String;
};
