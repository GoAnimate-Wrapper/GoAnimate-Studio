package anifire.studio.assets.control
{
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import mx.core.UIComponent;
   import mx.effects.Fade;
   
   public class ResizableControlPoint extends UIComponent
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
      
      private const POINT_RADIUS:Number = 3;
      
      private var _icon:ResizableControlIcon;
      
      private var _fadeIn:Fade;
      
      public function ResizableControlPoint(param1:uint)
      {
         this._fadeIn = new Fade();
         super();
         var _loc2_:UIComponent = new UIComponent();
         _loc2_.buttonMode = true;
         var _loc3_:Rectangle = new Rectangle(-this.POINT_RADIUS,-this.POINT_RADIUS,this.POINT_RADIUS * 2,this.POINT_RADIUS * 2);
         _loc2_.graphics.lineStyle(1,this.POINT_COLOR_LIGHT,1,true);
         _loc2_.graphics.drawRect(_loc3_.x,_loc3_.y,_loc3_.width,_loc3_.height);
         _loc2_.graphics.beginFill(this.POINT_COLOR_DARK);
         _loc2_.graphics.drawRect(_loc3_.x,_loc3_.y,_loc3_.width,_loc3_.height);
         _loc2_.graphics.endFill();
         this._icon = new ResizableControlIcon(param1);
         this._icon.visible = false;
         _loc2_.addChild(this._icon);
         _loc2_.addEventListener(MouseEvent.ROLL_OVER,this.onPointRollOver);
         _loc2_.addEventListener(MouseEvent.ROLL_OUT,this.onPointRollOut);
         this.addChild(_loc2_);
      }
      
      private function onPointRollOver(param1:MouseEvent) : void
      {
         if(!param1.buttonDown)
         {
            if(this.stage)
            {
               this.stage.addEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUp);
            }
            this._icon.visible = true;
         }
      }
      
      private function onStageMouseUp(param1:MouseEvent) : void
      {
         if(this.stage)
         {
            this.stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUp);
         }
         this._icon.visible = false;
      }
      
      private function onPointRollOut(param1:MouseEvent) : void
      {
         if(!param1.buttonDown)
         {
            this._icon.visible = false;
         }
      }
   }
}
