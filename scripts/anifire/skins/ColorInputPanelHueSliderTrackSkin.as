package anifire.skins
{
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.states.State;
   import spark.components.Button;
   import spark.components.Group;
   import spark.primitives.BitmapImage;
   import spark.primitives.Rect;
   import spark.skins.SparkSkin;
   
   use namespace mx_internal;
   
   public class ColorInputPanelHueSliderTrackSkin extends SparkSkin implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _74026253maskGroup:Group;
      
      private var _2136852217sliderContentGroup:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__styles_images_colorpalette_hue_slider_bg_png_1028489132:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:Button;
      
      public function ColorInputPanelHueSliderTrackSkin()
      {
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__styles_images_colorpalette_hue_slider_bg_png_1028489132 = ColorInputPanelHueSliderTrackSkin__embed_mxml__styles_images_colorpalette_hue_slider_bg_png_1028489132;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._ColorInputPanelHueSliderTrackSkin_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_skins_ColorInputPanelHueSliderTrackSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ColorInputPanelHueSliderTrackSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._ColorInputPanelHueSliderTrackSkin_Group1_i(),this._ColorInputPanelHueSliderTrackSkin_Group2_i(),this._ColorInputPanelHueSliderTrackSkin_Rect2_c()];
         this.currentState = "up";
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"down",
            "overrides":[]
         }),new State({
            "name":"over",
            "overrides":[]
         }),new State({
            "name":"disabled",
            "overrides":[]
         })];
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         ColorInputPanelHueSliderTrackSkin._watcherSetupUtil = param1;
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
      
      private function _ColorInputPanelHueSliderTrackSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.mxmlContent = [this._ColorInputPanelHueSliderTrackSkin_BitmapImage1_c()];
         _loc1_.id = "sliderContentGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sliderContentGroup = _loc1_;
         BindingManager.executeBindings(this,"sliderContentGroup",this.sliderContentGroup);
         return _loc1_;
      }
      
      private function _ColorInputPanelHueSliderTrackSkin_BitmapImage1_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fillMode = "scale";
         _loc1_.scaleMode = "stretch";
         _loc1_.source = this._embed_mxml__styles_images_colorpalette_hue_slider_bg_png_1028489132;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ColorInputPanelHueSliderTrackSkin_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 5;
         _loc1_.right = 5;
         _loc1_.top = 4;
         _loc1_.bottom = 4;
         _loc1_.mxmlContent = [this._ColorInputPanelHueSliderTrackSkin_Rect1_c()];
         _loc1_.id = "maskGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.maskGroup = _loc1_;
         BindingManager.executeBindings(this,"maskGroup",this.maskGroup);
         return _loc1_;
      }
      
      private function _ColorInputPanelHueSliderTrackSkin_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.radiusX = 7;
         _loc1_.radiusY = 7;
         _loc1_.fill = this._ColorInputPanelHueSliderTrackSkin_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ColorInputPanelHueSliderTrackSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         return _loc1_;
      }
      
      private function _ColorInputPanelHueSliderTrackSkin_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._ColorInputPanelHueSliderTrackSkin_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ColorInputPanelHueSliderTrackSkin_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      private function _ColorInputPanelHueSliderTrackSkin_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"sliderContentGroup.mask","maskGroup");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get maskGroup() : Group
      {
         return this._74026253maskGroup;
      }
      
      public function set maskGroup(param1:Group) : void
      {
         var _loc2_:Object = this._74026253maskGroup;
         if(_loc2_ !== param1)
         {
            this._74026253maskGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"maskGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sliderContentGroup() : Group
      {
         return this._2136852217sliderContentGroup;
      }
      
      public function set sliderContentGroup(param1:Group) : void
      {
         var _loc2_:Object = this._2136852217sliderContentGroup;
         if(_loc2_ !== param1)
         {
            this._2136852217sliderContentGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sliderContentGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : Button
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:Button) : void
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
