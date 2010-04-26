package com.vizzuality
{
        import flash.display.Sprite;
        import flash.events.MouseEvent;
        import flash.net.URLRequest;
        import flash.net.navigateToURL;
        import flash.text.TextField;
        import flash.text.TextFormat; 
        
        public class ICCACountriesInfoWindow extends Sprite {
        	
        	[Embed(source='DINOT-Medium.swf',fontName='DINOT-Medium',fontWeight='normal')]
        	public var f4:Class;
        	
            public function ICCACountriesInfoWindow(ob:Object) {
            	
/*             		useHandCursor = true;
            	 	mouseChildren = false;
            	 	buttonMode = true; */
 
            		var labelBackground2:Sprite = new Sprite();
		            labelBackground2.graphics.beginFill(0x000000,0.8);
 		            labelBackground2.graphics.drawRoundRect(0,0,200,60+ob.sites*23,7,7);
		            labelBackground2.graphics.endFill();
		            labelBackground2.mouseChildren=false;
		            addChild(labelBackground2);  
		            
		            var labelBackground:Sprite = new Sprite();
		            labelBackground.graphics.beginFill(0xFFFFFF,0.4);
		            labelBackground.graphics.drawCircle(10+2*ob.sites+15,15+2*ob.sites+8,17+2*ob.sites);
		            labelBackground.graphics.endFill();
		            labelBackground.mouseChildren=false;
		            addChild(labelBackground);		 
		            
		            var labelBackground3:Sprite = new Sprite();
		            labelBackground3.graphics.beginFill(0xFFFFFF,1);
		            labelBackground3.graphics.drawCircle(10+2*ob.sites+15,12+2*ob.sites+11,12+2*ob.sites);
		            labelBackground3.graphics.endFill();
		            labelBackground3.mouseChildren=false;
		            addChild(labelBackground3);		                       
            	
		            var shape: Sprite = new Sprite();
		            var tf:TextField = new TextField();
                    var format:TextFormat = tf.getTextFormat();
	                format.align = "center";
	                format.font = "DINOT-Medium";
                    format.size = 12;
                    tf.defaultTextFormat = format;
	                tf.textColor = 0x372d26;
	                tf.text = ob.short;
                    tf.width = 30;
                    tf.height= 30;
                    tf.embedFonts = true;
                    tf.x=10+2*ob.sites;
                    tf.y=14+2*ob.sites;
                    shape.addChild(tf);
                    addChild(shape);

					var shape1: VizzualityShape = new VizzualityShape(ob.url);
                    var tf2:TextField = new TextField();
                    var format2:TextFormat = tf2.getTextFormat();
                    format2.align = "left";
                    format2.font = "DINOT-Medium";
                    format2.size = 18;
                    format2.letterSpacing = -1;
                    tf2.defaultTextFormat = format2;
                    tf2.text = ob.name;
                    tf2.textColor = 0xffffff;
                    tf2.embedFonts = true;
                    tf2.width = 130;
                    tf2.height=22;
                    tf2.x=0;
                    tf2.y=0;
                    tf2.multiline = true;
                    shape1.x=((10+2*ob.sites+15)*2)
                    shape1.y= 5;
                    shape1.addChild(tf2);
                    shape1.width = 130;
                    shape1.height = 22;
                    shape1.mouseChildren=false;
                    shape1.buttonMode=true;
                    shape1.useHandCursor=true;
                    addChild(shape1);
                    shape1.addEventListener(MouseEvent.CLICK,clicked);
                    
                    
                    var shape2: Sprite = new Sprite();
                    var iccaText:TextField = new TextField();
                    var numICCAFormat:TextFormat = new TextFormat();
                    numICCAFormat.align = "left";
                    numICCAFormat.font = "DINOT-Medium";
                    numICCAFormat.size = 12;
                    iccaText.defaultTextFormat = numICCAFormat;
                    if (ob.sites==1) {
                    	iccaText.text = ob.sites + " ICCA SITE";
                    } else {
                    	iccaText.text = ob.sites + " ICCA SITES";
                    }
                    iccaText.textColor = 0x9cc342;
                    iccaText.embedFonts = true;
                    iccaText.width = 130;
                    iccaText.height=22;
                    iccaText.x=0;
                    iccaText.y=0;
                    iccaText.multiline = true;
                    shape2.x=((10+2*ob.sites+15)*2)
                    shape2.y= 24;
                    shape2.addChild(iccaText);
                    shape2.width = 130;
                    shape2.height = 22;
                    shape2.mouseChildren=false;
                    shape2.buttonMode=true;
                    shape2.useHandCursor=true;
                    addChild(shape2);
                    shape1.addEventListener(MouseEvent.CLICK,clicked);
                    
                    for(var i:Number=0;i< (ob.textSites as Array).length;i++) {
						var siteShape: VizzualityShape = new VizzualityShape((ob.textSites as Array)[i].url);
	                    var textField:TextField = new TextField();
	                    var textFormat:TextFormat = new TextFormat();
	                    textFormat.align = "left";
	                    textFormat.font = "DINOT-Medium";
	                    textFormat.size = 16;
	                    textFormat.letterSpacing = -1;
	                    textField.defaultTextFormat = textFormat;
	                    textField.text = (ob.textSites as Array)[i].name;
	                    textField.textColor = 0xffffff;
	                    textField.embedFonts = true;
	                    textField.width = 130;
	                    textField.height=22;
	                    textField.x=-10;
	                    textField.y=0;
	                    textField.multiline = true;
	                    siteShape.x=((15+2*ob.sites+15)*2);
	                    siteShape.y= ((50+20*i));
	                    siteShape.addChild(textField);
	                    siteShape.width = 130;
	                    siteShape.height = 22;
	                    siteShape.mouseChildren=false;
	                    siteShape.buttonMode=true;
	                    siteShape.useHandCursor=true;
	                    addChild(siteShape);
	                    siteShape.addEventListener(MouseEvent.CLICK,clicked);
                    }

                    this.x = 0;
                    this.y = 0;
                    this.width = 200;
                    /* this.height = 60+ob.sites*25; */
                    
            }
            
          	private function clicked(event:MouseEvent):void {
			    navigateToURL(new URLRequest(event.target.url),"_self");
			}
      }
}