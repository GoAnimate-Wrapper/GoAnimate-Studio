package anifire.studio.components
{
   import anifire.models.FontModel;
   import anifire.studio.interfaces.IMenuItemOwner;
   import anifire.studio.models.MenuItemModel;
   import anifire.studio.skins.LinkArrowPlainTextButtonSkin;
   import anifire.util.UtilDict;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.states.State;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   
   use namespace mx_internal;
   
   public class BannerMenuItemRenderer extends Group implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _BannerMenuItemRenderer_Label1:Label;
      
      public var _BannerMenuItemRenderer_LinkArrowButton1:LinkArrowButton;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _104069929model:MenuItemModel;
      
      private var _font:FontModel;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function BannerMenuItemRenderer()
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
         bindings = this._BannerMenuItemRenderer_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_BannerMenuItemRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return BannerMenuItemRenderer[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.height = 34;
         this.width = 225;
         this.buttonMode = true;
         this.mxmlContent = [this._BannerMenuItemRenderer_HGroup1_c()];
         this.currentState = "normal";
         this.addEventListener("mouseOver",this.___BannerMenuItemRenderer_Group1_mouseOver);
         states = [new State({
            "name":"normal",
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
         BannerMenuItemRenderer._watcherSetupUtil = param1;
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
      
      public function closeSubMenu() : void
      {
      }
      
      protected function onMouseOver(param1:MouseEvent) : void
      {
         var _loc2_:IMenuItemOwner = owner as IMenuItemOwner;
         if(_loc2_)
         {
            _loc2_.closeActiveItem();
         }
         param1.stopImmediatePropagation();
      }
      
      protected function getGoTeam_clickHandler(param1:MouseEvent) : void
      {
         if(ExternalInterface.available)
         {
            ExternalInterface.call("customFontBanner");
         }
      }
      
      private function _BannerMenuItemRenderer_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.left = 0;
         _loc1_.right = 10;
         _loc1_.top = 5;
         _loc1_.bottom = 5;
         _loc1_.verticalAlign = "middle";
         _loc1_.gap = -4;
         _loc1_.mxmlContent = [this._BannerMenuItemRenderer_Label1_i(),this._BannerMenuItemRenderer_LinkArrowButton1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _BannerMenuItemRenderer_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("color",11054003);
         _loc1_.setStyle("paddingLeft",10);
         _loc1_.setStyle("paddingRight",10);
         _loc1_.setStyle("textAlign","left");
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.id = "_BannerMenuItemRenderer_Label1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._BannerMenuItemRenderer_Label1 = _loc1_;
         BindingManager.executeBindings(this,"_BannerMenuItemRenderer_Label1",this._BannerMenuItemRenderer_Label1);
         return _loc1_;
      }
      
      private function _BannerMenuItemRenderer_LinkArrowButton1_i() : LinkArrowButton
      {
         var _loc1_:LinkArrowButton = new LinkArrowButton();
         _loc1_.top = 5;
         _loc1_.bottom = 5;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("skinClass",LinkArrowPlainTextButtonSkin);
         _loc1_.addEventListener("click",this.___BannerMenuItemRenderer_LinkArrowButton1_click);
         _loc1_.id = "_BannerMenuItemRenderer_LinkArrowButton1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._BannerMenuItemRenderer_LinkArrowButton1 = _loc1_;
         BindingManager.executeBindings(this,"_BannerMenuItemRenderer_LinkArrowButton1",this._BannerMenuItemRenderer_LinkArrowButton1);
         return _loc1_;
      }
      
      public function ___BannerMenuItemRenderer_LinkArrowButton1_click(param1:MouseEvent) : void
      {
         this.getGoTeam_clickHandler(param1);
      }
      
      public function ___BannerMenuItemRenderer_Group1_mouseOver(param1:MouseEvent) : void
      {
         this.onMouseOver(param1);
      }
      
      private function _BannerMenuItemRenderer_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Boolean
         {
            return model.enabled;
         },null,"this.enabled");
         result[1] = new Binding(this,function():Boolean
         {
            return model.enabled;
         },null,"this.mouseEnabled");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Import fonts");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_BannerMenuItemRenderer_Label1.text");
         result[3] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Get Professional");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_BannerMenuItemRenderer_LinkArrowButton1.label");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      protected function get model() : MenuItemModel
      {
         return this._104069929model;
      }
      
      protected function set model(param1:MenuItemModel) : void
      {
         var _loc2_:Object = this._104069929model;
         if(_loc2_ !== param1)
         {
            this._104069929model = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"model",_loc2_,param1));
            }
         }
      }
   }
}
