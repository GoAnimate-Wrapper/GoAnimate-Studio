package fl.transitions
{
   import flash.display.MovieClip;
   
   public class Rotate extends Transition
   {
       
      
      protected var _rotationFinal:Number = NaN;
      
      protected var _degrees:Number = 360;
      
      public function Rotate(param1:MovieClip, param2:Object, param3:TransitionManager)
      {
         super(param1,param2,param3);
         if(isNaN(this._rotationFinal))
         {
            this._rotationFinal = this.manager.contentAppearance.rotation;
         }
         if(param2.degrees)
         {
            this._degrees = param2.degrees;
         }
         if(param2.ccw ^ this.direction)
         {
            this._degrees = this._degrees * -1;
         }
      }
      
      override public function get type() : Class
      {
         return Rotate;
      }
      
      override protected function _render(param1:Number) : void
      {
         this._content.rotation = this._rotationFinal - this._degrees * (1 - param1);
      }
   }
}
