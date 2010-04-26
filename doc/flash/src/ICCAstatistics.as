package {
	import com.adobe.serialization.json.JSON;
	
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.*;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	import gs.TweenLite;

	[SWF(backgroundColor=0xFFFFFF, width=330, height=230)]
	public class ICCAstatistics extends Sprite
	{
		
		private var loader:URLLoader = new URLLoader();
		private var request:URLRequest = new URLRequest();	
		private var f: TextFormat = new TextFormat();
		private var t:TextField = new TextField();
		private var  embeddedFonts:Array = new Array();
		
		public function ICCAstatistics() {				
			var font: LoadFont = new LoadFont("TitilliumText14L.swf",["TitilliumText14L"]);
 	 	 	font.addEventListener(LoadFont.COMPLETE, successLoadFont);
 	 	 	font.addEventListener(LoadFont.ERROR, failLoadFont);
 	  	}
 	 	private function failLoadFont(e:Event):void {
 	 	 	f.font="Arial"; //default font if load fails.
 	 	 	t.embedFonts = false;
 	 	}
 	 	private function successLoadFont(e:Event):void {
 	 	 	embeddedFonts = Font.enumerateFonts(false);
 	 	 	f.font=embeddedFonts[0].fontName;
 	 	 	t.embedFonts = true;
 	 	 			
			request.url = "countryStats.json" ;
			loader.addEventListener(Event.COMPLETE, decodeJSON) ;
			loader.load(request);
 	 	}

		
		
		private function decodeJSON(event:Event):void {

			loader = URLLoader(event.target) ;
			var continents: Array = JSON.decode(loader.data) ;
			
   
	        
			
			for (var i:int = 0; i < continents.length; i++) {
			 	
				var barrita:Sprite = new Sprite();
	            barrita.graphics.beginFill(continents[i].color);
	            if (continents[i].value!=0) {
	            	barrita.graphics.drawRect(0,0, 53, -1);
	            } else {
	            	barrita.graphics.drawRect(0,0, 53, -1);
	            }
	            barrita.x = i*54+5;
	            barrita.y = 180;
	            barrita.graphics.endFill();
	            
	            addChild(barrita);
	            
	            if (continents[i].value!=0) {
					TweenLite.to(barrita, 1, {height:26*continents[i].value}); 
	            }
	            
	            var labelBackground:Shape = new Shape();
	            labelBackground.graphics.beginFill(0xD7D7D7);
	            labelBackground.graphics.drawRect(i*54+5, 180, 53, 32);
	            labelBackground.graphics.endFill();
	            addChild(labelBackground);
	            
	            
	            var countryText: TextField = new TextField();
	            countryText.text = continents[i].name;
	            var newFormat:TextFormat = new TextFormat(); 
       			newFormat.size = 9; 
       			newFormat.bold = true;
       			newFormat.letterSpacing = 0;
       			newFormat.font=embeddedFonts[0].fontName;
        		countryText.setTextFormat(newFormat); 
 	 	 		countryText.embedFonts = true;
	            countryText.x = i*54+7;
	            countryText.multiline = true;
	            countryText.wordWrap = true;
	            countryText.width = 50;
	            countryText.height = 40;
	            countryText.y = 186;
	            addChild(countryText);
	            
	            var countryValue: TextField = new TextField();
	            countryValue.text = continents[i].value;
	            var newFormatValue:TextFormat = new TextFormat(); 
       			newFormatValue.size = 24; 
       			newFormatValue.bold = true;
       			if (continents[i].value == 0) {
       				newFormatValue.color = 0xD7D7D7; 
       			} else {
       				newFormatValue.color = 0xFFFFFF; 
       			}	
       			newFormatValue.font=embeddedFonts[0].fontName;
       			newFormatValue.letterSpacing = 0;
        		countryValue.setTextFormat(newFormatValue); 
 	 	 		countryValue.embedFonts = true;		
	            countryValue.x = i*54+6;
	            countryValue.multiline = true;
	            countryValue.wordWrap = true;
	            countryValue.width = 15;
	            countryValue.height = 20;
	            countryValue.y = 154;
	            addChild(countryValue);
			}
			
		}
	}
}
