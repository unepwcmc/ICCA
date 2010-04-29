
$(document).ready(function() {
	$("#infinite").scrollable({size: 3}).circular();
	
	Cufon.replace('.flash-Bigtitle',{hover: true});
	Cufon.replace('.menu',{hover: true});
	Cufon.replace('.flash-h2',{hover: true});
	Cufon.replace('.flash-h2-special',{hover: true});

    gmapsKey = $('#gmaps-key').html();

    $('#worldmap').flash({
        src: 'flash/dottedWMap.swf',
        flashvars: { mapkey: gmapsKey},
        width: 590,
        height: 305        
    });
	
    $('#mapmap').flash({
        src: '/flash/ICCAMap.swf',
        flashvars: { mapkey: gmapsKey},        
        width: 938,
        height: 346
    });	


});

function showImage(idPhoto,srcPhoto, citation) {
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
    if (widthPhoto == 0) {
        widthPhoto = 700;
        heightPhoto = 525;
    }
	$("#simplemodal-container").css("width", widthPhoto +'px');
	$("#simplemodal-container").css("height", heightPhoto +'px');
	$("#basic-modal-content").html('<img src="'+ srcPhoto +'"/><br />' + citation);
	
	var wscr = $(window).width();
	var hscr = $(window).height();

	// obtain center point
	var mleft = ( wscr - widthPhoto) / 2;
    var mtop = ( hscr - heightPhoto ) / 2;

	// estableciendo ventana modal en el centro
	$('#simplemodal-container').css("left", mleft+'px');
	$('#simplemodal-container').css("top", mtop+'px')
    $('#simplemodal-container').css("text-align", 'center')
};