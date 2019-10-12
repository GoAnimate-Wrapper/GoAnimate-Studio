package anifire.studio.assets.control
{
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import mx.core.UIComponent;
   import mx.effects.Fade;
   
   public class RotatableControlPoint extends UIComponent
   {
      
      public static const POINT_ID_TOP_LEFT:uint = 0;
      
      public static const POINT_ID_TOP:uint = 1;
      
      public static const POINT_ID_TOP_RIGHT:uint = 2;
      
      public static const POINT_ID_RIGHT:uint = 3;
      
      public static const POINT_ID_BOTTOM_RIGHT:uint = 4;
      
      public static const POINT_ID_BOTTOM:uint = 5;
      
      public static const POINT_ID_BOTTOM_LEFT:uint = 6;
      
      public static const POINT_ID_LEFT:uint = 7;
       
      
      private const POINT_COLOR_LIGHT:uint = 11979662;
      
      private const POINT_COLOR_DARK:uint = 5405190;
      
      private const POINT_RADIUS:Number = 4;
      
      private var _btnLayer:UIComponent;
      
      private var _fadeIn:Fade;
      
      public function RotatableControlPoint(param1:uint)
      {
         this._btnLayer = new UIComponent();
         this._fadeIn = new Fade();
         super();
         var _loc2_:UIComponent = new UIComponent();
         _loc2_.buttonMode = true;
         _loc2_.addChild(this._btnLayer);
         this.addChild(_loc2_);
         var _loc3_:UIComponent = new UIComponent();
         var _loc4_:Rectangle = new Rectangle(-this.POINT_RADIUS,-this.POINT_RADIUS,this.POINT_RADIUS * 2,this.POINT_RADIUS * 2);
         _loc3_.graphics.beginFill(this.POINT_COLOR_DARK);
         _loc3_.graphics.lineStyle(1,this.POINT_COLOR_LIGHT,1,true);
         _loc3_.graphics.drawRect(_loc4_.x,_loc4_.y,_loc4_.width,_loc4_.height);
         _loc3_.graphics.endFill();
         _loc2_.addChild(_loc3_);
         _loc2_.addChild(this._btnLayer);
         var _loc5_:RotatableControlIcon = new RotatableControlIcon(param1);
         this._btnLayer.visible = false;
         this._btnLayer.addChild(_loc5_);
         _loc2_.addEventListener(MouseEvent.ROLL_OVER,this.onPointRollOver);
         _loc2_.addEventListener(MouseEvent.ROLL_OUT,this.onPointRollOut);
      }
      
      private function onPointRollOver(param1:MouseEvent) : void
      {
         if(!param1.buttonDown)
         {
            if(this.stage)
            {
               this.stage.addEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUp);
            }
            this._btnLayer.visible = true;
         }
      }
      
      private function onStageMouseUp(param1:MouseEvent) : void
      {
         if(this.stage)
         {
            this.stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUp);
         }
         this._btnLayer.visible = false;
      }
      
      private function onPointRollOut(param1:MouseEvent) : void
      {
         if(!param1.buttonDown)
         {
            this._btnLayer.visible = false;
         }
      }
   }
}
