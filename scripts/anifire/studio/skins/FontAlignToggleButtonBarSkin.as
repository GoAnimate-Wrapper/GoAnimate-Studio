package anifire.studio.skins
{
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.ClassFactory;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.ButtonBar;
   import spark.components.DataGroup;
   import spark.components.Label;
   import spark.components.supportClasses.ButtonBarHorizontalLayout;
   import spark.components.supportClasses.Skin;
   
   use namespace mx_internal;
   
   public class FontAlignToggleButtonBarSkin extends Skin implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _385593099dataGroup:DataGroup;
      
      private var _1518788094firstButton:ClassFactory;
      
      private var _1184053038labelDisplay:Label;
      
      private var _1454038376lastButton:ClassFactory;
      
      private var _654857945middleButton:ClassFactory;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:ButtonBar;
      
      public function FontAlignToggleButtonBarSkin()
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
         bindings = this._FontAlignToggleButtonBarSkin_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_skins_FontAlignToggleButtonBarSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return FontAlignToggleButtonBarSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.height = 34;
         this.mxmlContent = [this._FontAlignToggleButtonBarSkin_DataGroup1_i(),this._FontAlignToggleButtonBarSkin_Label1_i()];
         this.currentState = "normal";
         this._FontAlignToggleButtonBarSkin_ClassFactory1_i();
         this._FontAlignToggleButtonBarSkin_ClassFactory3_i();
         this._FontAlignToggleButtonBarSkin_ClassFactory2_i();
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
         FontAlignToggleButtonBarSkin._watcherSetupUtil = param1;
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
      
      private function _FontAlignToggleButtonBarSkin_ClassFactory1_i() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = FontAlignToggleButtonBarSkinInnerClass0;
         _loc1_.properties = {"outerDocument":this};
         this.firstButton = _loc1_;
         BindingManager.executeBindings(this,"firstButton",this.firstButton);
         return _loc1_;
      }
      
      private function _FontAlignToggleButtonBarSkin_ClassFactory3_i() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = FontAlignToggleButtonBarSkinInnerClass2;
         _loc1_.properties = {"outerDocument":this};
         this.lastButton = _loc1_;
         BindingManager.executeBindings(this,"lastButton",this.lastButton);
         return _loc1_;
      }
      
      private function _FontAlignToggleButtonBarSkin_ClassFactory2_i() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = FontAlignToggleButtonBarSkinInnerClass1;
         _loc1_.properties = {"outerDocument":this};
         this.middleButton = _loc1_;
         BindingManager.executeBindings(this,"middleButton",this.middleButton);
         return _loc1_;
      }
      
      private function _FontAlignToggleButtonBarSkin_DataGroup1_i() : DataGroup
      {
         var _loc1_:DataGroup = new DataGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.layout = this._FontAlignToggleButtonBarSkin_ButtonBarHorizontalLayout1_c();
         _loc1_.id = "dataGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dataGroup = _loc1_;
         BindingManager.executeBindings(this,"dataGroup",this.dataGroup);
         return _loc1_;
      }
      
      private function _FontAlignToggleButtonBarSkin_ButtonBarHorizontalLayout1_c() : ButtonBarHorizontalLayout
      {
         var _loc1_:ButtonBarHorizontalLayout = new ButtonBarHorizontalLayout();
         _loc1_.gap = -1;
         return _loc1_;
      }
      
      private function _FontAlignToggleButtonBarSkin_Label1_i() : Label
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
      
      private function _FontAlignToggleButtonBarSkin_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"this.baselinePositionElement","labelDisplay");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get dataGroup() : DataGroup
      {
         return this._385593099dataGroup;
      }
      
      public function set dataGroup(param1:DataGroup) : void
      {
         var _loc2_:Object = this._385593099dataGroup;
         if(_loc2_ !== param1)
         {
            this._385593099dataGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dataGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get firstButton() : ClassFactory
      {
         return this._1518788094firstButton;
      }
      
      public function set firstButton(param1:ClassFactory) : void
      {
         var _loc2_:Object = this._1518788094firstButton;
         if(_loc2_ !== param1)
         {
            this._1518788094firstButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"firstButton",_loc2_,param1));
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
      public function get lastButton() : ClassFactory
      {
         return this._1454038376lastButton;
      }
      
      public function set lastButton(param1:ClassFactory) : void
      {
         var _loc2_:Object = this._1454038376lastButton;
         if(_loc2_ !== param1)
         {
            this._1454038376lastButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lastButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get middleButton() : ClassFactory
      {
         return this._654857945middleButton;
      }
      
      public function set middleButton(param1:ClassFactory) : void
      {
         var _loc2_:Object = this._654857945middleButton;
         if(_loc2_ !== param1)
         {
            this._654857945middleButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"middleButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : ButtonBar
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:ButtonBar) : void
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
