package fl.transitions
{
   import flash.display.MovieClip;
   import flash.geom.Rectangle;
   
   public class Wipe extends Transition
   {
       
      
      protected var _mask:MovieClip;
      
      protected var _innerMask:MovieClip;
      
      protected var _startPoint:uint = 4;
      
      protected var _cornerMode:Boolean = false;
      
      public function Wipe(param1:MovieClip, param2:Object, param3:TransitionManager)
      {
         super(param1,param2,param3);
         if(param2.startPoint)
         {
            this._startPoint = param2.startPoint;
         }
         this._initMask();
      }
      
      override public function get type() : Class
      {
         return Wipe;
      }
      
      override public function start() : void
      {
         this._content.mask = this._mask;
         super.start();
      }
      
      override public function cleanUp() : void
      {
         this._content.removeChild(this._mask);
         this._content.mask = null;
         super.cleanUp();
      }
      
      protected function _initMask() : void
      {
         this._mask = new MovieClip();
         this._mask.visible = false;
         this._content.addChild(this._mask);
         this._innerMask = new MovieClip();
         this._mask.addChild(this._innerMask);
         this._innerMask.x = this._innerMask.y = 50;
         this._innerMask.graphics.beginFill(16711680);
         this.drawBox(this._innerMask,-50,-50,100,100);
         this._innerMask.graphics.endFill();
         switch(this._startPoint)
         {
            case 3:
            case 2:
               this._innerMask.rotation = 90;
               break;
            case 1:
            case 4:
            case 5:
               this._innerMask.rotation = 0;
               break;
            case 9:
            case 6:
               this._innerMask.rotation = 180;
               break;
            case 7:
            case 8:
               this._innerMask.rotation = -90;
         }
         if(this._startPoint % 2)
         {
            this._cornerMode = true;
         }
         var _loc1_:Rectangle = this._innerBounds;
         this._mask.x = _loc1_.left;
         this._mask.y = _loc1_.top;
         this._mask.width = _loc1_.width;
         this._mask.height = _loc1_.height;
      }
      
      override protected function _render(param1:Number) : void
      {
         this._innerMask.graphics.clear();
         this._innerMask.graphics.beginFill(16711680);
         if(this._cornerMode)
         {
            this._drawSlant(this._innerMask,param1);
         }
         else
         {
            this.drawBox(this._innerMask,-50,-50,param1 * 100,100);
         }
         this._innerMask.graphics.endFill();
      }
      
      protected function _drawSlant(param1:MovieClip, param2:Number) : void
      {
         param1.graphics.moveTo(-50,-50);
         if(param2 <= 0.5)
         {
            param1.graphics.lineTo(200 * (param2 - 0.25),-50);
            param1.graphics.lineTo(-50,200 * (param2 - 0.25));
         }
         else
         {
            param1.graphics.lineTo(50,-50);
            param1.graphics.lineTo(50,200 * (param2 - 0.75));
            param1.graphics.lineTo(200 * (param2 - 0.75),50);
            param1.graphics.lineTo(-50,50);
         }
         param1.graphics.lineTo(-50,-50);
      }
   }
}
