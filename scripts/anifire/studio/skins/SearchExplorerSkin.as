package anifire.studio.skins
{
   import anifire.studio.components.ProductExplorer;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.controls.Spacer;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.states.State;
   import spark.components.Label;
   import spark.components.List;
   import spark.components.VGroup;
   import spark.components.supportClasses.Skin;
   
   use namespace mx_internal;
   
   public class SearchExplorerSkin extends Skin implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _SearchExplorerSkin_Label1:Label;
      
      public var _SearchExplorerSkin_VGroup2:VGroup;
      
      private var _425996988categoryList:List;
      
      private var _1491869139productList:List;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:ProductExplorer;
      
      public function SearchExplorerSkin()
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
         bindings = this._SearchExplorerSkin_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_skins_SearchExplorerSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SearchExplorerSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._SearchExplorerSkin_VGroup1_c(),this._SearchExplorerSkin_VGroup2_i()];
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"loading",
            "overrides":[]
         }),new State({
            "name":"categoryExpanded",
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
         SearchExplorerSkin._watcherSetupUtil = param1;
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
      
      private function _SearchExplorerSkin_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._SearchExplorerSkin_List1_i(),this._SearchExplorerSkin_List2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SearchExplorerSkin_List1_i() : List
      {
         var _loc1_:List = new List();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("skinClass",SearchExplorerCategoryListSkin);
         _loc1_.id = "categoryList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.categoryList = _loc1_;
         BindingManager.executeBindings(this,"categoryList",this.categoryList);
         return _loc1_;
      }
      
      private function _SearchExplorerSkin_List2_i() : List
      {
         var _loc1_:List = new List();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.setStyle("skinClass",SearchProductListSkin);
         _loc1_.setStyle("verticalScrollPolicy","on");
         _loc1_.setStyle("horizontalScrollPolicy","off");
         _loc1_.id = "productList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.productList = _loc1_;
         BindingManager.executeBindings(this,"productList",this.productList);
         return _loc1_;
      }
      
      private function _SearchExplorerSkin_VGroup2_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.gap = 0;
         _loc1_.horizontalAlign = "center";
         _loc1_.mxmlContent = [this._SearchExplorerSkin_Spacer1_c(),this._SearchExplorerSkin_Label1_i(),this._SearchExplorerSkin_Spacer2_c()];
         _loc1_.id = "_SearchExplorerSkin_VGroup2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SearchExplorerSkin_VGroup2 = _loc1_;
         BindingManager.executeBindings(this,"_SearchExplorerSkin_VGroup2",this._SearchExplorerSkin_VGroup2);
         return _loc1_;
      }
      
      private function _SearchExplorerSkin_Spacer1_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.percentHeight = 30;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SearchExplorerSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("paddingLeft",10);
         _loc1_.setStyle("paddingRight",26);
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "_SearchExplorerSkin_Label1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SearchExplorerSkin_Label1 = _loc1_;
         BindingManager.executeBindings(this,"_SearchExplorerSkin_Label1",this._SearchExplorerSkin_Label1);
         return _loc1_;
      }
      
      private function _SearchExplorerSkin_Spacer2_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.percentHeight = 70;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SearchExplorerSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Boolean
         {
            return hostComponent.selectedCollection.length == 0;
         },null,"_SearchExplorerSkin_VGroup2.visible");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = !!hostComponent.emptyPrompt?hostComponent.emptyPrompt:hostComponent.selectedCollection.emptyMessage;
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_SearchExplorerSkin_Label1.text");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get categoryList() : List
      {
         return this._425996988categoryList;
      }
      
      public function set categoryList(param1:List) : void
      {
         var _loc2_:Object = this._425996988categoryList;
         if(_loc2_ !== param1)
         {
            this._425996988categoryList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"categoryList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get productList() : List
      {
         return this._1491869139productList;
      }
      
      public function set productList(param1:List) : void
      {
         var _loc2_:Object = this._1491869139productList;
         if(_loc2_ !== param1)
         {
            this._1491869139productList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"productList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : ProductExplorer
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:ProductExplorer) : void
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
