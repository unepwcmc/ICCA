package {
	import com.adobe.serialization.json.JSON;
	import com.google.maps.InfoWindowOptions;
	import com.google.maps.LatLng;
	import com.google.maps.LatLngBounds;
	import com.google.maps.Map;
	import com.google.maps.MapEvent;
	import com.google.maps.MapMouseEvent;
	import com.google.maps.MapType;
	import com.google.maps.overlays.Marker;
	import com.vizzuality.*;
	
	import flash.display.Sprite;
	import flash.events.*;
	import flash.geom.Point;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.text.Font;
	import flash.utils.Dictionary;
	
	import gs.TweenLite;
		
	/* import gs.TweenLite; */

	[SWF(backgroundColor=0xFFFFFF, width=938, height=346)]
	public class ICCAMap2 extends Sprite
	{
		
		private var loader:URLLoader = new URLLoader();
		private var request:URLRequest = new URLRequest();	
		private var embeddedFonts:Array = new Array();
		private var countriesMarkers: Array = new Array();
		private var countriesData: Array = new Array();
		private var pages: int = 0;
		private var actualPage: int = 0;
		private var iw:Dictionary=new Dictionary();
		
		private var map: Map = new Map();


		
		public function ICCAMap2() {	
			var font: LoadFont = new LoadFont("TitilliumText14L.swf",["TitilliumText14L"]);
 	 	 	font.addEventListener(LoadFont.COMPLETE, successLoadFont);
 	 	 	
 	 	 	var mapKey:String =root.loaderInfo.parameters.mapkey;
 	 	 	
	 	  	map.key = mapKey;
	 	 
	 	  	if (mapKey==null) {
 	 	 		map.key = "ABQIAAAAsIunaSEq-72JsQD5i92_2RTb-vLQlFZmc2N8bgWI8YDPp5FEVBSSShDhDbHNKr3tTC6UaCKqvYjyOQ";
 	 	 	}
	 	 
			map.language = "es";
			map.setSize(new Point(943,397));
			map.addEventListener(MapEvent.MAP_READY, onMapReady);
			this.addChild(map);
			
 	  	}
 	  	
 	  	
 	  	
		private function onMapReady(event:MapEvent):void {            			

			var zoomPlus:vizzButton = new vizzButton(this,10,10,25,25,"+",20,5,-1);		
			var zoomMinus:vizzButton = new vizzButton(this,10,36,25,25,"-",20,7,-2);
			var satellite:vizzButton = new vizzButton(this,750,10,90,25,"SATELLITE",12,12,4);
			var terrain:vizzButton = new vizzButton(this,841,10,90,25,"TERRAIN",12,17,4);
			
			zoomPlus.addEventListener(MouseEvent.CLICK,onZoomMap);
			zoomMinus.addEventListener(MouseEvent.CLICK,onUnZoomMap);
			satellite.addEventListener(MouseEvent.MOUSE_UP,onChangeMapTypeSatellite);
			terrain.addEventListener(MouseEvent.MOUSE_UP,onChangeMapTypeTerrain);
						
			request.url = "areas.json" ;
			loader.addEventListener(Event.COMPLETE, decodeJSON) ;
			loader.load(request);

		}
		
		
		private function onZoomMap(ev: MouseEvent):void {
			map.zoomIn(map.getCenter());
		}
		
		private function onUnZoomMap(ev: MouseEvent):void {
			map.zoomOut(map.getCenter());
		}
		
		private function onChangeMapTypeSatellite(ev:MouseEvent):void {
			map.setMapType(MapType.SATELLITE_MAP_TYPE);
		}
		
	  	private function onChangeMapTypeTerrain(ev:MouseEvent):void {
			map.setMapType(MapType.PHYSICAL_MAP_TYPE);
		}	  	
 	 	
 	 	private function successLoadFont(e:Event):void {
 	 	 	embeddedFonts = Font.enumerateFonts(false);
 	 	}


		private function decodeJSON(event:Event):void {
			var arrayAux: Object = new Object();
			loader = URLLoader(event.target) ;
			arrayAux = JSON.decode(loader.data);
			
			countriesData = arrayAux.iccas;
			map.setCenter(new LatLng(0,0), arrayAux.zoom, MapType.PHYSICAL_MAP_TYPE);
			   
			printData();
		}
		
		
		
		private function printData():void {
						
			var directionsBounds:LatLngBounds = new LatLngBounds();
			
			for (var i:int = 0; i < countriesData.length; i++) {

				var marker: ICCAMarker = new ICCAMarker(new LatLng(countriesData[i].lat,countriesData[i].lng),"+",3);
				marker.addEventListener(MapMouseEvent.ROLL_OVER, function(e:MapMouseEvent):void {
                        if(!rollingOver) {
	                        openInfoWindow(e);     
                        }
                        rollingOver=true;                                                                 
                });
                
                iw[marker]=countriesData[i];
                countriesMarkers.push(marker);
				
				
				marker.foreground.alpha=0;
				map.addOverlay(marker);
				TweenLite.to(marker.foreground,1,{alpha:1});
				directionsBounds.extend(marker.getLatLng());
			}

        	if (countriesData.length == 1 ) {
				map.setCenter(directionsBounds.getCenter(),map.getBoundsZoomLevel(directionsBounds) - 12); 	
        	} else {
				map.setCenter(directionsBounds.getCenter(),map.getBoundsZoomLevel(directionsBounds) - 1); 
        	}
			
		}
		
		private var rollingOver:Boolean=false;
		private var infoWindowToOpen:ICCAInfoWindow;
		private function onInfowindowRollOut(e:Event ):void {
			map.closeInfoWindow();
			rollingOver=false;
		}
		
		
		private function openInfoWindow(e:MapMouseEvent):void {
 
 			var m:Object = iw[e.target];
 			
 			infoWindowToOpen = new ICCAInfoWindow(m);
 			infoWindowToOpen.addEventListener(MouseEvent.ROLL_OUT,onInfowindowRollOut);
            var options:InfoWindowOptions = new InfoWindowOptions({
			  
              customContent: infoWindowToOpen,
              padding: 10,
              hasCloseButton: false,
              pointOffset:new Point(-10-2*3,-15-2*3),
              hasShadow: false
            });
            
            infoWindowToOpen.alpha=0;
            map.openInfoWindow(new LatLng(m.lat,m.lng),options);
            TweenLite.to(infoWindowToOpen,0.5,{alpha:1});
                
        }
        
        private function clicked(event:MouseEvent):void {
			navigateToURL(new URLRequest(event.target.url),"_self");
		}
		
	}
}
