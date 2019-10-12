package anifire.studio.components
{
   import anifire.studio.commands.ChangePropStateCommand;
   import anifire.studio.commands.ICommand;
   import anifire.studio.core.Prop;
   import anifire.studio.core.PropThumb;
   import anifire.studio.core.State;
   import anifire.studio.core.Thumb;
   import anifire.studio.models.MenuItemModel;
   import anifire.studio.models.ThumbModel;
   import anifire.studio.skins.CharacterPropDropDownListSkin;
   import anifire.studio.skins.ClearCharacterActionButtonSkin;
   import anifire.util.UtilDict;
   import anifire.util.UtilString;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.ArrayCollection;
   import mx.collections.IList;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.events.DropDownEvent;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class CharacterPropPanel extends Group implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _CharacterPropPanel_Label1:Label;
      
      private var _2071192609clearButton:Button;
      
      private var _1875904479propDisplay:ProductThumbSparkImage;
      
      private var _819188908propStateList:spark.components.DropDownList;
      
      private var _2146085971selectionGroup:Group;
      
      private var _1795581177titleGroup:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _prop:Prop;
      
      protected var _stateLookup:Object;
      
      protected var _351773468_propStates:ArrayCollection;
      
      private var _110371416title:String;
      
      private var _1219428931displayClearButton:Boolean = true;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function CharacterPropPanel()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._CharacterPropPanel_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_CharacterPropPanelWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return CharacterPropPanel[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._CharacterPropPanel_HGroup1_c()];
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         CharacterPropPanel._watcherSetupUtil = param1;
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
      
      public function get prop() : Prop
      {
         return this._prop;
      }
      
      public function set prop(param1:Prop) : void
      {
         if(this._prop != param1)
         {
            this._prop = param1;
            if(this._prop && this._prop.thumb.xml)
            {
               this.createMenuModel(this._prop.thumb.xml);
               this.propDisplay.model = new ThumbModel(this._prop.thumb as Thumb);
            }
            else
            {
               this.propStateList.selectedItem = null;
               this.propDisplay.model = null;
               this._propStates = null;
               this._stateLookup = null;
            }
         }
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
      
      protected function onClearButtonClick(param1:MouseEvent) : void
      {
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      protected function onPropListClose(param1:DropDownEvent) : void
      {
         var _loc3_:ICommand = null;
         var _loc2_:MenuItemModel = this.propStateList.selectedItem as MenuItemModel;
         if(_loc2_ && this._prop)
         {
            _loc3_ = new ChangePropStateCommand(this._prop,_loc2_.value as State);
            _loc3_.execute();
         }
      }
      
      private function _CharacterPropPanel_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._CharacterPropPanel_Group2_i(),this._CharacterPropPanel_Group3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CharacterPropPanel_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 98;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._CharacterPropPanel_Rect1_c(),this._CharacterPropPanel_Line1_c(),this._CharacterPropPanel_Line2_c(),this._CharacterPropPanel_HGroup2_c()];
         _loc1_.id = "titleGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.titleGroup = _loc1_;
         BindingManager.executeBindings(this,"titleGroup",this.titleGroup);
         return _loc1_;
      }
      
      private function _CharacterPropPanel_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._CharacterPropPanel_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _CharacterPropPanel_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 3233154;
         return _loc1_;
      }
      
      private function _CharacterPropPanel_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.top = 0;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.stroke = this._CharacterPropPanel_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _CharacterPropPanel_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 4023184;
         return _loc1_;
      }
      
      private function _CharacterPropPanel_Line2_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.top = 1;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.stroke = this._CharacterPropPanel_SolidColorStroke2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _CharacterPropPanel_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 5276350;
         return _loc1_;
      }
      
      private function _CharacterPropPanel_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = 5;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.verticalAlign = "middle";
         _loc1_.paddingLeft = 10;
         _loc1_.paddingRight = 5;
         _loc1_.mxmlContent = [this._CharacterPropPanel_Label1_i(),this._CharacterPropPanel_Button1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CharacterPropPanel_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("paddingTop",4);
         _loc1_.setStyle("color",16777215);
         _loc1_.id = "_CharacterPropPanel_Label1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CharacterPropPanel_Label1 = _loc1_;
         BindingManager.executeBindings(this,"_CharacterPropPanel_Label1",this._CharacterPropPanel_Label1);
         return _loc1_;
      }
      
      private function _CharacterPropPanel_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.setStyle("skinClass",ClearCharacterActionButtonSkin);
         _loc1_.addEventListener("click",this.__clearButton_click);
         _loc1_.id = "clearButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.clearButton = _loc1_;
         BindingManager.executeBindings(this,"clearButton",this.clearButton);
         return _loc1_;
      }
      
      public function __clearButton_click(param1:MouseEvent) : void
      {
         this.onClearButtonClick(param1);
      }
      
      private function _CharacterPropPanel_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._CharacterPropPanel_Line3_c(),this._CharacterPropPanel_Group4_c()];
         _loc1_.id = "selectionGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.selectionGroup = _loc1_;
         BindingManager.executeBindings(this,"selectionGroup",this.selectionGroup);
         return _loc1_;
      }
      
      private function _CharacterPropPanel_Line3_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.stroke = this._CharacterPropPanel_SolidColorStroke3_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _CharacterPropPanel_SolidColorStroke3_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 14606820;
         return _loc1_;
      }
      
      private function _CharacterPropPanel_Group4_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.left = 4;
         _loc1_.right = 4;
         _loc1_.top = 6;
         _loc1_.bottom = 5;
         _loc1_.mxmlContent = [this._CharacterPropPanel_DropDownList1_i(),this._CharacterPropPanel_Group5_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CharacterPropPanel_DropDownList1_i() : spark.components.DropDownList
      {
         var _loc1_:spark.components.DropDownList = new spark.components.DropDownList();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.buttonMode = true;
         _loc1_.setStyle("skinClass",CharacterPropDropDownListSkin);
         _loc1_.addEventListener("close",this.__propStateList_close);
         _loc1_.id = "propStateList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.propStateList = _loc1_;
         BindingManager.executeBindings(this,"propStateList",this.propStateList);
         return _loc1_;
      }
      
      public function __propStateList_close(param1:DropDownEvent) : void
      {
         this.onPropListClose(param1);
      }
      
      private function _CharacterPropPanel_Group5_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 10;
         _loc1_.width = 31;
         _loc1_.height = 31;
         _loc1_.mxmlContent = [this._CharacterPropPanel_ProductThumbSparkImage1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CharacterPropPanel_ProductThumbSparkImage1_i() : ProductThumbSparkImage
      {
         var _loc1_:ProductThumbSparkImage = new ProductThumbSparkImage();
         _loc1_.left = 2;
         _loc1_.right = 2;
         _loc1_.top = 2;
         _loc1_.bottom = 2;
         _loc1_.id = "propDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.propDisplay = _loc1_;
         BindingManager.executeBindings(this,"propDisplay",this.propDisplay);
         return _loc1_;
      }
      
      private function _CharacterPropPanel_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,null,"_CharacterPropPanel_Label1.text","title");
         result[1] = new Binding(this,null,null,"clearButton.visible","displayClearButton");
         result[2] = new Binding(this,null,null,"clearButton.includeInLayout","displayClearButton");
         result[3] = new Binding(this,function():IList
         {
            return _propStates;
         },null,"propStateList.dataProvider");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get clearButton() : Button
      {
         return this._2071192609clearButton;
      }
      
      public function set clearButton(param1:Button) : void
      {
         var _loc2_:Object = this._2071192609clearButton;
         if(_loc2_ !== param1)
         {
            this._2071192609clearButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"clearButton",_loc2_,param1));
            }
         }
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
      public function get selectionGroup() : Group
      {
         return this._2146085971selectionGroup;
      }
      
      public function set selectionGroup(param1:Group) : void
      {
         var _loc2_:Object = this._2146085971selectionGroup;
         if(_loc2_ !== param1)
         {
            this._2146085971selectionGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"selectionGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get titleGroup() : Group
      {
         return this._1795581177titleGroup;
      }
      
      public function set titleGroup(param1:Group) : void
      {
         var _loc2_:Object = this._1795581177titleGroup;
         if(_loc2_ !== param1)
         {
            this._1795581177titleGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"titleGroup",_loc2_,param1));
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
      
      [Bindable(event="propertyChange")]
      public function get title() : String
      {
         return this._110371416title;
      }
      
      public function set title(param1:String) : void
      {
         var _loc2_:Object = this._110371416title;
         if(_loc2_ !== param1)
         {
            this._110371416title = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"title",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get displayClearButton() : Boolean
      {
         return this._1219428931displayClearButton;
      }
      
      public function set displayClearButton(param1:Boolean) : void
      {
         var _loc2_:Object = this._1219428931displayClearButton;
         if(_loc2_ !== param1)
         {
            this._1219428931displayClearButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displayClearButton",_loc2_,param1));
            }
         }
      }
   }
}
