package anifire.studio.commands
{
   import anifire.studio.assets.controllers.BubbleController;
   import anifire.studio.core.Asset;
   import anifire.studio.interfaces.IBubbleTail;
   import flash.geom.Point;
   
   public class MoveBubbleTailCommand extends AssetCommand
   {
       
      
      private var _newTail:Point;
      
      private var _oldTail:Point;
      
      public function MoveBubbleTailCommand(param1:Object)
      {
         var _loc2_:Asset = null;
         if(param1 is BubbleController)
         {
            _loc2_ = (param1 as BubbleController).asset;
            super(_loc2_);
            _type = "MoveBubbleTailCommand";
            if(this.bubble)
            {
               this._oldTail = new Point(this.bubble.tailX,this.bubble.tailY);
            }
         }
      }
      
      private function get bubble() : IBubbleTail
      {
         return this.asset as IBubbleTail;
      }
      
      public function executeNow(param1:Number, param2:Number) : void
      {
         if(this.bubble)
         {
            super.execute();
            this._newTail = new Point(param1,param2);
            this.bubble.moveTail(this._newTail.x,this._newTail.y);
         }
      }
      
      override public function undo() : void
      {
         if(this.bubble && this._oldTail)
         {
            this.bubble.moveTail(this._oldTail.x,this._oldTail.y);
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         if(this.bubble && this._newTail)
         {
            this.bubble.moveTail(this._newTail.x,this._newTail.y);
         }
         super.redo();
      }
   }
}
