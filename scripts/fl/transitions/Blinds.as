package fl.transitions
{
   import flash.display.MovieClip;
   import flash.geom.Rectangle;
   
   public class Blinds extends Transition
   {
       
      
      protected var _numStrips:uint = 10;
      
      protected var _dimension:uint = 0;
      
      protected var _mask:MovieClip;
      
      protected var _innerMask:MovieClip;
      
      public function Blinds(param1:MovieClip, param2:Object, param3:TransitionManager)
      {
         super(param1,param2,param3);
         this._dimension = !!param2.dimension?uint(1):uint(0);
         if(param2.numStrips)
         {
            this._numStrips = param2.numStrips;
         }
         this._initMask();
      }
      
      override public function get type() : Class
      {
         return Blinds;
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
         if(this._dimension)
         {
            this._innerMask.rotation = -90;
         }
         this._innerMask.graphics.beginFill(16711680);
         this.drawBox(this._innerMask,0,0,100,100);
         this._innerMask.graphics.endFill();
         var _loc1_:Rectangle = this._innerBounds;
         this._mask.x = _loc1_.left;
         this._mask.y = _loc1_.top;
         this._mask.width = _loc1_.width;
         this._mask.height = _loc1_.height;
      }
      
      override protected function _render(param1:Number) : void
      {
         var _loc2_:Number = 100 / this._numStrips;
         var _loc3_:Number = param1 * _loc2_;
         var _loc4_:MovieClip = this._innerMask;
         _loc4_.graphics.clear();
         var _loc5_:Number = this._numStrips;
         _loc4_.graphics.beginFill(16711680);
         while(_loc5_--)
         {
            this.drawBox(_loc4_,-50,_loc5_ * _loc2_ - 50,100,_loc3_);
         }
         _loc4_.graphics.endFill();
      }
   }
}
