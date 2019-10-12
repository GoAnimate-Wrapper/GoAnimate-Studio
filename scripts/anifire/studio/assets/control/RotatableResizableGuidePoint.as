package anifire.studio.assets.control
{
   import anifire.util.UtilDraw;
   import flash.display.Sprite;
   import mx.core.UIComponent;
   import mx.effects.Fade;
   
   public class RotatableResizableGuidePoint extends UIComponent
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
      
      private var _rotateBtn:RotatableGuideIcon;
      
      private var _resizeBtn:ResizableControlIcon;
      
      private var _fadeIn:Fade;
      
      public function RotatableResizableGuidePoint(param1:uint)
      {
         this._btnLayer = new UIComponent();
         this._fadeIn = new Fade();
         super();
         var _loc2_:UIComponent = new UIComponent();
         _loc2_.buttonMode = true;
         _loc2_.addChild(this._btnLayer);
         this.addChild(_loc2_);
         _loc2_.addChild(this._btnLayer);
         this._rotateBtn = new RotatableGuideIcon(param1);
         this._resizeBtn = new ResizableControlIcon(param1);
         this._btnLayer.addChild(this._rotateBtn);
         this._btnLayer.addChild(this._resizeBtn);
         var _loc3_:Sprite = new Sprite();
         _loc3_.mouseEnabled = false;
         _loc3_.graphics.beginFill(0,0.2);
         _loc3_.graphics.lineStyle(1,0,0,true);
         UtilDraw.drawCircleSector(_loc3_.graphics,0,0,27,0,270);
         _loc3_.rotation = 180;
         _loc3_.graphics.endFill();
         this._btnLayer.addChild(_loc3_);
         this._rotateBtn.mask = _loc3_;
      }
   }
}
