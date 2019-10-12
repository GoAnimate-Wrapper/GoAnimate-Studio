package anifire.studio.skins
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
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Label;
   import spark.components.ToggleButton;
   import spark.primitives.BitmapImage;
   import spark.primitives.Rect;
   import spark.skins.SparkSkin;
   
   use namespace mx_internal;
   
   public class FontWeightToggleButtonSkin extends SparkSkin implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _2103383781_FontWeightToggleButtonSkin_BitmapImage1:BitmapImage;
      
      private var _37124061_FontWeightToggleButtonSkin_SolidColor1:SolidColor;
      
      private var _1184053038labelDisplay:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__styles_images_panel_text_style_bold_on_png_1572608329:Class;
      
      private var _embed_mxml__styles_images_panel_text_style_bold_png_1991265133:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:ToggleButton;
      
      public function FontWeightToggleButtonSkin()
      {
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__styles_images_panel_text_style_bold_on_png_1572608329 = FontWeightToggleButtonSkin__embed_mxml__styles_images_panel_text_style_bold_on_png_1572608329;
         this._embed_mxml__styles_images_panel_text_style_bold_png_1991265133 = FontWeightToggleButtonSkin__embed_mxml__styles_images_panel_text_style_bold_png_1991265133;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._FontWeightToggleButtonSkin_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_skins_FontWeightToggleButtonSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return FontWeightToggleButtonSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 38;
         this.height = 34;
         this.mxmlContent = [this._FontWeightToggleButtonSkin_Rect1_c(),this._FontWeightToggleButtonSkin_BitmapImage1_i(),this._FontWeightToggleButtonSkin_Label1_i()];
         this.currentState = "up";
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "stateGroups":["overStates","overDownStates"],
            "overrides":[]
         }),new State({
            "name":"down",
            "stateGroups":["downStates","overDownStates"],
            "overrides":[]
         }),new State({
            "name":"disabled",
            "stateGroups":["disabledStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            })]
         }),new State({
            "name":"upAndSelected",
            "stateGroups":["selectedStates","selectedUpStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_FontWeightToggleButtonSkin_SolidColor1",
               "name":"color",
               "value":4439206
            }),new SetProperty().initializeFromObject({
               "target":"_FontWeightToggleButtonSkin_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__styles_images_panel_text_style_bold_on_png_1572608329
            })]
         }),new State({
            "name":"overAndSelected",
            "stateGroups":["selectedStates","overDownSelectedStates","overStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_FontWeightToggleButtonSkin_SolidColor1",
               "name":"color",
               "value":4439206
            }),new SetProperty().initializeFromObject({
               "target":"_FontWeightToggleButtonSkin_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__styles_images_panel_text_style_bold_on_png_1572608329
            })]
         }),new State({
            "name":"downAndSelected",
            "stateGroups":["selectedStates","downStates","overDownSelectedStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_FontWeightToggleButtonSkin_SolidColor1",
               "name":"color",
               "value":4439206
            }),new SetProperty().initializeFromObject({
               "target":"_FontWeightToggleButtonSkin_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__styles_images_panel_text_style_bold_on_png_1572608329
            })]
         }),new State({
            "name":"disabledAndSelected",
            "stateGroups":["selectedStates","selectedUpStates","disabledStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            }),new SetProperty().initializeFromObject({
               "target":"_FontWeightToggleButtonSkin_SolidColor1",
               "name":"color",
               "value":4439206
            }),new SetProperty().initializeFromObject({
               "target":"_FontWeightToggleButtonSkin_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__styles_images_panel_text_style_bold_on_png_1572608329
            })]
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
         FontWeightToggleButtonSkin._watcherSetupUtil = param1;
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
      
      private function _FontWeightToggleButtonSkin_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.radiusX = 2;
         _loc1_.fill = this._FontWeightToggleButtonSkin_SolidColor1_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FontWeightToggleButtonSkin_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 15066597;
         this._FontWeightToggleButtonSkin_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_FontWeightToggleButtonSkin_SolidColor1",this._FontWeightToggleButtonSkin_SolidColor1);
         return _loc1_;
      }
      
      private function _FontWeightToggleButtonSkin_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.source = this._embed_mxml__styles_images_panel_text_style_bold_png_1991265133;
         _loc1_.initialized(this,"_FontWeightToggleButtonSkin_BitmapImage1");
         this._FontWeightToggleButtonSkin_BitmapImage1 = _loc1_;
         BindingManager.executeBindings(this,"_FontWeightToggleButtonSkin_BitmapImage1",this._FontWeightToggleButtonSkin_BitmapImage1);
         return _loc1_;
      }
      
      private function _FontWeightToggleButtonSkin_Label1_i() : Label
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
      
      private function _FontWeightToggleButtonSkin_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"this.baselinePositionElement","labelDisplay");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _FontWeightToggleButtonSkin_BitmapImage1() : BitmapImage
      {
         return this._2103383781_FontWeightToggleButtonSkin_BitmapImage1;
      }
      
      public function set _FontWeightToggleButtonSkin_BitmapImage1(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._2103383781_FontWeightToggleButtonSkin_BitmapImage1;
         if(_loc2_ !== param1)
         {
            this._2103383781_FontWeightToggleButtonSkin_BitmapImage1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_FontWeightToggleButtonSkin_BitmapImage1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _FontWeightToggleButtonSkin_SolidColor1() : SolidColor
      {
         return this._37124061_FontWeightToggleButtonSkin_SolidColor1;
      }
      
      public function set _FontWeightToggleButtonSkin_SolidColor1(param1:SolidColor) : void
      {
         var _loc2_:Object = this._37124061_FontWeightToggleButtonSkin_SolidColor1;
         if(_loc2_ !== param1)
         {
            this._37124061_FontWeightToggleButtonSkin_SolidColor1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_FontWeightToggleButtonSkin_SolidColor1",_loc2_,param1));
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
      public function get hostComponent() : ToggleButton
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:ToggleButton) : void
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
