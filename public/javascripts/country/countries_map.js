var map;
var bounds = new google.maps.LatLngBounds();

function zoomIn() {
    map.setZoom(map.getZoom() +1);
}

function zoomOut() {
    map.setZoom(map.getZoom() -1);
}

function changeMapType(type) {
    if (type=="satellite") {
        if (!$("#satellite").hasClass('current')) {
            $("#terrain").removeClass('current');
            $("#satellite").addClass('current');
            map.setMapTypeId(google.maps.MapTypeId.SATELLITE);
        }
    } else {
        if (!$("#terrain").hasClass('current')) {
            $("#terrain").addClass('current');
            $("#satellite").removeClass('current');
            map.setMapTypeId(google.maps.MapTypeId.TERRAIN);
        }
    }
}

$(document).ready(function() {
    var country_id = $('span#country_id').text();
    var myLatlng = new google.maps.LatLng(0,0);
    var myOptions = {
        zoom: 4,
        center: myLatlng,
        disableDefaultUI: true,
        mapTypeId: google.maps.MapTypeId.TERRAIN
    };
    map = new google.maps.Map(document.getElementById("countries_map"), myOptions);

    $.getJSON('/iccaCountryDetails.json',function(data){
        var latlng, marker;

        for (var i=0; i<data.iccas.length; i++) {
            if (data.iccas[i].lat !== '' && data.iccas[i].lat !== ''){
                latlng = new google.maps.LatLng(parseFloat(data.iccas[i].lat),parseFloat(data.iccas[i].lng));
                marker = new continentMarker(latlng,data.iccas[i],map);
                bounds.extend(latlng);
            }
        }
        map.fitBounds(bounds);
    });
});