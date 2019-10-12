package anifire.studio.components
{
   import anifire.constant.AnimeConstants;
   import anifire.event.StudioEvent;
   import anifire.managers.ServerConnector;
   import anifire.studio.core.Console;
   import anifire.util.UtilString;
   import anifire.util.UtilUnitConvert;
   import anifire.util.UtilUser;
   import flash.events.Event;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import spark.components.Group;
   import spark.components.Label;
   import spark.primitives.Rect;
   
   public class TimelineRuler extends Group
   {
      
      public static const drawColor:uint = 13355733;
      
      public static const textColor:uint = 9739439;
       
      
      private var _1346658131durationLimitLabel:Label;
      
      private var _263713807overlayGroup:Group;
      
      private var _989821177rulerDrawArea:Group;
      
      private var _74835753rulerGroup:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _drawnWidth:int = 1;
      
      public function TimelineRuler()
      {
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._TimelineRuler_Group2_i()];
         this.addEventListener("creationComplete",this.___TimelineRuler_Group1_creationComplete);
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
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         this.redraw();
      }
      
      protected function redraw() : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Label = null;
         var _loc9_:int = 0;
         var _loc1_:Number = this.rulerGroup.horizontalScrollPosition + this.rulerGroup.getLayoutBoundsWidth();
         var _loc2_:Number = this.rulerGroup.getLayoutBoundsHeight();
         if(_loc1_ > this._drawnWidth)
         {
            this.rulerDrawArea.graphics.lineStyle(0,drawColor);
            _loc3_ = 0.25 * AnimeConstants.PIXEL_PER_SEC;
            _loc4_ = AnimeConstants.PIXEL_PER_SEC;
            _loc5_ = AnimeConstants.PIXEL_PER_SEC * 5;
            _loc6_ = this._drawnWidth;
            while(_loc6_ <= _loc1_)
            {
               if(_loc6_ % _loc3_ == 0)
               {
                  _loc7_ = _loc6_ % _loc4_ == 0?15:8;
                  this.rulerDrawArea.graphics.moveTo(_loc6_,_loc2_ - _loc7_);
                  this.rulerDrawArea.graphics.lineTo(_loc6_,_loc2_ - 1);
                  if(_loc6_ % _loc5_ == 0)
                  {
                     _loc8_ = new Label();
                     _loc9_ = _loc6_ / AnimeConstants.PIXEL_PER_SEC;
                     if(_loc9_ >= 60)
                     {
                        _loc8_.text = UtilString.secToTimeString(_loc9_,false);
                     }
                     else
                     {
                        _loc8_.text = _loc9_ + "s";
                     }
                     _loc8_.setStyle("fontSize",12);
                     _loc8_.setStyle("fontWeight","bold");
                     _loc8_.setStyle("color",textColor);
                     _loc8_.x = _loc6_;
                     _loc8_.y = 12;
                     this.rulerDrawArea.addElement(_loc8_);
                  }
               }
               _loc6_++;
            }
            this._drawnWidth = _loc1_;
         }
      }
      
      public function scroll(param1:Number) : void
      {
         this.rulerGroup.horizontalScrollPosition = param1;
         invalidateDisplayList();
      }
      
      protected function init() : void
      {
         this.updateDurationLimitMarker();
         ServerConnector.instance.addEventListener(StudioEvent.UPGRADE_COMPLETE,this.onUserUpgradeComplete);
      }
      
      protected function updateDurationLimitMarker() : void
      {
         var _loc1_:int = 0;
         if(UtilUser.userType == UtilUser.BASIC_USER)
         {
            _loc1_ = Console.getConsole().basicUserDurationLimit;
            this.durationLimitLabel.text = UtilString.secToTimeString(_loc1_,false);
            this.overlayGroup.x = UtilUnitConvert.frameToPixel(UtilUnitConvert.durationToFrame(_loc1_));
         }
         else
         {
            this.overlayGroup.visible = false;
         }
      }
      
      private function onUserUpgradeComplete(param1:Event) : void
      {
         this.updateDurationLimitMarker();
      }
      
      private function _TimelineRuler_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.clipAndEnableScrolling = true;
         _loc1_.mxmlContent = [this._TimelineRuler_Group3_i(),this._TimelineRuler_Group4_i()];
         _loc1_.id = "rulerGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.rulerGroup = _loc1_;
         BindingManager.executeBindings(this,"rulerGroup",this.rulerGroup);
         return _loc1_;
      }
      
      private function _TimelineRuler_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentHeight = 100;
         _loc1_.id = "rulerDrawArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.rulerDrawArea = _loc1_;
         BindingManager.executeBindings(this,"rulerDrawArea",this.rulerDrawArea);
         return _loc1_;
      }
      
      private function _TimelineRuler_Group4_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentHeight = 100;
         _loc1_.width = 0;
         _loc1_.mxmlContent = [this._TimelineRuler_Group5_c()];
         _loc1_.id = "overlayGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.overlayGroup = _loc1_;
         BindingManager.executeBindings(this,"overlayGroup",this.overlayGroup);
         return _loc1_;
      }
      
      private function _TimelineRuler_Group5_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._TimelineRuler_Rect1_c(),this._TimelineRuler_Label1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TimelineRuler_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._TimelineRuler_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TimelineRuler_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16711680;
         return _loc1_;
      }
      
      private function _TimelineRuler_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("fontSize",14);
         _loc1_.setStyle("color",16777215);
         _loc1_.setStyle("paddingLeft",5);
         _loc1_.setStyle("paddingRight",5);
         _loc1_.setStyle("paddingTop",3);
         _loc1_.setStyle("paddingBottom",2);
         _loc1_.id = "durationLimitLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.durationLimitLabel = _loc1_;
         BindingManager.executeBindings(this,"durationLimitLabel",this.durationLimitLabel);
         return _loc1_;
      }
      
      public function ___TimelineRuler_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      [Bindable(event="propertyChange")]
      public function get durationLimitLabel() : Label
      {
         return this._1346658131durationLimitLabel;
      }
      
      public function set durationLimitLabel(param1:Label) : void
      {
         var _loc2_:Object = this._1346658131durationLimitLabel;
         if(_loc2_ !== param1)
         {
            this._1346658131durationLimitLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"durationLimitLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get overlayGroup() : Group
      {
         return this._263713807overlayGroup;
      }
      
      public function set overlayGroup(param1:Group) : void
      {
         var _loc2_:Object = this._263713807overlayGroup;
         if(_loc2_ !== param1)
         {
            this._263713807overlayGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"overlayGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rulerDrawArea() : Group
      {
         return this._989821177rulerDrawArea;
      }
      
      public function set rulerDrawArea(param1:Group) : void
      {
         var _loc2_:Object = this._989821177rulerDrawArea;
         if(_loc2_ !== param1)
         {
            this._989821177rulerDrawArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rulerDrawArea",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rulerGroup() : Group
      {
         return this._74835753rulerGroup;
      }
      
      public function set rulerGroup(param1:Group) : void
      {
         var _loc2_:Object = this._74835753rulerGroup;
         if(_loc2_ !== param1)
         {
            this._74835753rulerGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rulerGroup",_loc2_,param1));
            }
         }
      }
   }
}
