package anifire.bubble
{
   public class CloudBubble extends ImageBubble
   {
       
      
      private var cloudSymbol:Class;
      
      private var cloudTailSymbol:Class;
      
      public function CloudBubble(param1:Boolean = true)
      {
         this.cloudSymbol = CloudBubble_cloudSymbol;
         this.cloudTailSymbol = CloudBubble_cloudTailSymbol;
         super();
         tailEnable = param1;
         type = BubbleMgr.CLOUD;
         redraw();
      }
      
      override protected function drawBody() : void
      {
         image = this.cloudSymbol;
         super.drawBody();
      }
      
      override protected function drawTail() : void
      {
         tailImage = this.cloudTailSymbol;
         super.drawTail();
      }
      
      override protected function drawLabel() : void
      {
         leftMargin = 0;
         rightMargin = 8;
         super.drawLabel();
      }
   }
}
