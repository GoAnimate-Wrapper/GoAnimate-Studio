package anifire.studio.components
{
   import anifire.event.CoreEvent;
   import anifire.studio.core.Console;
   import anifire.studio.managers.TextComponentManager;
   import anifire.studio.models.TextComponentThumb;
   import anifire.util.UtilDict;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import flash.utils.setTimeout;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.ArrayCollection;
   import mx.collections.IList;
   import mx.core.ClassFactory;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Button;
   import spark.components.CheckBox;
   import spark.components.Form;
   import spark.components.FormItem;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.Panel;
   import spark.components.TextInput;
   import spark.components.VGroup;
   import spark.events.IndexChangeEvent;
   
   use namespace mx_internal;
   
   public class SaveTextComponentWindow extends DefaultPopUpContainer implements IBindingClient, IStateClient2
   {
      
      private static const DEFAULT_ERROR_MSG:String = "Text component could not be saved.";
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _SaveTextComponentWindow_Button1:Button;
      
      private var _799389710_SaveTextComponentWindow_Group2:Group;
      
      public var _SaveTextComponentWindow_HGroup1:HGroup;
      
      public var _SaveTextComponentWindow_PopUpContentBackground1:PopUpContentBackground;
      
      private var _1361128838chrome:Group;
      
      private var _312699062closeButton:Button;
      
      private var _1920075162errorDisplay:Label;
      
      private var _106433028panel:Panel;
      
      private var _1465991201replaceTextComponentCheckbox:CheckBox;
      
      private var _117673263replaceTextComponentItem:FormItem;
      
      private var _913416787statusGroup:VGroup;
      
      private var _1741687026textComponentList:spark.components.DropDownList;
      
      private var _1490029455textComponentNameInput:TextInput;
      
      private var _1488962734textComponentThumbnailInput:TextInput;
      
      private var _1987699119textComponentThumbnailItem:FormItem;
      
      private var _1859427045textComponentTitleItem:FormItem;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _967458370_textComponents:ArrayCollection;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SaveTextComponentWindow()
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
         bindings = this._SaveTextComponentWindow_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_SaveTextComponentWindowWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SaveTextComponentWindow[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._SaveTextComponentWindow_Array5_c);
         this.currentState = "normal";
         var _SaveTextComponentWindow_Button2_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._SaveTextComponentWindow_Button2_i);
         var _SaveTextComponentWindow_HGroup1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._SaveTextComponentWindow_HGroup1_i);
         var _SaveTextComponentWindow_Label1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._SaveTextComponentWindow_Label1_i);
         var _SaveTextComponentWindow_VGroup1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._SaveTextComponentWindow_VGroup1_i);
         states = [new State({
            "name":"normal",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_SaveTextComponentWindow_Button2_factory,
               "destination":"chrome",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["panel"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_SaveTextComponentWindow_HGroup1_factory,
               "destination":"_SaveTextComponentWindow_Group2",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_SaveTextComponentWindow_PopUpContentBackground1"]
            })]
         }),new State({
            "name":"loading",
            "stateGroups":["processing"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_SaveTextComponentWindow_VGroup1_factory,
               "destination":"_SaveTextComponentWindow_Group2",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_SaveTextComponentWindow_PopUpContentBackground1"]
            }),new SetProperty().initializeFromObject({
               "target":"panel",
               "name":"enabled",
               "value":false
            })]
         }),new State({
            "name":"error",
            "stateGroups":["processing"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_SaveTextComponentWindow_Label1_factory,
               "destination":"_SaveTextComponentWindow_Group2",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_SaveTextComponentWindow_PopUpContentBackground1"]
            }),new SetProperty().initializeFromObject({
               "target":"panel",
               "name":"enabled",
               "value":false
            })]
         }),new State({
            "name":"complete",
            "stateGroups":["processing"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"panel",
               "name":"enabled",
               "value":false
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
         SaveTextComponentWindow._watcherSetupUtil = param1;
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
      
      override protected function init() : void
      {
         var _loc1_:TextComponentManager = null;
         super.init();
         _loc1_ = TextComponentManager.instance;
         if(_loc1_.textComponents)
         {
            this._textComponents = _loc1_.textComponents;
         }
         else
         {
            currentState = "loading";
            _loc1_.addEventListener(CoreEvent.TEXT_COMPONENT_LIST_LOADED,this.textComponentManager_textComponentListLoadedHandler);
            _loc1_.loadTextComponentList();
         }
      }
      
      private function textComponentManager_textComponentListLoadedHandler(param1:CoreEvent) : void
      {
         var _loc2_:TextComponentManager = TextComponentManager.instance;
         _loc2_.removeEventListener(CoreEvent.TEXT_COMPONENT_LIST_LOADED,this.textComponentManager_textComponentListLoadedHandler);
         this._textComponents = _loc2_.textComponents;
         currentState = "normal";
      }
      
      private function saveTextComponent() : void
      {
         var _loc1_:String = null;
         var _loc2_:String = null;
         var _loc3_:Boolean = false;
         var _loc5_:String = null;
         _loc1_ = this.textComponentNameInput.text;
         _loc2_ = this.textComponentThumbnailInput.text;
         _loc3_ = this.replaceTextComponentCheckbox.selected;
         if(!_loc1_ || !_loc2_)
         {
            return;
         }
         currentState = "loading";
         var _loc4_:Console = Console.getConsole();
         _loc4_.addEventListener(CoreEvent.SAVE_TEXT_COMPONENT_COMPLETE,this.onSaveComplete);
         _loc4_.addEventListener(CoreEvent.SAVE_TEXT_COMPONENT_ERROR,this.onSaveError);
         if(_loc3_)
         {
            if(!this.textComponentList.selectedItem)
            {
               return;
            }
            _loc5_ = this.textComponentList.selectedItem.id;
            _loc4_.updateTextComponent(_loc5_,_loc1_,_loc2_);
         }
         else
         {
            _loc4_.addTextComponent(_loc1_,_loc2_);
         }
      }
      
      private function removeConsoleListeners() : void
      {
         var _loc1_:Console = Console.getConsole();
         _loc1_.removeEventListener(CoreEvent.SAVE_TEXT_COMPONENT_COMPLETE,this.onSaveComplete);
         _loc1_.removeEventListener(CoreEvent.SAVE_TEXT_COMPONENT_ERROR,this.onSaveError);
      }
      
      private function onSaveComplete(param1:CoreEvent) : void
      {
         this.removeConsoleListeners();
         currentState = "complete";
         setTimeout(confirm,1000);
      }
      
      private function onSaveError(param1:CoreEvent) : void
      {
         this.removeConsoleListeners();
         currentState = "error";
         var _loc2_:String = param1.getData() as String;
         if(_loc2_)
         {
            this.errorDisplay.text = _loc2_;
         }
         else
         {
            this.errorDisplay.text = DEFAULT_ERROR_MSG;
         }
         setTimeout(this.reset,1000);
      }
      
      private function reset() : void
      {
         currentState = "normal";
      }
      
      private function textComponentList_changeHandler(param1:IndexChangeEvent) : void
      {
         var _loc2_:TextComponentThumb = this.textComponentList.selectedItem as TextComponentThumb;
         this.textComponentNameInput.text = _loc2_.name;
         this.textComponentThumbnailInput.text = _loc2_.thumbnail;
      }
      
      private function _SaveTextComponentWindow_Array5_c() : Array
      {
         var _loc1_:Array = [this._SaveTextComponentWindow_Group1_i()];
         return _loc1_;
      }
      
      private function _SaveTextComponentWindow_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._SaveTextComponentWindow_Panel1_i()];
         _loc1_.id = "chrome";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.chrome = _loc1_;
         BindingManager.executeBindings(this,"chrome",this.chrome);
         return _loc1_;
      }
      
      private function _SaveTextComponentWindow_Panel1_i() : Panel
      {
         var _loc1_:Panel = new Panel();
         _loc1_.width = 400;
         _loc1_.minHeight = 360;
         _loc1_.controlBarContent = [this._SaveTextComponentWindow_Button1_i()];
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._SaveTextComponentWindow_Array8_c);
         _loc1_.id = "panel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.panel = _loc1_;
         BindingManager.executeBindings(this,"panel",this.panel);
         return _loc1_;
      }
      
      private function _SaveTextComponentWindow_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.styleName = "primary";
         _loc1_.addEventListener("click",this.___SaveTextComponentWindow_Button1_click);
         _loc1_.id = "_SaveTextComponentWindow_Button1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SaveTextComponentWindow_Button1 = _loc1_;
         BindingManager.executeBindings(this,"_SaveTextComponentWindow_Button1",this._SaveTextComponentWindow_Button1);
         return _loc1_;
      }
      
      public function ___SaveTextComponentWindow_Button1_click(param1:MouseEvent) : void
      {
         this.saveTextComponent();
      }
      
      private function _SaveTextComponentWindow_Array8_c() : Array
      {
         var _loc1_:Array = [this._SaveTextComponentWindow_Group2_i()];
         return _loc1_;
      }
      
      private function _SaveTextComponentWindow_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._SaveTextComponentWindow_PopUpContentBackground1_i()];
         _loc1_.id = "_SaveTextComponentWindow_Group2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SaveTextComponentWindow_Group2 = _loc1_;
         BindingManager.executeBindings(this,"_SaveTextComponentWindow_Group2",this._SaveTextComponentWindow_Group2);
         return _loc1_;
      }
      
      private function _SaveTextComponentWindow_PopUpContentBackground1_i() : PopUpContentBackground
      {
         var _loc1_:PopUpContentBackground = new PopUpContentBackground();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.id = "_SaveTextComponentWindow_PopUpContentBackground1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SaveTextComponentWindow_PopUpContentBackground1 = _loc1_;
         BindingManager.executeBindings(this,"_SaveTextComponentWindow_PopUpContentBackground1",this._SaveTextComponentWindow_PopUpContentBackground1);
         return _loc1_;
      }
      
      private function _SaveTextComponentWindow_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 20;
         _loc1_.paddingLeft = 28;
         _loc1_.paddingRight = 28;
         _loc1_.paddingTop = 25;
         _loc1_.paddingBottom = 25;
         _loc1_.mxmlContent = [this._SaveTextComponentWindow_Form1_c()];
         _loc1_.id = "_SaveTextComponentWindow_HGroup1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SaveTextComponentWindow_HGroup1 = _loc1_;
         BindingManager.executeBindings(this,"_SaveTextComponentWindow_HGroup1",this._SaveTextComponentWindow_HGroup1);
         return _loc1_;
      }
      
      private function _SaveTextComponentWindow_Form1_c() : Form
      {
         var _loc1_:Form = new Form();
         _loc1_.percentWidth = 100;
         _loc1_.styleName = "publish";
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._SaveTextComponentWindow_Array11_c);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SaveTextComponentWindow_Array11_c() : Array
      {
         var _loc1_:Array = [this._SaveTextComponentWindow_FormItem1_i(),this._SaveTextComponentWindow_FormItem2_i(),this._SaveTextComponentWindow_FormItem3_i()];
         return _loc1_;
      }
      
      private function _SaveTextComponentWindow_FormItem1_i() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.required = true;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._SaveTextComponentWindow_Array12_c);
         _loc1_.id = "textComponentTitleItem";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.textComponentTitleItem = _loc1_;
         BindingManager.executeBindings(this,"textComponentTitleItem",this.textComponentTitleItem);
         return _loc1_;
      }
      
      private function _SaveTextComponentWindow_Array12_c() : Array
      {
         var _loc1_:Array = [this._SaveTextComponentWindow_TextInput1_i()];
         return _loc1_;
      }
      
      private function _SaveTextComponentWindow_TextInput1_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.percentWidth = 100;
         _loc1_.maxChars = 50;
         _loc1_.id = "textComponentNameInput";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.textComponentNameInput = _loc1_;
         BindingManager.executeBindings(this,"textComponentNameInput",this.textComponentNameInput);
         return _loc1_;
      }
      
      private function _SaveTextComponentWindow_FormItem2_i() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.required = true;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._SaveTextComponentWindow_Array13_c);
         _loc1_.id = "textComponentThumbnailItem";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.textComponentThumbnailItem = _loc1_;
         BindingManager.executeBindings(this,"textComponentThumbnailItem",this.textComponentThumbnailItem);
         return _loc1_;
      }
      
      private function _SaveTextComponentWindow_Array13_c() : Array
      {
         var _loc1_:Array = [this._SaveTextComponentWindow_TextInput2_i()];
         return _loc1_;
      }
      
      private function _SaveTextComponentWindow_TextInput2_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.percentWidth = 100;
         _loc1_.maxChars = 50;
         _loc1_.id = "textComponentThumbnailInput";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.textComponentThumbnailInput = _loc1_;
         BindingManager.executeBindings(this,"textComponentThumbnailInput",this.textComponentThumbnailInput);
         return _loc1_;
      }
      
      private function _SaveTextComponentWindow_FormItem3_i() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._SaveTextComponentWindow_Array14_c);
         _loc1_.id = "replaceTextComponentItem";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.replaceTextComponentItem = _loc1_;
         BindingManager.executeBindings(this,"replaceTextComponentItem",this.replaceTextComponentItem);
         return _loc1_;
      }
      
      private function _SaveTextComponentWindow_Array14_c() : Array
      {
         var _loc1_:Array = [this._SaveTextComponentWindow_HGroup2_c()];
         return _loc1_;
      }
      
      private function _SaveTextComponentWindow_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.verticalAlign = "baseline";
         _loc1_.mxmlContent = [this._SaveTextComponentWindow_CheckBox1_i(),this._SaveTextComponentWindow_DropDownList1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SaveTextComponentWindow_CheckBox1_i() : CheckBox
      {
         var _loc1_:CheckBox = new CheckBox();
         _loc1_.id = "replaceTextComponentCheckbox";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.replaceTextComponentCheckbox = _loc1_;
         BindingManager.executeBindings(this,"replaceTextComponentCheckbox",this.replaceTextComponentCheckbox);
         return _loc1_;
      }
      
      private function _SaveTextComponentWindow_DropDownList1_i() : spark.components.DropDownList
      {
         var _loc1_:spark.components.DropDownList = new spark.components.DropDownList();
         _loc1_.percentWidth = 100;
         _loc1_.useVirtualLayout = true;
         _loc1_.itemRenderer = this._SaveTextComponentWindow_ClassFactory1_c();
         _loc1_.addEventListener("change",this.__textComponentList_change);
         _loc1_.id = "textComponentList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.textComponentList = _loc1_;
         BindingManager.executeBindings(this,"textComponentList",this.textComponentList);
         return _loc1_;
      }
      
      private function _SaveTextComponentWindow_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = TextComponentInfoRenderer;
         return _loc1_;
      }
      
      public function __textComponentList_change(param1:IndexChangeEvent) : void
      {
         this.textComponentList_changeHandler(param1);
      }
      
      private function _SaveTextComponentWindow_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.verticalAlign = "middle";
         _loc1_.horizontalAlign = "center";
         _loc1_.gap = 20;
         _loc1_.mxmlContent = [this._SaveTextComponentWindow_BusyIndicator1_c()];
         _loc1_.id = "statusGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.statusGroup = _loc1_;
         BindingManager.executeBindings(this,"statusGroup",this.statusGroup);
         return _loc1_;
      }
      
      private function _SaveTextComponentWindow_BusyIndicator1_c() : BusyIndicator
      {
         var _loc1_:BusyIndicator = new BusyIndicator();
         _loc1_.width = 60;
         _loc1_.height = 60;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SaveTextComponentWindow_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.horizontalCenter = "center";
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("color",16711680);
         _loc1_.setStyle("fontSize",16);
         _loc1_.id = "errorDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.errorDisplay = _loc1_;
         BindingManager.executeBindings(this,"errorDisplay",this.errorDisplay);
         return _loc1_;
      }
      
      private function _SaveTextComponentWindow_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.styleName = "closePopUp";
         _loc1_.top = 0;
         _loc1_.right = 0;
         _loc1_.width = 50;
         _loc1_.height = 50;
         _loc1_.addEventListener("click",this.__closeButton_click);
         _loc1_.id = "closeButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.closeButton = _loc1_;
         BindingManager.executeBindings(this,"closeButton",this.closeButton);
         return _loc1_;
      }
      
      public function __closeButton_click(param1:MouseEvent) : void
      {
         cancel();
      }
      
      private function _SaveTextComponentWindow_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Save a new text component");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"panel.title");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Save Text Component");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_SaveTextComponentWindow_Button1.label");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Name");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"textComponentTitleItem.label");
         result[3] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Thumbnail");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"textComponentThumbnailItem.label");
         result[4] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Update Text Component");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"replaceTextComponentItem.label");
         result[5] = new Binding(this,function():Boolean
         {
            return replaceTextComponentCheckbox.selected;
         },null,"textComponentList.enabled");
         result[6] = new Binding(this,function():IList
         {
            return _textComponents;
         },null,"textComponentList.dataProvider");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _SaveTextComponentWindow_Group2() : Group
      {
         return this._799389710_SaveTextComponentWindow_Group2;
      }
      
      public function set _SaveTextComponentWindow_Group2(param1:Group) : void
      {
         var _loc2_:Object = this._799389710_SaveTextComponentWindow_Group2;
         if(_loc2_ !== param1)
         {
            this._799389710_SaveTextComponentWindow_Group2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SaveTextComponentWindow_Group2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get chrome() : Group
      {
         return this._1361128838chrome;
      }
      
      public function set chrome(param1:Group) : void
      {
         var _loc2_:Object = this._1361128838chrome;
         if(_loc2_ !== param1)
         {
            this._1361128838chrome = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"chrome",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get closeButton() : Button
      {
         return this._312699062closeButton;
      }
      
      public function set closeButton(param1:Button) : void
      {
         var _loc2_:Object = this._312699062closeButton;
         if(_loc2_ !== param1)
         {
            this._312699062closeButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"closeButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get errorDisplay() : Label
      {
         return this._1920075162errorDisplay;
      }
      
      public function set errorDisplay(param1:Label) : void
      {
         var _loc2_:Object = this._1920075162errorDisplay;
         if(_loc2_ !== param1)
         {
            this._1920075162errorDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"errorDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get panel() : Panel
      {
         return this._106433028panel;
      }
      
      public function set panel(param1:Panel) : void
      {
         var _loc2_:Object = this._106433028panel;
         if(_loc2_ !== param1)
         {
            this._106433028panel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"panel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get replaceTextComponentCheckbox() : CheckBox
      {
         return this._1465991201replaceTextComponentCheckbox;
      }
      
      public function set replaceTextComponentCheckbox(param1:CheckBox) : void
      {
         var _loc2_:Object = this._1465991201replaceTextComponentCheckbox;
         if(_loc2_ !== param1)
         {
            this._1465991201replaceTextComponentCheckbox = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"replaceTextComponentCheckbox",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get replaceTextComponentItem() : FormItem
      {
         return this._117673263replaceTextComponentItem;
      }
      
      public function set replaceTextComponentItem(param1:FormItem) : void
      {
         var _loc2_:Object = this._117673263replaceTextComponentItem;
         if(_loc2_ !== param1)
         {
            this._117673263replaceTextComponentItem = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"replaceTextComponentItem",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get statusGroup() : VGroup
      {
         return this._913416787statusGroup;
      }
      
      public function set statusGroup(param1:VGroup) : void
      {
         var _loc2_:Object = this._913416787statusGroup;
         if(_loc2_ !== param1)
         {
            this._913416787statusGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"statusGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get textComponentList() : spark.components.DropDownList
      {
         return this._1741687026textComponentList;
      }
      
      public function set textComponentList(param1:spark.components.DropDownList) : void
      {
         var _loc2_:Object = this._1741687026textComponentList;
         if(_loc2_ !== param1)
         {
            this._1741687026textComponentList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textComponentList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get textComponentNameInput() : TextInput
      {
         return this._1490029455textComponentNameInput;
      }
      
      public function set textComponentNameInput(param1:TextInput) : void
      {
         var _loc2_:Object = this._1490029455textComponentNameInput;
         if(_loc2_ !== param1)
         {
            this._1490029455textComponentNameInput = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textComponentNameInput",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get textComponentThumbnailInput() : TextInput
      {
         return this._1488962734textComponentThumbnailInput;
      }
      
      public function set textComponentThumbnailInput(param1:TextInput) : void
      {
         var _loc2_:Object = this._1488962734textComponentThumbnailInput;
         if(_loc2_ !== param1)
         {
            this._1488962734textComponentThumbnailInput = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textComponentThumbnailInput",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get textComponentThumbnailItem() : FormItem
      {
         return this._1987699119textComponentThumbnailItem;
      }
      
      public function set textComponentThumbnailItem(param1:FormItem) : void
      {
         var _loc2_:Object = this._1987699119textComponentThumbnailItem;
         if(_loc2_ !== param1)
         {
            this._1987699119textComponentThumbnailItem = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textComponentThumbnailItem",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get textComponentTitleItem() : FormItem
      {
         return this._1859427045textComponentTitleItem;
      }
      
      public function set textComponentTitleItem(param1:FormItem) : void
      {
         var _loc2_:Object = this._1859427045textComponentTitleItem;
         if(_loc2_ !== param1)
         {
            this._1859427045textComponentTitleItem = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textComponentTitleItem",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _textComponents() : ArrayCollection
      {
         return this._967458370_textComponents;
      }
      
      private function set _textComponents(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._967458370_textComponents;
         if(_loc2_ !== param1)
         {
            this._967458370_textComponents = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_textComponents",_loc2_,param1));
            }
         }
      }
   }
}
