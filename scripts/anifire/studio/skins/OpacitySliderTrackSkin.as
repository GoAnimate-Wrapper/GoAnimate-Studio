package anifire.studio.skins
{
   import anifire.studio.components.OpacitySliderTrack;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.GradientEntry;
   import mx.graphics.LinearGradient;
   import mx.graphics.SolidColor;
   import mx.states.State;
   import spark.components.Group;
   import spark.primitives.BitmapImage;
   import spark.primitives.Rect;
   import spark.skins.SparkSkin;
   
   use namespace mx_internal;
   
   public class OpacitySliderTrackSkin extends SparkSkin implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _OpacitySliderTrackSkin_GradientEntry1:GradientEntry;
      
      public var _OpacitySliderTrackSkin_GradientEntry2:GradientEntry;
      
      private var _1773258774baseColorRect:Rect;
      
      private var _74026253maskGroup:Group;
      
      private var _2136852217sliderContentGroup:Group;
      
      private var _78338822sliderImage:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__styles_images_panel_opacity_slider_track_png_277908951:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:OpacitySliderTrack;
      
      public function OpacitySliderTrackSkin()
      {
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__styles_images_panel_opacity_slider_track_png_277908951 = OpacitySliderTrackSkin__embed_mxml__styles_images_panel_opacity_slider_track_png_277908951;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._OpacitySliderTrackSkin_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_skins_OpacitySliderTrackSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return OpacitySliderTrackSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._OpacitySliderTrackSkin_Group1_i(),this._OpacitySliderTrackSkin_Group2_i(),this._OpacitySliderTrackSkin_Rect3_c()];
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
         OpacitySliderTrackSkin._watcherSetupUtil = param1;
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
      
      private function _OpacitySliderTrackSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.mxmlContent = [this._OpacitySliderTrackSkin_BitmapImage1_i(),this._OpacitySliderTrackSkin_Rect1_i()];
         _loc1_.id = "sliderContentGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sliderContentGroup = _loc1_;
         BindingManager.executeBindings(this,"sliderContentGroup",this.sliderContentGroup);
         return _loc1_;
      }
      
      private function _OpacitySliderTrackSkin_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fillMode = "repeat";
         _loc1_.source = this._embed_mxml__styles_images_panel_opacity_slider_track_png_277908951;
         _loc1_.verticalCenter = 0;
         _loc1_.initialized(this,"sliderImage");
         this.sliderImage = _loc1_;
         BindingManager.executeBindings(this,"sliderImage",this.sliderImage);
         return _loc1_;
      }
      
      private function _OpacitySliderTrackSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._OpacitySliderTrackSkin_LinearGradient1_c();
         _loc1_.initialized(this,"baseColorRect");
         this.baseColorRect = _loc1_;
         BindingManager.executeBindings(this,"baseColorRect",this.baseColorRect);
         return _loc1_;
      }
      
      private function _OpacitySliderTrackSkin_LinearGradient1_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.entries = [this._OpacitySliderTrackSkin_GradientEntry1_i(),this._OpacitySliderTrackSkin_GradientEntry2_i()];
         return _loc1_;
      }
      
      private function _OpacitySliderTrackSkin_GradientEntry1_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.alpha = 0;
         this._OpacitySliderTrackSkin_GradientEntry1 = _loc1_;
         BindingManager.executeBindings(this,"_OpacitySliderTrackSkin_GradientEntry1",this._OpacitySliderTrackSkin_GradientEntry1);
         return _loc1_;
      }
      
      private function _OpacitySliderTrackSkin_GradientEntry2_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.alpha = 1;
         this._OpacitySliderTrackSkin_GradientEntry2 = _loc1_;
         BindingManager.executeBindings(this,"_OpacitySliderTrackSkin_GradientEntry2",this._OpacitySliderTrackSkin_GradientEntry2);
         return _loc1_;
      }
      
      private function _OpacitySliderTrackSkin_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 4;
         _loc1_.right = 4;
         _loc1_.top = 4;
         _loc1_.bottom = 6;
         _loc1_.mxmlContent = [this._OpacitySliderTrackSkin_Rect2_c()];
         _loc1_.id = "maskGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.maskGroup = _loc1_;
         BindingManager.executeBindings(this,"maskGroup",this.maskGroup);
         return _loc1_;
      }
      
      private function _OpacitySliderTrackSkin_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.radiusX = 7;
         _loc1_.radiusY = 7;
         _loc1_.fill = this._OpacitySliderTrackSkin_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _OpacitySliderTrackSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         return _loc1_;
      }
      
      private function _OpacitySliderTrackSkin_Rect3_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._OpacitySliderTrackSkin_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _OpacitySliderTrackSkin_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      private function _OpacitySliderTrackSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,null,"sliderContentGroup.mask","maskGroup");
         result[1] = new Binding(this,function():uint
         {
            return hostComponent.baseColor;
         },null,"_OpacitySliderTrackSkin_GradientEntry1.color");
         result[2] = new Binding(this,function():uint
         {
            return hostComponent.baseColor;
         },null,"_OpacitySliderTrackSkin_GradientEntry2.color");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get baseColorRect() : Rect
      {
         return this._1773258774baseColorRect;
      }
      
      public function set baseColorRect(param1:Rect) : void
      {
         var _loc2_:Object = this._1773258774baseColorRect;
         if(_loc2_ !== param1)
         {
            this._1773258774baseColorRect = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"baseColorRect",_loc2_,param1));
            }
         }
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
      public function get sliderImage() : BitmapImage
      {
         return this._78338822sliderImage;
      }
      
      public function set sliderImage(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._78338822sliderImage;
         if(_loc2_ !== param1)
         {
            this._78338822sliderImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sliderImage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : OpacitySliderTrack
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:OpacitySliderTrack) : void
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
