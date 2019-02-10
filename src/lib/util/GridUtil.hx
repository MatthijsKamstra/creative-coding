package lib.util;

import lib.Global.*;
import lib.AST;
import js.Browser.*;

class GridUtil {

	public var array:Array<Point> = [];
	public var total:Int = null;
	public var x:Float = null;
	public var y:Float = null;
	/**
	 * the width of the grid
	 */
	public var width:Float = null;
	/**
	 * the height of the grid
	 */
	public var height:Float = null;
	public var gridX:Float = 0;
	public var gridY:Float = 0;
	public var isCentered :Bool = false;

	public var cellWidth:Float = null;
	/**
	 * how height is the grid
	 */
	public var cellHeight:Float = null;
	public var numHor:Float = null;
	public var numVer:Float = null;


	var _isCellSize : Bool = false;
	var _isNumbered : Bool = false;
	var _isDimension : Bool = false;
	var _isPosition : Bool = false;
	var _isDebug : Bool = false; // fix ugly grid bugs

	public function new() {}

	/**
	 * [Description]
	 * @param x			start position x
	 * @param y			start postion y
	 */
	public function setPosition(x, y){
		if (_isDebug) console.log('GridUtil :: setPostion');
		this.x = x;
		this.y = y;
		this._isPosition = true;
		calculate();
	}

	/**
	 * use centered point for grid
	 *
	 * @param isCentered  (default: true)
	 */
	public function setIsCenterPoint(isCentered:Bool = true){
		if (_isDebug) console.log('GridUtil :: setCenterPoint');
		this.isCentered = isCentered;
		calculate();
	}

	/**
	 * create a grid based upon width/height
	 * 		x, y, cellWidth, cellHeight is calculated
	 * @param width		total width of grid
	 * @param height	total height of grid
	 */
	public function setDimension(width, height){
		if (_isDebug) console.log('GridUtil :: setDimension');
		this.width = width;
		this.height = height;
		this._isDimension = true;
		calculate();
	}

	/**
	 * create
	 * @param numHor	number of items horizontal
	 * @param numVer	number of itmes vertical
	 */
	public function setNumbered(numHor:Float, numVer:Float){
		if (_isDebug) console.log('GridUtil :: setNumbers');
		this.numHor = numHor;
		this.numVer = numVer;
		this._isNumbered = true;
		calculate();
	}

	/**
	 * use these values to calculate the grid
	 * if this is only set, it will x, y, width, height of the grid
	 *
	 * center point is LEFT,TOP
	 *
	 * @param cellWidth 	fixed grid width
	 * @param cellHeight 	(optional) fixed grid height (default is equal to cellWidth)
	 */
	public function setCellSize(cellWidth, ?cellHeight){
		if (cellHeight == null) cellHeight = cellWidth;
		if (_isDebug) console.log('GridUtil :: setCellSize');
		this.cellWidth = cellWidth;
		this.cellHeight = cellHeight;
		this._isCellSize = true;
		calculate();
	}


	function calculate(){
		if (_isDebug) console.log('GridUtil.calculate');
		 /**
		  * solution #1:
		  * grid is fixed via `cellWidth` and `cellHeight`
		  * calculate: `x`, `y`, `width`, `height`, `numHor`, `numVer`
		  *
		  * TOP/LEFT centerpoint?
		  */
		if(_isCellSize && !_isDimension){
			if (_isDebug) console.info('GridUtil solution #1: cellSize is set');
			numHor = Math.floor(w / cellWidth);
			numVer = Math.floor(h / cellHeight);
			width = numHor * cellWidth;
			height = numVer * cellHeight;
			x = (w - width)/2;
			y = (h - height)/2;
		}

		/**
		 * solution #2:
		 * use numbered cells (in x-dir and y-dir),
		 * calculate: `x`, `y`, `width`, `height`, `cellWidth`, `cellHeight`
		 */
		if(_isNumbered && !_isDimension){
			if (_isDebug) console.info('GridUtil solution #2: numbered cells set');
			var _w = (width != null) ? width : w;
			var _h = (height != null) ? height : h;
			// numHor = Math.floor(_w / cellWidth);
			// numVer = Math.floor(_h / cellHeight);
			cellWidth = _w / numHor;
			cellHeight = _h / numVer;
			width = numHor * cellWidth;
			height = numVer * cellHeight;
			x = (w - width)/2;
			y = (h - height)/2;
		}

		/**
		 * solution #3:
		 * use a grid with set `width` and `height`
		 * calculate: `x`, `y`, `numHor`, `numVer`, `cellWidth`, `cellHeight`
		 */
		if(_isDimension && !_isNumbered && !_isCellSize){
			if (_isDebug) console.info('GridUtil solution #3: width/height set ($width, $height)');

			// is not set
			var _cellWidth = (cellWidth != null) ? cellWidth : 50;
			var _cellHeight = (cellHeight != null) ? cellHeight : 50;
			// now we can calculate the number of rows/cols
			numHor = Math.floor(width / _cellWidth);
			numVer = Math.floor(height / _cellHeight);
			// because we can't have half a row, we need to recalculate the width/heigth
			width = numHor * _cellWidth;
			height = numVer * _cellHeight;
			// and now the width and height might have changed, so does the cells
			cellWidth = width / numHor;
			cellHeight = height / numVer;
			// centered everything
			x = (w - width)/2;
			y = (h - height)/2;
		}

		/**
		 * solution #3a:
		 * use a grid with set `width`, `height` AND `numHor`, `numVer`
		 * calculate: `x`, `y`, `cellWidth`, `cellHeight`
		 */
		if(_isDimension && _isNumbered && !_isCellSize){
			if (_isDebug) console.info('GridUtil solution #3a: width/height set ($width, $height) AND number row/cols ($numHor, $numVer)');

			// is not set, calculate
			cellWidth = Math.floor(width/numHor); // make it round numbers
			cellHeight =  Math.floor(height/numVer); // make it round numbers
			// because we can't have half a row, we need to recalculate the width/heigth
			width = numHor * cellWidth;
			height = numVer * cellHeight;
			// centered everything
			x = (w - width)/2;
			y = (h - height)/2;
		}

		/**
		 * solution #4:
		 * size of the cell is known, and width and height
		 * calculate: `x`, `y`, `width`, `height`, `cellWidth`, `cellHeight`
		 */
		if (_isCellSize && _isDimension){
			if (_isDebug) console.info('GridUtil solution #4: cellSize is set and width/height');
			numHor = Math.floor(width / cellWidth);
			numVer = Math.floor(height / cellHeight);

			width = numHor * cellWidth;
			height = numVer * cellHeight;

			// [mck] cellwidth will be leading, so the width and height will be fixed accordingly
			if(!_isPosition){
				x = (w - width)/2;
				y = (h - height)/2;
			}
		}



		var cx = 0.0;
		var cy = 0.0;
		if(isCentered) {
			cx = cellWidth/2;
			cy = cellHeight/2;
		}

		array= []; // reset array
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

		total = array.length; // just to have easy access to the array lentth
		if (_isDebug) console.warn('width: $width, height: $height, cellWidth: $cellWidth, cellHeight: $cellHeight, numHor: $numHor, numVer: $numVer, array: ${array.length}');
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
