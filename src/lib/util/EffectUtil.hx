package lib.util;

// https://github.com/GeorgeGally/creative_coding/blob/master/js/creative_coding.js#L761

class EffectUtil {
	public function new() {

	}

// function mirror(){

//   var input = ctx.getImageData(0, 0, w, h);
//   var output = ctx.createImageData(w, h);
//   var inputData = input.data;
//   var outputData = output.data
//    // loop


//    for (var y = 1; y < h-1; y += 1) {
//        for (var x = 0; x < w/2; x += 1) {
//          // RGB
//          var i = (y*w + x)*4;
//          var flip = (y*w + (w/2 - x))*4;
//          for (var c = 0; c < 4; c += 1) {
//             outputData[i+c] = inputData[flip+c];
//          }
//        }
//    }
//    ctx.putImageData(output, w/2, 0);

// }

/**

p.pixelate = function (blocksize,blockshape) {
  if (blockshape == undefined) blockshape = 0;
  if (blocksize == undefined) blocksize = 20;
  var imgData=ctx.getImageData(0,0,w,h);

  ctx.clearRect(0,0,w,h);
  //console.log(blockshape)
  if (blockshape == 3) {
    ctx.background(0);
  }

    var buffer = new Uint8Array(imgData.data.buffer);
    for(var x = 0; x < w; x += blocksize)
    {
        for(var y = 0; y < h; y += blocksize)
        {

          var pos = (x + y * w);
          var b = (buffer[pos] >> 16) & 0xff;
          var g = (buffer[pos] >> 8) & 0xff;
          var r = (buffer[pos] >> 0) & 0xff;
          this.fillStyle = rgb(r,g,b);
          if (blockshape == 0) {
            this.fillRect(x, y, blocksize, blocksize);
          } else if (blockshape == 1) {
          	this.fillEllipse(x, y, blocksize, blocksize);
          } else if (blockshape == 2) {
          	var bb = brightness(r,g,b);
          	this.fillStyle = (bb < 40 ? rgb(0) : rgb(255));
            this.fillEllipse(x, y, blocksize-1, blocksize-1);
           } else if (blockshape == 3) {
            this.fillStyle = rgb(r,g,b);
            this.fillEllipse(x, y, blocksize-3, blocksize-3);
          } else {
          	var bb = brightness(r,g,b);
          	if (bb< 40) {
          		this.fillStyle = rgb(0);
          		this.fillEllipse(x, y, blocksize-1, blocksize-1);
          	} else {
          		this.fillStyle = rgb(255);
          		this.fillEllipse(x, y, blocksize-1, blocksize-1);
            	this.strokeEllipse(x, y, blocksize, blocksize);
          	}
          };

        }
    }

}


function pixelate(blocksize,blockshape) {
  if (blockshape == undefined) blockshape = 0;
  if (blocksize == undefined) blocksize = 20;
  var imgData=ctx.getImageData(0,0,w,h);

  ctx.clearRect(0,0,w,h);
  //console.log(blockshape)
  if (blockshape == 3) {
    ctx.background(0);
  }

    var buffer = new Uint8Array(imgData.data.buffer);
    for(var x = 0; x < w; x += blocksize)
    {
        for(var y = 0; y < h; y += blocksize)
        {

          var pos = (x + y * w);
          var b = (buffer[pos] >> 16) & 0xff;
          var g = (buffer[pos] >> 8) & 0xff;
          var r = (buffer[pos] >> 0) & 0xff;
          ctx.fillStyle = rgb(r,g,b);
          if (blockshape == 0) {
            ctx.fillRect(x, y, blocksize, blocksize);
          } else if (blockshape == 1) {
          	ctx.fillEllipse(x, y, blocksize, blocksize);
          } else if (blockshape == 2) {
          	var bb = brightness(r,g,b);
          	ctx.fillStyle = (bb < 40 ? rgb(0) : rgb(255));
            ctx.fillEllipse(x, y, blocksize-1, blocksize-1);
           } else if (blockshape == 3) {
            ctx.fillStyle = rgb(r,g,b);
            ctx.fillEllipse(x, y, blocksize-3, blocksize-3);
          } else {
          	var bb = brightness(r,g,b);
          	if (bb< 40) {
          		ctx.fillStyle = rgb(0);
          		ctx.fillEllipse(x, y, blocksize-1, blocksize-1);
          	} else {
          		ctx.fillStyle = rgb(255);
          		ctx.fillEllipse(x, y, blocksize-1, blocksize-1);
            	ctx.strokeEllipse(x, y, blocksize, blocksize);
          	}
          };

        }
    }

}



function pixelShuffle(blockwidth, blockheight, freq, x1, y1, x2, y2) {

  if (x1 == undefined) {
    x1 = 0; y1 = 0; x2 = w; y2 = h;
  }
	if (freq == undefined) freq = 20;
	if (blockwidth == undefined) blockwidth = 20;
	if (blockheight == undefined) blockheight = blockwidth;
    var imgData=ctx.getImageData(x1,y1,x2,y2);
    //var sourceBuffer8 = new Uint8Array(imgData.data.buffer);
    //var sourceBuffer8 = new Uint8ClampedArray(imgData.data.buffer);
    //shuffle(sourceBuffer8, 1);
    var sourceBuffer32 = new Uint32Array(imgData.data.buffer);

    for(var x = x1; x < x2; x += blockwidth) {

        for(var y = y1; y < y2; y += blockheight) {

          var pos = (x + y * x2);
          if (chance(freq)) {
            pos = (pos + randomInt(-100,100)*4) % (x2*y2*4);
            var b = (sourceBuffer32[pos] >> 16) & 0xff;
            var g = (sourceBuffer32[pos] >> 8) & 0xff;
            var r = (sourceBuffer32[pos] >> 0) & 0xff;
            ctx.fillStyle = rgba(r,g,b, 0.9);
          ctx.fillRect(x, y, blockwidth, blockheight);
          }
        };

    }

}


// function pixelShuffle(blockwidth, blockheight, freq, x1, y1, x2, y2) {

//   if (x1 === undefined) {
//     x1 = 0; y1 = 0; x2 = w; y2 = h;
//   }



//   if (freq == undefined) freq = 20;
//   if (blockwidth == undefined) blockwidth = 20;
//   if (blockheight == undefined) blockheight = blockwidth;

//     var imgData=ctx.getImageData(0,0,x2,y2);
//     //ctx.clearRect(0,0,w,h);
//     //var sourceBuffer8 = new Uint8Array(imgData.data.buffer);
//     //var sourceBuffer8 = new Uint8ClampedArray(imgData.data.buffer);
//     //shuffle(sourceBuffer8, 1);
//     var sourceBuffer32 = new Uint32Array(imgData.data.buffer);

//     for(var x = x1; x < x2; x += blockwidth) {
//         for(var y = y2; y < y2; y += blockheight) {

//           var pos = (x + y * x2);

//           if (chance(freq)) {
//             pos = (pos + randomInt(-100,100)*4) % (x2*y2*4);
//             //pos = (pos + randomInt(-100,100)*4) % ((x1+x2)*(y1+y2)*4);
//             var b = (sourceBuffer32[pos] >> 16) & 0xff;
//             var g = (sourceBuffer32[pos] >> 8) & 0xff;
//             var r = (sourceBuffer32[pos] >> 0) & 0xff;
//             ctx.fillStyle = rgba(r,g,b, 0.9);
//             ctx.fillRect(x, y, blockwidth, blockheight);

//           }
//         };

//     }

// }




function shuffle(a, ammt) {
 if (ammt = undefined) ammt = a.length;
    var j, x, i;
    for (i = ammt; i; i--) {
        j = Math.floor(Math.random() * i);
        x = a[i - 1];
        a[i - 1] = a[j];
        a[j] = x;
    }
}



function halftone(blocksize, reverse) {
  if (reverse == undefined) reverse = 1;
  if (reverse == true) reverse = -1;
  if (blocksize == undefined) blocksize = 20;
  var imgData=ctx.getImageData(0,0,w,h);

  ctx.clearRect(0,0,w,h);
  var sourceBuffer32 = new Uint32Array(imgData.data.buffer);
  ctx.fillStyle = rgb(0,0,0);

  for(var x = 0; x < w; x += blocksize) {

        for(var y = 0; y < h; y += blocksize) {

        	var pos = (x + y * w);
        	var b = (sourceBuffer32[pos] >> 16) & 0xff;
			var g = (sourceBuffer32[pos] >> 8) & 0xff;
        	var r = (sourceBuffer32[pos] >> 0) & 0xff;
          	if (reverse == -1) {
          		var bb = 100 - brightness(r,g,b);
          	} else {
          		var bb = brightness(r,g,b);
          	}

          	ctx.fillEllipse(x, y, blocksize*bb/100, blocksize*bb/100);

          };

        }
    }




function triangulate(grid_w, grid_h, alpha) {

	if (grid_h == undefined) {
		grid_h = grid_w;
	}

	if (alpha == undefined) {
		alpha = 0.8;
	}

	var ww = Math.ceil(w/grid_w);
	var	hh = Math.ceil(h/grid_h);
    var imgData=ctx.getImageData(0,0,w,h);
    ctx.clearRect(0,0,w,h);
    //var sourceBuffer8 = new Uint8Array(imgData.data.buffer);
    //var sourceBuffer8 = new Uint8ClampedArray(imgData.data.buffer);

    var sourceBuffer32 = new Uint32Array(imgData.data.buffer);
    var i =0;
    for(var x = 0; x < w; x += grid_w)
    {
        for(var y = 0; y < h; y += grid_h)
        {

          var pos = (x + y * w);
          var b = (sourceBuffer32[pos] >> 16) & 0xff;
          var g = (sourceBuffer32[pos] >> 8) & 0xff;
          var r = (sourceBuffer32[pos] >> 0) & 0xff;
          ctx.fillStyle = rgba(r,g,b, alpha);

  if (i%2) {
	 ctx.fillTriangle(x, y - grid_h, x, y + grid_h, x - grid_w, y );
	} else {
		ctx.fillTriangle(x - grid_w, y - grid_h, x, y, x - grid_w , y + grid_h);
	}

	i++;
  }
}

}



// MIRROR THE CANVAS

function mirror(){

  var input = ctx.getImageData(0, 0, w, h);
  var output = ctx.createImageData(w, h);
  var inputData = input.data;
  var outputData = output.data
   // loop
   for (var y = 1; y < h-1; y += 1) {
       for (var x = 0; x < w/2; x += 1) {
         // RGB
         var i = (y*w + x)*4;
         var flip = (y*w + (w/2 - x))*4;
         for (var c = 0; c < 4; c += 1) {
            outputData[i+c] = inputData[flip+c];
         }
       }
   }
   ctx.putImageData(output, w/2, 0);

}



function ScaleImage(srcwidth, srcheight, targetwidth, targetheight, fLetterBox) {

    var result = { width: 0, height: 0, fScaleToTargetWidth: true };

    if ((srcwidth <= 0) || (srcheight <= 0) || (targetwidth <= 0) || (targetheight <= 0)) {
        return result;
    }

    // scale to the target width
    var scaleX1 = targetwidth;
    var scaleY1 = (srcheight * targetwidth) / srcwidth;

    // scale to the target height
    var scaleX2 = (srcwidth * targetheight) / srcheight;
    var scaleY2 = targetheight;

    // now figure out which one we should use
    var fScaleOnWidth = (scaleX2 > targetwidth);
    if (fScaleOnWidth) {
        fScaleOnWidth = fLetterBox;
    }
    else {
       fScaleOnWidth = !fLetterBox;
    }

    if (fScaleOnWidth) {
        result.width = Math.floor(scaleX1);
        result.height = Math.floor(scaleY1);
        result.fScaleToTargetWidth = true;
    }
    else {
        result.width = Math.floor(scaleX2);
        result.height = Math.floor(scaleY2);
        result.fScaleToTargetWidth = false;
    }
    result.targetleft = Math.floor((targetwidth - result.width) / 2);
    result.targettop = Math.floor((targetheight - result.height) / 2);

    return result;
}



 */

}