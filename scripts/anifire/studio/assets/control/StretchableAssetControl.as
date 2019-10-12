package anifire.studio.assets.control
{
   import anifire.studio.assets.interfaces.IReferencePoint;
   import anifire.studio.commands.ICommand;
   import anifire.studio.commands.ResizeObjectCommand;
   import anifire.studio.core.Console;
   import anifire.studio.events.AssetEvent;
   import anifire.studio.interfaces.IAssetControl;
   import anifire.studio.interfaces.IMovable;
   import anifire.studio.interfaces.IResizable;
   import anifire.studio.interfaces.IRotatable;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import mx.core.UIComponent;
   
   public class StretchableAssetControl extends AbstractAssetControlDecorator
   {
       
      
      private const POINT_COLOR_LIGHT:uint = 11979662;
      
      private const POINT_COLOR_DARK:uint = 5405190;
      
      private const POINT_RADIUS:Number = 4;
      
      private const REFERENCE_COLOR_LIGHT:Number = 11979662;
      
      private const REFERENCE_COLOR_DARK:Number = 5405190;
      
      private var _points:Array;
      
      private var _selectedPoint:UIComponent;
      
      private var _tooltip:AssetResizeToolTip;
      
      private var _oldMouseDown:Point;
      
      private var _oldSize:Point;
      
      private var _refLayer:UIComponent;
      
      private var _freeAspect:Boolean;
      
      public function StretchableAssetControl(param1:IAssetControl, param2:Boolean = false)
      {
         this._oldMouseDown = new Point();
         this._oldSize = new Point();
         this._refLayer = new UIComponent();
         super(param1);
         this._freeAspect = param2;
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
      
      private function updatePoints() : void
      {
         if(super.asset is IResizable)
         {
            UIComponent(this._points[AssetControlConstants.TOP]).x = 0;
            UIComponent(this._points[AssetControlConstants.TOP]).y = -(IResizable(super.asset).height / 2) - super.borderWidth / 2;
            UIComponent(this._points[AssetControlConstants.RIGHT]).x = IResizable(super.asset).width / 2 + super.borderWidth / 2;
            UIComponent(this._points[AssetControlConstants.RIGHT]).y = 0;
            UIComponent(this._points[AssetControlConstants.BOTTOM]).x = 0;
            UIComponent(this._points[AssetControlConstants.BOTTOM]).y = IResizable(super.asset).height / 2 + super.borderWidth / 2;
            UIComponent(this._points[AssetControlConstants.LEFT]).x = -(IResizable(super.asset).width / 2) - super.borderWidth / 2;
            UIComponent(this._points[AssetControlConstants.LEFT]).y = 0;
            UIComponent(this._points[AssetControlConstants.LEFT]).visible = UIComponent(this._points[AssetControlConstants.RIGHT]).visible = IResizable(super.asset).height > 20;
            UIComponent(this._points[AssetControlConstants.TOP]).visible = UIComponent(this._points[AssetControlConstants.BOTTOM]).visible = IResizable(super.asset).width > 20;
         }
      }
      
      private function addPoints() : void
      {
         this.addChild(this._refLayer);
         this._points = new Array();
         this._points[AssetControlConstants.TOP] = this.addPoint(RotatableControlPoint.POINT_ID_TOP);
         this._points[AssetControlConstants.RIGHT] = this.addPoint(RotatableControlPoint.POINT_ID_RIGHT);
         this._points[AssetControlConstants.BOTTOM] = this.addPoint(RotatableControlPoint.POINT_ID_BOTTOM);
         this._points[AssetControlConstants.LEFT] = this.addPoint(RotatableControlPoint.POINT_ID_LEFT);
         this.updatePoints();
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
      
      private function onPointMouseMove(param1:MouseEvent) : void
      {
         if(!param1.buttonDown)
         {
            this._refLayer.visible = true;
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
      
      private function onPointMouseDown(param1:MouseEvent) : void
      {
         var _loc2_:ICommand = null;
         this._oldMouseDown.x = this.mouseX - this.localRefPos.x;
         this._oldMouseDown.y = this.mouseY - this.localRefPos.y;
         if(super.asset is IResizable)
         {
            this._oldSize.x = IResizable(super.asset).width;
            this._oldSize.y = IResizable(super.asset).height;
         }
         this._selectedPoint = param1.currentTarget as UIComponent;
         this._tooltip = Console.getConsole().mainStage.assetResizeToolTip;
         this.updateToolTip(param1.shiftKey || this._freeAspect);
         this._tooltip.visible = true;
         if(this.undoableAction)
         {
            _loc2_ = new ResizeObjectCommand(super.asset as IResizable);
            _loc2_.execute();
         }
         this.stage.addEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUp);
         this.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onStageMouseMove);
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
      
      private function updateToolTip(param1:Boolean = false) : void
      {
         var _loc2_:IResizable = null;
         var _loc3_:Point = null;
         var _loc4_:Point = null;
         if(super.asset is IResizable && this._tooltip)
         {
            _loc2_ = super.asset as IResizable;
            this._tooltip.setSize(_loc2_.width,_loc2_.height,_loc2_.width / _loc2_.rect.width,_loc2_.height / _loc2_.rect.height,true,!param1);
            _loc3_ = new Point();
            _loc4_ = new Point(10,10);
            if(this._selectedPoint == this._points[AssetControlConstants.TOP])
            {
               _loc3_.x = 0;
               _loc3_.y = -(_loc2_.height / 2) - super.borderWidth;
            }
            else if(this._selectedPoint == this._points[AssetControlConstants.RIGHT])
            {
               _loc3_.x = _loc2_.width / 2 + super.borderWidth;
               _loc3_.y = 0;
            }
            else if(this._selectedPoint == this._points[AssetControlConstants.BOTTOM])
            {
               _loc3_.x = 0;
               _loc3_.y = _loc2_.height / 2 + super.borderWidth;
            }
            else if(this._selectedPoint == this._points[AssetControlConstants.LEFT])
            {
               _loc3_.x = -(_loc2_.width / 2) - super.borderWidth;
               _loc3_.y = 0;
            }
            _loc3_ = this.localToGlobal(_loc3_);
            if(this._selectedPoint == this._points[AssetControlConstants.TOP])
            {
               _loc3_.x = _loc3_.x - this._tooltip.width / 2;
               _loc3_.y = _loc3_.y - (this._tooltip.height + _loc4_.y);
            }
            else if(this._selectedPoint == this._points[AssetControlConstants.RIGHT])
            {
               _loc3_.x = _loc3_.x + _loc4_.x;
               _loc3_.y = _loc3_.y - this._tooltip.height / 2;
            }
            else if(this._selectedPoint == this._points[AssetControlConstants.BOTTOM])
            {
               _loc3_.x = _loc3_.x - this._tooltip.width / 2;
               _loc3_.y = _loc3_.y + _loc4_.y;
            }
            else if(this._selectedPoint == this._points[AssetControlConstants.LEFT])
            {
               _loc3_.x = _loc3_.x - (this._tooltip.width + _loc4_.x);
               _loc3_.y = _loc3_.y - this._tooltip.height / 2;
            }
            _loc3_ = this._tooltip.parent.globalToLocal(_loc3_);
            this._tooltip.move(_loc3_.x,_loc3_.y);
         }
      }
      
      private function updateReferenceLine() : void
      {
         var _loc1_:Point = this.localRefPos;
         this._refLayer.graphics.clear();
         if(this._selectedPoint == this._points[AssetControlConstants.LEFT] || this._selectedPoint == this._points[AssetControlConstants.RIGHT])
         {
            this._refLayer.graphics.lineStyle(this.drawingScale,this.REFERENCE_COLOR_DARK,0.1,true);
            this._refLayer.graphics.moveTo(_loc1_.x,_loc1_.y + 1000);
            this._refLayer.graphics.lineTo(_loc1_.x,_loc1_.y - 1000);
            this._refLayer.graphics.lineStyle(this.drawingScale,this.REFERENCE_COLOR_DARK,0.5,true);
            this._refLayer.graphics.moveTo(_loc1_.x + 1000,UIComponent(this._points[AssetControlConstants.TOP]).y);
            this._refLayer.graphics.lineTo(_loc1_.x - 1000,UIComponent(this._points[AssetControlConstants.TOP]).y);
            this._refLayer.graphics.lineStyle(this.drawingScale,this.REFERENCE_COLOR_DARK,0.5,true);
            this._refLayer.graphics.moveTo(_loc1_.x + 1000,UIComponent(this._points[AssetControlConstants.BOTTOM]).y);
            this._refLayer.graphics.lineTo(_loc1_.x - 1000,UIComponent(this._points[AssetControlConstants.BOTTOM]).y);
         }
         else
         {
            this._refLayer.graphics.lineStyle(this.drawingScale,this.REFERENCE_COLOR_DARK,0.1,true);
            this._refLayer.graphics.moveTo(_loc1_.x - 1000,_loc1_.y);
            this._refLayer.graphics.lineTo(_loc1_.x + 1000,_loc1_.y);
            this._refLayer.graphics.lineStyle(this.drawingScale,this.REFERENCE_COLOR_DARK,0.5,true);
            this._refLayer.graphics.moveTo(UIComponent(this._points[AssetControlConstants.LEFT]).x,_loc1_.y - 1000);
            this._refLayer.graphics.lineTo(UIComponent(this._points[AssetControlConstants.LEFT]).x,_loc1_.y + 1000);
            this._refLayer.graphics.lineStyle(this.drawingScale,this.REFERENCE_COLOR_DARK,0.5,true);
            this._refLayer.graphics.moveTo(UIComponent(this._points[AssetControlConstants.RIGHT]).x,_loc1_.y - 1000);
            this._refLayer.graphics.lineTo(UIComponent(this._points[AssetControlConstants.RIGHT]).x,_loc1_.y + 1000);
         }
      }
      
      private function onStageMouseMove(param1:MouseEvent) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc2_:Number = Math.abs(this._oldSize.x);
         var _loc3_:Number = Math.abs(this._oldSize.y);
         var _loc4_:Boolean = param1.shiftKey || this._freeAspect;
         if(this._selectedPoint == this._points[AssetControlConstants.LEFT] || this._selectedPoint == this._points[AssetControlConstants.RIGHT])
         {
            _loc5_ = Math.max(0,(this.mouseX - this.localRefPos.x) / this._oldMouseDown.x);
            _loc2_ = Math.abs(this._oldSize.x * _loc5_);
            if(!_loc4_)
            {
               _loc3_ = Math.abs(this._oldSize.y * _loc5_);
            }
         }
         else
         {
            _loc6_ = Math.max(0,(this.mouseY - this.localRefPos.y) / this._oldMouseDown.y);
            _loc3_ = Math.abs(this._oldSize.y * _loc6_);
            if(!_loc4_)
            {
               _loc2_ = Math.abs(this._oldSize.x * _loc6_);
            }
         }
         if(super.asset is IResizable)
         {
            IResizable(super.asset).resize(_loc2_,_loc3_,!_loc4_);
         }
         this.updateReferenceLine();
         this.updateToolTip(_loc4_);
      }
      
      override public function set drawingScale(param1:Number) : void
      {
         super.drawingScale = param1;
         UIComponent(this._points[AssetControlConstants.TOP]).scaleX = UIComponent(this._points[AssetControlConstants.TOP]).scaleY = param1;
         UIComponent(this._points[AssetControlConstants.RIGHT]).scaleX = UIComponent(this._points[AssetControlConstants.RIGHT]).scaleY = param1;
         UIComponent(this._points[AssetControlConstants.BOTTOM]).scaleX = UIComponent(this._points[AssetControlConstants.BOTTOM]).scaleY = param1;
         UIComponent(this._points[AssetControlConstants.LEFT]).scaleX = UIComponent(this._points[AssetControlConstants.LEFT]).scaleY = param1;
         this.redraw();
      }
      
      private function resizeWidth(param1:Number) : void
      {
         if(super.asset is IResizable)
         {
            IResizable(super.asset).width = param1;
         }
      }
      
      private function resizeHeight(param1:Number) : void
      {
         if(super.asset is IResizable)
         {
            IResizable(super.asset).height = param1;
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
