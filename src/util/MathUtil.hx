package util;

class MathUtil {


	static public function radians(deg) {return deg*Math.PI/180;};
	static public function degrees(rad) {return rad*180/Math.PI;};

	static public function dist(x1, y1, x2, y2) {
		x2-=x1; y2-=y1;
		return Math.sqrt((x2*x2) + (y2*y2));
	}


	static public function randomInteger(min, max) {
		if(max===undefined) {
			max = min;
			min = 0;
		}
		return Math.floor(Math.random() * (max+1-min)) +min;
	}

	static public function random(min, max) {
		if(min===undefined) {
			min = 0;
			max = 1;
		} else if(max=== undefined) {
			max = min;
			min = 0;
		}
		return (Math.random() * (max-min)) + min;
	};


static public function map(value, min1, max1, min2, max2, clampResult) {
	var returnvalue = ((value-min1) / (max1 - min1) * (max2-min2)) + min2;
	if(clampResult) return clamp(returnvalue, min2, max2);
	else return returnvalue;
};

static public function clamp(value, min, max) {
	if(max<min) {
		var temp = min;
		min = max;
		max = temp;

	}
	return Math.max(min, Math.min(value, max));
};

}