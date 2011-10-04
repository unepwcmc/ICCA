continentMarker.prototype = new google.maps.OverlayView();


function continentMarker(latlng, data, map) {
    this.map_ = map;
    this.data_ = data;
    this.latlng_ = latlng;
    this.offsetVertical_ = -21;
    this.offsetHorizontal_ = -21;
    this.height_ = 43;
    this.width_ = 43;
    this.div_ = null;
    this.setMap(map);

}

continentMarker.prototype.onAdd = function() {

    var div = document.createElement('DIV');
    div.style.width = "43px";
    div.style.height = "43px";
    div.style.position = "absolute";

    var img = document.createElement("div");
    img.src = "/images/marker.png";
    img.style.width = "43px";
    img.style.height = "43px";
    img.style.position = "relative";
    if (this.data_.sites > 0){
      img.style.background = "url(/images/marker_blank.png) no-repeat 0 0";
    } else {
      img.style.background = "url(/images/marker.png) no-repeat 0 0";
    }
    img.style.float = "left";
    img.style.display = "block";
    div.appendChild(img);

    var over = document.createElement('DIV');
    over.style.borderStyle = "none";
    over.style.borderWidth = "0px";
    over.style.width = "193px";
    over.style.top = "-8px";
    over.style.left = "-6px";
    over.style.height = "60px";
    over.style.background = "url(/images/over_marker.png) no-repeat 0 0";
    over.style.position = "absolute";
    over.style.display = "none";

    var over_txt = document.createElement('a');
    over_txt.href = this.data_.url;
    over_txt.style.borderStyle = "none";
    over_txt.style.borderWidth = "0px";
    
    var over_txt_str;
    if (this.data_.name.length>18) {
        over_txt_str = this.data_.name.substr(0,15)+'...'
    } else {
        over_txt_str = this.data_.name;
    }
    if (this.data_.sites > 0){
      over_txt_str += "<br/><span class='sites_count'>" + this.data_.sites + " sites</span>";
    }
    $(over_txt).html(over_txt_str);

    over_txt.style.width = "193px";
    over_txt.style.top = "20px";
    over_txt.style.left = "60px";
    over_txt.style.position = "absolute";
    over_txt.style.font = "bold 15px Arial";
    over_txt.style.color = "white";
    over.appendChild(over_txt);

    if (this.data_.sites > 0){
        var sites_display = document.createElement('DIV');
        $(sites_display).html(this.data_.sites);
        sites_display.style.top = "13px";
        sites_display.style.left = "17px";
        sites_display.style.position = "absolute";
        sites_display.style.font = "bold 15px Arial";
        sites_display.style.color = "white";
        div.appendChild(sites_display);
    }

    div.appendChild(over);


    $(div).hover(function(){$(over).show()},function(){$(over).hide()});


    this.div_ = div;

    var panes = this.getPanes();
    panes.overlayImage.appendChild(div);
}

continentMarker.prototype.draw = function() {

    var div = this.div_;
    var pixPosition = this.getProjection().fromLatLngToDivPixel(this.latlng_);
    if (pixPosition) {
        div.style.width = this.width_ + "px";
        div.style.left = (pixPosition.x + this.offsetHorizontal_) + "px";
        div.style.height = this.height_ + "px";
        div.style.top = (pixPosition.y + this.offsetVertical_) + "px";
    }
}

continentMarker.prototype.onRemove = function() {
    this.div_.parentNode.removeChild(this.div_);
    this.div_ = null;
}