package lib.model.constants;

import haxe.macro.Context;

class App {
	public static var NAME:String = "Creative Code [mck]";
	public static macro function getBuildDate() {
		#if !display
		var date = Date.now().toString();
		return macro $v{date};
		#else
		var date = Date.now().toString();
		return macro $v{date};
		#end
	}
}
