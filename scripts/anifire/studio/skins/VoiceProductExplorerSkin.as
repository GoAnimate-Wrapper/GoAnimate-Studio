package anifire.studio.skins
{
   import anifire.studio.components.FocusTextInput;
   import anifire.studio.components.ProductExplorer;
   import anifire.util.UtilDict;
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
   import spark.components.Group;
   import spark.components.Label;
   import spark.components.List;
   import spark.components.VGroup;
   import spark.components.supportClasses.Skin;
   
   use namespace mx_internal;
   
   public class VoiceProductExplorerSkin extends Skin implements IBindingClient, IStateClient2
   {
      
      private static const DEFAULT_PROMPT_COPY:String = UtilDict.toDisplay("go","Latest 50 voices imported to your library");
      
      private static const SEARCH_RESULT_COPY:String = UtilDict.toDisplay("go","Search results:");
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _VoiceProductExplorerSkin_Label1:Label;
      
      public var _VoiceProductExplorerSkin_VGroup2:VGroup;
      
      private var _434221093chromeGroup:VGroup;
      
      private var _1491869139productList:List;
      
      private var _263438014promptDisplay:Label;
      
      private var _559723774searchInput:FocusTextInput;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:ProductExplorer;
      
      public function VoiceProductExplorerSkin()
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
         bindings = this._VoiceProductExplorerSkin_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_skins_VoiceProductExplorerSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return VoiceProductExplorerSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.transitions = [];
         this.mxmlContent = [this._VoiceProductExplorerSkin_VGroup1_i()];
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
         VoiceProductExplorerSkin._watcherSetupUtil = param1;
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
      
      private function _VoiceProductExplorerSkin_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 7;
         _loc1_.mxmlContent = [this._VoiceProductExplorerSkin_FocusTextInput1_i(),this._VoiceProductExplorerSkin_Spacer1_c(),this._VoiceProductExplorerSkin_Label1_i(),this._VoiceProductExplorerSkin_Group1_c()];
         _loc1_.id = "chromeGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.chromeGroup = _loc1_;
         BindingManager.executeBindings(this,"chromeGroup",this.chromeGroup);
         return _loc1_;
      }
      
      private function _VoiceProductExplorerSkin_FocusTextInput1_i() : FocusTextInput
      {
         var _loc1_:FocusTextInput = new FocusTextInput();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("skinClass",SearchTextInputSkin);
         _loc1_.id = "searchInput";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.searchInput = _loc1_;
         BindingManager.executeBindings(this,"searchInput",this.searchInput);
         return _loc1_;
      }
      
      private function _VoiceProductExplorerSkin_Spacer1_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.height = 21;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _VoiceProductExplorerSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.id = "_VoiceProductExplorerSkin_Label1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._VoiceProductExplorerSkin_Label1 = _loc1_;
         BindingManager.executeBindings(this,"_VoiceProductExplorerSkin_Label1",this._VoiceProductExplorerSkin_Label1);
         return _loc1_;
      }
      
      private function _VoiceProductExplorerSkin_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._VoiceProductExplorerSkin_List1_i(),this._VoiceProductExplorerSkin_VGroup2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _VoiceProductExplorerSkin_List1_i() : List
      {
         var _loc1_:List = new List();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.setStyle("skinClass",VoiceExplorerProductListSkin);
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
      
      private function _VoiceProductExplorerSkin_VGroup2_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 0;
         _loc1_.horizontalAlign = "center";
         _loc1_.mxmlContent = [this._VoiceProductExplorerSkin_Spacer2_c(),this._VoiceProductExplorerSkin_Label2_i(),this._VoiceProductExplorerSkin_Spacer3_c()];
         _loc1_.id = "_VoiceProductExplorerSkin_VGroup2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._VoiceProductExplorerSkin_VGroup2 = _loc1_;
         BindingManager.executeBindings(this,"_VoiceProductExplorerSkin_VGroup2",this._VoiceProductExplorerSkin_VGroup2);
         return _loc1_;
      }
      
      private function _VoiceProductExplorerSkin_Spacer2_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.percentHeight = 30;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _VoiceProductExplorerSkin_Label2_i() : Label
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
      
      private function _VoiceProductExplorerSkin_Spacer3_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.percentHeight = 70;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _VoiceProductExplorerSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Search by keywords");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"searchInput.prompt");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = !!hostComponent.isSearching?SEARCH_RESULT_COPY:DEFAULT_PROMPT_COPY;
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_VoiceProductExplorerSkin_Label1.text");
         result[2] = new Binding(this,function():Boolean
         {
            return hostComponent.shouldDisplayPrompt();
         },null,"_VoiceProductExplorerSkin_VGroup2.visible");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get chromeGroup() : VGroup
      {
         return this._434221093chromeGroup;
      }
      
      public function set chromeGroup(param1:VGroup) : void
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
      public function get searchInput() : FocusTextInput
      {
         return this._559723774searchInput;
      }
      
      public function set searchInput(param1:FocusTextInput) : void
      {
         var _loc2_:Object = this._559723774searchInput;
         if(_loc2_ !== param1)
         {
            this._559723774searchInput = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"searchInput",_loc2_,param1));
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
