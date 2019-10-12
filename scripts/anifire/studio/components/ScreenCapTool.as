package anifire.studio.components
{
   import anifire.studio.events.SelectedAreaEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.ui.Mouse;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import spark.components.Group;
   import spark.components.Label;
   import spark.core.SpriteVisualElement;
   import spark.primitives.Path;
   import spark.primitives.Rect;
   
   public class ScreenCapTool extends Group
   {
       
      
      private var _1880802801_toolTipText:Label;
      
      private var _1427278138backgroundMask:SpriteVisualElement;
      
      private var _1591961399cursorGroup:Group;
      
      private var _1754531041selectedRect:Rect;
      
      private var _267199580toolTipGroup:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _isDown:Boolean;
      
      private var _activeArea:Rectangle;
      
      private var _startPt:Point;
      
      private var _endPt:Point;
      
      public function ScreenCapTool()
      {
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._ScreenCapTool_SpriteVisualElement1_i(),this._ScreenCapTool_Group2_i(),this._ScreenCapTool_Rect2_i(),this._ScreenCapTool_Group3_i()];
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
      
      public function show(param1:Number, param2:Number, param3:Number, param4:Number) : void
      {
         this.backgroundMask.graphics.clear();
         this.backgroundMask.graphics.beginFill(16777215,0.5);
         this.backgroundMask.graphics.drawRect(0,0,this.backgroundMask.width,param2);
         this.backgroundMask.graphics.drawRect(0,param2,param1,param4);
         this.backgroundMask.graphics.drawRect(param1 + param3,param2,this.backgroundMask.width - param1 - param3,param4);
         this.backgroundMask.graphics.drawRect(0,param2 + param4,this.backgroundMask.width,this.backgroundMask.height - param2 - param4);
         this.backgroundMask.graphics.beginFill(16777215,0);
         this.backgroundMask.graphics.drawRect(param1,param2,param3,param4);
         this.backgroundMask.graphics.endFill();
         this.selectedRect.visible = true;
         this.selectedRect.width = 0;
         this.selectedRect.height = 0;
         this.cursorGroup.visible = true;
         this.cursorGroup.x = param1;
         this.cursorGroup.y = param2;
         addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         Mouse.hide();
         this._activeArea = new Rectangle(param1,param2,param3,param4);
      }
      
      public function hide() : void
      {
         removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         this.backgroundMask.graphics.clear();
         this.selectedRect.visible = false;
         this.cursorGroup.visible = false;
         this.toolTipGroup.visible = false;
         validateNow();
      }
      
      private function onMouseUp(param1:MouseEvent) : void
      {
         this._isDown = false;
         this._endPt = new Point(this.cursorGroup.x,this.cursorGroup.y);
         this.dispatchSelectedArea();
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this._isDown = true;
         this._startPt = new Point(this.cursorGroup.x,this.cursorGroup.y);
         this.toolTipGroup.visible = true;
         addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
      }
      
      private function updateSelectedArea() : void
      {
         this.selectedRect.x = this._startPt.x;
         this.selectedRect.y = this._startPt.y;
         this.selectedRect.width = this.cursorGroup.x - this._startPt.x;
         this.selectedRect.height = this.cursorGroup.y - this._startPt.y;
         this._toolTipText.text = "[" + Math.abs(this.cursorGroup.x - this._startPt.x) + "," + Math.abs(this.cursorGroup.y - this._startPt.y) + "]";
         this.toolTipGroup.x = this._startPt.x - this._toolTipText.width;
         this.toolTipGroup.y = this._startPt.y - this._toolTipText.height;
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         var _loc2_:Point = null;
         if(this._startPt == null)
         {
            _loc2_ = new Point(this._activeArea.x,this._activeArea.y);
         }
         else
         {
            _loc2_ = new Point(this._startPt.x,this._startPt.y);
         }
         if(param1.stageX >= _loc2_.x && param1.stageX <= this._activeArea.x + this._activeArea.width)
         {
            this.cursorGroup.x = param1.stageX;
         }
         else if(param1.stageX < _loc2_.x)
         {
            this.cursorGroup.x = _loc2_.x;
         }
         else if(param1.stageX > this._activeArea.x + this._activeArea.width)
         {
            this.cursorGroup.x = this._activeArea.x + this._activeArea.width;
         }
         if(param1.stageY >= _loc2_.y && param1.stageY <= this._activeArea.y + this._activeArea.height)
         {
            this.cursorGroup.y = param1.stageY;
         }
         else if(param1.stageY < _loc2_.y)
         {
            this.cursorGroup.y = _loc2_.y;
         }
         else if(param1.stageY > this._activeArea.y + this._activeArea.height)
         {
            this.cursorGroup.y = this._activeArea.y + this._activeArea.height;
         }
         if(this._isDown)
         {
            this.updateSelectedArea();
         }
      }
      
      private function dispatchSelectedArea() : void
      {
         Mouse.show();
         this.hide();
         var _loc1_:SelectedAreaEvent = new SelectedAreaEvent(SelectedAreaEvent.AREA_SELECTED,this);
         _loc1_.startPt = this._startPt;
         _loc1_.endPt = this._endPt;
         dispatchEvent(_loc1_);
         this._startPt = this._endPt = null;
      }
      
      private function _ScreenCapTool_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.initialized(this,"backgroundMask");
         this.backgroundMask = _loc1_;
         BindingManager.executeBindings(this,"backgroundMask",this.backgroundMask);
         return _loc1_;
      }
      
      private function _ScreenCapTool_Group2_i() : Group
      {
         var _loc1_:Group = null;
         _loc1_ = new Group();
         _loc1_.visible = false;
         _loc1_.mxmlContent = [this._ScreenCapTool_Rect1_c(),this._ScreenCapTool_Label1_i()];
         _loc1_.id = "toolTipGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.toolTipGroup = _loc1_;
         BindingManager.executeBindings(this,"toolTipGroup",this.toolTipGroup);
         return _loc1_;
      }
      
      private function _ScreenCapTool_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._ScreenCapTool_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ScreenCapTool_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16776960;
         return _loc1_;
      }
      
      private function _ScreenCapTool_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("paddingLeft",2);
         _loc1_.setStyle("paddingRight",2);
         _loc1_.setStyle("paddingTop",2);
         _loc1_.setStyle("paddingBottom",2);
         _loc1_.id = "_toolTipText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._toolTipText = _loc1_;
         BindingManager.executeBindings(this,"_toolTipText",this._toolTipText);
         return _loc1_;
      }
      
      private function _ScreenCapTool_Rect2_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.visible = false;
         _loc1_.fill = this._ScreenCapTool_SolidColor2_c();
         _loc1_.initialized(this,"selectedRect");
         this.selectedRect = _loc1_;
         BindingManager.executeBindings(this,"selectedRect",this.selectedRect);
         return _loc1_;
      }
      
      private function _ScreenCapTool_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16552448;
         _loc1_.alpha = 0.2;
         return _loc1_;
      }
      
      private function _ScreenCapTool_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 0;
         _loc1_.height = 0;
         _loc1_.visible = false;
         _loc1_.mxmlContent = [this._ScreenCapTool_Path1_c()];
         _loc1_.id = "cursorGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.cursorGroup = _loc1_;
         BindingManager.executeBindings(this,"cursorGroup",this.cursorGroup);
         return _loc1_;
      }
      
      private function _ScreenCapTool_Path1_c() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.data = "M 0 -10 l 20 0 m -10 -10 l 0 20";
         _loc1_.stroke = this._ScreenCapTool_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ScreenCapTool_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 0;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _toolTipText() : Label
      {
         return this._1880802801_toolTipText;
      }
      
      public function set _toolTipText(param1:Label) : void
      {
         var _loc2_:Object = this._1880802801_toolTipText;
         if(_loc2_ !== param1)
         {
            this._1880802801_toolTipText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_toolTipText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get backgroundMask() : SpriteVisualElement
      {
         return this._1427278138backgroundMask;
      }
      
      public function set backgroundMask(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1427278138backgroundMask;
         if(_loc2_ !== param1)
         {
            this._1427278138backgroundMask = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"backgroundMask",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get cursorGroup() : Group
      {
         return this._1591961399cursorGroup;
      }
      
      public function set cursorGroup(param1:Group) : void
      {
         var _loc2_:Object = this._1591961399cursorGroup;
         if(_loc2_ !== param1)
         {
            this._1591961399cursorGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cursorGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get selectedRect() : Rect
      {
         return this._1754531041selectedRect;
      }
      
      public function set selectedRect(param1:Rect) : void
      {
         var _loc2_:Object = this._1754531041selectedRect;
         if(_loc2_ !== param1)
         {
            this._1754531041selectedRect = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"selectedRect",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get toolTipGroup() : Group
      {
         return this._267199580toolTipGroup;
      }
      
      public function set toolTipGroup(param1:Group) : void
      {
         var _loc2_:Object = this._267199580toolTipGroup;
         if(_loc2_ !== param1)
         {
            this._267199580toolTipGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"toolTipGroup",_loc2_,param1));
            }
         }
      }
   }
}
