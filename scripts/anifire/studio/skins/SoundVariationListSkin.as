package anifire.studio.skins
{
   import anifire.studio.components.SoundVariationList;
   import anifire.studio.components.SoundVariationRenderer;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.ClassFactory;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.effects.Parallel;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.states.Transition;
   import spark.components.DataGroup;
   import spark.components.Group;
   import spark.components.Scroller;
   import spark.effects.Fade;
   import spark.effects.Move;
   import spark.layouts.VerticalLayout;
   import spark.primitives.Rect;
   import spark.skins.SparkSkin;
   
   use namespace mx_internal;
   
   public class SoundVariationListSkin extends SparkSkin implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _SoundVariationListSkin_Fade1:Fade;
      
      public var _SoundVariationListSkin_Fade2:Fade;
      
      public var _SoundVariationListSkin_Move1:Move;
      
      public var _SoundVariationListSkin_Move2:Move;
      
      private var _135636251_SoundVariationListSkin_SetProperty1:SetProperty;
      
      private var _1332194002background:Rect;
      
      private var _1391998104bgFill:SolidColor;
      
      private var _455576551closeListEffect:Transition;
      
      private var _385593099dataGroup:DataGroup;
      
      private var _1246295935listGroup:Group;
      
      private var _1078127175openListEffect:Transition;
      
      private var _402164678scroller:Scroller;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:SoundVariationList;
      
      public function SoundVariationListSkin()
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
         bindings = this._SoundVariationListSkin_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_skins_SoundVariationListSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SoundVariationListSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.minWidth = 112;
         this.blendMode = "normal";
         this.transitions = [this._SoundVariationListSkin_Transition1_i(),this._SoundVariationListSkin_Transition2_i()];
         this.mxmlContent = [this._SoundVariationListSkin_Group1_i()];
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"scroller",
               "name":"y",
               "value":0
            })]
         }),new State({
            "name":"closed",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"listGroup",
               "name":"alpha",
               "value":0
            }),this._SoundVariationListSkin_SetProperty1 = SetProperty(new SetProperty().initializeFromObject({
               "target":"scroller",
               "name":"y",
               "value":undefined
            }))]
         }),new State({
            "name":"disabled",
            "overrides":[]
         })];
         BindingManager.executeBindings(this,"_SoundVariationListSkin_SetProperty1",this._SoundVariationListSkin_SetProperty1);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         SoundVariationListSkin._watcherSetupUtil = param1;
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
      
      private function _SoundVariationListSkin_Transition1_i() : Transition
      {
         var _loc1_:Transition = new Transition();
         _loc1_.fromState = "closed";
         _loc1_.toState = "normal";
         _loc1_.effect = this._SoundVariationListSkin_Parallel1_c();
         this.openListEffect = _loc1_;
         BindingManager.executeBindings(this,"openListEffect",this.openListEffect);
         return _loc1_;
      }
      
      private function _SoundVariationListSkin_Parallel1_c() : Parallel
      {
         var _loc1_:Parallel = new Parallel();
         _loc1_.children = [this._SoundVariationListSkin_Move1_i(),this._SoundVariationListSkin_Fade1_i()];
         return _loc1_;
      }
      
      private function _SoundVariationListSkin_Move1_i() : Move
      {
         var _loc1_:Move = new Move();
         _loc1_.duration = 300;
         this._SoundVariationListSkin_Move1 = _loc1_;
         BindingManager.executeBindings(this,"_SoundVariationListSkin_Move1",this._SoundVariationListSkin_Move1);
         return _loc1_;
      }
      
      private function _SoundVariationListSkin_Fade1_i() : Fade
      {
         var _loc1_:Fade = new Fade();
         _loc1_.duration = 100;
         _loc1_.startDelay = 200;
         this._SoundVariationListSkin_Fade1 = _loc1_;
         BindingManager.executeBindings(this,"_SoundVariationListSkin_Fade1",this._SoundVariationListSkin_Fade1);
         return _loc1_;
      }
      
      private function _SoundVariationListSkin_Transition2_i() : Transition
      {
         var _loc1_:Transition = new Transition();
         _loc1_.fromState = "normal";
         _loc1_.toState = "closed";
         _loc1_.effect = this._SoundVariationListSkin_Parallel2_c();
         this.closeListEffect = _loc1_;
         BindingManager.executeBindings(this,"closeListEffect",this.closeListEffect);
         return _loc1_;
      }
      
      private function _SoundVariationListSkin_Parallel2_c() : Parallel
      {
         var _loc1_:Parallel = new Parallel();
         _loc1_.children = [this._SoundVariationListSkin_Move2_i(),this._SoundVariationListSkin_Fade2_i()];
         return _loc1_;
      }
      
      private function _SoundVariationListSkin_Move2_i() : Move
      {
         var _loc1_:Move = new Move();
         _loc1_.duration = 300;
         this._SoundVariationListSkin_Move2 = _loc1_;
         BindingManager.executeBindings(this,"_SoundVariationListSkin_Move2",this._SoundVariationListSkin_Move2);
         return _loc1_;
      }
      
      private function _SoundVariationListSkin_Fade2_i() : Fade
      {
         var _loc1_:Fade = new Fade();
         _loc1_.duration = 100;
         this._SoundVariationListSkin_Fade2 = _loc1_;
         BindingManager.executeBindings(this,"_SoundVariationListSkin_Fade2",this._SoundVariationListSkin_Fade2);
         return _loc1_;
      }
      
      private function _SoundVariationListSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.top = 0;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.alpha = 1;
         _loc1_.mxmlContent = [this._SoundVariationListSkin_Rect1_i(),this._SoundVariationListSkin_Scroller1_i()];
         _loc1_.id = "listGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.listGroup = _loc1_;
         BindingManager.executeBindings(this,"listGroup",this.listGroup);
         return _loc1_;
      }
      
      private function _SoundVariationListSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.right = 1;
         _loc1_.top = 1;
         _loc1_.bottom = 1;
         _loc1_.fill = this._SoundVariationListSkin_SolidColor1_i();
         _loc1_.initialized(this,"background");
         this.background = _loc1_;
         BindingManager.executeBindings(this,"background",this.background);
         return _loc1_;
      }
      
      private function _SoundVariationListSkin_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         this.bgFill = _loc1_;
         BindingManager.executeBindings(this,"bgFill",this.bgFill);
         return _loc1_;
      }
      
      private function _SoundVariationListSkin_Scroller1_i() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.minViewportInset = 1;
         _loc1_.hasFocusableChildren = false;
         _loc1_.viewport = this._SoundVariationListSkin_DataGroup1_i();
         _loc1_.id = "scroller";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.scroller = _loc1_;
         BindingManager.executeBindings(this,"scroller",this.scroller);
         return _loc1_;
      }
      
      private function _SoundVariationListSkin_DataGroup1_i() : DataGroup
      {
         var _loc1_:DataGroup = new DataGroup();
         _loc1_.itemRenderer = this._SoundVariationListSkin_ClassFactory1_c();
         _loc1_.layout = this._SoundVariationListSkin_VerticalLayout1_c();
         _loc1_.id = "dataGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dataGroup = _loc1_;
         BindingManager.executeBindings(this,"dataGroup",this.dataGroup);
         return _loc1_;
      }
      
      private function _SoundVariationListSkin_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = SoundVariationRenderer;
         return _loc1_;
      }
      
      private function _SoundVariationListSkin_VerticalLayout1_c() : VerticalLayout
      {
         var _loc1_:VerticalLayout = new VerticalLayout();
         _loc1_.gap = 0;
         _loc1_.horizontalAlign = "contentJustify";
         _loc1_.requestedMinRowCount = 1;
         return _loc1_;
      }
      
      private function _SoundVariationListSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,null,"_SoundVariationListSkin_Move1.target","scroller");
         result[1] = new Binding(this,null,null,"_SoundVariationListSkin_Fade1.target","listGroup");
         result[2] = new Binding(this,null,null,"_SoundVariationListSkin_Move2.target","scroller");
         result[3] = new Binding(this,null,null,"_SoundVariationListSkin_Fade2.target","listGroup");
         result[4] = new Binding(this,function():*
         {
            return -dataGroup.height;
         },null,"_SoundVariationListSkin_SetProperty1.value");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _SoundVariationListSkin_SetProperty1() : SetProperty
      {
         return this._135636251_SoundVariationListSkin_SetProperty1;
      }
      
      public function set _SoundVariationListSkin_SetProperty1(param1:SetProperty) : void
      {
         var _loc2_:Object = this._135636251_SoundVariationListSkin_SetProperty1;
         if(_loc2_ !== param1)
         {
            this._135636251_SoundVariationListSkin_SetProperty1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SoundVariationListSkin_SetProperty1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get background() : Rect
      {
         return this._1332194002background;
      }
      
      public function set background(param1:Rect) : void
      {
         var _loc2_:Object = this._1332194002background;
         if(_loc2_ !== param1)
         {
            this._1332194002background = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"background",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bgFill() : SolidColor
      {
         return this._1391998104bgFill;
      }
      
      public function set bgFill(param1:SolidColor) : void
      {
         var _loc2_:Object = this._1391998104bgFill;
         if(_loc2_ !== param1)
         {
            this._1391998104bgFill = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bgFill",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get closeListEffect() : Transition
      {
         return this._455576551closeListEffect;
      }
      
      public function set closeListEffect(param1:Transition) : void
      {
         var _loc2_:Object = this._455576551closeListEffect;
         if(_loc2_ !== param1)
         {
            this._455576551closeListEffect = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"closeListEffect",_loc2_,param1));
            }
         }
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
      public function get listGroup() : Group
      {
         return this._1246295935listGroup;
      }
      
      public function set listGroup(param1:Group) : void
      {
         var _loc2_:Object = this._1246295935listGroup;
         if(_loc2_ !== param1)
         {
            this._1246295935listGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"listGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get openListEffect() : Transition
      {
         return this._1078127175openListEffect;
      }
      
      public function set openListEffect(param1:Transition) : void
      {
         var _loc2_:Object = this._1078127175openListEffect;
         if(_loc2_ !== param1)
         {
            this._1078127175openListEffect = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"openListEffect",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scroller() : Scroller
      {
         return this._402164678scroller;
      }
      
      public function set scroller(param1:Scroller) : void
      {
         var _loc2_:Object = this._402164678scroller;
         if(_loc2_ !== param1)
         {
            this._402164678scroller = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scroller",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : SoundVariationList
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:SoundVariationList) : void
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
