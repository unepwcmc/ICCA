package
{
	import com.google.maps.LatLng;
	import com.google.maps.Map;
	import com.google.maps.MapEvent;
	import com.google.maps.MapType;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.Font;
	
	
	[SWF(backgroundColor=0xFFFFFF, width=337, height=203)]
	public class smallMap extends Sprite
	{
		
			private var map: Map = new Map();
			private var embeddedFonts:Array = new Array();
			
			public function smallMap() {	
				var font: LoadFont = new LoadFont("TitilliumText14L.swf",["TitilliumText14L"]);
	 	 	 	font.addEventListener(LoadFont.COMPLETE, successLoadFont);
	 	 	 	
	 	 	 	var mapKey:String = root.loaderInfo.parameters.mapkey;
	 	  		map.key = mapKey;
				map.language = "es";
				map.setSize(new Point(337,203));
				map.addEventListener(MapEvent.MAP_READY, onMapReady);
				this.addChild(map);
				
	 	  	}
	 	  	
			private function onMapReady(event:MapEvent):void {
				
				var zoomPlus:vizzButton = new vizzButton(this,10,10,25,25,"+",20,5,-1);		
				var zoomMinus:vizzButton = new vizzButton(this,10,36,25,25,"-",20,7,-2);
				var satellite:vizzButton = new vizzButton(this,148,10,90,25,"SATELLITE",12,12,4);
				var terrain:vizzButton = new vizzButton(this,239,10,90,25,"TERRAIN",12,17,4);
				var lat: Number = root.loaderInfo.parameters.lat;
	 	 	 	var lon: Number = root.loaderInfo.parameters.lon;
	 	 	 	
	 	 	 	var latlon:LatLng = new LatLng(lat,lon);
                map.setCenter(latlon, 5, MapType.PHYSICAL_MAP_TYPE);
				zoomPlus.addEventListener(MouseEvent.CLICK,onZoomMap);
				zoomMinus.addEventListener(MouseEvent.CLICK,onUnZoomMap);
				satellite.addEventListener(MouseEvent.MOUSE_UP,onChangeMapTypeSatellite);
				terrain.addEventListener(MouseEvent.MOUSE_UP,onChangeMapTypeTerrain);
	
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
			
		}
}