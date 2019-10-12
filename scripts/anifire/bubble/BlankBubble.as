package anifire.bubble
{
   import anifire.util.UtilDraw;
   import anifire.util.UtilString;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   
   public class BlankBubble extends Bubble
   {
       
      
      private var _border:Boolean = false;
      
      public function BlankBubble()
      {
         super();
         tailEnable = false;
         outlineEnable = false;
         paddingEnabled = true;
         type = BubbleMgr.BLANK;
         this.redraw();
         this.fillAlpha = 0;
      }
      
      override protected function drawBody() : void
      {
         if(super.body != null)
         {
            content.removeChild(super.body);
         }
         var _loc1_:Sprite = new Sprite();
         _loc1_.name = "body";
         if(UtilString.trim(text," ") == "")
         {
            this._border = true;
         }
         else
         {
            this._border = false;
         }
         _loc1_.graphics.clear();
         if(this.fillAlpha > 0)
         {
            _loc1_.graphics.beginFill(this.fillRgb,this.fillAlpha);
            _loc1_.graphics.drawRect(x,y,width,height);
            this._border = false;
         }
         if(this._border)
         {
            _loc1_.graphics.lineStyle(0,this.lineRgb);
            UtilDraw.drawDashRect(_loc1_,x,y,width,height,3,3);
         }
         _loc1_.graphics.endFill();
         super.body = content.addChild(_loc1_) as Sprite;
      }
      
      override protected function drawTail() : void
      {
         var _loc1_:Sprite = new Sprite();
         _loc1_.name = "tail";
         tail = content.addChild(_loc1_) as Sprite;
      }
      
      override protected function drawLabel() : void
      {
         var _loc3_:Object = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.numChildren)
         {
            _loc3_ = this.getChildAt(_loc1_);
            if(_loc3_ is FlashEff2Flex)
            {
               return;
            }
            _loc1_++;
         }
         if(mver >= 2)
         {
            super.drawLabel();
         }
         if(super.label != null)
         {
            if(super.label.parent)
            {
               super.label.parent.removeChild(super.label);
            }
         }
         var _loc2_:TextField = super.returnLabel();
         _loc2_.x = x + horizontalPadding / 2;
         _loc2_.y = y + verticalPadding / 2;
         if(editEnable)
         {
            _loc2_.addEventListener(Event.CHANGE,this.iTextChangeHandler);
         }
         boundHeight = textHeight;
         boundWidth = textWidth;
         super.label = addChild(_loc2_) as TextField;
         if(mver >= 2)
         {
            updateVerticalAlign();
         }
         else
         {
            super.drawLabel();
         }
      }
      
      override public function redraw() : void
      {
         this.drawTail();
         this.drawBody();
         this.drawLabel();
      }
      
      private function iTextChangeHandler(param1:Event) : void
      {
         var _loc2_:String = param1.currentTarget.text;
         if(UtilString.trim(_loc2_," ") == "")
         {
            if(!this._border)
            {
               this.drawBody();
            }
         }
         else if(this._border)
         {
            this.drawBody();
         }
      }
      
      override public function getSize() : Rectangle
      {
         var _loc1_:Rectangle = new Rectangle();
         _loc1_.x = x;
         _loc1_.y = y;
         _loc1_.width = width;
         _loc1_.height = height;
         return _loc1_;
      }
   }
}
