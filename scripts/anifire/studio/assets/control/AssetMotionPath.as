package anifire.studio.assets.control
{
   import anifire.constant.AnimeConstants;
   import anifire.studio.components.MyBezierSpline;
   import anifire.studio.components.PopUpMenu;
   import anifire.studio.core.Console;
   import anifire.studio.models.MenuItemModel;
   import anifire.util.Util;
   import anifire.util.UtilDict;
   import anifire.util.UtilDraw;
   import anifire.util.UtilErrorLogger;
   import anifire.util.UtilPlain;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.geom.Point;
   import mx.collections.ArrayCollection;
   import mx.core.UIComponent;
   import spark.events.PopUpEvent;
   
   public class AssetMotionPath extends UIComponent
   {
      
      private static const REMOVE_MOTION:String = "removeMotion";
      
      private static const PATH_ORIENTED:String = "PATH_ORIENTED";
      
      private static const ADD_CONTROL_POINT:String = "addControlPoint";
      
      private static const REMOVE_CONTROL_POINT:String = "removeControlPoint";
       
      
      private const MOTION_PATH_COLOR:Number = 16633879;
      
      private var _path:Vector.<Point>;
      
      private var _spline:MyBezierSpline;
      
      private var _curve:UIComponent;
      
      private var _pointLayer:UIComponent;
      
      private var _graphic:Sprite;
      
      private var _knots:Vector.<MaskPoint>;
      
      private var _insertingPoint:Number = -1;
      
      private var _motionMenuModel:ArrayCollection;
      
      private var _mouseClickPoint:Point;
      
      private var _currControlPointName:String;
      
      private var _growthColor:uint = 0;
      
      private var _pathColor:uint = 13421772;
      
      private var _distLabel:Boolean = true;
      
      private var _toolTip:AssetMotionToolTip;
      
      private var _pathOriented:Boolean = false;
      
      public var disableMenu:Boolean;
      
      public function AssetMotionPath()
      {
         this._mouseClickPoint = new Point();
         this._toolTip = new AssetMotionToolTip();
         super();
         this._path = new Vector.<Point>();
         this._knots = new Vector.<MaskPoint>();
         this._graphic = new Sprite();
         this._spline = new MyBezierSpline();
         this._spline.container = this._graphic;
         this._spline.thickness = 4;
         this._spline.motionPath = this;
         this._curve = new UIComponent();
         this._curve.buttonMode = true;
         this._curve.addChild(this._graphic);
         addChild(this._curve);
         this._pointLayer = new UIComponent();
         addChild(this._pointLayer);
         this._toolTip.alpha = 1;
         this._toolTip.mouseEnabled = false;
         this._toolTip.mouseChildren = false;
         this._toolTip.visible = false;
         addChild(this._toolTip);
         this.addMotionMenuListener();
      }
      
      public function get distLabel() : Boolean
      {
         return this._distLabel;
      }
      
      public function set distLabel(param1:Boolean) : void
      {
         this._distLabel = param1;
      }
      
      public function get growthColor() : uint
      {
         return this._growthColor;
      }
      
      public function set growthColor(param1:uint) : void
      {
         this._growthColor = param1;
      }
      
      public function set pathColor(param1:uint) : void
      {
         this._pathColor = param1;
      }
      
      public function destroy() : void
      {
      }
      
      private function reset() : void
      {
         try
         {
            this.removeChild(this._curve);
            this.removeChild(this._pointLayer);
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("AssetMotionPath:reset",e);
         }
         this.removeMotionMenuListener();
         this._path = new Vector.<Point>();
         this._knots = new Vector.<MaskPoint>();
         this._graphic = new Sprite();
         this._spline = new MyBezierSpline();
         this._spline.container = this._graphic;
         this._spline.thickness = 4;
         this._spline.motionPath = this;
         this._insertingPoint = -1;
         this._curve = new UIComponent();
         this._curve.buttonMode = true;
         this._curve.addChild(this._graphic);
         this.addChild(this._curve);
         this._pointLayer = new UIComponent();
         this.addChild(this._pointLayer);
         this.addMotionMenuListener();
      }
      
      public function get path() : Vector.<Point>
      {
         var _loc1_:Vector.<Point> = new Vector.<Point>();
         _loc1_.push(this._path[0]);
         var _loc2_:int = 0;
         while(_loc2_ < this._knots.length)
         {
            _loc1_.push(new Point(MaskPoint(this._knots[_loc2_]).x,MaskPoint(this._knots[_loc2_]).y));
            _loc2_++;
         }
         _loc1_.push(this._path[this._path.length - 1]);
         return _loc1_;
      }
      
      public function set path(param1:Vector.<Point>) : void
      {
         var _loc2_:int = 0;
         this.reset();
         this._path = param1;
         if(this._path.length > 1)
         {
            if(this._path.length > 2)
            {
               _loc2_ = 1;
               while(_loc2_ < this._path.length - 1)
               {
                  this.addControlPoint(Point(this._path[_loc2_]));
                  _loc2_++;
               }
            }
            this.redraw();
            visible = true;
         }
         else
         {
            visible = false;
         }
      }
      
      private function redraw() : void
      {
         this.drawMotionLine();
      }
      
      protected function drawMotionLine() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Point = null;
         var _loc3_:Point = null;
         var _loc4_:int = 0;
         this._graphic.graphics.clear();
         UtilPlain.removeAllSon(this._graphic);
         UtilPlain.removeAllSon(this._curve);
         this._curve.graphics.clear();
         this._curve.addChild(this._graphic);
         this._spline.reset();
         if(this._knots.length == 0)
         {
            _loc2_ = this._path[0];
            _loc3_ = this._path[this._path.length - 1];
            this._curve.graphics.lineStyle(4 / Console.getConsole().stageScale,this._pathColor);
            UtilDraw.drawDashLineWithArrow(this._curve,_loc2_,_loc3_,10 / Console.getConsole().stageScale,5 / Console.getConsole().stageScale,15 / Console.getConsole().stageScale);
            this._curve.name = "theCurve";
            this._curve.addEventListener(MouseEvent.CLICK,this.onDashlineClickHandler);
            _loc1_ = Point.distance(_loc2_,_loc3_);
         }
         else
         {
            this._curve.removeEventListener(MouseEvent.CLICK,this.onDashlineClickHandler);
            this._spline.addControlPoint(this._path[0].x,this._path[0].y);
            _loc4_ = 0;
            while(_loc4_ < this._knots.length)
            {
               this._spline.addControlPoint(MaskPoint(this._knots[_loc4_]).x,MaskPoint(this._knots[_loc4_]).y);
               _loc4_++;
            }
            this._spline.addControlPoint(this._path[this._path.length - 1].x,this._path[this._path.length - 1].y);
            this._spline.draw(4 / Console.getConsole().stageScale,10 / Console.getConsole().stageScale,5 / Console.getConsole().stageScale,15 / Console.getConsole().stageScale);
            _loc1_ = this._spline.arcLength() * 2;
         }
         this._toolTip.visible = false;
         if(this._distLabel && _loc1_ > AnimeConstants.ASSET_MOVE_TOLERANCE)
         {
            this._toolTip.visible = true;
            this._toolTip.setLabelText(String(Util.roundNum(_loc1_,0)) + "px");
            this._toolTip.scaleX = this._toolTip.scaleY = 1 / Console.getConsole().stageScale;
            this._toolTip.x = this._path[0].x - this._toolTip.width / 2;
            this._toolTip.y = this._path[0].y - this._toolTip.height / 2;
            this.addChild(this._toolTip);
         }
         this.onDashlineOutHandler();
      }
      
      private function addMotionMenuListener() : void
      {
         this._curve.addEventListener(MouseEvent.MOUSE_OVER,this.onDashlineOverHandler);
         this._curve.addEventListener(MouseEvent.MOUSE_OUT,this.onDashlineOutHandler);
      }
      
      private function removeMotionMenuListener() : void
      {
         this._curve.removeEventListener(MouseEvent.MOUSE_OVER,this.onDashlineOverHandler);
         this._curve.removeEventListener(MouseEvent.MOUSE_OUT,this.onDashlineOutHandler);
      }
      
      private function onDashlineOverHandler(param1:MouseEvent) : void
      {
         var _loc2_:GlowFilter = null;
         var _loc3_:Array = null;
         if(!param1.buttonDown)
         {
            _loc2_ = new GlowFilter(16737792,1,5,5,150,1,true);
            _loc3_ = new Array();
            _loc3_.push(_loc2_);
            _loc2_ = new GlowFilter(0,1,3,3,250);
            _loc3_.push(_loc2_);
            this._curve.filters = _loc3_;
         }
      }
      
      private function onDashlineOutHandler(param1:MouseEvent = null) : void
      {
         var _loc2_:GlowFilter = new GlowFilter(this.growthColor,1,3,3,250);
         var _loc3_:Array = new Array();
         _loc3_.push(_loc2_);
         this._curve.filters = _loc3_;
      }
      
      private function onDashlineClickHandler(param1:MouseEvent) : void
      {
         if(!this.disableMenu)
         {
            this.showMotionMenu(param1);
         }
      }
      
      public function showMotionMenu(param1:MouseEvent = null) : void
      {
         var _loc2_:Object = param1.currentTarget;
         if(_loc2_.name != "theCurve")
         {
            this._insertingPoint = Number(_loc2_.name);
         }
         if(_loc2_ is MaskPoint)
         {
            this._currControlPointName = _loc2_.name;
         }
         var _loc3_:PopUpMenu = new PopUpMenu();
         _loc3_.menuProvider = this.createMotionMenu(_loc2_ is MaskPoint);
         this._mouseClickPoint.x = this.mouseX;
         this._mouseClickPoint.y = this.mouseY;
         var _loc4_:Number = param1.stageX;
         var _loc5_:Number = param1.stageY;
         _loc3_.x = param1.stageX;
         _loc3_.y = param1.stageY;
         _loc3_.addEventListener(PopUpEvent.CLOSE,this.onPopUpMenuClose);
         _loc3_.open(this);
      }
      
      private function onPopUpMenuClose(param1:PopUpEvent) : void
      {
         var _loc3_:String = null;
         (param1.currentTarget as EventDispatcher).removeEventListener(PopUpEvent.CLOSE,this.onPopUpMenuClose);
         var _loc2_:MenuItemModel = param1.data as MenuItemModel;
         if(param1.commit && _loc2_)
         {
            _loc3_ = _loc2_.value as String;
            switch(_loc3_)
            {
               case REMOVE_MOTION:
                  this.dispatchEvent(new AssetMotionPathEvent(AssetMotionPathEvent.MOTION_PATH_REMOVED));
                  break;
               case ADD_CONTROL_POINT:
                  this.addControlPoint(this._mouseClickPoint);
                  this.dispatchEvent(new AssetMotionPathEvent(AssetMotionPathEvent.CONTROL_POINT_ADDED));
                  break;
               case REMOVE_CONTROL_POINT:
                  this.deleteMaskPointByName(this._currControlPointName);
                  break;
               case PATH_ORIENTED:
                  this.togglePathOriented();
            }
         }
      }
      
      private function createMotionMenu(param1:Boolean = false) : ArrayCollection
      {
         var _loc2_:ArrayCollection = new ArrayCollection();
         if(param1)
         {
            _loc2_.addItem(new MenuItemModel(UtilDict.toDisplay("go","Remove Control Point"),REMOVE_CONTROL_POINT));
         }
         else
         {
            _loc2_.addItem(new MenuItemModel(UtilDict.toDisplay("go","Add Control Point"),ADD_CONTROL_POINT));
         }
         var _loc3_:MenuItemModel = new MenuItemModel(UtilDict.toDisplay("go","Auto-rotate with Path"),PATH_ORIENTED,MenuItemModel.MENU_TYPE_CHECKBOX);
         _loc3_.enabled = this._knots.length > 0;
         _loc3_.selected = this._pathOriented;
         _loc2_.addItem(_loc3_);
         _loc2_.addItem(new MenuItemModel("",null,MenuItemModel.MENU_TYPE_SEPARATOR));
         _loc2_.addItem(new MenuItemModel(UtilDict.toDisplay("go","Remove Movement"),REMOVE_MOTION));
         return _loc2_;
      }
      
      public function set pathOriented(param1:Boolean) : void
      {
         this._pathOriented = param1;
      }
      
      public function get pathOriented() : Boolean
      {
         return this._pathOriented;
      }
      
      private function togglePathOriented() : void
      {
         this._pathOriented = !this._pathOriented;
         this.dispatchEvent(new AssetMotionPathEvent(AssetMotionPathEvent.PATH_ORIENTED_CHANGED));
      }
      
      private function deleteMaskPoint(param1:MouseEvent) : void
      {
         var _loc2_:DisplayObject = DisplayObject(param1.currentTarget);
         this.removeMaskPoint(_loc2_);
      }
      
      private function deleteMaskPointByName(param1:String) : void
      {
         var _loc2_:DisplayObject = this._pointLayer.getChildByName(param1);
         this.removeMaskPoint(_loc2_);
      }
      
      private function removeMaskPoint(param1:DisplayObject) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:int = 0;
         if(param1)
         {
            this._pointLayer.removeChild(param1);
            _loc2_ = -1;
            _loc3_ = 0;
            while(_loc3_ < this._knots.length)
            {
               if(this._knots[_loc3_] == param1)
               {
                  _loc2_ = _loc3_;
               }
               _loc3_++;
            }
            this._knots.splice(_loc2_,1);
            this.drawMotionLine();
            if(this._knots.length == 0)
            {
               this._pathOriented = false;
            }
            this.dispatchEvent(new AssetMotionPathEvent(AssetMotionPathEvent.CONTROL_POINT_REMOVED));
         }
      }
      
      private function addControlPoint(param1:Point) : void
      {
         var _loc2_:MaskPoint = new MaskPoint();
         _loc2_.scaleX = _loc2_.scaleY = 1 / Console.getConsole().stageScale;
         _loc2_.x = param1.x;
         _loc2_.y = param1.y;
         _loc2_.doubleClickEnabled = true;
         _loc2_.addEventListener(MouseEvent.MOUSE_DOWN,this.onMaskPointDown);
         _loc2_.addEventListener(MouseEvent.MOUSE_UP,this.onMaskPointUp);
         _loc2_.addEventListener(MouseEvent.CLICK,this.onMaskPointClick);
         this._pointLayer.addChild(_loc2_);
         if(this._insertingPoint > -1)
         {
            this._knots.splice(this._insertingPoint,0,_loc2_);
         }
         else
         {
            this._knots.push(_loc2_);
         }
         this.drawMotionLine();
      }
      
      private function onMaskPointClick(param1:MouseEvent) : void
      {
         if(this._mouseClickPoint.equals(new Point(this.mouseX,this.mouseY)))
         {
            this.showMotionMenu(param1);
         }
      }
      
      private function onMaskPointDown(param1:MouseEvent) : void
      {
         this._mouseClickPoint.x = this.mouseX;
         this._mouseClickPoint.y = this.mouseY;
         var _loc2_:MaskPoint = MaskPoint(param1.currentTarget);
         _loc2_.oPos = new Point(_loc2_.x,_loc2_.y);
         _loc2_.doDrag(param1);
         this.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onStageMouseMove);
         this.stage.addEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUp);
      }
      
      private function onStageMouseMove(param1:Event) : void
      {
         this.drawMotionLine();
         this.dispatchEvent(new AssetMotionPathEvent(AssetMotionPathEvent.CONTROL_POINT_MOVING));
      }
      
      private function onStageMouseUp(param1:Event) : void
      {
         this.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onStageMouseMove);
         this.stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUp);
         if(!this._mouseClickPoint.equals(new Point(this.mouseX,this.mouseY)))
         {
            this.dispatchEvent(new AssetMotionPathEvent(AssetMotionPathEvent.CONTROL_POINT_MOVED));
         }
      }
      
      private function onMaskPointUp(param1:MouseEvent) : void
      {
         (param1.currentTarget as MaskPoint).doMouseUp(param1);
         this.dispatchEvent(new Event(Event.CHANGE));
      }
   }
}
