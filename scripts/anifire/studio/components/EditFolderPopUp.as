package anifire.studio.components
{
   import anifire.studio.core.Thumb;
   import anifire.studio.validators.AssetTitleValidator;
   import anifire.util.UtilDict;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.validators.Validator;
   import spark.components.Button;
   import spark.components.Form;
   import spark.components.FormItem;
   import spark.components.Group;
   import spark.components.Panel;
   import spark.components.TextInput;
   import spark.components.VGroup;
   
   use namespace mx_internal;
   
   public class EditFolderPopUp extends DefaultPopUpContainer implements IBindingClient, IStateClient2
   {
      
      public static const DATA_NAME:String = "name";
      
      public static const POPUP_TITLE:String = "Edit Info";
      
      private static const NAME_LABEL:String = "Name";
      
      private static const CONFIRM_TEXT:String = "Update";
      
      private static const CANCEL_TEXT:String = "Cancel";
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _EditFolderPopUp_AssetTitleValidator1:AssetTitleValidator;
      
      public var _EditFolderPopUp_BusyIndicator1:BusyIndicator;
      
      public var _EditFolderPopUp_Button1:Button;
      
      public var _EditFolderPopUp_Button2:Button;
      
      public var _EditFolderPopUp_Button3:Button;
      
      public var _EditFolderPopUp_FormItem1:FormItem;
      
      private var _578168068_EditFolderPopUp_Group1:Group;
      
      public var _EditFolderPopUp_Panel1:Panel;
      
      private var _1213385727nameInput:TextInput;
      
      private var _528206064validatorList:Array;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _273158742_nameLabel:String;
      
      protected var _thumb:Thumb;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function EditFolderPopUp()
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
         bindings = this._EditFolderPopUp_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_EditFolderPopUpWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return EditFolderPopUp[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._EditFolderPopUp_Array3_c);
         this.currentState = "normal";
         this._EditFolderPopUp_Array1_i();
         var _EditFolderPopUp_BusyIndicator1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._EditFolderPopUp_BusyIndicator1_i);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"loading",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_EditFolderPopUp_BusyIndicator1_factory,
               "destination":"_EditFolderPopUp_Group1",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_EditFolderPopUp_Button3"]
            }),new SetProperty().initializeFromObject({
               "target":"_EditFolderPopUp_Group1",
               "name":"mouseEnabled",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"_EditFolderPopUp_Group1",
               "name":"mouseChildren",
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
         EditFolderPopUp._watcherSetupUtil = param1;
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
      
      public function set thumb(param1:Thumb) : void
      {
         if(this._thumb != param1)
         {
            this._thumb = param1;
            if(initialized)
            {
               this.updateUI();
            }
         }
      }
      
      override protected function confirm() : void
      {
         var _loc1_:Array = Validator.validateAll(this.validatorList);
         if(_loc1_.length == 0)
         {
            _data = {};
            _data[DATA_NAME] = this.nameInput.text;
            super.confirm();
         }
      }
      
      override protected function init() : void
      {
         super.init();
         this._nameLabel = UtilDict.translate(NAME_LABEL) + ":";
         this.confirmText = UtilDict.translate(CONFIRM_TEXT);
         this.cancelText = UtilDict.translate(CANCEL_TEXT);
         this.updateUI();
      }
      
      protected function updateUI() : void
      {
         if(this._thumb)
         {
            this.nameInput.text = this._thumb.name;
         }
      }
      
      private function _EditFolderPopUp_Array1_i() : Array
      {
         var _loc1_:Array = [this._EditFolderPopUp_AssetTitleValidator1_i()];
         this.validatorList = _loc1_;
         BindingManager.executeBindings(this,"validatorList",this.validatorList);
         return _loc1_;
      }
      
      private function _EditFolderPopUp_AssetTitleValidator1_i() : AssetTitleValidator
      {
         var _loc1_:AssetTitleValidator = new AssetTitleValidator();
         _loc1_.property = "text";
         _loc1_.initialized(this,"_EditFolderPopUp_AssetTitleValidator1");
         this._EditFolderPopUp_AssetTitleValidator1 = _loc1_;
         BindingManager.executeBindings(this,"_EditFolderPopUp_AssetTitleValidator1",this._EditFolderPopUp_AssetTitleValidator1);
         return _loc1_;
      }
      
      private function _EditFolderPopUp_Array3_c() : Array
      {
         var _loc1_:Array = [this._EditFolderPopUp_Group1_i()];
         return _loc1_;
      }
      
      private function _EditFolderPopUp_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._EditFolderPopUp_Panel1_i(),this._EditFolderPopUp_Button3_i()];
         _loc1_.id = "_EditFolderPopUp_Group1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._EditFolderPopUp_Group1 = _loc1_;
         BindingManager.executeBindings(this,"_EditFolderPopUp_Group1",this._EditFolderPopUp_Group1);
         return _loc1_;
      }
      
      private function _EditFolderPopUp_Panel1_i() : Panel
      {
         var _loc1_:Panel = new Panel();
         _loc1_.controlBarContent = [this._EditFolderPopUp_Button1_i(),this._EditFolderPopUp_Button2_i()];
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._EditFolderPopUp_Array6_c);
         _loc1_.id = "_EditFolderPopUp_Panel1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._EditFolderPopUp_Panel1 = _loc1_;
         BindingManager.executeBindings(this,"_EditFolderPopUp_Panel1",this._EditFolderPopUp_Panel1);
         return _loc1_;
      }
      
      private function _EditFolderPopUp_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.styleName = "secondary";
         _loc1_.addEventListener("click",this.___EditFolderPopUp_Button1_click);
         _loc1_.id = "_EditFolderPopUp_Button1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._EditFolderPopUp_Button1 = _loc1_;
         BindingManager.executeBindings(this,"_EditFolderPopUp_Button1",this._EditFolderPopUp_Button1);
         return _loc1_;
      }
      
      public function ___EditFolderPopUp_Button1_click(param1:MouseEvent) : void
      {
         cancel();
      }
      
      private function _EditFolderPopUp_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.styleName = "primary";
         _loc1_.addEventListener("click",this.___EditFolderPopUp_Button2_click);
         _loc1_.id = "_EditFolderPopUp_Button2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._EditFolderPopUp_Button2 = _loc1_;
         BindingManager.executeBindings(this,"_EditFolderPopUp_Button2",this._EditFolderPopUp_Button2);
         return _loc1_;
      }
      
      public function ___EditFolderPopUp_Button2_click(param1:MouseEvent) : void
      {
         this.confirm();
      }
      
      private function _EditFolderPopUp_Array6_c() : Array
      {
         var _loc1_:Array = [this._EditFolderPopUp_PopUpContentBackground1_c(),this._EditFolderPopUp_VGroup1_c()];
         return _loc1_;
      }
      
      private function _EditFolderPopUp_PopUpContentBackground1_c() : PopUpContentBackground
      {
         var _loc1_:PopUpContentBackground = new PopUpContentBackground();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _EditFolderPopUp_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.gap = 20;
         _loc1_.paddingTop = 25;
         _loc1_.paddingBottom = 25;
         _loc1_.paddingLeft = 28;
         _loc1_.paddingRight = 28;
         _loc1_.mxmlContent = [this._EditFolderPopUp_Form1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _EditFolderPopUp_Form1_c() : Form
      {
         var _loc1_:Form = new Form();
         _loc1_.minWidth = 300;
         _loc1_.horizontalCenter = 0;
         _loc1_.styleName = "publish";
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._EditFolderPopUp_Array8_c);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _EditFolderPopUp_Array8_c() : Array
      {
         var _loc1_:Array = [this._EditFolderPopUp_FormItem1_i()];
         return _loc1_;
      }
      
      private function _EditFolderPopUp_FormItem1_i() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._EditFolderPopUp_Array9_c);
         _loc1_.id = "_EditFolderPopUp_FormItem1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._EditFolderPopUp_FormItem1 = _loc1_;
         BindingManager.executeBindings(this,"_EditFolderPopUp_FormItem1",this._EditFolderPopUp_FormItem1);
         return _loc1_;
      }
      
      private function _EditFolderPopUp_Array9_c() : Array
      {
         var _loc1_:Array = [this._EditFolderPopUp_TextInput1_i()];
         return _loc1_;
      }
      
      private function _EditFolderPopUp_TextInput1_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.percentWidth = 100;
         _loc1_.id = "nameInput";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.nameInput = _loc1_;
         BindingManager.executeBindings(this,"nameInput",this.nameInput);
         return _loc1_;
      }
      
      private function _EditFolderPopUp_Button3_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.styleName = "closePopUp";
         _loc1_.buttonMode = true;
         _loc1_.top = 0;
         _loc1_.right = 0;
         _loc1_.width = 50;
         _loc1_.height = 50;
         _loc1_.addEventListener("click",this.___EditFolderPopUp_Button3_click);
         _loc1_.id = "_EditFolderPopUp_Button3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._EditFolderPopUp_Button3 = _loc1_;
         BindingManager.executeBindings(this,"_EditFolderPopUp_Button3",this._EditFolderPopUp_Button3);
         return _loc1_;
      }
      
      public function ___EditFolderPopUp_Button3_click(param1:MouseEvent) : void
      {
         cancel();
      }
      
      private function _EditFolderPopUp_BusyIndicator1_i() : BusyIndicator
      {
         var _loc1_:BusyIndicator = new BusyIndicator();
         _loc1_.width = 60;
         _loc1_.height = 60;
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.setStyle("symbolColor",16777215);
         _loc1_.id = "_EditFolderPopUp_BusyIndicator1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._EditFolderPopUp_BusyIndicator1 = _loc1_;
         BindingManager.executeBindings(this,"_EditFolderPopUp_BusyIndicator1",this._EditFolderPopUp_BusyIndicator1);
         return _loc1_;
      }
      
      private function _EditFolderPopUp_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,null,"_EditFolderPopUp_AssetTitleValidator1.source","nameInput");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate(POPUP_TITLE);
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_EditFolderPopUp_Panel1.title");
         result[2] = new Binding(this,null,null,"_EditFolderPopUp_Button1.label","cancelText");
         result[3] = new Binding(this,null,null,"_EditFolderPopUp_Button2.label","confirmText");
         result[4] = new Binding(this,function():String
         {
            var _loc1_:* = _nameLabel;
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_EditFolderPopUp_FormItem1.label");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _EditFolderPopUp_Group1() : Group
      {
         return this._578168068_EditFolderPopUp_Group1;
      }
      
      public function set _EditFolderPopUp_Group1(param1:Group) : void
      {
         var _loc2_:Object = this._578168068_EditFolderPopUp_Group1;
         if(_loc2_ !== param1)
         {
            this._578168068_EditFolderPopUp_Group1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_EditFolderPopUp_Group1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get nameInput() : TextInput
      {
         return this._1213385727nameInput;
      }
      
      public function set nameInput(param1:TextInput) : void
      {
         var _loc2_:Object = this._1213385727nameInput;
         if(_loc2_ !== param1)
         {
            this._1213385727nameInput = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"nameInput",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get validatorList() : Array
      {
         return this._528206064validatorList;
      }
      
      public function set validatorList(param1:Array) : void
      {
         var _loc2_:Object = this._528206064validatorList;
         if(_loc2_ !== param1)
         {
            this._528206064validatorList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"validatorList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _nameLabel() : String
      {
         return this._273158742_nameLabel;
      }
      
      protected function set _nameLabel(param1:String) : void
      {
         var _loc2_:Object = this._273158742_nameLabel;
         if(_loc2_ !== param1)
         {
            this._273158742_nameLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_nameLabel",_loc2_,param1));
            }
         }
      }
   }
}
