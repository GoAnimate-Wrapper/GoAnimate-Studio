package anifire.studio.assets.control
{
   import anifire.constant.LicenseConstants;
   import anifire.studio.assets.controllers.CameraController;
   import anifire.studio.assets.interfaces.IReferencePoint;
   import anifire.studio.commands.ICommand;
   import anifire.studio.commands.ResizeObjectCommand;
   import anifire.studio.core.Console;
   import anifire.studio.events.AssetEvent;
   import anifire.studio.interfaces.IAssetControl;
   import anifire.studio.interfaces.IMovable;
   import anifire.studio.interfaces.IResizable;
   import anifire.studio.interfaces.IRotatable;
   import anifire.util.UtilMath;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import mx.core.UIComponent;
   import mx.effects.Fade;
   
   public class ResizableAssetControl extends AbstractAssetControlDecorator
   {
       
      
      private const POINT_COLOR_LIGHT:uint = 11979662;
      
      private const POINT_COLOR_DARK:uint = 5405190;
      
      private const POINT_RADIUS:Number = 4;
      
      private const REFERENCE_COLOR_LIGHT:Number = 11979662;
      
      private const REFERENCE_COLOR_DARK:Number = 5405190;
      
      private var _points:Array;
      
      private var _selectedPoint:UIComponent;
      
      private var _tooltip:AssetResizeToolTip;
      
      private var _aspect:Number = 1;
      
      private var _oldMouseDown:Point;
      
      private var _oldSize:Point;
      
      private var _refLayer:UIComponent;
      
      private var _fadeIn:Fade;
      
      public function ResizableAssetControl(param1:IAssetControl)
      {
         this._oldMouseDown = new Point();
         this._oldSize = new Point();
         this._refLayer = new UIComponent();
         this._fadeIn = new Fade();
         super(param1);
         this.addPoints();
         this.addAssetEventListeners(param1.asset);
      }
      
      private function addAssetEventListeners(param1:IEventDispatcher) : void
      {
         if(param1)
         {
            param1.addEventListener(AssetEvent.ASSET_RESIZED,this.onAssetResize);
         }
      }
      
      override public function destroy(param1:String = "rip") : void
      {
         this.stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUp);
         this.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onStageMouseMove);
         this.removeAssetEventListeners(super.asset);
         this._tooltip = null;
         this._points = null;
         this._selectedPoint = null;
         super.destroy(param1);
      }
      
      override public function set asset(param1:IEventDispatcher) : void
      {
         this.removeAssetEventListeners(super.asset);
         super.asset = param1;
         this.redraw();
         this.addAssetEventListeners(decorated.asset);
      }
      
      private function redraw() : void
      {
         this.updatePoints();
      }
      
      private function removeAssetEventListeners(param1:IEventDispatcher) : void
      {
         if(param1)
         {
            param1.removeEventListener(AssetEvent.ASSET_RESIZED,this.onAssetResize);
         }
      }
      
      private function updateToolTip() : void
      {
         var _loc1_:IResizable = null;
         var _loc2_:Point = null;
         var _loc3_:Point = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         if(super.asset is IResizable && this._tooltip)
         {
            _loc1_ = super.asset as IResizable;
            this._tooltip.setSize(_loc1_.width,_loc1_.height);
            _loc2_ = new Point();
            _loc3_ = new Point(10,10);
            _loc4_ = _loc1_.width;
            _loc5_ = _loc1_.height;
            if(this.asset is CameraController)
            {
               _loc6_ = LicenseConstants.getScreenRatio();
               _loc4_ = IResizable(this.asset).width;
               _loc5_ = IResizable(this.asset).width / _loc6_;
            }
            if(this._selectedPoint == this._points[AssetControlConstants.TOP_LEFT])
            {
               _loc2_.x = -(_loc4_ / 2) - super.borderWidth;
               _loc2_.y = -(_loc5_ / 2) - super.borderWidth;
            }
            else if(this._selectedPoint == this._points[AssetControlConstants.TOP_RIGHT])
            {
               _loc2_.x = _loc4_ / 2 + super.borderWidth;
               _loc2_.y = -(_loc5_ / 2) - super.borderWidth;
            }
            else if(this._selectedPoint == this._points[AssetControlConstants.BOTTOM_RIGHT])
            {
               _loc2_.x = _loc4_ / 2 + super.borderWidth;
               _loc2_.y = _loc5_ / 2 + super.borderWidth;
            }
            else if(this._selectedPoint == this._points[AssetControlConstants.BOTTOM_LEFT])
            {
               _loc2_.x = -(_loc4_ / 2) - super.borderWidth;
               _loc2_.y = _loc5_ / 2 + super.borderWidth;
            }
            _loc2_ = this.localToGlobal(_loc2_);
            if(this._selectedPoint == this._points[AssetControlConstants.TOP_LEFT])
            {
               _loc2_.x = _loc2_.x - (this._tooltip.width + _loc3_.x);
               _loc2_.y = _loc2_.y - (this._tooltip.height + _loc3_.y);
            }
            else if(this._selectedPoint == this._points[AssetControlConstants.TOP_RIGHT])
            {
               _loc2_.x = _loc2_.x + _loc3_.x;
               _loc2_.y = _loc2_.y - (this._tooltip.height + _loc3_.y);
            }
            else if(this._selectedPoint == this._points[AssetControlConstants.BOTTOM_RIGHT])
            {
               _loc2_.x = _loc2_.x + _loc3_.x;
               _loc2_.y = _loc2_.y + _loc3_.y;
            }
            else if(this._selectedPoint == this._points[AssetControlConstants.BOTTOM_LEFT])
            {
               _loc2_.x = _loc2_.x - (this._tooltip.width + _loc3_.x);
               _loc2_.y = _loc2_.y + _loc3_.y;
            }
            _loc2_ = this._tooltip.parent.globalToLocal(_loc2_);
            this._tooltip.move(_loc2_.x,_loc2_.y);
         }
      }
      
      override public function set drawingScale(param1:Number) : void
      {
         super.drawingScale = param1;
         UIComponent(this._points[AssetControlConstants.TOP_LEFT]).scaleX = UIComponent(this._points[AssetControlConstants.TOP_LEFT]).scaleY = param1;
         UIComponent(this._points[AssetControlConstants.TOP_RIGHT]).scaleX = UIComponent(this._points[AssetControlConstants.TOP_RIGHT]).scaleY = param1;
         UIComponent(this._points[AssetControlConstants.BOTTOM_RIGHT]).scaleX = UIComponent(this._points[AssetControlConstants.BOTTOM_RIGHT]).scaleY = param1;
         UIComponent(this._points[AssetControlConstants.BOTTOM_LEFT]).scaleX = UIComponent(this._points[AssetControlConstants.BOTTOM_LEFT]).scaleY = param1;
         this.redraw();
      }
      
      private function updatePoints() : void
      {
         var _loc1_:IResizable = null;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(super.asset is IResizable)
         {
            _loc1_ = super.asset as IResizable;
            _loc2_ = _loc1_.width;
            _loc3_ = _loc1_.height;
            if(this.asset is CameraController)
            {
               _loc4_ = LicenseConstants.getScreenRatio();
               _loc2_ = IResizable(this.asset).width;
               _loc3_ = IResizable(this.asset).width / _loc4_;
            }
            UIComponent(this._points[AssetControlConstants.TOP_LEFT]).x = -(_loc2_ / 2) - super.borderWidth / 2;
            UIComponent(this._points[AssetControlConstants.TOP_LEFT]).y = -(_loc3_ / 2) - super.borderWidth / 2;
            UIComponent(this._points[AssetControlConstants.TOP_RIGHT]).x = _loc2_ / 2 + super.borderWidth / 2;
            UIComponent(this._points[AssetControlConstants.TOP_RIGHT]).y = -(_loc3_ / 2) - super.borderWidth / 2;
            UIComponent(this._points[AssetControlConstants.BOTTOM_RIGHT]).x = _loc2_ / 2 + super.borderWidth / 2;
            UIComponent(this._points[AssetControlConstants.BOTTOM_RIGHT]).y = _loc3_ / 2 + super.borderWidth / 2;
            UIComponent(this._points[AssetControlConstants.BOTTOM_LEFT]).x = -(_loc2_ / 2) - super.borderWidth / 2;
            UIComponent(this._points[AssetControlConstants.BOTTOM_LEFT]).y = _loc3_ / 2 + super.borderWidth / 2;
         }
      }
      
      private function addPoints() : void
      {
         this.addChild(this._refLayer);
         this._points = new Array();
         this._points[AssetControlConstants.TOP_LEFT] = this.addPoint(RotatableControlPoint.POINT_ID_TOP_LEFT);
         this._points[AssetControlConstants.TOP_RIGHT] = this.addPoint(RotatableControlPoint.POINT_ID_TOP_RIGHT);
         this._points[AssetControlConstants.BOTTOM_RIGHT] = this.addPoint(RotatableControlPoint.POINT_ID_BOTTOM_RIGHT);
         this._points[AssetControlConstants.BOTTOM_LEFT] = this.addPoint(RotatableControlPoint.POINT_ID_BOTTOM_LEFT);
         this.updatePoints();
      }
      
      private function onPointMouseMove(param1:MouseEvent) : void
      {
         if(!param1.buttonDown)
         {
            this._refLayer.visible = true;
         }
      }
      
      private function addPoint(param1:uint) : UIComponent
      {
         var _loc2_:ResizableControlPoint = null;
         _loc2_ = new ResizableControlPoint(param1);
         _loc2_.addEventListener(MouseEvent.MOUSE_DOWN,this.onPointMouseDown);
         _loc2_.addEventListener(MouseEvent.MOUSE_MOVE,this.onPointMouseMove);
         _loc2_.addEventListener(MouseEvent.ROLL_OVER,this.onPointRollOver);
         _loc2_.addEventListener(MouseEvent.ROLL_OUT,this.onPointRollOut);
         this.addChild(_loc2_);
         return _loc2_;
      }
      
      private function onPointRollOver(param1:MouseEvent) : void
      {
         if(!param1.buttonDown)
         {
            this._selectedPoint = param1.currentTarget as UIComponent;
            this.updateReferenceLine();
            this._refLayer.visible = true;
         }
      }
      
      private function onPointRollOut(param1:MouseEvent) : void
      {
         if(!param1.buttonDown)
         {
            this._refLayer.visible = false;
         }
      }
      
      private function get refMat() : Matrix
      {
         var _loc1_:Matrix = new Matrix();
         if(super.asset is IRotatable)
         {
            _loc1_.rotate(IRotatable(super.asset).rotation * Math.PI / 180);
         }
         if(super.asset is IMovable)
         {
            _loc1_.translate(IMovable(super.asset).x,IMovable(asset).y);
         }
         return _loc1_;
      }
      
      private function get localRefPos() : Point
      {
         var _loc2_:Matrix = null;
         var _loc1_:Point = new Point();
         if(super.asset is IReferencePoint)
         {
            _loc1_ = new Point(IReferencePoint(super.asset).referenceX,IReferencePoint(super.asset).referenceY);
            _loc2_ = this.refMat;
            _loc2_.invert();
            _loc1_ = _loc2_.transformPoint(_loc1_);
         }
         return _loc1_;
      }
      
      private function onPointMouseDown(param1:MouseEvent) : void
      {
         var _loc2_:ICommand = null;
         this._selectedPoint = param1.currentTarget as UIComponent;
         this._oldMouseDown.x = this.mouseX - this.localRefPos.x;
         this._oldMouseDown.y = this.mouseY - this.localRefPos.y;
         if(super.asset is IResizable)
         {
            if(IResizable(super.asset).width > 0 && IResizable(super.asset).height > 0)
            {
               this._aspect = IResizable(super.asset).height / IResizable(super.asset).width;
            }
            this._oldSize.x = IResizable(super.asset).width;
            this._oldSize.y = IResizable(super.asset).height;
         }
         this._tooltip = Console.getConsole().mainStage.assetResizeToolTip;
         this.updateToolTip();
         this._tooltip.visible = true;
         if(this.undoableAction)
         {
            _loc2_ = new ResizeObjectCommand(super.asset as IResizable);
            _loc2_.execute();
         }
         this.stage.addEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUp);
         this.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onStageMouseMove);
      }
      
      private function onStageMouseMove(param1:MouseEvent) : void
      {
         var _loc2_:Number = Math.max(0,(this.mouseX - this.localRefPos.x) / this._oldMouseDown.x);
         var _loc3_:Number = Math.max(0,(this.mouseY - this.localRefPos.y) / this._oldMouseDown.y);
         var _loc4_:Point = new Point(this._oldSize.x * _loc2_,this._oldSize.y * _loc3_);
         this.resizeAsset(_loc4_.x,_loc4_.y,!param1.shiftKey);
         this.updateToolTip();
         this.updateReferenceLine();
      }
      
      private function updateReferenceLine() : void
      {
         var _loc1_:Point = this.localRefPos;
         var _loc2_:Point = new Point();
         var _loc3_:Number = 0.5;
         this._refLayer.graphics.clear();
         _loc2_.x = UIComponent(this._points[AssetControlConstants.TOP_LEFT]).x - _loc1_.x;
         _loc2_.y = UIComponent(this._points[AssetControlConstants.TOP_LEFT]).y - _loc1_.y;
         if(_loc2_.length > 20)
         {
            _loc3_ = this._selectedPoint == this._points[AssetControlConstants.TOP_LEFT]?Number(0.5):Number(0.1);
            _loc2_ = UtilMath.scalePoint(_loc2_,100,100);
            this._refLayer.graphics.moveTo(_loc1_.x + _loc2_.x,_loc1_.y + _loc2_.y);
            this._refLayer.graphics.lineStyle(this.drawingScale,this.REFERENCE_COLOR_DARK,_loc3_,true);
            this._refLayer.graphics.lineTo(_loc1_.x,_loc1_.y);
         }
         _loc2_.x = UIComponent(this._points[AssetControlConstants.TOP_RIGHT]).x - _loc1_.x;
         _loc2_.y = UIComponent(this._points[AssetControlConstants.TOP_RIGHT]).y - _loc1_.y;
         if(_loc2_.length > 20)
         {
            _loc3_ = this._selectedPoint == this._points[AssetControlConstants.TOP_RIGHT]?Number(0.5):Number(0.1);
            _loc2_ = UtilMath.scalePoint(_loc2_,100,100);
            this._refLayer.graphics.moveTo(_loc1_.x + _loc2_.x,_loc1_.y + _loc2_.y);
            this._refLayer.graphics.lineStyle(this.drawingScale,this.REFERENCE_COLOR_DARK,_loc3_,true);
            this._refLayer.graphics.lineTo(_loc1_.x,_loc1_.y);
         }
         _loc2_.x = UIComponent(this._points[AssetControlConstants.BOTTOM_LEFT]).x - _loc1_.x;
         _loc2_.y = UIComponent(this._points[AssetControlConstants.BOTTOM_LEFT]).y - _loc1_.y;
         if(_loc2_.length > 20)
         {
            _loc3_ = this._selectedPoint == this._points[AssetControlConstants.BOTTOM_LEFT]?Number(0.5):Number(0.1);
            _loc2_ = UtilMath.scalePoint(_loc2_,100,100);
            this._refLayer.graphics.moveTo(_loc1_.x + _loc2_.x,_loc1_.y + _loc2_.y);
            this._refLayer.graphics.lineStyle(this.drawingScale,this.REFERENCE_COLOR_DARK,_loc3_,true);
            this._refLayer.graphics.lineTo(_loc1_.x,_loc1_.y);
         }
         _loc2_.x = UIComponent(this._points[AssetControlConstants.BOTTOM_RIGHT]).x - _loc1_.x;
         _loc2_.y = UIComponent(this._points[AssetControlConstants.BOTTOM_RIGHT]).y - _loc1_.y;
         if(_loc2_.length > 20)
         {
            _loc3_ = this._selectedPoint == this._points[AssetControlConstants.BOTTOM_RIGHT]?Number(0.5):Number(0.1);
            _loc2_ = UtilMath.scalePoint(_loc2_,100,100);
            this._refLayer.graphics.moveTo(_loc1_.x + _loc2_.x,_loc1_.y + _loc2_.y);
            this._refLayer.graphics.lineStyle(this.drawingScale,this.REFERENCE_COLOR_DARK,_loc3_,true);
            this._refLayer.graphics.lineTo(_loc1_.x,_loc1_.y);
         }
      }
      
      private function resizeAsset(param1:Number, param2:Number, param3:Boolean = true) : void
      {
         var _loc4_:IResizable = null;
         if(super.asset is IResizable)
         {
            _loc4_ = super.asset as IResizable;
            param1 = UtilMath.boundaryCheck(param1,_loc4_.minWidth,_loc4_.maxWidth);
            param2 = UtilMath.boundaryCheck(param2,_loc4_.minHeight,_loc4_.maxHeight);
            if(param3)
            {
               if(param2 / param1 > this._aspect)
               {
                  param1 = param2 / this._aspect;
               }
               else
               {
                  param2 = param1 * this._aspect;
               }
            }
            IResizable(_loc4_).resize(param1,param2,param3);
         }
      }
      
      private function onStageMouseUp(param1:MouseEvent) : void
      {
         this.stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUp);
         this.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onStageMouseMove);
         this._refLayer.visible = false;
         this._tooltip.visible = false;
      }
      
      private function onAssetResize(param1:AssetEvent) : void
      {
         this.redraw();
      }
   }
}
