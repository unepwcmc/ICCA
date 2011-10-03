package com.vizzuality
{
        import com.google.maps.LatLng;
        import com.google.maps.overlays.Marker;
        import com.google.maps.overlays.MarkerOptions;
       
        import flash.geom.Point;


        public class ICCAMarker extends Marker
        {

                public function ICCAMarker(location:LatLng,name:String,sites:int)
                {
                        var options:MarkerOptions = new MarkerOptions();
                        options.iconOffset = new Point(0,0);
                        options.hasShadow = false;
                        options.draggable = false;
                        options.icon = new GenericMarkerIcon(name,sites);
                        super(location, options);
                }
        }
}
