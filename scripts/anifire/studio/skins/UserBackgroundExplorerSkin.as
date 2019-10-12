package anifire.studio.skins
{
   import anifire.studio.components.BusyIndicator;
   import anifire.studio.components.ProductExplorer;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.controls.Spacer;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.EffectEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.states.Transition;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.List;
   import spark.components.VGroup;
   import spark.components.supportClasses.Skin;
   import spark.effects.Resize;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class UserBackgroundExplorerSkin extends Skin implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _UserBackgroundExplorerSkin_HGroup1:HGroup;
      
      public var _UserBackgroundExplorerSkin_Resize1:Resize;
      
      private var _239137499_UserBackgroundExplorerSkin_SetProperty1:SetProperty;
      
      public var _UserBackgroundExplorerSkin_VGroup1:VGroup;
      
      private var _425996988categoryList:List;
      
      private var _1135072989categoryListGroup:Group;
      
      private var _434221093chromeGroup:Group;
      
      private var _1389660835loadingGroup:Group;
      
      private var _1491869139productList:List;
      
      private var _263438014promptDisplay:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:ProductExplorer;
      
      public function UserBackgroundExplorerSkin()
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
         bindings = this._UserBackgroundExplorerSkin_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_skins_UserBackgroundExplorerSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return UserBackgroundExplorerSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.transitions = [this._UserBackgroundExplorerSkin_Transition1_c()];
         this.mxmlContent = [this._UserBackgroundExplorerSkin_Group1_i()];
         this.currentState = "normal";
         var _UserBackgroundExplorerSkin_Group5_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._UserBackgroundExplorerSkin_Group5_i);
         states = [new State({
            "name":"normal",
            "overrides":[this._UserBackgroundExplorerSkin_SetProperty1 = SetProperty(new SetProperty().initializeFromObject({
               "target":"categoryListGroup",
               "name":"width",
               "value":undefined
            }))]
         }),new State({
            "name":"loading",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_UserBackgroundExplorerSkin_Group5_factory,
               "destination":"chromeGroup",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["categoryListGroup"]
            })]
         }),new State({
            "name":"categoryExpanded",
            "overrides":[]
         })];
         BindingManager.executeBindings(this,"_UserBackgroundExplorerSkin_SetProperty1",this._UserBackgroundExplorerSkin_SetProperty1);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         UserBackgroundExplorerSkin._watcherSetupUtil = param1;
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
      
      protected function onResizeComplete(param1:EffectEvent) : void
      {
         if(currentState == "categoryExpanded")
         {
            this.categoryList.setStyle("verticalScrollPolicy","auto");
         }
         this.categoryList.autoLayout = true;
      }
      
      protected function onResizeStart(param1:EffectEvent) : void
      {
         if(currentState == "normal")
         {
            this.categoryList.setStyle("verticalScrollPolicy","off");
         }
         this.categoryList.autoLayout = false;
      }
      
      private function _UserBackgroundExplorerSkin_Transition1_c() : Transition
      {
         var _loc1_:Transition = new Transition();
         _loc1_.fromState = "*";
         _loc1_.toState = "*";
         _loc1_.effect = this._UserBackgroundExplorerSkin_Resize1_i();
         return _loc1_;
      }
      
      private function _UserBackgroundExplorerSkin_Resize1_i() : Resize
      {
         var _loc1_:Resize = new Resize();
         _loc1_.duration = 250;
         _loc1_.addEventListener("effectStart",this.___UserBackgroundExplorerSkin_Resize1_effectStart);
         _loc1_.addEventListener("effectEnd",this.___UserBackgroundExplorerSkin_Resize1_effectEnd);
         this._UserBackgroundExplorerSkin_Resize1 = _loc1_;
         BindingManager.executeBindings(this,"_UserBackgroundExplorerSkin_Resize1",this._UserBackgroundExplorerSkin_Resize1);
         return _loc1_;
      }
      
      public function ___UserBackgroundExplorerSkin_Resize1_effectStart(param1:EffectEvent) : void
      {
         this.onResizeStart(param1);
      }
      
      public function ___UserBackgroundExplorerSkin_Resize1_effectEnd(param1:EffectEvent) : void
      {
         this.onResizeComplete(param1);
      }
      
      private function _UserBackgroundExplorerSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._UserBackgroundExplorerSkin_Rect1_c(),this._UserBackgroundExplorerSkin_HGroup1_i(),this._UserBackgroundExplorerSkin_Group3_i()];
         _loc1_.id = "chromeGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.chromeGroup = _loc1_;
         BindingManager.executeBindings(this,"chromeGroup",this.chromeGroup);
         return _loc1_;
      }
      
      private function _UserBackgroundExplorerSkin_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._UserBackgroundExplorerSkin_SolidColorStroke1_c();
         _loc1_.fill = this._UserBackgroundExplorerSkin_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _UserBackgroundExplorerSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.weight = 1;
         _loc1_.color = 14737632;
         return _loc1_;
      }
      
      private function _UserBackgroundExplorerSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _UserBackgroundExplorerSkin_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.right = 0;
         _loc1_.percentHeight = 100;
         _loc1_.paddingTop = 1;
         _loc1_.paddingBottom = 1;
         _loc1_.mxmlContent = [this._UserBackgroundExplorerSkin_Group2_c()];
         _loc1_.id = "_UserBackgroundExplorerSkin_HGroup1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._UserBackgroundExplorerSkin_HGroup1 = _loc1_;
         BindingManager.executeBindings(this,"_UserBackgroundExplorerSkin_HGroup1",this._UserBackgroundExplorerSkin_HGroup1);
         return _loc1_;
      }
      
      private function _UserBackgroundExplorerSkin_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._UserBackgroundExplorerSkin_List1_i(),this._UserBackgroundExplorerSkin_VGroup1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _UserBackgroundExplorerSkin_List1_i() : List
      {
         var _loc1_:List = new List();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.setStyle("skinClass",ProductExplorerProductListSkin);
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
      
      private function _UserBackgroundExplorerSkin_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 0;
         _loc1_.horizontalAlign = "center";
         _loc1_.mxmlContent = [this._UserBackgroundExplorerSkin_Spacer1_c(),this._UserBackgroundExplorerSkin_Label1_i(),this._UserBackgroundExplorerSkin_Spacer2_c()];
         _loc1_.id = "_UserBackgroundExplorerSkin_VGroup1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._UserBackgroundExplorerSkin_VGroup1 = _loc1_;
         BindingManager.executeBindings(this,"_UserBackgroundExplorerSkin_VGroup1",this._UserBackgroundExplorerSkin_VGroup1);
         return _loc1_;
      }
      
      private function _UserBackgroundExplorerSkin_Spacer1_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.percentHeight = 30;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _UserBackgroundExplorerSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("paddingLeft",10);
         _loc1_.setStyle("paddingRight",26);
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("color",6710886);
         _loc1_.id = "promptDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.promptDisplay = _loc1_;
         BindingManager.executeBindings(this,"promptDisplay",this.promptDisplay);
         return _loc1_;
      }
      
      private function _UserBackgroundExplorerSkin_Spacer2_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.percentHeight = 70;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _UserBackgroundExplorerSkin_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 0;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._UserBackgroundExplorerSkin_Rect2_c(),this._UserBackgroundExplorerSkin_VGroup2_c()];
         _loc1_.id = "categoryListGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.categoryListGroup = _loc1_;
         BindingManager.executeBindings(this,"categoryListGroup",this.categoryListGroup);
         return _loc1_;
      }
      
      private function _UserBackgroundExplorerSkin_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._UserBackgroundExplorerSkin_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _UserBackgroundExplorerSkin_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 3233154;
         return _loc1_;
      }
      
      private function _UserBackgroundExplorerSkin_VGroup2_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.paddingTop = 1;
         _loc1_.paddingBottom = 1;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._UserBackgroundExplorerSkin_Group4_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _UserBackgroundExplorerSkin_Group4_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._UserBackgroundExplorerSkin_List2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _UserBackgroundExplorerSkin_List2_i() : List
      {
         var _loc1_:List = new List();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.useVirtualLayout = false;
         _loc1_.setStyle("skinClass",ProductExplorerCategoryListSkin);
         _loc1_.setStyle("horizontalScrollPolicy","off");
         _loc1_.setStyle("verticalScrollPolicy","off");
         _loc1_.id = "categoryList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.categoryList = _loc1_;
         BindingManager.executeBindings(this,"categoryList",this.categoryList);
         return _loc1_;
      }
      
      private function _UserBackgroundExplorerSkin_Group5_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 0;
         _loc1_.top = 1;
         _loc1_.right = 0;
         _loc1_.bottom = 1;
         _loc1_.mxmlContent = [this._UserBackgroundExplorerSkin_Rect3_c(),this._UserBackgroundExplorerSkin_BusyIndicator1_c()];
         _loc1_.id = "loadingGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.loadingGroup = _loc1_;
         BindingManager.executeBindings(this,"loadingGroup",this.loadingGroup);
         return _loc1_;
      }
      
      private function _UserBackgroundExplorerSkin_Rect3_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._UserBackgroundExplorerSkin_SolidColor3_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _UserBackgroundExplorerSkin_SolidColor3_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.alpha = 0.5;
         return _loc1_;
      }
      
      private function _UserBackgroundExplorerSkin_BusyIndicator1_c() : BusyIndicator
      {
         var _loc1_:BusyIndicator = new BusyIndicator();
         _loc1_.width = 60;
         _loc1_.height = 60;
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _UserBackgroundExplorerSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,null,"_UserBackgroundExplorerSkin_Resize1.target","categoryListGroup");
         result[1] = new Binding(this,function():Object
         {
            return hostComponent.categoryListWidth;
         },null,"_UserBackgroundExplorerSkin_HGroup1.left");
         result[2] = new Binding(this,function():Boolean
         {
            return hostComponent.shouldDisplayPrompt();
         },null,"_UserBackgroundExplorerSkin_VGroup1.visible");
         result[3] = new Binding(this,function():Number
         {
            return hostComponent.categoryListWidth;
         },null,"categoryListGroup.minWidth");
         result[4] = new Binding(this,function():*
         {
            return hostComponent.categoryListWidth;
         },null,"_UserBackgroundExplorerSkin_SetProperty1.value");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _UserBackgroundExplorerSkin_SetProperty1() : SetProperty
      {
         return this._239137499_UserBackgroundExplorerSkin_SetProperty1;
      }
      
      public function set _UserBackgroundExplorerSkin_SetProperty1(param1:SetProperty) : void
      {
         var _loc2_:Object = this._239137499_UserBackgroundExplorerSkin_SetProperty1;
         if(_loc2_ !== param1)
         {
            this._239137499_UserBackgroundExplorerSkin_SetProperty1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_UserBackgroundExplorerSkin_SetProperty1",_loc2_,param1));
            }
         }
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
      public function get categoryListGroup() : Group
      {
         return this._1135072989categoryListGroup;
      }
      
      public function set categoryListGroup(param1:Group) : void
      {
         var _loc2_:Object = this._1135072989categoryListGroup;
         if(_loc2_ !== param1)
         {
            this._1135072989categoryListGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"categoryListGroup",_loc2_,param1));
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
      public function get loadingGroup() : Group
      {
         return this._1389660835loadingGroup;
      }
      
      public function set loadingGroup(param1:Group) : void
      {
         var _loc2_:Object = this._1389660835loadingGroup;
         if(_loc2_ !== param1)
         {
            this._1389660835loadingGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"loadingGroup",_loc2_,param1));
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
      public function get promptDisplay() : Label
      {
         return this._263438014promptDisplay;
      }
      
      public function set promptDisplay(param1:Label) : void
      {
         var _loc2_:Object = this._263438014promptDisplay;
         if(_loc2_ !== param1)
         {
            this._263438014promptDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"promptDisplay",_loc2_,param1));
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
