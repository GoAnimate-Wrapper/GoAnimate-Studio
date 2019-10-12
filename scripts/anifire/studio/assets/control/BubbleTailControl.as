package anifire.studio.assets.control
{
   import anifire.studio.commands.MoveBubbleTailCommand;
   import anifire.studio.events.AssetEvent;
   import anifire.studio.events.BubbleAssetEvent;
   import anifire.studio.interfaces.IAssetControl;
   import anifire.studio.interfaces.IBubbleTail;
   import anifire.studio.interfaces.IRotatable;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import mx.core.UIComponent;
   
   public class BubbleTailControl extends AbstractAssetControlDecorator
   {
       
      
      private const POINT_COLOR_LIGHT:uint = 11979662;
      
      private const POINT_COLOR_DARK:uint = 5405190;
      
      private const POINT_RADIUS:Number = 4;
      
      private var _point:UIComponent;
      
      private var _command:MoveBubbleTailCommand;
      
      public function BubbleTailControl(param1:IAssetControl)
      {
         super(param1);
         this.addPoint();
         this.addAssetEventListeners(param1.asset);
      }
      
      private function addAssetEventListeners(param1:IEventDispatcher) : void
      {
         if(param1)
         {
            param1.addEventListener(BubbleAssetEvent.TAIL_MOVED,this.onTailMoved);
            param1.addEventListener(AssetEvent.ASSET_ROTATED,this.onAssetRotated);
         }
      }
      
      override public function set drawingScale(param1:Number) : void
      {
         super.drawingScale = param1;
         UIComponent(this._point).scaleX = UIComponent(this._point).scaleY = param1;
      }
      
      override public function destroy(param1:String = "rip") : void
      {
         this.stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUp);
         this.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onStageMouseMove);
         this.removeAssetEventListeners(super.asset);
         this.removeChild(this._point);
         this._point = null;
         super.destroy(param1);
      }
      
      override public function set asset(param1:IEventDispatcher) : void
      {
         this.removeAssetEventListeners(super.asset);
         super.asset = param1;
         this.updatePoint();
         if(super.asset is IBubbleTail)
         {
            this._point.visible = IBubbleTail(super.asset).hasTail;
         }
         this.addAssetEventListeners(decorated.asset);
      }
      
      private function removeAssetEventListeners(param1:IEventDispatcher) : void
      {
         if(param1)
         {
            param1.removeEventListener(BubbleAssetEvent.TAIL_MOVED,this.onTailMoved);
            param1.removeEventListener(AssetEvent.ASSET_ROTATED,this.onAssetRotated);
         }
      }
      
      private function onAssetRotated(param1:AssetEvent) : void
      {
         this.updatePoint();
      }
      
      private function addPoint() : void
      {
         this._point = new UIComponent();
         this._point.buttonMode = true;
         this._point.addEventListener(MouseEvent.MOUSE_DOWN,this.onPointMouseDown);
         var _loc1_:Rectangle = new Rectangle(-this.POINT_RADIUS,-this.POINT_RADIUS,this.POINT_RADIUS * 2,this.POINT_RADIUS * 2);
         this._point.graphics.lineStyle(1,this.POINT_COLOR_LIGHT,1,true);
         this._point.graphics.drawRect(_loc1_.x,_loc1_.y,_loc1_.width,_loc1_.height);
         this._point.graphics.beginFill(this.POINT_COLOR_DARK);
         this._point.graphics.drawRect(_loc1_.x,_loc1_.y,_loc1_.width,_loc1_.height);
         this._point.graphics.endFill();
         this.addChild(this._point);
         this.updatePoint();
      }
      
      private function updatePoint() : void
      {
         var _loc1_:Point = null;
         var _loc2_:Matrix = null;
         if(super.asset is IBubbleTail)
         {
            _loc1_ = new Point(IBubbleTail(super.asset).tailX,IBubbleTail(super.asset).tailY);
            _loc2_ = this.mat;
            _loc1_ = _loc2_.transformPoint(_loc1_);
            this._point.x = _loc1_.x;
            this._point.y = _loc1_.y;
         }
      }
      
      private function onPointMouseDown(param1:MouseEvent) : void
      {
         this._command = new MoveBubbleTailCommand(super.asset);
         this.stage.addEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUp);
         this.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onStageMouseMove);
      }
      
      private function get mat() : Matrix
      {
         var _loc1_:Matrix = new Matrix();
         if(super.asset is IRotatable)
         {
            _loc1_.rotate(IRotatable(super.asset).rotation * Math.PI / 180);
         }
         return _loc1_;
      }
      
      private function get newTailPosition() : Point
      {
         var _loc1_:Point = new Point(this.mouseX,this.mouseY);
         var _loc2_:Matrix = this.mat;
         _loc2_.invert();
         _loc1_ = _loc2_.transformPoint(_loc1_);
         return _loc1_;
      }
      
      private function onStageMouseMove(param1:MouseEvent) : void
      {
         var _loc2_:Point = null;
         if(super.asset is IBubbleTail)
         {
            _loc2_ = this.newTailPosition;
            IBubbleTail(super.asset).moveTail(_loc2_.x,_loc2_.y);
         }
      }
      
      private function onStageMouseUp(param1:MouseEvent) : void
      {
         var _loc2_:Point = null;
         this.stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUp);
         this.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onStageMouseMove);
         if(this._command)
         {
            _loc2_ = this.newTailPosition;
            this._command.executeNow(_loc2_.x,_loc2_.y);
         }
      }
      
      private function onTailMoved(param1:Event) : void
      {
         this.updatePoint();
      }
   }
}
