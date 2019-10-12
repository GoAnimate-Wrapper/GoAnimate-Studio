package anifire.studio.assets.control
{
   import anifire.constant.AnimeConstants;
   import anifire.studio.assets.interfaces.IReferencePoint;
   import anifire.studio.commands.MoveAssetReferenceCommand;
   import anifire.studio.events.AssetEvent;
   import anifire.studio.interfaces.IAssetControl;
   import anifire.studio.interfaces.IMovable;
   import anifire.studio.interfaces.IResizable;
   import anifire.studio.interfaces.IRotatable;
   import anifire.util.UtilMath;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import mx.core.UIComponent;
   import mx.effects.Fade;
   
   public class AssetReferencePointControl extends AbstractAssetControlDecorator
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
      
      private var _oldPosition:Point;
      
      private var _oldSize:Rectangle;
      
      private var _pointLayer:UIComponent;
      
      private var _refLayer:UIComponent;
      
      private var _selectedPoint:UIComponent;
      
      private var _fadeIn:Fade;
      
      private var _command:MoveAssetReferenceCommand;
      
      public function AssetReferencePointControl(param1:IAssetControl)
      {
         this._oldMouseDown = new Point();
         this._oldPosition = new Point();
         this._oldSize = new Rectangle();
         this._pointLayer = new UIComponent();
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
            param1.addEventListener(AssetEvent.REFERENCE_POINT_CHANGED,this.onAssetReferencePointChanged);
            param1.addEventListener(AssetEvent.ASSET_RESIZED,this.onAssetResize);
         }
      }
      
      override public function destroy(param1:String = "rip") : void
      {
         this.stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUp);
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
      }
      
      private function removeAssetEventListeners(param1:IEventDispatcher) : void
      {
         if(param1)
         {
            param1.removeEventListener(AssetEvent.REFERENCE_POINT_CHANGED,this.onAssetReferencePointChanged);
            param1.removeEventListener(AssetEvent.ASSET_RESIZED,this.onAssetResize);
         }
      }
      
      private function onAssetResize(param1:AssetEvent) : void
      {
         this.updatePoints();
      }
      
      override public function set drawingScale(param1:Number) : void
      {
         super.drawingScale = param1;
         if(this._points)
         {
            UIComponent(this._points["ref"]).scaleX = UIComponent(this._points["ref"]).scaleY = param1;
         }
         this.redraw();
      }
      
      private function addPoints() : void
      {
         this._refLayer.visible = false;
         this.addChild(this._refLayer);
         this.addChild(this._pointLayer);
         this._points = new Array();
         this._points["ref"] = this.addRefPoint();
         this.updatePoints();
      }
      
      private function addRefPoint() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.graphics.lineStyle(1,this.REFERENCE_COLOR_LIGHT);
         _loc1_.graphics.beginFill(this.REFERENCE_COLOR_DARK,1);
         _loc1_.graphics.drawCircle(0,0,6);
         _loc1_.graphics.drawCircle(0,0,4);
         _loc1_.graphics.drawCircle(0,0,4);
         _loc1_.graphics.endFill();
         _loc1_.buttonMode = true;
         _loc1_.mouseChildren = false;
         _loc1_.alpha = 0.5;
         _loc1_.addEventListener(MouseEvent.MOUSE_DOWN,this.onRefPointMouseDown);
         _loc1_.addEventListener(MouseEvent.ROLL_OVER,this.onRefPointRollOver);
         _loc1_.addEventListener(MouseEvent.ROLL_OUT,this.onRefPointRollOut);
         _loc1_.visible = false;
         this._pointLayer.addChild(_loc1_);
         return _loc1_;
      }
      
      override public function set showReferencePoint(param1:Boolean) : void
      {
         if(this._points["ref"])
         {
            UIComponent(this._points["ref"]).visible = !UIComponent(this._points["ref"]).visible;
         }
      }
      
      private function updatePoints() : void
      {
         var _loc1_:IResizable = null;
         if(super.asset is IReferencePoint && this._points)
         {
            UIComponent(this._points["ref"]).move(IReferencePoint(super.asset).referenceX,IReferencePoint(super.asset).referenceY);
         }
         if(super.asset is IResizable)
         {
            _loc1_ = super.asset as IResizable;
            this._pointLayer.visible = _loc1_.width > 20 || _loc1_.height > 20;
         }
      }
      
      private function onRefPointMouseDown(param1:MouseEvent) : void
      {
         this.stage.addEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUp);
         this.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onStageMouseMove);
         if(this.undoableAction)
         {
            this._command = new MoveAssetReferenceCommand(this.asset);
         }
         this.updateReferenceLine();
         this._refLayer.visible = true;
      }
      
      private function onRefPointRollOver(param1:MouseEvent) : void
      {
         if(!param1.buttonDown && this._points)
         {
            UIComponent(this._points["ref"]).alpha = 1;
         }
      }
      
      private function onRefPointRollOut(param1:MouseEvent) : void
      {
         if(!param1.buttonDown && this._points)
         {
            UIComponent(this._points["ref"]).alpha = 0.5;
         }
      }
      
      private function onStageMouseUp(param1:MouseEvent) : void
      {
         this.stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUp);
         this.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onStageMouseMove);
         this._refLayer.visible = false;
         if(this._points)
         {
            UIComponent(this._points["ref"]).stopDrag();
            UIComponent(this._points["ref"]).alpha = 0.5;
            if(this._command)
            {
               this._command.executeNow(UIComponent(this._points["ref"]).x,UIComponent(this._points["ref"]).y);
            }
         }
      }
      
      private function onStageMouseMove(param1:MouseEvent) : void
      {
         var _loc2_:Point = new Point(this.mouseX,this.mouseY);
         if(param1.shiftKey)
         {
            _loc2_.x = Math.round(_loc2_.x / 20) * 20;
            _loc2_.y = Math.round(_loc2_.y / 20) * 20;
         }
         _loc2_ = this.snapPoint(_loc2_);
         if(super.asset is IReferencePoint)
         {
            IReferencePoint(super.asset).setReferencePoint(_loc2_.x,_loc2_.y);
         }
         this.updateReferenceLine();
      }
      
      private function snapPoint(param1:Point) : Point
      {
         var _loc3_:Point = null;
         var _loc6_:Point = null;
         var _loc7_:Point = null;
         var _loc8_:Point = null;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc2_:Point = param1.clone();
         var _loc4_:Number = 5 * this.drawingScale;
         if(super.asset is IMovable)
         {
            _loc3_ = new Point(IMovable(super.asset).x - param1.x,IMovable(super.asset).y - param1.y);
            if(_loc3_.length < _loc4_)
            {
               _loc4_ = _loc3_.length;
               _loc2_.x = IMovable(super.asset).x;
               _loc2_.y = IMovable(super.asset).y;
            }
         }
         if(super.asset is IMovable)
         {
            if(super.asset is IResizable)
            {
               _loc6_ = new Point(IMovable(super.asset).x,IMovable(super.asset).y);
               _loc7_ = new Point(IResizable(super.asset).width,IResizable(super.asset).height);
               _loc8_ = new Point();
               _loc9_ = 0;
               if(super.asset is IRotatable)
               {
                  _loc9_ = IRotatable(super.asset).rotation;
               }
               _loc8_.x = _loc6_.x - _loc7_.x / 2;
               _loc8_.y = _loc6_.y - _loc7_.y / 2;
               if(_loc9_ != 0)
               {
                  _loc8_ = UtilMath.rotatePoint(_loc8_,_loc9_,_loc6_);
               }
               _loc3_ = new Point(_loc8_.x - param1.x,_loc8_.y - param1.y);
               if(_loc3_.length < _loc4_)
               {
                  _loc4_ = _loc3_.length;
                  _loc2_.x = _loc8_.x;
                  _loc2_.y = _loc8_.y;
               }
               _loc8_.x = _loc6_.x;
               _loc8_.y = _loc6_.y - _loc7_.y / 2;
               if(_loc9_ != 0)
               {
                  _loc8_ = UtilMath.rotatePoint(_loc8_,_loc9_,_loc6_);
               }
               _loc3_ = new Point(_loc8_.x - param1.x,_loc8_.y - param1.y);
               if(_loc3_.length < _loc4_)
               {
                  _loc4_ = _loc3_.length;
                  _loc2_.x = _loc8_.x;
                  _loc2_.y = _loc8_.y;
               }
               _loc8_.x = _loc6_.x + _loc7_.x / 2;
               _loc8_.y = _loc6_.y - _loc7_.y / 2;
               if(_loc9_ != 0)
               {
                  _loc8_ = UtilMath.rotatePoint(_loc8_,_loc9_,_loc6_);
               }
               _loc3_ = new Point(_loc8_.x - param1.x,_loc8_.y - param1.y);
               if(_loc3_.length < _loc4_)
               {
                  _loc4_ = _loc3_.length;
                  _loc2_.x = _loc8_.x;
                  _loc2_.y = _loc8_.y;
               }
               _loc8_.x = _loc6_.x - _loc7_.x / 2;
               _loc8_.y = _loc6_.y;
               if(_loc9_ != 0)
               {
                  _loc8_ = UtilMath.rotatePoint(_loc8_,_loc9_,_loc6_);
               }
               _loc3_ = new Point(_loc8_.x - param1.x,_loc8_.y - param1.y);
               if(_loc3_.length < _loc4_)
               {
                  _loc4_ = _loc3_.length;
                  _loc2_.x = _loc8_.x;
                  _loc2_.y = _loc8_.y;
               }
               _loc8_.x = _loc6_.x + _loc7_.x / 2;
               _loc8_.y = _loc6_.y;
               if(_loc9_ != 0)
               {
                  _loc8_ = UtilMath.rotatePoint(_loc8_,_loc9_,_loc6_);
               }
               _loc3_ = new Point(_loc8_.x - param1.x,_loc8_.y - param1.y);
               if(_loc3_.length < _loc4_)
               {
                  _loc4_ = _loc3_.length;
                  _loc2_.x = _loc8_.x;
                  _loc2_.y = _loc8_.y;
               }
               _loc8_.x = _loc6_.x - _loc7_.x / 2;
               _loc8_.y = _loc6_.y + _loc7_.y / 2;
               if(_loc9_ != 0)
               {
                  _loc8_ = UtilMath.rotatePoint(_loc8_,_loc9_,_loc6_);
               }
               _loc3_ = new Point(_loc8_.x - param1.x,_loc8_.y - param1.y);
               if(_loc3_.length < _loc4_)
               {
                  _loc4_ = _loc3_.length;
                  _loc2_.x = _loc8_.x;
                  _loc2_.y = _loc8_.y;
               }
               _loc8_.x = _loc6_.x;
               _loc8_.y = _loc6_.y + _loc7_.y / 2;
               if(_loc9_ != 0)
               {
                  _loc8_ = UtilMath.rotatePoint(_loc8_,_loc9_,_loc6_);
               }
               _loc3_ = new Point(_loc8_.x - param1.x,_loc8_.y - param1.y);
               if(_loc3_.length < _loc4_)
               {
                  _loc4_ = _loc3_.length;
                  _loc2_.x = _loc8_.x;
                  _loc2_.y = _loc8_.y;
               }
               _loc8_.x = _loc6_.x + _loc7_.x / 2;
               _loc8_.y = _loc6_.y + _loc7_.y / 2;
               if(_loc9_ != 0)
               {
                  _loc8_ = UtilMath.rotatePoint(_loc8_,_loc9_,_loc6_);
               }
               _loc3_ = new Point(_loc8_.x - param1.x,_loc8_.y - param1.y);
               if(_loc3_.length < _loc4_)
               {
                  _loc4_ = _loc3_.length;
                  _loc2_.x = _loc8_.x;
                  _loc2_.y = _loc8_.y;
               }
            }
         }
         var _loc5_:Rectangle = AnimeConstants.screenRect;
         _loc8_.x = _loc5_.left;
         _loc8_.y = _loc5_.top;
         _loc3_ = new Point(_loc8_.x - param1.x,_loc8_.y - param1.y);
         if(_loc3_.length < _loc4_)
         {
            _loc4_ = _loc3_.length;
            _loc2_.x = _loc8_.x;
            _loc2_.y = _loc8_.y;
         }
         _loc8_.x = _loc5_.right;
         _loc8_.y = _loc5_.top;
         _loc3_ = new Point(_loc8_.x - param1.x,_loc8_.y - param1.y);
         if(_loc3_.length < _loc4_)
         {
            _loc4_ = _loc3_.length;
            _loc2_.x = _loc8_.x;
            _loc2_.y = _loc8_.y;
         }
         _loc8_.x = _loc5_.x + _loc5_.width / 2;
         _loc8_.y = _loc5_.y + _loc5_.height / 2;
         _loc3_ = new Point(_loc8_.x - param1.x,_loc8_.y - param1.y);
         if(_loc3_.length < _loc4_)
         {
            _loc4_ = _loc3_.length;
            _loc2_.x = _loc8_.x;
            _loc2_.y = _loc8_.y;
         }
         _loc8_.x = _loc5_.left;
         _loc8_.y = _loc5_.bottom;
         _loc3_ = new Point(_loc8_.x - param1.x,_loc8_.y - param1.y);
         if(_loc3_.length < _loc4_)
         {
            _loc4_ = _loc3_.length;
            _loc2_.x = _loc8_.x;
            _loc2_.y = _loc8_.y;
         }
         _loc8_.x = _loc5_.right;
         _loc8_.y = _loc5_.bottom;
         _loc3_ = new Point(_loc8_.x - param1.x,_loc8_.y - param1.y);
         if(_loc3_.length < _loc4_)
         {
            _loc4_ = _loc3_.length;
            _loc2_.x = _loc8_.x;
            _loc2_.y = _loc8_.y;
         }
         this._refLayer.graphics.clear();
         if(Point.distance(_loc2_,param1) > 0)
         {
            _loc10_ = 20 * this.drawingScale;
            this._refLayer.graphics.lineStyle(this.drawingScale,5405190,0.5,true);
            this._refLayer.graphics.moveTo(_loc2_.x,_loc2_.y - _loc10_);
            this._refLayer.graphics.lineTo(_loc2_.x,_loc2_.y + _loc10_);
            this._refLayer.graphics.moveTo(_loc2_.x - _loc10_,_loc2_.y);
            this._refLayer.graphics.lineTo(_loc2_.x + _loc10_,_loc2_.y);
         }
         return _loc2_;
      }
      
      private function onAssetReferencePointChanged(param1:AssetEvent) : void
      {
         this.updatePoints();
      }
      
      private function updateReferenceLine() : void
      {
      }
   }
}
