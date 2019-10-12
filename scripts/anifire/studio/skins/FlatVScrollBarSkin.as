package anifire.studio.skins
{
   import anifire.studio.components.FlatVScrollBar;
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
   import mx.states.Transition;
   import spark.components.Button;
   import spark.effects.Fade;
   import spark.primitives.Rect;
   import spark.skins.SparkSkin;
   
   use namespace mx_internal;
   
   public class FlatVScrollBarSkin extends SparkSkin implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _FlatVScrollBarSkin_Fade1:Fade;
      
      private var _110342614thumb:Button;
      
      private var _110621003track:Button;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:FlatVScrollBar;
      
      public function FlatVScrollBarSkin()
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
         bindings = this._FlatVScrollBarSkin_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_skins_FlatVScrollBarSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return FlatVScrollBarSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 10;
         this.minHeight = 54;
         this.alpha = 0;
         this.transitions = [this._FlatVScrollBarSkin_Transition1_c()];
         this.mxmlContent = [this._FlatVScrollBarSkin_Rect1_c(),this._FlatVScrollBarSkin_Button1_i(),this._FlatVScrollBarSkin_Button2_i()];
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"track",
               "name":"buttonMode",
               "value":true
            }),new SetProperty().initializeFromObject({
               "target":"thumb",
               "name":"buttonMode",
               "value":true
            })]
         }),new State({
            "name":"active",
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":1
            })]
         }),new State({
            "name":"inactive",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"thumb",
               "name":"visible",
               "value":false
            })]
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
         FlatVScrollBarSkin._watcherSetupUtil = param1;
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
      
      private function _FlatVScrollBarSkin_Transition1_c() : Transition
      {
         var _loc1_:Transition = new Transition();
         _loc1_.fromState = "active";
         _loc1_.toState = "normal";
         _loc1_.effect = this._FlatVScrollBarSkin_Fade1_i();
         return _loc1_;
      }
      
      private function _FlatVScrollBarSkin_Fade1_i() : Fade
      {
         var _loc1_:Fade = new Fade();
         _loc1_.duration = 500;
         this._FlatVScrollBarSkin_Fade1 = _loc1_;
         BindingManager.executeBindings(this,"_FlatVScrollBarSkin_Fade1",this._FlatVScrollBarSkin_Fade1);
         return _loc1_;
      }
      
      private function _FlatVScrollBarSkin_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = -3;
         _loc1_.right = -3;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._FlatVScrollBarSkin_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FlatVScrollBarSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      private function _FlatVScrollBarSkin_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.height = 54;
         _loc1_.buttonMode = true;
         _loc1_.focusEnabled = false;
         _loc1_.tabEnabled = false;
         _loc1_.setStyle("skinClass",FlatVScrollBarTrackSkin);
         _loc1_.id = "track";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.track = _loc1_;
         BindingManager.executeBindings(this,"track",this.track);
         return _loc1_;
      }
      
      private function _FlatVScrollBarSkin_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.focusEnabled = false;
         _loc1_.tabEnabled = false;
         _loc1_.setStyle("skinClass",FlatVScrollBarThumbSkin);
         _loc1_.id = "thumb";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.thumb = _loc1_;
         BindingManager.executeBindings(this,"thumb",this.thumb);
         return _loc1_;
      }
      
      private function _FlatVScrollBarSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Object
         {
            return this;
         },null,"_FlatVScrollBarSkin_Fade1.target");
         return result;
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
      public function get track() : Button
      {
         return this._110621003track;
      }
      
      public function set track(param1:Button) : void
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
      public function get hostComponent() : FlatVScrollBar
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:FlatVScrollBar) : void
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
