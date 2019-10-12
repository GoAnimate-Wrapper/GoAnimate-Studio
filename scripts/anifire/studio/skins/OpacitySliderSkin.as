package anifire.studio.skins
{
   import anifire.studio.components.FocusTextInput;
   import anifire.studio.components.OpacitySlider;
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
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.utils.StringUtil;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.skins.SparkSkin;
   
   use namespace mx_internal;
   
   public class OpacitySliderSkin extends SparkSkin implements IBindingClient, IStateClient2
   {
      
      private static const exclusions:Array = ["track","thumb"];
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _1184053038labelDisplay:FocusTextInput;
      
      private var _110342614thumb:Button;
      
      private var _110621003track:OpacitySliderTrack;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:OpacitySlider;
      
      public function OpacitySliderSkin()
      {
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._OpacitySliderSkin_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_skins_OpacitySliderSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return OpacitySliderSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.minHeight = 11;
         this.mxmlContent = [this._OpacitySliderSkin_HGroup1_c()];
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"disabled",
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
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
         OpacitySliderSkin._watcherSetupUtil = param1;
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
      
      override public function get colorizeExclusions() : Array
      {
         return exclusions;
      }
      
      override protected function initializationComplete() : void
      {
         useChromeColor = true;
         super.initializationComplete();
      }
      
      override protected function measure() : void
      {
         var _loc1_:Number = this.thumb.getLayoutBoundsX();
         this.thumb.setLayoutBoundsPosition(0,this.thumb.getLayoutBoundsY());
         super.measure();
         this.thumb.setLayoutBoundsPosition(_loc1_,this.thumb.getLayoutBoundsY());
      }
      
      private function _OpacitySliderSkin_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 7;
         _loc1_.mxmlContent = [this._OpacitySliderSkin_Group1_c(),this._OpacitySliderSkin_FocusTextInput1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _OpacitySliderSkin_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._OpacitySliderSkin_OpacitySliderTrack1_i(),this._OpacitySliderSkin_Button1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _OpacitySliderSkin_OpacitySliderTrack1_i() : OpacitySliderTrack
      {
         var _loc1_:OpacitySliderTrack = new OpacitySliderTrack();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.tabEnabled = false;
         _loc1_.setStyle("skinClass",OpacitySliderTrackSkin);
         _loc1_.id = "track";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.track = _loc1_;
         BindingManager.executeBindings(this,"track",this.track);
         return _loc1_;
      }
      
      private function _OpacitySliderSkin_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.top = 1;
         _loc1_.bottom = 0;
         _loc1_.width = 25;
         _loc1_.height = 25;
         _loc1_.tabEnabled = false;
         _loc1_.buttonMode = true;
         _loc1_.setStyle("skinClass",OpacitySliderThumbSkin);
         _loc1_.id = "thumb";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.thumb = _loc1_;
         BindingManager.executeBindings(this,"thumb",this.thumb);
         return _loc1_;
      }
      
      private function _OpacitySliderSkin_FocusTextInput1_i() : FocusTextInput
      {
         var _loc1_:FocusTextInput = new FocusTextInput();
         _loc1_.restrict = "0-9";
         _loc1_.height = 25;
         _loc1_.width = 48;
         _loc1_.focusEnabled = false;
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("fontWeight","normal");
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",this.labelDisplay);
         return _loc1_;
      }
      
      private function _OpacitySliderSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():uint
         {
            return hostComponent.baseColor;
         },null,"track.baseColor");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = StringUtil.substitute("{0}" + OpacitySlider.PERCENTAGE_SYMBOL,hostComponent.value);
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"labelDisplay.text");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get labelDisplay() : FocusTextInput
      {
         return this._1184053038labelDisplay;
      }
      
      public function set labelDisplay(param1:FocusTextInput) : void
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
      public function get thumb() : Button
      {
         return this._110342614thumb;
      }
      
      public function set thumb(param1:Button) : void
      {
         var _loc2_:Object = this._110342614thumb;
         if(_loc2_ !== param1)
         {
            this._110342614thumb = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"thumb",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get track() : OpacitySliderTrack
      {
         return this._110621003track;
      }
      
      public function set track(param1:OpacitySliderTrack) : void
      {
         var _loc2_:Object = this._110621003track;
         if(_loc2_ !== param1)
         {
            this._110621003track = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"track",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : OpacitySlider
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:OpacitySlider) : void
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
