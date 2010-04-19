
$(document).ready(function() {
	$("#infinite").scrollable({size: 3}).circular();
	
	Cufon.replace('.flash-Bigtitle',{hover: true});
	Cufon.replace('.menu',{hover: true});
	Cufon.replace('.flash-h2',{hover: true});
	Cufon.replace('.flash-h2-special',{hover: true});
	
	
    $('#worldmap').flash({
        src: 'flash/dottedWMap.swf',
        flashvars: { mapkey: 'ABQIAAAAsIunaSEq-72JsQD5i92_2RSBAjOOhu3AGseSip9oOKv69lUsGxQJJZ1BfzmSIDX0FfGUGpci0uokEA'},        
        width: 590,
        height: 305        
    });
	
    $('#countrymap').flash({
        src: 'flash/ICCAMap2.swf',
        flashvars: { mapkey: 'ABQIAAAAsIunaSEq-72JsQD5i92_2RSBAjOOhu3AGseSip9oOKv69lUsGxQJJZ1BfzmSIDX0FfGUGpci0uokEA'},
        width: 938,
        height: 346
    });	
	
    $('#mapmap').flash({
        src: 'flash/ICCAMap.swf',
        flashvars: { mapkey: 'ABQIAAAAsIunaSEq-72JsQD5i92_2RSBAjOOhu3AGseSip9oOKv69lUsGxQJJZ1BfzmSIDX0FfGUGpci0uokEA'},        
        width: 938,
        height: 346
    });	

    $('#widgetnews').flash({
        src: 'flash/smallMap.swf',
        flashvars: { mapkey: 'ABQIAAAAsIunaSEq-72JsQD5i92_2RSBAjOOhu3AGseSip9oOKv69lUsGxQJJZ1BfzmSIDX0FfGUGpci0uokEA'},        
        width: 337,
        height: 203
    });	


});

function showImage(idPhoto,srcPhoto) {
    $("#basic-modal-content").modal({onOpen: function (dialog) {
		dialog.overlay.fadeIn('slow', function () {
			dialog.container.slideDown('slow', function () {
				dialog.data.fadeIn('slow');
			});
		});
	}});
	newImage = new Image();
	newImage.src = srcPhoto;
	var widthPhoto = newImage.width;
	var heightPhoto = newImage.height;
	$("#simplemodal-container").css("width", widthPhoto +'px');
	$("#simplemodal-container").css("height", heightPhoto +'px');
	$("#basic-modal-content").html('<img src="'+ srcPhoto +'"/>');
	
	var wscr = $(window).width();
	var hscr = $(window).height();

	// obtener posicion central
	var mleft = ( wscr - widthPhoto) / 2;
    var mtop = ( hscr - heightPhoto ) / 2;

	// estableciendo ventana modal en el centro
	$('#simplemodal-container').css("left", mleft+'px');
	$('#simplemodal-container').css("top", mtop+'px')
};