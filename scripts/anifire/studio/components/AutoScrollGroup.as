package anifire.studio.components
{
   import anifire.studio.core.AnimeSound;
   import anifire.studio.core.BackgroundThumb;
   import anifire.studio.core.SoundThumb;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IUIComponent;
   import mx.events.DragEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.managers.DragManager;
   import spark.components.Group;
   import spark.primitives.Rect;
   
   public class AutoScrollGroup extends Group
   {
       
      
      private var _1717970532leftEdge:Group;
      
      private var _1569573383rightEdge:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _scrollBar:TimelineHScrollBar;
      
      private var _timer:Timer;
      
      private var _dx:Number;
      
      public function AutoScrollGroup()
      {
         this._timer = new Timer(50);
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._AutoScrollGroup_Group2_i(),this._AutoScrollGroup_Group3_i()];
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
      
      public function set scrollBar(param1:TimelineHScrollBar) : void
      {
         if(param1)
         {
            this._scrollBar = param1;
            param1.addEventListener(Event.CHANGE,this.onScrollBarScroll);
         }
      }
      
      private function onScrollBarScroll(param1:Event) : void
      {
         this.leftEdge.visible = this._scrollBar.value > 0;
         this.rightEdge.visible = this._scrollBar.value < this._scrollBar.maximum;
         this.leftEdge.x = this._scrollBar.value > 0?Number(0):Number(-100);
         this.rightEdge.x = this._scrollBar.value < this._scrollBar.maximum?Number(this.width - 100):Number(this.width);
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         if(!DragManager.isDragging)
         {
            this._timer.stop();
         }
         this._scrollBar.scroll(this._scrollBar.value + this._dx);
         this.leftEdge.visible = this._scrollBar.value > 0;
         this.rightEdge.visible = this._scrollBar.value < this._scrollBar.maximum;
         this.leftEdge.x = this._scrollBar.value > 0?Number(0):Number(-100);
         this.rightEdge.x = this._scrollBar.value < this._scrollBar.maximum?Number(this.width - 100):Number(this.width);
      }
      
      private function onDragEnterLeftEdge(param1:DragEvent) : void
      {
         if(param1.dragSource.hasFormat(BackgroundThumb.STARTER_DRAG_DATA_FORMAT) || param1.dragSource.hasFormat(SceneElement.DRAG_DATA_FORMAT) || param1.dragSource.hasFormat(AnimeSound.DRAG_DATA_FORMAT) || param1.dragSource.hasFormat(SoundThumb.DRAG_DATA_FORMAT))
         {
            DragManager.acceptDragDrop(param1.target as IUIComponent);
            DragManager.showFeedback(DragManager.NONE);
            this._dx = -this._scrollBar.stepSize;
            this._timer.addEventListener(TimerEvent.TIMER,this.onTimer);
            this._timer.start();
         }
      }
      
      private function onDragEnterRightEdge(param1:DragEvent) : void
      {
         if(param1.dragSource.hasFormat(BackgroundThumb.STARTER_DRAG_DATA_FORMAT) || param1.dragSource.hasFormat(SceneElement.DRAG_DATA_FORMAT) || param1.dragSource.hasFormat(AnimeSound.DRAG_DATA_FORMAT) || param1.dragSource.hasFormat(SoundThumb.DRAG_DATA_FORMAT))
         {
            DragManager.acceptDragDrop(param1.target as IUIComponent);
            DragManager.showFeedback(DragManager.NONE);
            this._dx = this._scrollBar.stepSize;
            this._timer.addEventListener(TimerEvent.TIMER,this.onTimer);
            this._timer.start();
         }
      }
      
      private function onDragExit(param1:DragEvent) : void
      {
         this._timer.stop();
         this.visible = false;
      }
      
      protected function onRollOverLeftEdge(param1:MouseEvent) : void
      {
      }
      
      protected function onRollOutLeftEdge(param1:MouseEvent) : void
      {
         if(!DragManager.isDragging)
         {
            this._timer.stop();
         }
      }
      
      protected function onRollOverRightEdge(param1:MouseEvent) : void
      {
      }
      
      protected function onRollOutRightEdge(param1:MouseEvent) : void
      {
         if(!DragManager.isDragging)
         {
            this._timer.stop();
         }
      }
      
      private function _AutoScrollGroup_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 40;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._AutoScrollGroup_Rect1_c()];
         _loc1_.addEventListener("dragEnter",this.__leftEdge_dragEnter);
         _loc1_.addEventListener("dragDrop",this.__leftEdge_dragDrop);
         _loc1_.addEventListener("dragExit",this.__leftEdge_dragExit);
         _loc1_.addEventListener("rollOver",this.__leftEdge_rollOver);
         _loc1_.addEventListener("rollOut",this.__leftEdge_rollOut);
         _loc1_.id = "leftEdge";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.leftEdge = _loc1_;
         BindingManager.executeBindings(this,"leftEdge",this.leftEdge);
         return _loc1_;
      }
      
      private function _AutoScrollGroup_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._AutoScrollGroup_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _AutoScrollGroup_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 65280;
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      public function __leftEdge_dragEnter(param1:DragEvent) : void
      {
         this.onDragEnterLeftEdge(param1);
      }
      
      public function __leftEdge_dragDrop(param1:DragEvent) : void
      {
         this.onDragExit(param1);
      }
      
      public function __leftEdge_dragExit(param1:DragEvent) : void
      {
         this.onDragExit(param1);
      }
      
      public function __leftEdge_rollOver(param1:MouseEvent) : void
      {
         this.onRollOverLeftEdge(param1);
      }
      
      public function __leftEdge_rollOut(param1:MouseEvent) : void
      {
         this.onRollOutLeftEdge(param1);
      }
      
      private function _AutoScrollGroup_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 40;
         _loc1_.percentHeight = 100;
         _loc1_.right = 0;
         _loc1_.mxmlContent = [this._AutoScrollGroup_Rect2_c()];
         _loc1_.addEventListener("dragEnter",this.__rightEdge_dragEnter);
         _loc1_.addEventListener("dragDrop",this.__rightEdge_dragDrop);
         _loc1_.addEventListener("dragExit",this.__rightEdge_dragExit);
         _loc1_.addEventListener("rollOver",this.__rightEdge_rollOver);
         _loc1_.addEventListener("rollOut",this.__rightEdge_rollOut);
         _loc1_.id = "rightEdge";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.rightEdge = _loc1_;
         BindingManager.executeBindings(this,"rightEdge",this.rightEdge);
         return _loc1_;
      }
      
      private function _AutoScrollGroup_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._AutoScrollGroup_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _AutoScrollGroup_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 65280;
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      public function __rightEdge_dragEnter(param1:DragEvent) : void
      {
         this.onDragEnterRightEdge(param1);
      }
      
      public function __rightEdge_dragDrop(param1:DragEvent) : void
      {
         this.onDragExit(param1);
      }
      
      public function __rightEdge_dragExit(param1:DragEvent) : void
      {
         this.onDragExit(param1);
      }
      
      public function __rightEdge_rollOver(param1:MouseEvent) : void
      {
         this.onRollOverRightEdge(param1);
      }
      
      public function __rightEdge_rollOut(param1:MouseEvent) : void
      {
         this.onRollOutRightEdge(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get leftEdge() : Group
      {
         return this._1717970532leftEdge;
      }
      
      public function set leftEdge(param1:Group) : void
      {
         var _loc2_:Object = this._1717970532leftEdge;
         if(_loc2_ !== param1)
         {
            this._1717970532leftEdge = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"leftEdge",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rightEdge() : Group
      {
         return this._1569573383rightEdge;
      }
      
      public function set rightEdge(param1:Group) : void
      {
         var _loc2_:Object = this._1569573383rightEdge;
         if(_loc2_ !== param1)
         {
            this._1569573383rightEdge = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rightEdge",_loc2_,param1));
            }
         }
      }
   }
}
