package anifire.studio.components
{
   import anifire.studio.commands.ChangePropStateCommand;
   import anifire.studio.commands.ICommand;
   import anifire.studio.core.Prop;
   import anifire.studio.core.PropThumb;
   import anifire.studio.core.State;
   import anifire.studio.events.AssetEvent;
   import anifire.studio.models.MenuItemModel;
   import anifire.studio.models.ThumbModel;
   import anifire.studio.skins.PropStateDropDownListSkin;
   import anifire.util.UtilDict;
   import anifire.util.UtilString;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.ArrayCollection;
   import mx.collections.IList;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.components.VGroup;
   import spark.events.IndexChangeEvent;
   
   use namespace mx_internal;
   
   public class PropStatePanel extends spark.components.NavigatorContent implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _1875904479propDisplay:ProductThumbSparkImage;
      
      private var _819188908propStateList:spark.components.DropDownList;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _prop:Prop;
      
      protected var _stateLookup:Object;
      
      protected var _351773468_propStates:ArrayCollection;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function PropStatePanel()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._PropStatePanel_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_PropStatePanelWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return PropStatePanel[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._PropStatePanel_Array1_c);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         PropStatePanel._watcherSetupUtil = param1;
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
      
      public function set target(param1:Object) : void
      {
         if(this._prop != param1)
         {
            if(this._prop)
            {
               this._prop.removeEventListener(AssetEvent.STATE_CHANGE,this.onPropStateChange);
            }
            this._prop = param1 as Prop;
            createDeferredContent();
            if(this._prop && this._prop.thumb)
            {
               this._prop.addEventListener(AssetEvent.STATE_CHANGE,this.onPropStateChange);
               this.createMenuModel(this._prop.thumb.xml);
               this.propDisplay.model = new ThumbModel(this._prop.thumb,this._prop.thumb.firstColorSetId);
            }
            else
            {
               this._propStates = null;
               this._stateLookup = null;
               this.propDisplay.model = null;
            }
         }
      }
      
      private function getTitle(param1:Prop) : String
      {
         if(param1)
         {
            return UtilString.firstLetterToUpperCase(UtilDict.toDisplay("store",(param1.thumb as PropThumb).name));
         }
         return "";
      }
      
      private function createMenuModel(param1:XML) : void
      {
         var _loc3_:MenuItemModel = null;
         var _loc5_:State = null;
         var _loc6_:MenuItemModel = null;
         this._propStates = new ArrayCollection();
         this._stateLookup = {};
         var _loc2_:PropThumb = this._prop.thumb as PropThumb;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.states.length)
         {
            _loc5_ = _loc2_.states[_loc4_] as State;
            if(_loc5_.isEnable)
            {
               _loc6_ = new MenuItemModel(UtilString.firstLetterToUpperCase(UtilDict.toDisplay("store",_loc5_.name)),_loc5_);
               this._propStates.addItem(_loc6_);
               this._stateLookup[_loc5_.id] = _loc6_;
               if(this._prop.stateId == _loc5_.id)
               {
                  _loc3_ = _loc6_;
               }
            }
            _loc4_++;
         }
         if(this._propStates.length > 0)
         {
            this.propStateList.enabled = true;
            this.propStateList.selectedItem = _loc3_;
         }
         else
         {
            this.propStateList.enabled = false;
            this.propStateList.prompt = UtilString.firstLetterToUpperCase(UtilDict.toDisplay("store",_loc2_.name));
         }
      }
      
      protected function onPropChange(param1:IndexChangeEvent) : void
      {
         var _loc3_:ICommand = null;
         var _loc2_:MenuItemModel = this.propStateList.selectedItem as MenuItemModel;
         if(_loc2_ && this._prop)
         {
            _loc3_ = new ChangePropStateCommand(this._prop,_loc2_.value as State);
            _loc3_.execute();
         }
      }
      
      protected function onPropStateChange(param1:AssetEvent) : void
      {
         if(this._propStates.length > 0)
         {
            this.propStateList.selectedItem = this._stateLookup[this._prop.stateId];
         }
      }
      
      private function _PropStatePanel_Array1_c() : Array
      {
         var _loc1_:Array = [this._PropStatePanel_VGroup1_c()];
         return _loc1_;
      }
      
      private function _PropStatePanel_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.paddingLeft = 14;
         _loc1_.paddingRight = 14;
         _loc1_.paddingTop = 4;
         _loc1_.paddingBottom = 14;
         _loc1_.mxmlContent = [this._PropStatePanel_Group1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _PropStatePanel_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._PropStatePanel_DropDownList1_i(),this._PropStatePanel_ProductThumbSparkImage1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _PropStatePanel_DropDownList1_i() : spark.components.DropDownList
      {
         var _loc1_:spark.components.DropDownList = new spark.components.DropDownList();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.buttonMode = true;
         _loc1_.setStyle("skinClass",PropStateDropDownListSkin);
         _loc1_.addEventListener("change",this.__propStateList_change);
         _loc1_.id = "propStateList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.propStateList = _loc1_;
         BindingManager.executeBindings(this,"propStateList",this.propStateList);
         return _loc1_;
      }
      
      public function __propStateList_change(param1:IndexChangeEvent) : void
      {
         this.onPropChange(param1);
      }
      
      private function _PropStatePanel_ProductThumbSparkImage1_i() : ProductThumbSparkImage
      {
         var _loc1_:ProductThumbSparkImage = new ProductThumbSparkImage();
         _loc1_.left = 10;
         _loc1_.top = 5;
         _loc1_.bottom = 5;
         _loc1_.width = 30;
         _loc1_.height = 30;
         _loc1_.id = "propDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.propDisplay = _loc1_;
         BindingManager.executeBindings(this,"propDisplay",this.propDisplay);
         return _loc1_;
      }
      
      private function _PropStatePanel_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():IList
         {
            return _propStates;
         },null,"propStateList.dataProvider");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get propDisplay() : ProductThumbSparkImage
      {
         return this._1875904479propDisplay;
      }
      
      public function set propDisplay(param1:ProductThumbSparkImage) : void
      {
         var _loc2_:Object = this._1875904479propDisplay;
         if(_loc2_ !== param1)
         {
            this._1875904479propDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"propDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get propStateList() : spark.components.DropDownList
      {
         return this._819188908propStateList;
      }
      
      public function set propStateList(param1:spark.components.DropDownList) : void
      {
         var _loc2_:Object = this._819188908propStateList;
         if(_loc2_ !== param1)
         {
            this._819188908propStateList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"propStateList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _propStates() : ArrayCollection
      {
         return this._351773468_propStates;
      }
      
      protected function set _propStates(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._351773468_propStates;
         if(_loc2_ !== param1)
         {
            this._351773468_propStates = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_propStates",_loc2_,param1));
            }
         }
      }
   }
}
