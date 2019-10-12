package anifire.studio.assets.control
{
   import mx.controls.Button;
   import mx.core.UIComponent;
   
   public class ResizableControlIcon extends UIComponent
   {
      
      public static const POINT_ID_TOP_LEFT:uint = 0;
      
      public static const POINT_ID_TOP:uint = 1;
      
      public static const POINT_ID_TOP_RIGHT:uint = 2;
      
      public static const POINT_ID_RIGHT:uint = 3;
      
      public static const POINT_ID_BOTTOM_RIGHT:uint = 4;
      
      public static const POINT_ID_BOTTOM:uint = 5;
      
      public static const POINT_ID_BOTTOM_LEFT:uint = 6;
      
      public static const POINT_ID_LEFT:uint = 7;
       
      
      private var _btn:Button;
      
      private var _btnLayer:UIComponent;
      
      public function ResizableControlIcon(param1:uint)
      {
         this._btn = new Button();
         this._btnLayer = new UIComponent();
         super();
         this._btn.x = -9;
         this._btn.y = -9;
         this._btn.width = 18;
         this._btn.height = 18;
         switch(param1)
         {
            case POINT_ID_TOP_LEFT:
            case POINT_ID_BOTTOM_RIGHT:
               this._btnLayer.rotation = 90;
               break;
            case POINT_ID_TOP:
            case POINT_ID_BOTTOM:
               this._btnLayer.rotation = -45;
               break;
            case POINT_ID_TOP_RIGHT:
            case POINT_ID_BOTTOM_LEFT:
               break;
            case POINT_ID_RIGHT:
            case POINT_ID_LEFT:
               this._btnLayer.rotation = 45;
         }
         this._btn.setStyle("upSkin",ResizeTopRightIcon);
         this._btn.setStyle("overSkin",ResizeTopRightOverIcon);
         this._btn.setStyle("downSkin",ResizeTopRightIcon);
         this._btnLayer.addChild(this._btn);
         this.addChild(this._btnLayer);
      }
   }
}
