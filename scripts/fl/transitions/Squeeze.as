package fl.transitions
{
   import flash.display.MovieClip;
   
   public class Squeeze extends Transition
   {
       
      
      protected var _scaleProp:String = "scaleX";
      
      protected var _scaleFinal:Number = 1;
      
      public function Squeeze(param1:MovieClip, param2:Object, param3:TransitionManager)
      {
         super(param1,param2,param3);
         if(param2.dimension)
         {
            this._scaleProp = "scaleY";
            this._scaleFinal = this.manager.contentAppearance.scaleY;
         }
         else
         {
            this._scaleProp = "scaleX";
            this._scaleFinal = this.manager.contentAppearance.scaleX;
         }
      }
      
      override public function get type() : Class
      {
         return Squeeze;
      }
      
      override protected function _render(param1:Number) : void
      {
         if(param1 <= 0)
         {
            param1 = 0;
         }
         this._content[this._scaleProp] = param1 * this._scaleFinal;
      }
   }
}
