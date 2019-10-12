package anifire.studio.assets.control
{
   import anifire.util.UtilDraw;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import mx.core.UIComponent;
   import mx.effects.Fade;
   
   public class RotatableResizableControlPoint extends UIComponent
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
      
      private var _btnLayer:UIComponent;
      
      private var _rotateBtn:RotatableControlIcon;
      
      private var _resizeBtn:ResizableControlIcon;
      
      private var _fadeIn:Fade;
      
      public function RotatableResizableControlPoint(param1:uint)
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
         _loc3_.graphics.beginFill(0,0);
         _loc3_.graphics.lineStyle(1,this.POINT_COLOR_LIGHT,0,true);
         UtilDraw.drawCircleSector(_loc3_.graphics,0,0,27,90,180);
         _loc3_.graphics.endFill();
         _loc3_.graphics.beginFill(this.POINT_COLOR_DARK);
         _loc3_.graphics.lineStyle(1,this.POINT_COLOR_LIGHT,1,true);
         _loc3_.graphics.drawRect(_loc4_.x,_loc4_.y,_loc4_.width,_loc4_.height);
         _loc3_.graphics.endFill();
         switch(param1)
         {
            case POINT_ID_TOP_LEFT:
               _loc3_.rotation = 90;
               break;
            case POINT_ID_TOP:
               _loc3_.rotation = -45;
               break;
            case POINT_ID_TOP_RIGHT:
               _loc3_.rotation = 180;
               break;
            case POINT_ID_RIGHT:
               _loc3_.rotation = 45;
               break;
            case POINT_ID_BOTTOM_RIGHT:
               _loc3_.rotation = 270;
               break;
            case POINT_ID_BOTTOM:
               _loc3_.rotation = 135;
               break;
            case POINT_ID_BOTTOM_LEFT:
               break;
            case POINT_ID_LEFT:
               _loc3_.rotation = -135;
         }
         _loc2_.addChild(_loc3_);
         _loc2_.addChild(this._btnLayer);
         this._rotateBtn = new RotatableControlIcon(param1);
         this._resizeBtn = new ResizableControlIcon(param1);
         this._btnLayer.visible = false;
         this._btnLayer.addChild(this._rotateBtn);
         this._btnLayer.addChild(this._resizeBtn);
         _loc2_.addEventListener(MouseEvent.MOUSE_MOVE,this.onPointMouseMove);
         _loc2_.addEventListener(MouseEvent.ROLL_OVER,this.onPointRollOver);
         _loc2_.addEventListener(MouseEvent.ROLL_OUT,this.onPointRollOut);
      }
      
      public function get resizeBtn() : UIComponent
      {
         return this._resizeBtn;
      }
      
      public function get rotateBtn() : UIComponent
      {
         return this._rotateBtn;
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
      
      private function onPointMouseMove(param1:MouseEvent) : void
      {
         if(!param1.buttonDown)
         {
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
