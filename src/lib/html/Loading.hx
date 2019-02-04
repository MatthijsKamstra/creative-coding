package lib.html;

import js.jquery.JQuery;
import js.Browser.*;
import js.html.*;

class Loading extends CSSinjector {

	public function new() {
		super(css(), 'inject-loading');
	}


	/**
	 *  @param isDark -
	 */
	function showLoading(isLoading:Bool,isDark:Bool = false) {
		// Get the snackbar DIV
		var x = document.getElementById("loading");

		// if no #snackbar exists, create it
		if(x == null){
			var div = document.createDivElement();
			div.id = 'loading';
			div.innerHTML = '<i class="fa fa-refresh fa-spin fa-3x fa-fw"></i><span class="sr-only">Loading...</span>';
			document.body.appendChild(div);
			x = div;
		}

		if(isLoading){
			// Add the "show" class to DIV
			x.className = "show";
		} else {
			x.className = "hide";
		}
	}

	function css ():String{
		return '
#loading {
    visibility: hidden; /* Hidden by default. Visible on click */
    height: 100%;
    width: 100%;
    z-index: 700;
    display: block;
    position: absolute;
    /* border: 1px solid pink; */
    top: 0;
    left: 0;

    background-color: rgba(0, 0, 0, 0.10);

    display: flex;
    align-items: center;
    justify-content: center;
}

#loading.show {
    visibility: visible; /* Show the loading */
	/* Add animation: Take 0.5 seconds to fade in and out the loading.
	However, delay the fade out process for 2.5 seconds */
    -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
    animation: fadein 0.5s, fadeout 0.5s 2.5s;
}
#loading.hide {
    /* visibility: visible; Show the loading */
	/* Add animation: Take 0.5 seconds to fade in and out the loading.
	However, delay the fade out process for 2.5 seconds */
    -webkit-animation: fadeout 0.5s;
    animation: fadeout 0.5s;
}
';

	}



}