package anifire.component
{
   import anifire.event.EyeDropperEvent;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.ui.Keyboard;
   import flash.ui.Mouse;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   import mx.binding.BindingManager;
   import mx.core.FlexGlobals;
   import mx.core.IFlexModuleFactory;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.events.ResizeEvent;
   import mx.graphics.BitmapFill;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import spark.components.Group;
   import spark.primitives.Ellipse;
   import spark.primitives.Rect;
   
   public class EyeDropperScreenOverlay extends Group
   {
      
      protected static const CURSOR_REFRESH_INTERVAL:int = 50;
      
      public static const MAGNIFICATION_RATE:Number = 10;
      
      public static const MAGNIFIED_SIZE:Number = 90;
      
      public static const MAGNIFIED_OFFSET:Number = MAGNIFIED_SIZE * 0.5;
      
      public static const DRAW_AREA_OFFSET:Number = 4;
      
      public static var instance:EyeDropperScreenOverlay;
       
      
      private var _1188667384currentColorDisplay:SolidColor;
      
      private var _1405136365eyeDropperCursor:Group;
      
      private var _205743947magnifiedImage:BitmapFill;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _requiresUpdate:Boolean;
      
      protected var _screenBitmapData:BitmapData;
      
      protected var _magnifiedBitmapData:BitmapData;
      
      protected var _magnifiedMatrix:Matrix;
      
      public var isPickingColor:Boolean = false;
      
      protected var _timer:uint;
      
      private var _excludedDisplayObject:DisplayObject;
      
      public function EyeDropperScreenOverlay()
      {
         super();
         mx_internal::_document = this;
         this.autoLayout = false;
         this.mouseEnabled = true;
         this.mouseChildren = false;
         this.mouseEnabledWhereTransparent = true;
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._EyeDropperScreenOverlay_Group2_i()];
         this.addEventListener("creationComplete",this.___EyeDropperScreenOverlay_Group1_creationComplete);
         this.addEventListener("resize",this.___EyeDropperScreenOverlay_Group1_resize);
         this.addEventListener("mouseUp",this.___EyeDropperScreenOverlay_Group1_mouseUp);
         this.addEventListener("mouseDown",this.___EyeDropperScreenOverlay_Group1_mouseDown);
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      protected function init() : void
      {
         instance = this;
         visible = false;
         this._requiresUpdate = true;
         this._magnifiedBitmapData = new BitmapData(MAGNIFIED_SIZE,MAGNIFIED_SIZE);
         this._magnifiedMatrix = new Matrix();
         this.magnifiedImage.source = this._magnifiedBitmapData;
      }
      
      protected function clearScreenImage() : void
      {
         if(this._screenBitmapData)
         {
            this._screenBitmapData.dispose();
            this._screenBitmapData = null;
         }
      }
      
      protected function createScreenImage() : void
      {
         this.clearScreenImage();
         this._screenBitmapData = new BitmapData(getLayoutBoundsWidth(),getLayoutBoundsHeight(),false);
         this._screenBitmapData.draw(FlexGlobals.topLevelApplication as DisplayObject);
         this._requiresUpdate = false;
      }
      
      public function createScreenshotOverlay() : void
      {
         if(this._excludedDisplayObject)
         {
            this._excludedDisplayObject.visible = false;
         }
         this.createScreenImage();
         visible = true;
         this.eyeDropperCursor.visible = true;
         Mouse.hide();
         this.isPickingColor = true;
         stage.addEventListener(KeyboardEvent.KEY_DOWN,this.stage_keyDownHandler);
         this._timer = setInterval(this.updateCursor,CURSOR_REFRESH_INTERVAL);
      }
      
      protected function mouseUpHandler(param1:MouseEvent) : void
      {
         var _loc2_:EyeDropperEvent = null;
         param1.stopImmediatePropagation();
         if(this.isPickingColor)
         {
            _loc2_ = new EyeDropperEvent(EyeDropperEvent.EYE_DROPPER_COMPLETE);
            _loc2_.color = this.getCurrentColor();
            this.closeScreenshotOverlay();
            dispatchEvent(_loc2_);
         }
      }
      
      protected function mouseDownHandler(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
      }
      
      protected function updateCursor() : void
      {
         if(this.isPickingColor)
         {
            this.eyeDropperCursor.x = mouseX;
            this.eyeDropperCursor.y = mouseY;
            this._magnifiedMatrix.identity();
            this._magnifiedMatrix.translate(DRAW_AREA_OFFSET - int(mouseX),DRAW_AREA_OFFSET - int(mouseY));
            this._magnifiedMatrix.scale(MAGNIFICATION_RATE,MAGNIFICATION_RATE);
            this._magnifiedBitmapData.draw(this._screenBitmapData,this._magnifiedMatrix);
            this.currentColorDisplay.color = this.getCurrentColor();
         }
      }
      
      protected function getCurrentColor() : uint
      {
         if(this._requiresUpdate)
         {
            this.createScreenImage();
         }
         return this._screenBitmapData.getPixel(mouseX,mouseY);
      }
      
      protected function stage_keyDownHandler(param1:KeyboardEvent) : void
      {
         var _loc2_:EyeDropperEvent = null;
         if(param1.keyCode == Keyboard.ESCAPE)
         {
            stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.stage_keyDownHandler);
            _loc2_ = new EyeDropperEvent(EyeDropperEvent.EYE_DROPPER_CANCEL);
            this.dispatchEvent(_loc2_);
            this.closeScreenshotOverlay();
         }
      }
      
      protected function closeScreenshotOverlay() : void
      {
         this.isPickingColor = false;
         this.clearScreenImage();
         this.eyeDropperCursor.visible = false;
         visible = false;
         clearInterval(this._timer);
         Mouse.show();
         if(this._excludedDisplayObject)
         {
            this._excludedDisplayObject.visible = true;
         }
      }
      
      public function excludedFromCapture(param1:DisplayObject) : void
      {
         this._excludedDisplayObject = param1;
      }
      
      protected function resizeHandler(param1:ResizeEvent) : void
      {
         this._requiresUpdate = true;
      }
      
      private function _EyeDropperScreenOverlay_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.visible = false;
         _loc1_.mxmlContent = [this._EyeDropperScreenOverlay_Ellipse1_c(),this._EyeDropperScreenOverlay_Rect1_c()];
         _loc1_.id = "eyeDropperCursor";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.eyeDropperCursor = _loc1_;
         BindingManager.executeBindings(this,"eyeDropperCursor",this.eyeDropperCursor);
         return _loc1_;
      }
      
      private function _EyeDropperScreenOverlay_Ellipse1_c() : Ellipse
      {
         var _loc1_:Ellipse = new Ellipse();
         _loc1_.width = 90;
         _loc1_.height = 90;
         _loc1_.x = -45;
         _loc1_.y = -45;
         _loc1_.fill = this._EyeDropperScreenOverlay_BitmapFill1_i();
         _loc1_.stroke = this._EyeDropperScreenOverlay_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _EyeDropperScreenOverlay_BitmapFill1_i() : BitmapFill
      {
         var _loc1_:BitmapFill = new BitmapFill();
         this.magnifiedImage = _loc1_;
         BindingManager.executeBindings(this,"magnifiedImage",this.magnifiedImage);
         return _loc1_;
      }
      
      private function _EyeDropperScreenOverlay_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13421772;
         _loc1_.weight = 2;
         return _loc1_;
      }
      
      private function _EyeDropperScreenOverlay_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.width = 16;
         _loc1_.height = 16;
         _loc1_.x = -8;
         _loc1_.y = -8;
         _loc1_.stroke = this._EyeDropperScreenOverlay_SolidColorStroke2_c();
         _loc1_.fill = this._EyeDropperScreenOverlay_SolidColor1_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _EyeDropperScreenOverlay_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13421772;
         _loc1_.weight = 2;
         return _loc1_;
      }
      
      private function _EyeDropperScreenOverlay_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         this.currentColorDisplay = _loc1_;
         BindingManager.executeBindings(this,"currentColorDisplay",this.currentColorDisplay);
         return _loc1_;
      }
      
      public function ___EyeDropperScreenOverlay_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      public function ___EyeDropperScreenOverlay_Group1_resize(param1:ResizeEvent) : void
      {
         this.resizeHandler(param1);
      }
      
      public function ___EyeDropperScreenOverlay_Group1_mouseUp(param1:MouseEvent) : void
      {
         this.mouseUpHandler(param1);
      }
      
      public function ___EyeDropperScreenOverlay_Group1_mouseDown(param1:MouseEvent) : void
      {
         this.mouseDownHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get currentColorDisplay() : SolidColor
      {
         return this._1188667384currentColorDisplay;
      }
      
      public function set currentColorDisplay(param1:SolidColor) : void
      {
         var _loc2_:Object = this._1188667384currentColorDisplay;
         if(_loc2_ !== param1)
         {
            this._1188667384currentColorDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"currentColorDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get eyeDropperCursor() : Group
      {
         return this._1405136365eyeDropperCursor;
      }
      
      public function set eyeDropperCursor(param1:Group) : void
      {
         var _loc2_:Object = this._1405136365eyeDropperCursor;
         if(_loc2_ !== param1)
         {
            this._1405136365eyeDropperCursor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"eyeDropperCursor",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get magnifiedImage() : BitmapFill
      {
         return this._205743947magnifiedImage;
      }
      
      public function set magnifiedImage(param1:BitmapFill) : void
      {
         var _loc2_:Object = this._205743947magnifiedImage;
         if(_loc2_ !== param1)
         {
            this._205743947magnifiedImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"magnifiedImage",_loc2_,param1));
            }
         }
      }
   }
}
