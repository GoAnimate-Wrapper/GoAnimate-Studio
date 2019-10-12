package anifire.studio.components
{
   import anifire.studio.events.MenuItemEvent;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.ArrayCollection;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.events.SandboxMouseEvent;
   import spark.components.SkinnablePopUpContainer;
   
   use namespace mx_internal;
   
   public class PopUpMenu extends SkinnablePopUpContainer implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _1983820356listDisplay:MenuItemList;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _2001620880menuProvider:ArrayCollection;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function PopUpMenu()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._PopUpMenu_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_PopUpMenuWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return PopUpMenu[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._PopUpMenu_Array1_c);
         this.addEventListener("creationComplete",this.___PopUpMenu_SkinnablePopUpContainer1_creationComplete);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         PopUpMenu._watcherSetupUtil = param1;
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
      
      protected function init() : void
      {
         this.addCloseTrigger();
      }
      
      protected function addCloseTrigger() : void
      {
         systemManager.getSandboxRoot().addEventListener(MouseEvent.MOUSE_UP,this.systemManager_mouseHandler);
         systemManager.getSandboxRoot().addEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE,this.systemManager_mouseHandler);
      }
      
      protected function removeCloseTrigger() : void
      {
         systemManager.getSandboxRoot().removeEventListener(MouseEvent.MOUSE_UP,this.systemManager_mouseHandler);
         systemManager.getSandboxRoot().removeEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE,this.systemManager_mouseHandler);
      }
      
      private function systemManager_mouseHandler(param1:Event) : void
      {
         this.close();
      }
      
      override public function close(param1:Boolean = false, param2:* = null) : void
      {
         this.removeCloseTrigger();
         super.close(param1,param2);
      }
      
      protected function onItemClick(param1:MenuItemEvent) : void
      {
         this.close(true,param1.item);
      }
      
      private function _PopUpMenu_Array1_c() : Array
      {
         var _loc1_:Array = [this._PopUpMenu_MenuItemList1_i()];
         return _loc1_;
      }
      
      private function _PopUpMenu_MenuItemList1_i() : MenuItemList
      {
         var _loc1_:MenuItemList = new MenuItemList();
         _loc1_.addEventListener("itemClick",this.__listDisplay_itemClick);
         _loc1_.id = "listDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.listDisplay = _loc1_;
         BindingManager.executeBindings(this,"listDisplay",this.listDisplay);
         return _loc1_;
      }
      
      public function __listDisplay_itemClick(param1:MenuItemEvent) : void
      {
         this.onItemClick(param1);
      }
      
      public function ___PopUpMenu_SkinnablePopUpContainer1_creationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      private function _PopUpMenu_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"listDisplay.dataProvider","menuProvider");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get listDisplay() : MenuItemList
      {
         return this._1983820356listDisplay;
      }
      
      public function set listDisplay(param1:MenuItemList) : void
      {
         var _loc2_:Object = this._1983820356listDisplay;
         if(_loc2_ !== param1)
         {
            this._1983820356listDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"listDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get menuProvider() : ArrayCollection
      {
         return this._2001620880menuProvider;
      }
      
      public function set menuProvider(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._2001620880menuProvider;
         if(_loc2_ !== param1)
         {
            this._2001620880menuProvider = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"menuProvider",_loc2_,param1));
            }
         }
      }
   }
}
