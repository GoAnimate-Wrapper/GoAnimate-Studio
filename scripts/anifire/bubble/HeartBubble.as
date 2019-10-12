package anifire.bubble
{
   public class HeartBubble extends ImageBubble
   {
       
      
      private var heartSymbol:Class;
      
      public function HeartBubble(param1:Boolean = true)
      {
         this.heartSymbol = HeartBubble_heartSymbol;
         super();
         tailEnable = param1;
         height = 160;
         taily = 210;
         type = BubbleMgr.HEART;
         redraw();
      }
      
      override protected function drawBody() : void
      {
         image = this.heartSymbol;
         super.drawBody();
      }
      
      override protected function drawTail() : void
      {
         tailImage = this.heartSymbol;
         super.drawTail();
      }
      
      override protected function drawLabel() : void
      {
         leftMargin = 25;
         rightMargin = 25;
         super.drawLabel();
      }
   }
}
