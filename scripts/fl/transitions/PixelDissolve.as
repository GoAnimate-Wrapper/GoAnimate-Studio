package fl.transitions
{
   import flash.display.MovieClip;
   import flash.geom.Rectangle;
   
   public class PixelDissolve extends Transition
   {
       
      
      protected var _xSections:Number = 10;
      
      protected var _ySections:Number = 10;
      
      protected var _numSections:uint = 1;
      
      protected var _indices:Array;
      
      protected var _mask:MovieClip;
      
      protected var _innerMask:MovieClip;
      
      public function PixelDissolve(param1:MovieClip, param2:Object, param3:TransitionManager)
      {
         var _loc5_:int = 0;
         super(param1,param2,param3);
         if(param2.xSections)
         {
            this._xSections = param2.xSections;
         }
         if(param2.ySections)
         {
            this._ySections = param2.ySections;
         }
         this._numSections = this._xSections * this._ySections;
         this._indices = new Array();
         var _loc4_:int = this._ySections;
         while(_loc4_--)
         {
            _loc5_ = this._xSections;
            while(_loc5_--)
            {
               this._indices[_loc4_ * this._xSections + _loc5_] = {
                  "x":_loc5_,
                  "y":_loc4_
               };
            }
         }
         this._shuffleArray(this._indices);
         this._initMask();
      }
      
      override public function get type() : Class
      {
         return PixelDissolve;
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
         this._innerMask.graphics.beginFill(16711680);
         this.drawBox(this._innerMask,0,0,100,100);
         this._innerMask.graphics.endFill();
         var _loc1_:Rectangle = this._innerBounds;
         this._mask.x = _loc1_.left;
         this._mask.y = _loc1_.top;
         this._mask.width = _loc1_.right - _loc1_.left;
         this._mask.height = _loc1_.bottom - _loc1_.top;
      }
      
      protected function _shuffleArray(param1:Array) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Object = null;
         var _loc2_:int = param1.length - 1;
         while(_loc2_ > 0)
         {
            _loc3_ = Math.floor(Math.random() * (_loc2_ + 1));
            if(_loc3_ != _loc2_)
            {
               _loc4_ = param1[_loc2_];
               param1[_loc2_] = param1[_loc3_];
               param1[_loc3_] = _loc4_;
            }
            _loc2_--;
         }
      }
      
      override protected function _render(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 1)
         {
            param1 = 1;
         }
         var _loc2_:Number = 100 / this._xSections;
         var _loc3_:Number = 100 / this._ySections;
         var _loc4_:Array = this._indices;
         var _loc5_:MovieClip = this._innerMask;
         _loc5_.graphics.clear();
         _loc5_.graphics.beginFill(16711680);
         var _loc6_:Number = Math.floor(param1 * this._numSections);
         while(_loc6_--)
         {
            this.drawBox(_loc5_,_loc4_[_loc6_].x * _loc2_,_loc4_[_loc6_].y * _loc3_,_loc2_,_loc3_);
         }
         _loc5_.graphics.endFill();
      }
   }
}
