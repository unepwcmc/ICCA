package com.vizzuality
{
        import flash.display.Shape;
        import flash.display.Sprite;
        import flash.text.TextField;
        import flash.text.TextFormat; 
        
        public class GenericMarkerIcon extends Sprite {
        	
        	[Embed(source='DINOT-Medium.swf',fontName='DINOT-Medium',fontWeight='normal')]
        	public var f4:Class;
        	
          
            public function GenericMarkerIcon(texto:String,sites:int) {
            	
            	 	useHandCursor = true;
            	 	mouseChildren = false;
            	 	buttonMode = true;
     
                    var labelBackground:Shape = new Shape();
		            labelBackground.graphics.beginFill(0x000000,0.2);
		            labelBackground.graphics.drawCircle(15,8,17+2*sites);
		            labelBackground.graphics.endFill();
		            addChild(labelBackground);
		            
		            var labelBackground2:Shape = new Shape();
		            labelBackground2.graphics.beginFill(0x000000,0.6);
		            labelBackground2.graphics.drawCircle(15,8,12+2*sites);
		            labelBackground2.graphics.endFill();
		            addChild(labelBackground2);
		            
		            if (texto=="+") {
	                    var tf:TextField = new TextField();
	                    var format:TextFormat = tf.getTextFormat();
	                    format.align = "center";
	                    format.font = "Arial";
	                    format.size = 25;
	                    tf.defaultTextFormat = format;
	                    tf.text = texto;
	                    tf.textColor = 0xffffff;
	                    tf.mouseEnabled = false;
	                    tf.x = 1;
	                    tf.y = -8;
	                    tf.width = 30;
	                    tf.height = 30;
	                    mouseChildren = false;
	                    addChild(tf);
		            } else {
	                    var tf:TextField = new TextField();
	                    var format:TextFormat = tf.getTextFormat();
	                    format.align = "center";
	                    format.font = "DINOT-Medium";
	                    format.size = 12;
	                    tf.defaultTextFormat = format;
	                    tf.text = texto;
	                    tf.textColor = 0xffffff;
	                    tf.mouseEnabled = false;
	                    tf.embedFonts = true;
	                    tf.width = 30;
	                    tf.height = 20;
	                    tf.y=-1;
	                    mouseChildren = false;
	                    addChild(tf);
		            }   
            }
      }
}
