package fl.transitions
{
   import flash.display.MovieClip;
   
   public class Zoom extends Transition
   {
       
      
      protected var _scaleXFinal:Number = 1;
      
      protected var _scaleYFinal:Number = 1;
      
      public function Zoom(param1:MovieClip, param2:Object, param3:TransitionManager)
      {
         super(param1,param2,param3);
         this._scaleXFinal = this.manager.contentAppearance.scaleX;
         this._scaleYFinal = this.manager.contentAppearance.scaleY;
      }
      
      override public function get type() : Class
      {
         return Zoom;
      }
      
      override protected function _render(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         this._content.scaleX = param1 * this._scaleXFinal;
         this._content.scaleY = param1 * this._scaleYFinal;
      }
   }
}
