package lib.util;

import lib.Global.*;
import lib.AST;

class GridUtil {

	public var array:Array<Point> = [];
	public var x:Float = null;
	public var y:Float = null;
	public var width:Float = null;
	public var height:Float = null;
	public var gridX:Float = 0;
	public var gridY:Float = 0;
	public var cellWidth:Float = 0;
	public var isCentered :Bool = false;

	/**
	 * how heigh is the grid
	 */
	public var cellHeight:Float = 0;
	public var numHor:Float = 0;
	public var numVer:Float = 0;

	public function new() {}

	/**
	 * [Description]
	 * @param x			start position x
	 * @param y			start postion y
	 */
	public function position(x, y){
		this.x = x;
		this.y = y;
		calculate();
	}

	/**
	 * use centered point for grid
	 *
	 * @param isCentered  (default: true)
	 */
	public function useCenterPoints(isCentered:Bool = true){
		this.isCentered = isCentered;
		calculate();
	}

	/**
	 * TODO : create a grid based upon width/height
	 * 		x, y, cellWidth, cellHeight is calculated
	 * @param width		total width of grid
	 * @param height	total height of grid
	 */
	public function dimension(width, height){
		this.width = width;
		this.height = height;
		calculate();
	}

	/**
	 * create
	 * @param numHor	number of items horizontal
	 * @param numVer	number of itmes vertical
	 */
	public function numbered(numHor, numVer){
		this.numHor = numHor;
		this.numVer = numVer;
		calculate();
	}

	/**
	 * use these values to calculate the grid
	 * if this is only set, it will x, y, width, height of the grid
	 *
	 * center point is LEFT,TOP
	 *
	 * @param cellWidth 	fixed grid width
	 * @param cellHeight 	fixed grid height
	 */
	public function cellSize(cellWidth, ?cellHeight){
		if (cellHeight == null) cellHeight = cellWidth;
		this.cellWidth = cellWidth;
		this.cellHeight = cellHeight;
		calculate();
	}

	function calculate(){
		// if (width == null  || width <= 0) width = w;
		// if (height == null || height <= 0) height = h;
		// if(cellWidth == null || cellWidth <= 0) cellWidth = 20;
		// if(cellHeight == null || cellHeight <= 0) cellHeight = 20;

		 /**
		  * solution #1:
		  * 	grid is fixed via cellWidth and cellHeight
		  *
		  * calculate x, y, width, height, numH, numV,
		  *
		  * TOP/LEFT centerpoint?
		  */

		if (cellWidth != null){
			numHor = Math.floor(w / cellWidth);
			width = numHor * cellWidth;
			x = (w - width)/2;
		}
		if (cellHeight!= null){
			numVer = Math.floor(h / cellHeight);
			height = numVer * cellHeight;
			y = (h - height)/2;
		}
		// force
		// x = 0;
		// y=0;

		var cx = 0.0;
		var cy = 0.0;
		if(isCentered) {
			cx = cellWidth/2;
			cy = cellHeight/2;
		}

		array= [];
		var total = Math.round(numHor * numVer);
		var xpos = 0;
		var ypos = 0;
		for (i in 0...total) {
			var point:Point = {
				x: Math.round(x + (xpos * cellWidth) + cx),
				y: Math.round(y + (ypos * cellHeight) + cy),
			}
			array.push(point);
			xpos++;
			if (xpos >= numHor) {
				xpos = 0;
				ypos++;
			}
		}
	}


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



	/**
	 *
	 * @param x
	 * @param y
	 * @param width
	 * @param height
	 * @param gridX
	 * @param gridY
	 * @param numHor
	 * @param numVer
	 * @return GridUtil
	 */
	static public function calc(?x:Float = -1, ?y:Float = -1,
								?width:Float = -1, ?height:Float = -1,
								?gridX:Float = 1, ?gridY:Float = 1,
								?numHor:Int = 1, ?numVer:Int = 1):GridUtil {
		var grid = new GridUtil();
		grid.array = [];
		grid.x = 0;
		grid.y = 0;
		grid.width = 0;
		grid.height = 0;
		grid.gridX = 0;
		grid.gridY = 0;
		return grid;
	}
}
