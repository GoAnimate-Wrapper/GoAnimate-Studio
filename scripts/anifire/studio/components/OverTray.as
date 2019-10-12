package anifire.studio.components
{
   import anifire.studio.managers.TutorialManager;
   import anifire.studio.skins.CloseTrayButtonSkin;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.EffectEvent;
   import mx.events.PropertyChangeEvent;
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.states.Transition;
   import spark.components.Button;
   import spark.components.Group;
   import spark.effects.Move;
   import spark.primitives.RectangularDropShadow;
   
   use namespace mx_internal;
   
   public class OverTray extends Group implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _OverTray_Move1:Move;
      
      private var _1235282000_OverTray_SetProperty1:SetProperty;
      
      private var _94886_pw:PropertiesWindow;
      
      private var _434221093chromeGroup:Group;
      
      private var _1625230065clipGroup:Group;
      
      private var _312699062closeButton:Button;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _tutorialManager:TutorialManager;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function OverTray()
      {
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._tutorialManager = TutorialManager.instance;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._OverTray_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_OverTrayWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return OverTray[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mouseEnabled = false;
         this.transitions = [this._OverTray_Transition1_c()];
         this.mxmlContent = [this._OverTray_Group2_i()];
         this.currentState = "closed";
         states = [new State({
            "name":"closed",
            "overrides":[this._OverTray_SetProperty1 = SetProperty(new SetProperty().initializeFromObject({
               "target":"chromeGroup",
               "name":"x",
               "value":undefined
            }))]
         }),new State({
            "name":"opened",
            "overrides":[]
         })];
         BindingManager.executeBindings(this,"_OverTray_SetProperty1",this._OverTray_SetProperty1);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         OverTray._watcherSetupUtil = param1;
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
      
      public function get propertiesWindow() : PropertiesWindow
      {
         return this._pw;
      }
      
      private function open() : void
      {
         currentState = "opened";
      }
      
      private function close() : void
      {
         currentState = "closed";
      }
      
      protected function closeButtonDownHandler(param1:MouseEvent) : void
      {
         if(currentState == "opened")
         {
            this._pw.close();
         }
      }
      
      protected function propertiesWindowOpenHandler(param1:Event) : void
      {
         this.open();
      }
      
      protected function propertiesWindowCloseHandler(param1:Event) : void
      {
         this.close();
      }
      
      protected function onTransitionEnd(param1:EffectEvent) : void
      {
         if(currentState == "opened")
         {
            this._tutorialManager.notifyTutorialAction("tray_open");
         }
      }
      
      private function _OverTray_Transition1_c() : Transition
      {
         var _loc1_:Transition = new Transition();
         _loc1_.fromState = "*";
         _loc1_.toState = "*";
         _loc1_.effect = this._OverTray_Move1_i();
         return _loc1_;
      }
      
      private function _OverTray_Move1_i() : Move
      {
         var _loc1_:Move = new Move();
         _loc1_.addEventListener("effectEnd",this.___OverTray_Move1_effectEnd);
         this._OverTray_Move1 = _loc1_;
         BindingManager.executeBindings(this,"_OverTray_Move1",this._OverTray_Move1);
         return _loc1_;
      }
      
      public function ___OverTray_Move1_effectEnd(param1:EffectEvent) : void
      {
         this.onTransitionEnd(param1);
      }
      
      private function _OverTray_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.top = 0;
         _loc1_.bottom = -20;
         _loc1_.clipAndEnableScrolling = true;
         _loc1_.mouseEnabled = false;
         _loc1_.mxmlContent = [this._OverTray_Group3_i()];
         _loc1_.id = "clipGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.clipGroup = _loc1_;
         BindingManager.executeBindings(this,"clipGroup",this.clipGroup);
         return _loc1_;
      }
      
      private function _OverTray_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mouseEnabled = false;
         _loc1_.width = 330;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._OverTray_RectangularDropShadow1_c(),this._OverTray_PropertiesWindow1_i(),this._OverTray_Button1_i()];
         _loc1_.id = "chromeGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.chromeGroup = _loc1_;
         BindingManager.executeBindings(this,"chromeGroup",this.chromeGroup);
         return _loc1_;
      }
      
      private function _OverTray_RectangularDropShadow1_c() : RectangularDropShadow
      {
         var _loc1_:RectangularDropShadow = new RectangularDropShadow();
         _loc1_.left = 0;
         _loc1_.right = 20;
         _loc1_.top = 0;
         _loc1_.bottom = 20;
         _loc1_.distance = 5;
         _loc1_.alpha = 0.4;
         _loc1_.color = 0;
         _loc1_.blurX = 20;
         _loc1_.blurY = 20;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _OverTray_PropertiesWindow1_i() : PropertiesWindow
      {
         var _loc1_:PropertiesWindow = new PropertiesWindow();
         _loc1_.width = 310;
         _loc1_.top = 0;
         _loc1_.bottom = 20;
         _loc1_.addEventListener("open",this.___pw_open);
         _loc1_.addEventListener("close",this.___pw_close);
         _loc1_.id = "_pw";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._pw = _loc1_;
         BindingManager.executeBindings(this,"_pw",this._pw);
         return _loc1_;
      }
      
      public function ___pw_open(param1:Event) : void
      {
         this.propertiesWindowOpenHandler(param1);
      }
      
      public function ___pw_close(param1:Event) : void
      {
         this.propertiesWindowCloseHandler(param1);
      }
      
      private function _OverTray_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.top = 10;
         _loc1_.right = 30;
         _loc1_.setStyle("skinClass",CloseTrayButtonSkin);
         _loc1_.addEventListener("click",this.__closeButton_click);
         _loc1_.id = "closeButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.closeButton = _loc1_;
         BindingManager.executeBindings(this,"closeButton",this.closeButton);
         return _loc1_;
      }
      
      public function __closeButton_click(param1:MouseEvent) : void
      {
         this.closeButtonDownHandler(param1);
      }
      
      private function _OverTray_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,null,"_OverTray_Move1.target","chromeGroup");
         result[1] = new Binding(this,function():*
         {
            return -chromeGroup.width - 20;
         },null,"_OverTray_SetProperty1.value");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _OverTray_SetProperty1() : SetProperty
      {
         return this._1235282000_OverTray_SetProperty1;
      }
      
      public function set _OverTray_SetProperty1(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1235282000_OverTray_SetProperty1;
         if(_loc2_ !== param1)
         {
            this._1235282000_OverTray_SetProperty1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_OverTray_SetProperty1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _pw() : PropertiesWindow
      {
         return this._94886_pw;
      }
      
      public function set _pw(param1:PropertiesWindow) : void
      {
         var _loc2_:Object = this._94886_pw;
         if(_loc2_ !== param1)
         {
            this._94886_pw = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_pw",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get chromeGroup() : Group
      {
         return this._434221093chromeGroup;
      }
      
      public function set chromeGroup(param1:Group) : void
      {
         var _loc2_:Object = this._434221093chromeGroup;
         if(_loc2_ !== param1)
         {
            this._434221093chromeGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"chromeGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get clipGroup() : Group
      {
         return this._1625230065clipGroup;
      }
      
      public function set clipGroup(param1:Group) : void
      {
         var _loc2_:Object = this._1625230065clipGroup;
         if(_loc2_ !== param1)
         {
            this._1625230065clipGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"clipGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get closeButton() : Button
      {
         return this._312699062closeButton;
      }
      
      public function set closeButton(param1:Button) : void
      {
         var _loc2_:Object = this._312699062closeButton;
         if(_loc2_ !== param1)
         {
            this._312699062closeButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"closeButton",_loc2_,param1));
            }
         }
      }
   }
}
