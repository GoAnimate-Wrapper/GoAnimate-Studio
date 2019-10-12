package anifire.studio.assets.control
{
   import anifire.util.UtilDraw;
   import flash.display.Sprite;
   import mx.controls.Button;
   import mx.core.UIComponent;
   
   public class RotatableControlIcon extends UIComponent
   {
      
      public static const POINT_ID_TOP_LEFT:uint = 0;
      
      public static const POINT_ID_TOP:uint = 1;
      
      public static const POINT_ID_TOP_RIGHT:uint = 2;
      
      public static const POINT_ID_RIGHT:uint = 3;
      
      public static const POINT_ID_BOTTOM_RIGHT:uint = 4;
      
      public static const POINT_ID_BOTTOM:uint = 5;
      
      public static const POINT_ID_BOTTOM_LEFT:uint = 6;
      
      public static const POINT_ID_LEFT:uint = 7;
       
      
      private var _btnLayer:UIComponent;
      
      public function RotatableControlIcon(param1:uint)
      {
         this._btnLayer = new UIComponent();
         super();
         var _loc2_:Button = new Button();
         _loc2_.x = -27.5;
         _loc2_.y = -27.5;
         _loc2_.width = 55;
         _loc2_.height = 55;
         var _loc3_:Sprite = new Sprite();
         _loc3_.mouseEnabled = false;
         _loc3_.graphics.beginFill(0,0.2);
         _loc3_.graphics.lineStyle(1,0,0,true);
         UtilDraw.drawCircleSector(_loc3_.graphics,0,0,27,60,210);
         _loc3_.rotation = 180;
         _loc3_.graphics.endFill();
         this._btnLayer.addChild(_loc3_);
         _loc2_.mask = _loc3_;
         switch(param1)
         {
            case POINT_ID_TOP_LEFT:
               this._btnLayer.rotation = -90;
               break;
            case POINT_ID_TOP:
               break;
            case POINT_ID_TOP_RIGHT:
               break;
            case POINT_ID_RIGHT:
               break;
            case POINT_ID_BOTTOM_RIGHT:
               this._btnLayer.rotation = 90;
               break;
            case POINT_ID_BOTTOM:
               break;
            case POINT_ID_BOTTOM_LEFT:
               this._btnLayer.rotation = 180;
               break;
            case POINT_ID_LEFT:
         }
         _loc2_.setStyle("upSkin",RotateTopRightIcon);
         _loc2_.setStyle("overSkin",RotateTopRightOverIcon);
         _loc2_.setStyle("downSkin",RotateTopRightOverIcon);
         this._btnLayer.addChild(_loc2_);
         this.addChild(this._btnLayer);
      }
   }
}
