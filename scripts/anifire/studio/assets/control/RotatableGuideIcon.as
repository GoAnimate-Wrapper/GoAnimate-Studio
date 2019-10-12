package anifire.studio.assets.control
{
   import mx.controls.Button;
   import mx.core.UIComponent;
   
   public class RotatableGuideIcon extends UIComponent
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
      
      public function RotatableGuideIcon(param1:uint)
      {
         this._btnLayer = new UIComponent();
         super();
         var _loc2_:Button = new Button();
         _loc2_.x = -27.5;
         _loc2_.y = -27.5;
         _loc2_.width = 55;
         _loc2_.height = 55;
         switch(param1)
         {
            case POINT_ID_TOP_LEFT:
               this._btnLayer.rotation = -90;
               break;
            case POINT_ID_TOP:
               this._btnLayer.rotation = -45;
               break;
            case POINT_ID_TOP_RIGHT:
               break;
            case POINT_ID_RIGHT:
               this._btnLayer.rotation = 45;
               break;
            case POINT_ID_BOTTOM_RIGHT:
               this._btnLayer.rotation = 90;
               break;
            case POINT_ID_BOTTOM:
               this._btnLayer.rotation = 135;
               break;
            case POINT_ID_BOTTOM_LEFT:
               this._btnLayer.rotation = 180;
               break;
            case POINT_ID_LEFT:
               this._btnLayer.rotation = -135;
         }
         _loc2_.setStyle("upSkin",RotateTopRightGuideIcon);
         _loc2_.setStyle("overSkin",RotateTopRightGuideIcon);
         _loc2_.setStyle("downSkin",RotateTopRightGuideIcon);
         this._btnLayer.addChild(_loc2_);
         this.addChild(this._btnLayer);
      }
   }
}
