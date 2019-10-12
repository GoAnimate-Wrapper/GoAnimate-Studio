package anifire.studio.components
{
   import anifire.studio.models.WhiteboardHandModel;
   import anifire.studio.skins.WhiteboardHandListSkin;
   import anifire.util.UtilDict;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import spark.components.Button;
   import spark.components.CheckBox;
   import spark.components.Group;
   import spark.components.List;
   import spark.components.Panel;
   import spark.components.VGroup;
   
   use namespace mx_internal;
   
   public class WhiteboardHandPopUp extends DefaultPopUpContainer implements IBindingClient
   {
      
      public static const DATA_SELECTED_HAND:String = "selectedHand";
      
      public static const DATA_APPLY_TO_ALL:String = "applyToAll";
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _1990131276cancelButton:Button;
      
      private var _1361128838chrome:Group;
      
      private var _312699062closeButton:Button;
      
      private var _236983790confirmButton:Button;
      
      private var _1119661handList:List;
      
      private var _87223877motionOnlyCheckBox:CheckBox;
      
      private var _106433028panel:Panel;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function WhiteboardHandPopUp()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._WhiteboardHandPopUp_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_WhiteboardHandPopUpWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return WhiteboardHandPopUp[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._WhiteboardHandPopUp_Array1_c);
         this.addEventListener("creationComplete",this.___WhiteboardHandPopUp_DefaultPopUpContainer1_creationComplete);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         WhiteboardHandPopUp._watcherSetupUtil = param1;
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
         this.handList.dataProvider = WhiteboardHandModel.createHandModels();
      }
      
      override protected function confirm() : void
      {
         _data = {};
         _data[DATA_SELECTED_HAND] = this.handList.selectedItem.id;
         _data[DATA_APPLY_TO_ALL] = !this.motionOnlyCheckBox.selected;
         super.confirm();
      }
      
      public function setCurrentHand(param1:int) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         var _loc4_:WhiteboardHandModel = null;
         if(this.handList.dataProvider)
         {
            _loc2_ = false;
            _loc3_ = 0;
            while(_loc3_ < this.handList.dataProvider.length)
            {
               _loc4_ = this.handList.dataProvider[_loc3_];
               if(_loc4_.id == param1)
               {
                  this.handList.selectedItem = _loc4_;
                  _loc2_ = true;
                  break;
               }
               _loc3_++;
            }
            if(!_loc2_)
            {
               this.handList.selectedIndex = 0;
            }
         }
      }
      
      private function _WhiteboardHandPopUp_Array1_c() : Array
      {
         var _loc1_:Array = [this._WhiteboardHandPopUp_Group1_i()];
         return _loc1_;
      }
      
      private function _WhiteboardHandPopUp_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._WhiteboardHandPopUp_Panel1_i(),this._WhiteboardHandPopUp_Button3_i()];
         _loc1_.id = "chrome";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.chrome = _loc1_;
         BindingManager.executeBindings(this,"chrome",this.chrome);
         return _loc1_;
      }
      
      private function _WhiteboardHandPopUp_Panel1_i() : Panel
      {
         var _loc1_:Panel = new Panel();
         _loc1_.controlBarContent = [this._WhiteboardHandPopUp_Button1_i(),this._WhiteboardHandPopUp_Button2_i()];
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._WhiteboardHandPopUp_Array4_c);
         _loc1_.id = "panel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.panel = _loc1_;
         BindingManager.executeBindings(this,"panel",this.panel);
         return _loc1_;
      }
      
      private function _WhiteboardHandPopUp_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.styleName = "secondary";
         _loc1_.addEventListener("click",this.__cancelButton_click);
         _loc1_.id = "cancelButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.cancelButton = _loc1_;
         BindingManager.executeBindings(this,"cancelButton",this.cancelButton);
         return _loc1_;
      }
      
      public function __cancelButton_click(param1:MouseEvent) : void
      {
         cancel();
      }
      
      private function _WhiteboardHandPopUp_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.styleName = "primary";
         _loc1_.addEventListener("click",this.__confirmButton_click);
         _loc1_.id = "confirmButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.confirmButton = _loc1_;
         BindingManager.executeBindings(this,"confirmButton",this.confirmButton);
         return _loc1_;
      }
      
      public function __confirmButton_click(param1:MouseEvent) : void
      {
         this.confirm();
      }
      
      private function _WhiteboardHandPopUp_Array4_c() : Array
      {
         var _loc1_:Array = [this._WhiteboardHandPopUp_PopUpContentBackground1_c(),this._WhiteboardHandPopUp_VGroup1_c()];
         return _loc1_;
      }
      
      private function _WhiteboardHandPopUp_PopUpContentBackground1_c() : PopUpContentBackground
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
      
      private function _WhiteboardHandPopUp_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.paddingTop = 15;
         _loc1_.paddingBottom = 10;
         _loc1_.paddingLeft = 28;
         _loc1_.paddingRight = 28;
         _loc1_.mxmlContent = [this._WhiteboardHandPopUp_List1_i(),this._WhiteboardHandPopUp_CheckBox1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _WhiteboardHandPopUp_List1_i() : List
      {
         var _loc1_:List = new List();
         _loc1_.requireSelection = true;
         _loc1_.setStyle("skinClass",WhiteboardHandListSkin);
         _loc1_.id = "handList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.handList = _loc1_;
         BindingManager.executeBindings(this,"handList",this.handList);
         return _loc1_;
      }
      
      private function _WhiteboardHandPopUp_CheckBox1_i() : CheckBox
      {
         var _loc1_:CheckBox = new CheckBox();
         _loc1_.selected = false;
         _loc1_.id = "motionOnlyCheckBox";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.motionOnlyCheckBox = _loc1_;
         BindingManager.executeBindings(this,"motionOnlyCheckBox",this.motionOnlyCheckBox);
         return _loc1_;
      }
      
      private function _WhiteboardHandPopUp_Button3_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.styleName = "closePopUp";
         _loc1_.buttonMode = true;
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
      
      public function ___WhiteboardHandPopUp_DefaultPopUpContainer1_creationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      private function _WhiteboardHandPopUp_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Select a Hand");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"panel.title");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Cancel");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"cancelButton.label");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Update Hand");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"confirmButton.label");
         result[3] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Apply to this motion only");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"motionOnlyCheckBox.label");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get cancelButton() : Button
      {
         return this._1990131276cancelButton;
      }
      
      public function set cancelButton(param1:Button) : void
      {
         var _loc2_:Object = this._1990131276cancelButton;
         if(_loc2_ !== param1)
         {
            this._1990131276cancelButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cancelButton",_loc2_,param1));
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
      public function get confirmButton() : Button
      {
         return this._236983790confirmButton;
      }
      
      public function set confirmButton(param1:Button) : void
      {
         var _loc2_:Object = this._236983790confirmButton;
         if(_loc2_ !== param1)
         {
            this._236983790confirmButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"confirmButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get handList() : List
      {
         return this._1119661handList;
      }
      
      public function set handList(param1:List) : void
      {
         var _loc2_:Object = this._1119661handList;
         if(_loc2_ !== param1)
         {
            this._1119661handList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"handList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get motionOnlyCheckBox() : CheckBox
      {
         return this._87223877motionOnlyCheckBox;
      }
      
      public function set motionOnlyCheckBox(param1:CheckBox) : void
      {
         var _loc2_:Object = this._87223877motionOnlyCheckBox;
         if(_loc2_ !== param1)
         {
            this._87223877motionOnlyCheckBox = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"motionOnlyCheckBox",_loc2_,param1));
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
   }
}
