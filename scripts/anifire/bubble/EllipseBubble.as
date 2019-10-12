package anifire.bubble
{
   import flash.display.Sprite;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   
   public class EllipseBubble extends Bubble
   {
       
      
      public function EllipseBubble(param1:Boolean = true)
      {
         super();
         tailEnable = param1;
         type = BubbleMgr.ELLIPSE;
         this.redraw();
      }
      
      override protected function drawBody() : void
      {
         if(super.body != null)
         {
            content.removeChild(super.body);
         }
         var _loc1_:Sprite = new Sprite();
         _loc1_.name = "body";
         _loc1_.graphics.beginFill(this.fillRgb,1);
         _loc1_.graphics.drawEllipse(x,y,width,height);
         _loc1_.graphics.endFill();
         super.body = content.addChild(_loc1_) as Sprite;
      }
      
      override protected function drawTail() : void
      {
         var _loc1_:Sprite = null;
         var _loc2_:Sprite = null;
         if(super.tail != null && content.contains(super.tail))
         {
            content.removeChild(super.tail);
         }
         if(tailEnable)
         {
            _loc1_ = super.returnTail();
            super.tail = content.addChild(_loc1_) as Sprite;
         }
         else
         {
            _loc2_ = new Sprite();
            _loc2_.name = "tail";
            _loc1_ = content.addChild(_loc2_) as Sprite;
         }
      }
      
      override protected function drawLabel() : void
      {
         var _loc4_:Object = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.numChildren)
         {
            _loc4_ = this.getChildAt(_loc1_);
            if(_loc4_ is FlashEff2Flex)
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
         var _loc2_:TextField = super.returnLabel(null,0,0);
         var _loc3_:Rectangle = GMath.getBubbleBounds(width,height,type);
         _loc2_.x = _loc3_.x + x;
         _loc2_.y = _loc3_.y + y;
         _loc2_.width = _loc3_.width;
         _loc2_.height = _loc3_.height;
         boundHeight = _loc3_.height - _loc3_.y;
         boundWidth = _loc3_.width;
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
         drawOutline(content);
      }
   }
}
