package com.vizzuality
{
        import flash.display.Sprite;
        import flash.events.MouseEvent;
        import flash.net.URLRequest;
        import flash.net.navigateToURL;
        import flash.text.TextField;
        import flash.text.TextFormat; 
        
        public class ICCAInfoWindow extends Sprite {
        	
        	[Embed(source='DINOT-Medium.swf',fontName='DINOT-Medium',fontWeight='normal')]
        	public var f4:Class;
        	private var url:String ='';
        	
            public function ICCAInfoWindow(ob:Object) {
            	
            		useHandCursor = true;
            	 	mouseChildren = false;
            	 	buttonMode = true;
            	 	
            	 	url = ob.url as String;
            	 	addEventListener(MouseEvent.CLICK,clicked); 
 
            		var labelBackground2:Sprite = new Sprite();
		            labelBackground2.graphics.beginFill(0x000000,0.6);
 		            labelBackground2.graphics.drawRoundRect(0,0,200,60,7,7);
		            labelBackground2.graphics.endFill();
		            labelBackground2.mouseChildren=false;
		            addChild(labelBackground2);  
		            
		            var labelBackground:Sprite = new Sprite();
		            labelBackground.graphics.beginFill(0xFFFFFF,0.4);
		            labelBackground.graphics.drawCircle(10+2*3+15,15+2*3+8,17+2*3);
		            labelBackground.graphics.endFill();
		            labelBackground.mouseChildren=false;
		            addChild(labelBackground);		 
		            
		            var labelBackground3:Sprite = new Sprite();
		            labelBackground3.graphics.beginFill(0xFFFFFF,1);
		            labelBackground3.graphics.drawCircle(10+2*3+15,12+2*3+11,12+2*3);
		            labelBackground3.graphics.endFill();
		            labelBackground3.mouseChildren=false;
		            addChild(labelBackground3);		                       
            	
		            var shape: Sprite = new Sprite();
		            var tf:TextField = new TextField();
                    var format:TextFormat = tf.getTextFormat();
                    format.align = "center";
                    format.font = 'Arial';
                    format.size = 25;
                    tf.defaultTextFormat = format;
                    tf.textColor = 0x5e5751;
                    tf.text = "+";
                    tf.width = 30;
                    tf.height=30;
                    tf.x=11+2*3;
                    tf.y=19-2*3;
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
                    shape1.x=((10+2*3+15)*2)
                    shape1.y= 16;
                    shape1.addChild(tf2);
                    shape1.width = 130;
                    shape1.height = 22;
                    shape1.mouseChildren=false;
                    shape1.buttonMode=true;
                    shape1.useHandCursor=true;
                    addChild(shape1);
                    
                    
                    this.x = 0;
                    this.y = 0;
                    this.width = 200;
                    this.height = 60;
            }
            
          	private function clicked(event:MouseEvent):void {
			    navigateToURL(new URLRequest(url),"_self");
			}
      }
}