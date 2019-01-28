package util;

import Global.*;
import AST;

class GridUtil {
	public function new() {}

	/**
	 * [Description]
	 * @param x			start position x
	 * @param y			start postion y
	 * @param width		width of grid
	 * @param height	height of grid
	 * @param numHor	number of items horizontal
	 * @param numVer	number of itmes vertical
	 */
	static public function create(x:Float, y:Float, width:Float, height:Float, numHor:Int = 1, numVer:Int = 1):Array<Point> {
		// trace( x, y, width, height, numHor, numVer);
		var gridW = width / (numHor - 1);
		var gridH = height / (numVer - 1);
		var total = numHor * numVer;
		var xpos = 0;
		var ypos = 0;
		var arr:Array<Point> = [];
		for (i in 0...total) {
			var point:Point = {
				x: x + (xpos * gridW),
				y: y + (ypos * gridH),
			}
			arr.push(point);
			xpos++;
			if (xpos >= numHor) {
				xpos = 0;
				ypos++;
			}
		}
		return arr;
	}
}
