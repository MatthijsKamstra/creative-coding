package lib.util;

import js.html.CanvasRenderingContext2D;

/**
 * probably only work on Firefox and Chrome
 *
 * https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/filter#Browser_compatibility
 *
 */
class FilterUtil {
	public function new() {
	}


	/**
	 * grayscale()
	 * A CSS <percentage>. Converts the drawing to grayscale.
	 * A value of 100% is completely grayscale. A value of 0% leaves the drawing unchanged.
	 * @param ctx
	 * @param value
	 */
	public static function grayscale(ctx:CanvasRenderingContext2D, value:Float = 100){
		if (value > 1) {
			ctx.filter = 'grayscale($value%)';
		} else {
			ctx.filter = 'grayscale($value)';
		}
	}

/**
blur()
A CSS <length>. Applies a Gaussian blur to the drawing. It defines the value of the standard deviation to the Gaussian function, i.e., how many pixels on the screen blend into each other; thus, a larger value will create more blur. A value of 0 leaves the input unchanged.
brightness()
A CSS <percentage>. Applies a linear multiplier to the drawing, making it appear brighter or darker. A value under 100% darkens the image, while a value over 100% brightens it. A value of 0% will create an image that is completely black, while a value of 100% leaves the input unchanged.
contrast()
A CSS <percentage>. Adjusts the contrast of the drawing. A value of 0% will create a drawing that is completely black. A value of 100% leaves the drawing unchanged.
drop-shadow()
Applies a drop shadow effect to the drawing. A drop shadow is effectively a blurred, offset version of the drawing's alpha mask drawn in a particular color, composited below the drawing. This function takes up to five arguments:
<offset-x>: See <length> for possible units. Specifies the horizontal distance of the shadow.
<offset-y>: See <length> for possible units. Specifies the vertical distance of the shadow.
<blur-radius>: The larger this value, the bigger the blur, so the shadow becomes bigger and lighter. Negative values are not allowed.
<color>: See <color> values for possible keywords and notations.
hue-rotate()
A CSS <angle>. Applies a hue rotation on the drawing. A value of 0deg leaves the input unchanged.
invert()
A CSS <percentage>. Inverts the drawing. A value of 100% means complete inversion. A value of 0% leaves the drawing unchanged.
opacity()
A CSS <percentage>. Applies transparency to the drawing. A value of 0% means completely transparent. A value of 100% leaves the drawing unchanged.
saturate()
A CSS <percentage>. Saturates the drawing. A value of 0% means completely un-saturated. A value of 100% leaves the drawing unchanged.
sepia()
A CSS <percentage>. Converts the drawing to sepia. A value of 100% means completely sepia. A value of 0% leaves the drawing unchanged.
none
No filter is applied. Initial value.
 */
}