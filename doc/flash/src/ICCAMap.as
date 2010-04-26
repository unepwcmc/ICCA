package {
	import com.adobe.serialization.json.JSON;
	import com.google.maps.InfoWindowOptions;
	import com.google.maps.LatLng;
	import com.google.maps.Map;
	import com.google.maps.MapEvent;
	import com.google.maps.MapMouseEvent;
	import com.google.maps.MapType;
	import com.google.maps.overlays.Marker;
	import com.vizzuality.*;
	
	import flash.display.Bitmap;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.*;
	import flash.geom.Point;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.Dictionary;
	
	import gs.TweenLite;
		
	/* import gs.TweenLite; */

	[SWF(backgroundColor=0xFFFFFF, width=938, height=346)]
	public class ICCAMap extends Sprite
	{
		
		private var loader:URLLoader = new URLLoader();
		private var request:URLRequest = new URLRequest();	
		private var embeddedFonts:Array = new Array();
		private var countriesObjectsArray: Array = new Array();
		private var countriesData: Array = new Array();
		private var pages: int = 0;
		private var actualPage: int = 0;
		private var iw:Dictionary=new Dictionary();
		
		private var map: Map = new Map();

		[Embed(source='assets/band.jpg')]
		private var bandClass:Class;

		
		public function ICCAMap() {	
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
			
			var band: Bitmap = new bandClass();
			band.height=397;
			band.x=45;
			band.y=0;
			addChild(band);
			
			var title: TextField = new TextField();
	        title.text = "EXPLORE THE";
            var newFormatValue:TextFormat = new TextFormat(); 
   			newFormatValue.size = 12; 
   			newFormatValue.bold = true;
			newFormatValue.color = 0xFFFFFF; 
   			newFormatValue.font=embeddedFonts[0].fontName;
   			newFormatValue.letterSpacing = 0;
    		title.setTextFormat(newFormatValue); 
  	 		title.embedFonts = true;		
            title.x = 60;
            title.width = 100;
            title.y = 15;
            addChild(title);
            
            var title2: TextField = new TextField();
	        title2.text = "ICCA SITES";
            var newFormatValue2:TextFormat = new TextFormat(); 
   			newFormatValue2.size = 24; 
   			newFormatValue2.bold = true;
			newFormatValue2.color = 0xFFFFFF; 
   			newFormatValue2.font=embeddedFonts[0].fontName;
   			newFormatValue2.letterSpacing = 0;
    		title2.setTextFormat(newFormatValue2); 
  	 		title2.embedFonts = true;		
            title2.x = 59;
            title2.width = 125;
            title2.y = 25;
            addChild(title2);
            

			var zoomPlus:vizzButton = new vizzButton(this,10,10,25,25,"+",20,5,-1);		
			var zoomMinus:vizzButton = new vizzButton(this,10,36,25,25,"-",20,7,-2);
			var satellite:vizzButton = new vizzButton(this,750,10,90,25,"SATELLITE",12,12,4);
			var terrain:vizzButton = new vizzButton(this,841,10,90,25,"TERRAIN",12,17,4);
			
			zoomPlus.addEventListener(MouseEvent.CLICK,onZoomMap);
			zoomMinus.addEventListener(MouseEvent.CLICK,onUnZoomMap);
			satellite.addEventListener(MouseEvent.MOUSE_UP,onChangeMapTypeSatellite);
			terrain.addEventListener(MouseEvent.MOUSE_UP,onChangeMapTypeTerrain);
						
			request.url = "iccaCountryDetails.json" ;
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
			map.setCenter(new LatLng(arrayAux.lat,arrayAux.lng), arrayAux.zoom, MapType.PHYSICAL_MAP_TYPE);
			
			if (countriesData.length % 4 == 0) {
				pages = countriesData.length/4;
			} else {
				pages = countriesData.length/4 + 1;
			}
			actualPage = 0;
			if (pages>1) {
				var nextCountries:vizzButton = new vizzButton(this,176,323,15,16,">",13,2,-1);	
				nextCountries.addEventListener(MouseEvent.CLICK,onClickNext);	
				var previousCountries:vizzButton = new vizzButton(this,156,323,15,16,"<",13,1,-1);	
				previousCountries.addEventListener(MouseEvent.CLICK,onClickPrevious);
			}
			
			printData(((actualPage+1)*4) % countriesData.length);
			
		}
		
		
		private function onClickNext(ev:MouseEvent):void {
			if (actualPage+1<pages) {
				actualPage++;
				var modular : int = ((actualPage+1)*4) % countriesData.length;
				if ( modular == 0) {
					printData(4);
				} else {
					printData(modular);
				}				
			}
		}
		
		private function onClickPrevious(ev:MouseEvent):void {
			if (actualPage-1>=0) {
				actualPage--;
				var modular : int = ((actualPage+1)*4) % countriesData.length;
				if ( modular == 0) {
					printData(4);
				} else {
					printData(modular);
				}				
			}
		}
		
		private function removeMarker(m:Marker):void {
			map.removeOverlay(m);
		}
		
		private function printData(limit:int):void {
			
			//map.clearOverlays();
 			for (var mar:Object in iw) {
				TweenLite.to(mar.foreground,1,{alpha:0,onComplete:removeMarker,onCompleteParams:[mar]});
			} 
			
			removeBeforeData();
			
			var posCont: int = 0;
			if (countriesData.length <= 4 ){
				trace(countriesData.length);
				for (var i:int = 0; i < countriesData.length; i++) {
				
					var vizzSprite: VizzualityShape = new VizzualityShape(countriesData[i].url);
		            var countryText: TextField = new TextField();
		            countryText.text =  "IN " + countriesData[i].name;
		            var newFormat:TextFormat = new TextFormat(); 
	       			newFormat.size = 15; 
	       			newFormat.color = 0xFFFFFF;
	       			newFormat.bold = true;
	       			newFormat.letterSpacing = 0;
	       			newFormat.font=embeddedFonts[0].fontName;
	        		countryText.setTextFormat(newFormat); 
	 	 	 		countryText.embedFonts = true;
		            countryText.multiline = true;
		            countryText.wordWrap = true;
		            countryText.width = 130;
		            countryText.height = 30;
		            countryText.x = 0;
		            countryText.y = 0;
		            vizzSprite.x = 60;
		            if (i==0){
		            	vizzSprite.y = 75+(posCont)*63;
		            } else {
		            	vizzSprite.y = 70+(posCont)*63;
		            }
		            vizzSprite.addChild(countryText);
		            vizzSprite.width = 130;
		            vizzSprite.height = 30; 
		            vizzSprite.mouseChildren=false;
	                vizzSprite.buttonMode=true;
	                vizzSprite.useHandCursor=true;
		            addChild(vizzSprite);
		            vizzSprite.addEventListener(MouseEvent.CLICK,clicked);
		            
		            
		            var countryValue: TextField = new TextField();
		            countryValue.text = countriesData[i].value;
		            var newFormatValue:TextFormat = new TextFormat(); 
	       			newFormatValue.size = 11; 
	       			newFormatValue.bold = true;
	       			newFormatValue.color = 0xFFFFFF; 
	       			newFormatValue.font=embeddedFonts[0].fontName;
	       			newFormatValue.letterSpacing = 0;
	        		countryValue.setTextFormat(newFormatValue); 
	 	 	 		countryValue.embedFonts = true;		
		            countryValue.x = 60;
		            countryValue.multiline = true;
		            countryValue.wordWrap = true;
		            countryValue.width = 140;
		            countryValue.height = 30;
		            countryValue.y = 90+(posCont)*63;
		            addChild(countryValue);
		
					var s:Shape = new DottedLine(135, 1, 0xFFFFFF,0.5,1,1);
					s.x = 55;
					s.y = 113+(posCont)*63;
					addChild(s);
					
					countriesObjectsArray.push(vizzSprite,countryValue,s);
					
					var marker: ICCAMarker = new ICCAMarker(new LatLng(countriesData[i].lat,countriesData[i].lng),countriesData[i].short,countriesData[i].sites);
					if(countriesData[i].sites > 0){
						marker.addEventListener(MapMouseEvent.ROLL_OVER, function(e:MapMouseEvent):void {
	                        if(!rollingOver) {
		                        openInfoWindow(e); 
		                    } 
	                        rollingOver=true;
		                });
	    			}
	                
	                iw[marker]=countriesData[i];
					
					
					//add the marker with fade in
					marker.foreground.alpha=0;
					map.addOverlay(marker);
					TweenLite.to(marker.foreground,1,{alpha:1});
					
					posCont++;

				}
			} else {
				for (var i:int = actualPage*4+1; i < actualPage*4+1+limit; i++) {
				
					var vizzSprite: VizzualityShape = new VizzualityShape(countriesData[i-1].url);
		            var countryText: TextField = new TextField();
		            countryText.text =  "IN " + countriesData[i-1].name;
		            var newFormat:TextFormat = new TextFormat(); 
	       			newFormat.size = 15; 
	       			newFormat.color = 0xFFFFFF;
	       			newFormat.bold = true;
	       			newFormat.letterSpacing = 0;
	       			newFormat.font=embeddedFonts[0].fontName;
	        		countryText.setTextFormat(newFormat); 
	 	 	 		countryText.embedFonts = true;
		            countryText.multiline = true;
		            countryText.wordWrap = true;
		            countryText.width = 130;
		            countryText.height = 30;
		            countryText.x = 0;
		            countryText.y = 0;
		            vizzSprite.x = 60;
		            vizzSprite.y = 70+(posCont)*63;
		            vizzSprite.addChild(countryText);
		            vizzSprite.width = 130;
		            vizzSprite.height = 30; 
		            vizzSprite.mouseChildren=false;
	                vizzSprite.buttonMode=true;
	                vizzSprite.useHandCursor=true;
		            addChild(vizzSprite);
		            vizzSprite.addEventListener(MouseEvent.CLICK,clicked);
		            
		            
		            var countryValue: TextField = new TextField();
		            countryValue.text ="+ " + countriesData[i-1].value;
		            var newFormatValue:TextFormat = new TextFormat(); 
	       			newFormatValue.size = 11; 
	       			newFormatValue.bold = true;
	       			newFormatValue.color = 0xFFFFFF; 
	       			newFormatValue.font=embeddedFonts[0].fontName;
	       			newFormatValue.letterSpacing = 0;
	        		countryValue.setTextFormat(newFormatValue); 
	 	 	 		countryValue.embedFonts = true;		
		            countryValue.x = 60;
		            countryValue.multiline = true;
		            countryValue.wordWrap = true;
		            countryValue.width = 140;
		            countryValue.height = 30;
		            countryValue.y = 90+(posCont)*63;
		            addChild(countryValue);
		
					var s:Shape = new DottedLine(135, 1, 0xFFFFFF,0.5,1,1);
					s.x = 55;
					s.y = 123+(posCont)*63;
					addChild(s);
					
					countriesObjectsArray.push(vizzSprite,countryValue,s);
					
					var marker: ICCAMarker = new ICCAMarker(new LatLng(countriesData[i-1].lat,countriesData[i-1].lng),countriesData[i-1].short,countriesData[i-1].sites);
					if(countriesData[i].sites > 0){
						marker.addEventListener(MapMouseEvent.ROLL_OVER, function(e:MapMouseEvent):void {
		                    if(countriesData[i-1].sites != 0){
		                        if(!rollingOver) {
			                        openInfoWindow(e);
		                        }
		                        rollingOver=true; 
		                    }                                                                
		                });
		   			}
	                
	                iw[marker]=countriesData[i-1];
					
					
					//add the marker with fade in
					marker.foreground.alpha=0;
					map.addOverlay(marker);
					TweenLite.to(marker.foreground,1,{alpha:1});
					
					posCont++;

				}
			}
			
		}
		
		private var rollingOver:Boolean=false;
		private var infoWindowToOpen:ICCACountriesInfoWindow;
		private function onInfowindowRollOut(e:Event ):void {
			map.closeInfoWindow();
			rollingOver=false;
		}
		
		private function removeBeforeData():void {
			if (countriesObjectsArray.length != 0) {
				for (var i:int=0;i<countriesObjectsArray.length;i++) {
					removeChild(countriesObjectsArray[i]);
				}
				countriesObjectsArray = new Array();
			}		
		}
		
		private function openInfoWindow(e:MapMouseEvent):void {
 
 			var m:Object = iw[e.target];
 			
 			infoWindowToOpen = new ICCACountriesInfoWindow(m);
 			infoWindowToOpen.addEventListener(MouseEvent.ROLL_OUT,onInfowindowRollOut);
        	var options:InfoWindowOptions = new InfoWindowOptions({

          	customContent: infoWindowToOpen,
          	padding: 10,
          	hasCloseButton: false,
          	pointOffset:new Point(-10-2*m.sites,-15-2*m.sites),
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