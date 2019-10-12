package anifire.studio.skins
{
   import anifire.studio.components.ArrowTipContainer;
   import anifire.studio.components.ArrowTipMenuItemList;
   import anifire.studio.components.MenuItemRenderer;
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
   import spark.components.DataGroup;
   import spark.components.Scroller;
   import spark.layouts.VerticalLayout;
   import spark.skins.SparkSkin;
   
   use namespace mx_internal;
   
   public class ArrowTipMenuItemListSkin extends SparkSkin implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _ArrowTipMenuItemListSkin_ArrowTipContainer1:ArrowTipContainer;
      
      private var _385593099dataGroup:DataGroup;
      
      private var _402164678scroller:Scroller;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:ArrowTipMenuItemList;
      
      public function ArrowTipMenuItemListSkin()
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
         bindings = this._ArrowTipMenuItemListSkin_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_skins_ArrowTipMenuItemListSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ArrowTipMenuItemListSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.minWidth = 80;
         this.minHeight = 0;
         this.blendMode = "normal";
         this.mxmlContent = [this._ArrowTipMenuItemListSkin_ArrowTipContainer1_i()];
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
         ArrowTipMenuItemListSkin._watcherSetupUtil = param1;
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
      
      private function _ArrowTipMenuItemListSkin_ArrowTipContainer1_i() : ArrowTipContainer
      {
         var _loc1_:ArrowTipContainer = new ArrowTipContainer();
         _loc1_.content = [this._ArrowTipMenuItemListSkin_Scroller1_i()];
         _loc1_.id = "_ArrowTipMenuItemListSkin_ArrowTipContainer1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ArrowTipMenuItemListSkin_ArrowTipContainer1 = _loc1_;
         BindingManager.executeBindings(this,"_ArrowTipMenuItemListSkin_ArrowTipContainer1",this._ArrowTipMenuItemListSkin_ArrowTipContainer1);
         return _loc1_;
      }
      
      private function _ArrowTipMenuItemListSkin_Scroller1_i() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.left = 0;
         _loc1_.top = 3;
         _loc1_.right = 0;
         _loc1_.bottom = 3;
         _loc1_.hasFocusableChildren = false;
         _loc1_.minViewportInset = 1;
         _loc1_.viewport = this._ArrowTipMenuItemListSkin_DataGroup1_i();
         _loc1_.id = "scroller";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.scroller = _loc1_;
         BindingManager.executeBindings(this,"scroller",this.scroller);
         return _loc1_;
      }
      
      private function _ArrowTipMenuItemListSkin_DataGroup1_i() : DataGroup
      {
         var _loc1_:DataGroup = new DataGroup();
         _loc1_.itemRenderer = this._ArrowTipMenuItemListSkin_ClassFactory1_c();
         _loc1_.layout = this._ArrowTipMenuItemListSkin_VerticalLayout1_c();
         _loc1_.id = "dataGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dataGroup = _loc1_;
         BindingManager.executeBindings(this,"dataGroup",this.dataGroup);
         return _loc1_;
      }
      
      private function _ArrowTipMenuItemListSkin_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = MenuItemRenderer;
         return _loc1_;
      }
      
      private function _ArrowTipMenuItemListSkin_VerticalLayout1_c() : VerticalLayout
      {
         var _loc1_:VerticalLayout = new VerticalLayout();
         _loc1_.gap = 0;
         _loc1_.horizontalAlign = "contentJustify";
         _loc1_.variableRowHeight = true;
         _loc1_.requestedMinRowCount = 1;
         _loc1_.requestedRowCount = -1;
         return _loc1_;
      }
      
      private function _ArrowTipMenuItemListSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Number
         {
            return hostComponent.offset;
         },null,"_ArrowTipMenuItemListSkin_ArrowTipContainer1.offset");
         result[1] = new Binding(this,function():Number
         {
            return hostComponent.targetWidth;
         },null,"_ArrowTipMenuItemListSkin_ArrowTipContainer1.targetWidth");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = hostComponent.tipPosition;
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_ArrowTipMenuItemListSkin_ArrowTipContainer1.tipPosition");
         return result;
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
      public function get hostComponent() : ArrowTipMenuItemList
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:ArrowTipMenuItemList) : void
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
