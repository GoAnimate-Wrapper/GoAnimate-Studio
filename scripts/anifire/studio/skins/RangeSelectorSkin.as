package anifire.studio.skins
{
   import anifire.studio.components.RangeSelector;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import spark.components.Group;
   import spark.components.HSlider;
   import spark.components.Label;
   import spark.components.supportClasses.Skin;
   import spark.primitives.Path;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class RangeSelectorSkin extends Skin implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _1290911217backgroundGroup:Group;
      
      private var _1427278138backgroundMask:Group;
      
      private var _1427430450backgroundRect:Rect;
      
      private var _1601543580endSlider:HSlider;
      
      private var _1184053038labelDisplay:Label;
      
      private var _1121299823rectangle:Rect;
      
      private var _1873815581startSlider:HSlider;
      
      private var _1497762312triangle:Path;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:RangeSelector;
      
      public function RangeSelectorSkin()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._RangeSelectorSkin_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_skins_RangeSelectorSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return RangeSelectorSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.minWidth = 60;
         this.minHeight = 44;
         this.mxmlContent = [this._RangeSelectorSkin_Label1_i(),this._RangeSelectorSkin_Group1_i(),this._RangeSelectorSkin_Group2_i(),this._RangeSelectorSkin_HSlider1_i(),this._RangeSelectorSkin_HSlider2_i()];
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         RangeSelectorSkin._watcherSetupUtil = param1;
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
         var _loc3_:Number = this.hostComponent.maximum - this.hostComponent.minimum;
         var _loc4_:Number = param1 - 14;
         this.triangle.x = this.hostComponent.startValue / _loc3_ * _loc4_;
         this.triangle.width = (this.hostComponent.endValue - this.hostComponent.startValue) / _loc3_ * _loc4_;
         this.rectangle.x = this.triangle.x + this.triangle.width;
         this.rectangle.width = _loc4_ - this.rectangle.x;
      }
      
      private function _RangeSelectorSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.verticalCenter = 0;
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",this.labelDisplay);
         return _loc1_;
      }
      
      private function _RangeSelectorSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 7;
         _loc1_.right = 7;
         _loc1_.top = 11;
         _loc1_.bottom = 11;
         _loc1_.mxmlContent = [this._RangeSelectorSkin_Rect1_i(),this._RangeSelectorSkin_Path1_i(),this._RangeSelectorSkin_Rect2_i()];
         _loc1_.id = "backgroundGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.backgroundGroup = _loc1_;
         BindingManager.executeBindings(this,"backgroundGroup",this.backgroundGroup);
         return _loc1_;
      }
      
      private function _RangeSelectorSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._RangeSelectorSkin_SolidColor1_c();
         _loc1_.initialized(this,"backgroundRect");
         this.backgroundRect = _loc1_;
         BindingManager.executeBindings(this,"backgroundRect",this.backgroundRect);
         return _loc1_;
      }
      
      private function _RangeSelectorSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 14678781;
         return _loc1_;
      }
      
      private function _RangeSelectorSkin_Path1_i() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.data = "M 0 1 l 1 0 l 0 -1 z";
         _loc1_.fill = this._RangeSelectorSkin_SolidColor2_c();
         _loc1_.initialized(this,"triangle");
         this.triangle = _loc1_;
         BindingManager.executeBindings(this,"triangle",this.triangle);
         return _loc1_;
      }
      
      private function _RangeSelectorSkin_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 5824968;
         return _loc1_;
      }
      
      private function _RangeSelectorSkin_Rect2_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._RangeSelectorSkin_SolidColor3_c();
         _loc1_.initialized(this,"rectangle");
         this.rectangle = _loc1_;
         BindingManager.executeBindings(this,"rectangle",this.rectangle);
         return _loc1_;
      }
      
      private function _RangeSelectorSkin_SolidColor3_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 5824968;
         return _loc1_;
      }
      
      private function _RangeSelectorSkin_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 7;
         _loc1_.right = 7;
         _loc1_.top = 11;
         _loc1_.bottom = 11;
         _loc1_.mxmlContent = [this._RangeSelectorSkin_Rect3_c()];
         _loc1_.id = "backgroundMask";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.backgroundMask = _loc1_;
         BindingManager.executeBindings(this,"backgroundMask",this.backgroundMask);
         return _loc1_;
      }
      
      private function _RangeSelectorSkin_Rect3_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.radiusX = 4;
         _loc1_.fill = this._RangeSelectorSkin_SolidColor4_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _RangeSelectorSkin_SolidColor4_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         return _loc1_;
      }
      
      private function _RangeSelectorSkin_HSlider1_i() : HSlider
      {
         var _loc1_:HSlider = new HSlider();
         _loc1_.top = 0;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.buttonMode = true;
         _loc1_.setStyle("skinClass",RangeSelectorSliderSkin);
         _loc1_.id = "endSlider";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.endSlider = _loc1_;
         BindingManager.executeBindings(this,"endSlider",this.endSlider);
         return _loc1_;
      }
      
      private function _RangeSelectorSkin_HSlider2_i() : HSlider
      {
         var _loc1_:HSlider = new HSlider();
         _loc1_.bottom = 0;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.buttonMode = true;
         _loc1_.setStyle("skinClass",RangeSelectorSliderSkin);
         _loc1_.id = "startSlider";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.startSlider = _loc1_;
         BindingManager.executeBindings(this,"startSlider",this.startSlider);
         return _loc1_;
      }
      
      private function _RangeSelectorSkin_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"backgroundGroup.mask","backgroundMask");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get backgroundGroup() : Group
      {
         return this._1290911217backgroundGroup;
      }
      
      public function set backgroundGroup(param1:Group) : void
      {
         var _loc2_:Object = this._1290911217backgroundGroup;
         if(_loc2_ !== param1)
         {
            this._1290911217backgroundGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"backgroundGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get backgroundMask() : Group
      {
         return this._1427278138backgroundMask;
      }
      
      public function set backgroundMask(param1:Group) : void
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
      public function get backgroundRect() : Rect
      {
         return this._1427430450backgroundRect;
      }
      
      public function set backgroundRect(param1:Rect) : void
      {
         var _loc2_:Object = this._1427430450backgroundRect;
         if(_loc2_ !== param1)
         {
            this._1427430450backgroundRect = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"backgroundRect",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get endSlider() : HSlider
      {
         return this._1601543580endSlider;
      }
      
      public function set endSlider(param1:HSlider) : void
      {
         var _loc2_:Object = this._1601543580endSlider;
         if(_loc2_ !== param1)
         {
            this._1601543580endSlider = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"endSlider",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get labelDisplay() : Label
      {
         return this._1184053038labelDisplay;
      }
      
      public function set labelDisplay(param1:Label) : void
      {
         var _loc2_:Object = this._1184053038labelDisplay;
         if(_loc2_ !== param1)
         {
            this._1184053038labelDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"labelDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rectangle() : Rect
      {
         return this._1121299823rectangle;
      }
      
      public function set rectangle(param1:Rect) : void
      {
         var _loc2_:Object = this._1121299823rectangle;
         if(_loc2_ !== param1)
         {
            this._1121299823rectangle = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rectangle",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get startSlider() : HSlider
      {
         return this._1873815581startSlider;
      }
      
      public function set startSlider(param1:HSlider) : void
      {
         var _loc2_:Object = this._1873815581startSlider;
         if(_loc2_ !== param1)
         {
            this._1873815581startSlider = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"startSlider",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get triangle() : Path
      {
         return this._1497762312triangle;
      }
      
      public function set triangle(param1:Path) : void
      {
         var _loc2_:Object = this._1497762312triangle;
         if(_loc2_ !== param1)
         {
            this._1497762312triangle = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"triangle",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : RangeSelector
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:RangeSelector) : void
      {
         var _loc2_:Object = this._213507019hostComponent;
         if(_loc2_ !== param1)
         {
            this._213507019hostComponent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hostComponent",_loc2_,param1));
            }
         }
      }
   }
}
