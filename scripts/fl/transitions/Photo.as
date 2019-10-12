package fl.transitions
{
   import flash.display.MovieClip;
   import flash.geom.ColorTransform;
   
   public class Photo extends Transition
   {
       
      
      protected var _alphaFinal:Number = 1;
      
      protected var _colorControl:ColorTransform;
      
      public function Photo(param1:MovieClip, param2:Object, param3:TransitionManager)
      {
         super(param1,param2,param3);
         this._alphaFinal = this.manager.contentAppearance.alpha;
         this._colorControl = new ColorTransform();
      }
      
      override public function get type() : Class
      {
         return Photo;
      }
      
      override protected function _render(param1:Number) : void
      {
         var _loc2_:Number = 0.8;
         var _loc3_:Number = 0.9;
         var _loc4_:Object = {};
         var _loc5_:Number = 0;
         if(param1 <= _loc2_)
         {
            this._colorControl.alphaMultiplier = this._alphaFinal * (param1 / _loc2_);
         }
         else
         {
            this._colorControl.alphaMultiplier = this._alphaFinal;
            if(param1 <= _loc3_)
            {
               _loc5_ = (param1 - _loc2_) / (_loc3_ - _loc2_) * 256;
            }
            else
            {
               _loc5_ = (1 - (param1 - _loc3_) / (1 - _loc3_)) * 256;
            }
         }
         _loc4_.rb = _loc4_.gb = _loc4_.bb = _loc5_;
         this._colorControl.redOffset = this._colorControl.greenOffset = this._colorControl.blueOffset = _loc5_;
         this._content.transform.colorTransform = this._colorControl;
      }
   }
}
