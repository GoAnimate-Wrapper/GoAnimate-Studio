package anifire.studio.assets.control
{
   import anifire.studio.assets.controllers.AssetCollectionController;
   import anifire.studio.assets.interfaces.IReferencePoint;
   import anifire.studio.commands.ICommand;
   import anifire.studio.commands.ResizeObjectCommand;
   import anifire.studio.commands.RotateObjectCommand;
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
   
   public class AdvancedRotatableAssetControl extends AbstractAssetControlDecorator
   {
       
      
      private const POINT_OFFSET:Number = 15;
      
      private const POINT_RADIUS:Number = 5;
      
      private const REFERENCE_COLOR:Number = 1411583;
      
      private const REFERENCE_COLOR_LIGHT:Number = 11979662;
      
      private const REFERENCE_COLOR_DARK:Number = 5405190;
      
      private var _points:Array;
      
      private var _oldRotation:Number = 0;
      
      private var _oldMouseRotation:Number = 0;
      
      private var _oldMouseDown:Point;
      
      private var _oldSize:Point;
      
      private var _pointLayer:UIComponent;
      
      private var _refLayer:UIComponent;
      
      private var _guideLayer:UIComponent;
      
      private var _selectedPoint:UIComponent;
      
      private var _fadeIn:Fade;
      
      private var _tooltip:AssetResizeToolTip;
      
      private var _aspect:Number = 1;
      
      private var _showGuide:Boolean;
      
      private var _command:ICommand;
      
      private var _freeAspect:Boolean;
      
      public function AdvancedRotatableAssetControl(param1:IAssetControl, param2:Boolean = false)
      {
         this._oldMouseDown = new Point();
         this._oldSize = new Point();
         this._pointLayer = new UIComponent();
         this._refLayer = new UIComponent();
         this._guideLayer = new UIComponent();
         this._fadeIn = new Fade();
         super(param1);
         this._freeAspect = param2;
         this.addPoints();
         this.addAssetEventListeners(param1.asset);
      }
      
      private function addAssetEventListeners(param1:IEventDispatcher) : void
      {
         if(param1)
         {
            param1.addEventListener(AssetEvent.ASSET_ROTATED,this.onAssetRotated);
            param1.addEventListener(AssetEvent.ASSET_RESIZED,this.onAssetResize);
         }
      }
      
      override public function destroy(param1:String = "rip") : void
      {
         this.stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStageRotateMouseUp);
         this.stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStageResizeMouseUp);
         this.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onStageRotateMouseMove);
         this.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onStageResizeMouseMove);
         this.removeAssetEventListeners(super.asset);
         this._points = null;
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
         this.rotateControl();
      }
      
      private function removeAssetEventListeners(param1:IEventDispatcher) : void
      {
         if(param1)
         {
            param1.removeEventListener(AssetEvent.ASSET_ROTATED,this.onAssetRotated);
            param1.removeEventListener(AssetEvent.ASSET_RESIZED,this.onAssetResize);
         }
      }
      
      override public function set drawingScale(param1:Number) : void
      {
         super.drawingScale = param1;
         UIComponent(this._points[AssetControlConstants.TOP_LEFT]).scaleX = UIComponent(this._points[AssetControlConstants.TOP_LEFT]).scaleY = param1;
         UIComponent(this._points[AssetControlConstants.TOP_RIGHT]).scaleX = UIComponent(this._points[AssetControlConstants.TOP_RIGHT]).scaleY = param1;
         UIComponent(this._points[AssetControlConstants.BOTTOM_RIGHT]).scaleX = UIComponent(this._points[AssetControlConstants.BOTTOM_RIGHT]).scaleY = param1;
         UIComponent(this._points[AssetControlConstants.BOTTOM_LEFT]).scaleX = UIComponent(this._points[AssetControlConstants.BOTTOM_LEFT]).scaleY = param1;
         UIComponent(this._points[AssetControlConstants.GUIDE]).scaleX = UIComponent(this._points[AssetControlConstants.GUIDE]).scaleY = param1;
         this.redraw();
      }
      
      private function addPoints() : void
      {
         this._refLayer.visible = false;
         this.addChild(this._refLayer);
         this.addChild(this._pointLayer);
         this.addChild(this._guideLayer);
         this._points = new Array();
         this._points[AssetControlConstants.TOP_LEFT] = this.addPoint(RotatableControlPoint.POINT_ID_TOP_LEFT);
         this._points[AssetControlConstants.TOP_RIGHT] = this.addPoint(RotatableControlPoint.POINT_ID_TOP_RIGHT);
         this._points[AssetControlConstants.BOTTOM_RIGHT] = this.addPoint(RotatableControlPoint.POINT_ID_BOTTOM_RIGHT);
         this._points[AssetControlConstants.BOTTOM_LEFT] = this.addPoint(RotatableControlPoint.POINT_ID_BOTTOM_LEFT);
         this._points[AssetControlConstants.GUIDE] = this.addGuidePoint();
         this.updatePoints();
      }
      
      private function addPoint(param1:uint) : UIComponent
      {
         var _loc2_:RotatableResizableControlPoint = new RotatableResizableControlPoint(param1);
         _loc2_.rotateBtn.addEventListener(MouseEvent.MOUSE_DOWN,this.onRotateBtnMouseDown);
         _loc2_.resizeBtn.addEventListener(MouseEvent.MOUSE_DOWN,this.onResizeBtnMouseDown);
         _loc2_.addEventListener(MouseEvent.MOUSE_MOVE,this.onPointMouseMove);
         _loc2_.addEventListener(MouseEvent.MOUSE_DOWN,this.onPointMouseDown);
         _loc2_.addEventListener(MouseEvent.ROLL_OVER,this.onPointRollOver);
         _loc2_.addEventListener(MouseEvent.ROLL_OUT,this.onPointRollOut);
         _loc2_.rotateBtn.addEventListener(MouseEvent.ROLL_OVER,this.onRotateBtnRollOver);
         _loc2_.rotateBtn.addEventListener(MouseEvent.ROLL_OUT,this.onRotateBtnRollOut);
         _loc2_.resizeBtn.addEventListener(MouseEvent.ROLL_OVER,this.onResizeBtnRollOver);
         _loc2_.resizeBtn.addEventListener(MouseEvent.ROLL_OUT,this.onResizeBtnRollOut);
         this._pointLayer.addChild(_loc2_);
         return _loc2_;
      }
      
      private function addGuidePoint() : UIComponent
      {
         var _loc1_:UIComponent = null;
         _loc1_ = new RotatableResizableGuidePoint(RotatableControlPoint.POINT_ID_TOP_RIGHT);
         this._guideLayer.mouseChildren = false;
         this._guideLayer.mouseEnabled = false;
         this._guideLayer.addChild(_loc1_);
         return _loc1_;
      }
      
      private function updatePoints() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:IResizable = null;
         if(super.asset is IResizable)
         {
            _loc3_ = super.asset as IResizable;
            _loc1_ = _loc3_.width;
            _loc2_ = _loc3_.height;
            UIComponent(this._points[AssetControlConstants.TOP_LEFT]).x = -(_loc1_ / 2) - super.borderWidth / 2;
            UIComponent(this._points[AssetControlConstants.TOP_LEFT]).y = -(_loc2_ / 2) - super.borderWidth / 2;
            UIComponent(this._points[AssetControlConstants.TOP_RIGHT]).x = _loc1_ / 2 + super.borderWidth / 2;
            UIComponent(this._points[AssetControlConstants.TOP_RIGHT]).y = -(_loc2_ / 2) - super.borderWidth / 2;
            UIComponent(this._points[AssetControlConstants.BOTTOM_RIGHT]).x = _loc1_ / 2 + super.borderWidth / 2;
            UIComponent(this._points[AssetControlConstants.BOTTOM_RIGHT]).y = _loc2_ / 2 + super.borderWidth / 2;
            UIComponent(this._points[AssetControlConstants.BOTTOM_LEFT]).x = -(_loc1_ / 2) - super.borderWidth / 2;
            UIComponent(this._points[AssetControlConstants.BOTTOM_LEFT]).y = _loc2_ / 2 + super.borderWidth / 2;
            UIComponent(this._points[AssetControlConstants.GUIDE]).x = _loc1_ / 2 + super.borderWidth / 2;
            UIComponent(this._points[AssetControlConstants.GUIDE]).y = -(_loc2_ / 2) - super.borderWidth / 2;
         }
         if(_loc1_ <= 20 && _loc2_ <= 20)
         {
            this._showGuide = false;
         }
         else
         {
            this._showGuide = true;
         }
         if(super.asset is IRotatable)
         {
            this._pointLayer.visible = IRotatable(super.asset).isRotatable;
            if(IRotatable(super.asset).isRotatable)
            {
               this._guideLayer.visible = !this._refLayer.visible && this._showGuide;
            }
            else
            {
               this._guideLayer.visible = false;
            }
         }
      }
      
      private function onPointMouseMove(param1:MouseEvent) : void
      {
         if(!param1.buttonDown)
         {
            this._refLayer.visible = true;
            this._guideLayer.visible = false;
         }
      }
      
      private function onPointRollOver(param1:MouseEvent) : void
      {
         if(!param1.buttonDown)
         {
            this._selectedPoint = param1.currentTarget as UIComponent;
            this._guideLayer.visible = false;
         }
      }
      
      private function onPointRollOut(param1:MouseEvent) : void
      {
         if(!param1.buttonDown)
         {
            this._refLayer.visible = false;
            this._guideLayer.visible = this._showGuide;
         }
      }
      
      private function onRotateBtnRollOver(param1:MouseEvent) : void
      {
         if(!param1.buttonDown)
         {
            this.updateReferenceLineOnRotate();
            this._refLayer.visible = true;
         }
      }
      
      private function onRotateBtnRollOut(param1:MouseEvent) : void
      {
         if(!param1.buttonDown)
         {
            this._refLayer.graphics.clear();
            this._refLayer.visible = false;
         }
      }
      
      private function onResizeBtnRollOver(param1:MouseEvent) : void
      {
         if(!param1.buttonDown)
         {
            this.updateReferenceLineOnResize();
            this._refLayer.visible = true;
         }
      }
      
      private function onResizeBtnRollOut(param1:MouseEvent) : void
      {
         if(!param1.buttonDown)
         {
            this._refLayer.graphics.clear();
            this._refLayer.visible = false;
         }
      }
      
      private function onPointMouseDown(param1:MouseEvent) : void
      {
         this._selectedPoint = param1.currentTarget as UIComponent;
      }
      
      private function onRotateBtnMouseDown(param1:MouseEvent) : void
      {
         if(this.undoableAction)
         {
            this._command = new RotateObjectCommand(super.asset as IRotatable);
            this._command.execute();
         }
         if(super.asset is IRotatable)
         {
            this._oldRotation = IRotatable(super.asset).rotation;
         }
         var _loc2_:Point = new Point(this.mouseX - this.localRefPos.x,this.mouseY - this.localRefPos.y);
         var _loc3_:Matrix = new Matrix();
         _loc3_.rotate(this.rotation * Math.PI / 180);
         _loc2_ = _loc3_.transformPoint(_loc2_);
         this._oldMouseRotation = Math.atan2(_loc2_.y,_loc2_.x) * 180 / Math.PI;
         this.stage.addEventListener(MouseEvent.MOUSE_UP,this.onStageRotateMouseUp);
         this.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onStageRotateMouseMove);
      }
      
      private function onResizeBtnMouseDown(param1:MouseEvent) : void
      {
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
         if(this.undoableAction)
         {
            this._command = new ResizeObjectCommand(super.asset as IResizable);
            this._command.execute();
         }
         this._tooltip = Console.getConsole().mainStage.assetResizeToolTip;
         this.updateToolTip(param1.shiftKey || this._freeAspect);
         this._tooltip.visible = true;
         this.stage.addEventListener(MouseEvent.MOUSE_UP,this.onStageResizeMouseUp);
         this.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onStageResizeMouseMove);
      }
      
      private function updateToolTip(param1:Boolean = false) : void
      {
         var _loc2_:IResizable = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Point = null;
         var _loc6_:Point = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         if(super.asset is IResizable && this._tooltip)
         {
            _loc2_ = super.asset as IResizable;
            _loc3_ = -1;
            _loc4_ = -1;
            if(!(_loc2_ is AssetCollectionController))
            {
               _loc3_ = _loc2_.width / _loc2_.rect.width;
               _loc4_ = _loc2_.height / _loc2_.rect.height;
            }
            this._tooltip.setSize(_loc2_.width,_loc2_.height,_loc3_,_loc4_,true,!param1);
            _loc5_ = new Point();
            _loc6_ = new Point(10,10);
            _loc7_ = _loc2_.width;
            _loc8_ = _loc2_.height;
            if(this._selectedPoint == this._points[AssetControlConstants.TOP_LEFT])
            {
               _loc5_.x = -(_loc7_ / 2) - super.borderWidth;
               _loc5_.y = -(_loc8_ / 2) - super.borderWidth;
            }
            else if(this._selectedPoint == this._points[AssetControlConstants.TOP_RIGHT])
            {
               _loc5_.x = _loc7_ / 2 + super.borderWidth;
               _loc5_.y = -(_loc8_ / 2) - super.borderWidth;
            }
            else if(this._selectedPoint == this._points[AssetControlConstants.BOTTOM_RIGHT])
            {
               _loc5_.x = _loc7_ / 2 + super.borderWidth;
               _loc5_.y = _loc8_ / 2 + super.borderWidth;
            }
            else if(this._selectedPoint == this._points[AssetControlConstants.BOTTOM_LEFT])
            {
               _loc5_.x = -(_loc7_ / 2) - super.borderWidth;
               _loc5_.y = _loc8_ / 2 + super.borderWidth;
            }
            _loc5_ = this.localToGlobal(_loc5_);
            if(this._selectedPoint == this._points[AssetControlConstants.TOP_LEFT])
            {
               _loc5_.x = _loc5_.x - (this._tooltip.width + _loc6_.x);
               _loc5_.y = _loc5_.y - (this._tooltip.height + _loc6_.y);
            }
            else if(this._selectedPoint == this._points[AssetControlConstants.TOP_RIGHT])
            {
               _loc5_.x = _loc5_.x + _loc6_.x;
               _loc5_.y = _loc5_.y - (this._tooltip.height + _loc6_.y);
            }
            else if(this._selectedPoint == this._points[AssetControlConstants.BOTTOM_RIGHT])
            {
               _loc5_.x = _loc5_.x + _loc6_.x;
               _loc5_.y = _loc5_.y + _loc6_.y;
            }
            else if(this._selectedPoint == this._points[AssetControlConstants.BOTTOM_LEFT])
            {
               _loc5_.x = _loc5_.x - (this._tooltip.width + _loc6_.x);
               _loc5_.y = _loc5_.y + _loc6_.y;
            }
            _loc5_ = this._tooltip.parent.globalToLocal(_loc5_);
            this._tooltip.move(_loc5_.x,_loc5_.y);
         }
      }
      
      private function getNewRotation(param1:Boolean) : Number
      {
         var _loc2_:Point = new Point(this.mouseX - this.localRefPos.x,this.mouseY - this.localRefPos.y);
         var _loc3_:Matrix = new Matrix();
         _loc3_.rotate(this.rotation * Math.PI / 180);
         _loc2_ = _loc3_.transformPoint(_loc2_);
         var _loc4_:Number = Math.atan2(_loc2_.y,_loc2_.x) * 180 / Math.PI;
         _loc4_ = _loc4_ - this._oldMouseRotation;
         _loc4_ = this._oldRotation + _loc4_;
         if(param1)
         {
            _loc4_ = Math.round(_loc4_ / 45) * 45;
         }
         return _loc4_;
      }
      
      private function onStageRotateMouseMove(param1:MouseEvent) : void
      {
         if(super.asset is IRotatable)
         {
            IRotatable(super.asset).rotation = this.getNewRotation(param1.shiftKey);
            this.updateReferenceLineOnRotate();
         }
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
      
      private function onStageResizeMouseMove(param1:MouseEvent) : void
      {
         var _loc2_:Number = Math.max(0,(this.mouseX - this.localRefPos.x) / this._oldMouseDown.x);
         var _loc3_:Number = Math.max(0,(this.mouseY - this.localRefPos.y) / this._oldMouseDown.y);
         var _loc4_:Point = new Point(this._oldSize.x * _loc2_,this._oldSize.y * _loc3_);
         this.resizeAsset(_loc4_.x,_loc4_.y,!param1.shiftKey && !this._freeAspect);
         this.updateToolTip(param1.shiftKey || this._freeAspect);
         this.updateReferenceLineOnResize();
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
      
      private function updateReferenceLineOnResize() : void
      {
         var _loc1_:Point = this.localRefPos;
         var _loc2_:Point = new Point();
         var _loc3_:Number = 0.5;
         this._refLayer.graphics.clear();
         _loc2_.x = UIComponent(this._points[AssetControlConstants.TOP_LEFT]).x - _loc1_.x;
         _loc2_.y = UIComponent(this._points[AssetControlConstants.TOP_LEFT]).y - _loc1_.y;
         if(_loc2_.length > 20)
         {
            if(this._selectedPoint)
            {
               _loc3_ = this._selectedPoint == this._points[AssetControlConstants.TOP_LEFT]?Number(0.5):Number(0.1);
            }
            _loc2_ = UtilMath.scalePoint(_loc2_,100,100);
            this._refLayer.graphics.moveTo(_loc1_.x + _loc2_.x,_loc1_.y + _loc2_.y);
            this._refLayer.graphics.lineStyle(this.drawingScale,this.REFERENCE_COLOR_DARK,_loc3_,true);
            this._refLayer.graphics.lineTo(_loc1_.x,_loc1_.y);
         }
         _loc2_.x = UIComponent(this._points[AssetControlConstants.TOP_RIGHT]).x - _loc1_.x;
         _loc2_.y = UIComponent(this._points[AssetControlConstants.TOP_RIGHT]).y - _loc1_.y;
         if(_loc2_.length > 20)
         {
            if(this._selectedPoint)
            {
               _loc3_ = this._selectedPoint == this._points[AssetControlConstants.TOP_RIGHT]?Number(0.5):Number(0.1);
            }
            _loc2_ = UtilMath.scalePoint(_loc2_,100,100);
            this._refLayer.graphics.moveTo(_loc1_.x + _loc2_.x,_loc1_.y + _loc2_.y);
            this._refLayer.graphics.lineStyle(this.drawingScale,this.REFERENCE_COLOR_DARK,_loc3_,true);
            this._refLayer.graphics.lineTo(_loc1_.x,_loc1_.y);
         }
         _loc2_.x = UIComponent(this._points[AssetControlConstants.BOTTOM_LEFT]).x - _loc1_.x;
         _loc2_.y = UIComponent(this._points[AssetControlConstants.BOTTOM_LEFT]).y - _loc1_.y;
         if(_loc2_.length > 20)
         {
            if(this._selectedPoint)
            {
               _loc3_ = this._selectedPoint == this._points[AssetControlConstants.BOTTOM_LEFT]?Number(0.5):Number(0.1);
            }
            _loc2_ = UtilMath.scalePoint(_loc2_,100,100);
            this._refLayer.graphics.moveTo(_loc1_.x + _loc2_.x,_loc1_.y + _loc2_.y);
            this._refLayer.graphics.lineStyle(this.drawingScale,this.REFERENCE_COLOR_DARK,_loc3_,true);
            this._refLayer.graphics.lineTo(_loc1_.x,_loc1_.y);
         }
         _loc2_.x = UIComponent(this._points[AssetControlConstants.BOTTOM_RIGHT]).x - _loc1_.x;
         _loc2_.y = UIComponent(this._points[AssetControlConstants.BOTTOM_RIGHT]).y - _loc1_.y;
         if(_loc2_.length > 20)
         {
            if(this._selectedPoint)
            {
               _loc3_ = this._selectedPoint == this._points[AssetControlConstants.BOTTOM_RIGHT]?Number(0.5):Number(0.1);
            }
            _loc2_ = UtilMath.scalePoint(_loc2_,100,100);
            this._refLayer.graphics.moveTo(_loc1_.x + _loc2_.x,_loc1_.y + _loc2_.y);
            this._refLayer.graphics.lineStyle(this.drawingScale,this.REFERENCE_COLOR_DARK,_loc3_,true);
            this._refLayer.graphics.lineTo(_loc1_.x,_loc1_.y);
         }
      }
      
      private function updateReferenceLineOnRotate() : void
      {
         var _loc1_:Point = null;
         var _loc2_:Point = null;
         if(this._selectedPoint)
         {
            _loc1_ = this.localRefPos;
            _loc2_ = new Point(this._selectedPoint.x - _loc1_.x,this._selectedPoint.y - _loc1_.y);
            if(_loc2_.length > 20)
            {
               this._refLayer.graphics.clear();
               this._refLayer.graphics.lineStyle(this.drawingScale,this.REFERENCE_COLOR_DARK,0.5,true);
               this._refLayer.graphics.drawCircle(_loc1_.x,_loc1_.y,_loc2_.length);
            }
            if(_loc2_.length > 20)
            {
               this._refLayer.graphics.moveTo(_loc1_.x + _loc2_.x,_loc1_.y + _loc2_.y);
               this._refLayer.graphics.lineStyle(this.drawingScale,this.REFERENCE_COLOR_DARK,0.2,true);
               this._refLayer.graphics.lineTo(_loc1_.x,_loc1_.y);
            }
         }
      }
      
      private function onStageRotateMouseUp(param1:MouseEvent) : void
      {
         this.stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStageRotateMouseUp);
         this.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onStageRotateMouseMove);
         this._refLayer.visible = false;
         this._guideLayer.visible = this._showGuide;
      }
      
      private function onStageResizeMouseUp(param1:MouseEvent) : void
      {
         this.stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStageResizeMouseUp);
         this.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onStageResizeMouseMove);
         this._tooltip.visible = false;
         this._refLayer.visible = false;
         this._guideLayer.visible = this._showGuide;
      }
      
      private function onAssetRotated(param1:AssetEvent) : void
      {
         this.rotateControl();
      }
      
      private function rotateControl() : void
      {
         if(super.asset is IRotatable)
         {
            this.rotation = IRotatable(super.asset).rotation;
         }
      }
      
      private function onAssetResize(param1:AssetEvent) : void
      {
         this.updatePoints();
      }
   }
}
