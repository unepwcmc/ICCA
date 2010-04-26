package
{
import flash.display.SimpleButton;
import flash.display.Sprite;
import flash.events.Event;
import flash.text.Font;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

   public class vizzButton extends Sprite {
   	
      private var path:Sprite
      private var label: String
      private var widthBut : int
      private var heightBut: int
      private var sizeBut: int
      private var textX: int
      private var textY: int
      public var button:SimpleButton = new SimpleButton;
	  private var embeddedFonts:Array = new Array();

      public function vizzButton(where,x,y,width,height,text,size,labelX,labelY):void {
         path = where
         label = text
         widthBut = width
         heightBut = height
         sizeBut = size
         textX = labelX
         textY = labelY
         button.hitTestState = button.upState;
         button.useHandCursor = true;
         button.x = x         
         button.y = y
         
         button.upState = creaSprite(1,0x000000,0x000000,widthBut,heightBut,0.5);
         button.overState = creaSprite(1,0x000000,0x000000,widthBut,heightBut,0.7);
         button.downState = creaSprite(1,0x000000,0x000000,widthBut,heightBut, 0.9);

		 button.hitTestState = button.upState;
		 button.useHandCursor = true;
         
         
         path.addChild(button);

 	 	 
      }
      
      
      public override function addEventListener(type:String, listener:Function, useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=false):void {
		button.addEventListener(type,listener, useCapture, priority, useWeakReference);
      }
      
      public override function removeEventListener(type:String, listener:Function, useCapture:Boolean=false):void {
		button.removeEventListener(type,listener,useCapture);
      }      


      private function creaSprite(line_height, line_color, fill_color, width, height, opacity):Sprite {
         var sprite:Sprite = new Sprite();      
         sprite.graphics.beginFill(fill_color,opacity);
         sprite.graphics.drawRoundRect(0,0,width,height,9);
         var lab:TextField = createLabel();
         sprite.addChild(lab);
         return sprite;
      }
      
      private function createLabel():TextField {
	  	 var fmt:TextFormat = new TextFormat("Arial", sizeBut,0xFFFFFF,true);
		 var tf:TextField = new TextField();
		 tf.selectable = false;
		 tf.y=textY;
		 tf.x=textX;
		 tf.mouseEnabled = false;
		 tf.autoSize = TextFieldAutoSize.LEFT;
		 tf.defaultTextFormat = fmt;
		 tf.text = label;
		 return tf;
	  }
   }
}
