package anifire.bubble
{
   import flash.display.Sprite;
   import flash.geom.Rectangle;
   
   public class BoomBubble extends ImageBubble
   {
       
      
      private var boomSymbol:Class;
      
      public function BoomBubble()
      {
         this.boomSymbol = BoomBubble_boomSymbol;
         super();
         fillRgb = 16711680;
         tailEnable = false;
         type = BubbleMgr.BOOM;
         redraw();
      }
      
      override protected function drawBody() : void
      {
         image = this.boomSymbol;
         super.drawBody();
      }
      
      override protected function drawTail() : void
      {
         var _loc1_:Sprite = new Sprite();
         _loc1_.name = "tail";
         tail = content.addChild(_loc1_) as Sprite;
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
      
      override protected function drawLabel() : void
      {
         leftMargin = 0;
         rightMargin = 0;
         super.drawLabel();
      }
   }
}
