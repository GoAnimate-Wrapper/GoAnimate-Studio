package anifire.studio.components
{
   import anifire.studio.skins.FlatVScrollBarSkin;
   import flash.events.MouseEvent;
   import spark.components.VScrollBar;
   import spark.events.TrackBaseEvent;
   
   public class FlatVScrollBar extends VScrollBar
   {
       
      
      protected var _hovered:Boolean;
      
      protected var _pressed:Boolean;
      
      public var alwaysActive:Boolean;
      
      public function FlatVScrollBar()
      {
         super();
         setStyle("skinClass",FlatVScrollBarSkin);
         addEventListener(MouseEvent.ROLL_OVER,this.rollOverHandler);
         addEventListener(MouseEvent.ROLL_OUT,this.rollOutHandler);
         addEventListener(TrackBaseEvent.THUMB_PRESS,this.thumbPressHandler);
         addEventListener(TrackBaseEvent.THUMB_RELEASE,this.thumbReleaseHandler);
      }
      
      protected function rollOverHandler(param1:MouseEvent) : void
      {
         this._hovered = true;
         invalidateSkinState();
      }
      
      protected function rollOutHandler(param1:MouseEvent) : void
      {
         this._hovered = false;
         invalidateSkinState();
      }
      
      protected function thumbPressHandler(param1:TrackBaseEvent) : void
      {
         this._pressed = true;
         invalidateSkinState();
      }
      
      protected function thumbReleaseHandler(param1:TrackBaseEvent) : void
      {
         this._pressed = false;
         invalidateSkinState();
      }
      
      override protected function getCurrentSkinState() : String
      {
         if(this.alwaysActive || this._pressed || this._hovered)
         {
            return "active";
         }
         return super.getCurrentSkinState();
      }
   }
}
