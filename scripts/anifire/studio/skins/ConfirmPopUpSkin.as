package anifire.studio.skins
{
   import anifire.studio.components.ConfirmPopUp;
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
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.Panel;
   import spark.components.VGroup;
   import spark.components.supportClasses.Skin;
   import spark.layouts.VerticalLayout;
   import spark.primitives.BitmapImage;
   
   use namespace mx_internal;
   
   public class ConfirmPopUpSkin extends Skin implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _1990131276cancelButton:Button;
      
      private var _1361128838chrome:Group;
      
      private var _312699062closeButton:Button;
      
      private var _236983790confirmButton:Button;
      
      private var _1031744009iconDisplay:BitmapImage;
      
      private var _1304200403messageLabel:Label;
      
      private var _106433028panel:Panel;
      
      private var _1574621811subMessageLabel:Label;
      
      private var _1893287094titleDisplay:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:ConfirmPopUp;
      
      public function ConfirmPopUpSkin()
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
         bindings = this._ConfirmPopUpSkin_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_skins_ConfirmPopUpSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ConfirmPopUpSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._ConfirmPopUpSkin_Group1_i()];
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"disabled",
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            })]
         }),new State({
            "name":"closed",
            "stateGroups":["closedGroup"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"chrome",
               "name":"visible",
               "value":false
            })]
         }),new State({
            "name":"disabledAndClosed",
            "stateGroups":["closedGroup"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"chrome",
               "name":"visible",
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
         ConfirmPopUpSkin._watcherSetupUtil = param1;
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
      
      private function _ConfirmPopUpSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._ConfirmPopUpSkin_Panel1_i(),this._ConfirmPopUpSkin_Button3_i()];
         _loc1_.id = "chrome";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.chrome = _loc1_;
         BindingManager.executeBindings(this,"chrome",this.chrome);
         return _loc1_;
      }
      
      private function _ConfirmPopUpSkin_Panel1_i() : Panel
      {
         var _loc1_:Panel = new Panel();
         _loc1_.minWidth = 200;
         _loc1_.maxWidth = 450;
         _loc1_.layout = this._ConfirmPopUpSkin_VerticalLayout1_c();
         _loc1_.controlBarContent = [this._ConfirmPopUpSkin_Button1_i(),this._ConfirmPopUpSkin_Button2_i()];
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._ConfirmPopUpSkin_Array7_c);
         _loc1_.id = "panel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.panel = _loc1_;
         BindingManager.executeBindings(this,"panel",this.panel);
         return _loc1_;
      }
      
      private function _ConfirmPopUpSkin_VerticalLayout1_c() : VerticalLayout
      {
         var _loc1_:VerticalLayout = new VerticalLayout();
         _loc1_.gap = 20;
         _loc1_.paddingTop = 30;
         _loc1_.paddingLeft = 25;
         _loc1_.paddingRight = 25;
         _loc1_.paddingBottom = 32;
         return _loc1_;
      }
      
      private function _ConfirmPopUpSkin_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.styleName = "secondary";
         _loc1_.id = "cancelButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.cancelButton = _loc1_;
         BindingManager.executeBindings(this,"cancelButton",this.cancelButton);
         return _loc1_;
      }
      
      private function _ConfirmPopUpSkin_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.styleName = "primary";
         _loc1_.id = "confirmButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.confirmButton = _loc1_;
         BindingManager.executeBindings(this,"confirmButton",this.confirmButton);
         return _loc1_;
      }
      
      private function _ConfirmPopUpSkin_Array7_c() : Array
      {
         var _loc1_:Array = [this._ConfirmPopUpSkin_HGroup1_c()];
         return _loc1_;
      }
      
      private function _ConfirmPopUpSkin_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 15;
         _loc1_.verticalAlign = "baseline";
         _loc1_.mxmlContent = [this._ConfirmPopUpSkin_BitmapImage1_i(),this._ConfirmPopUpSkin_VGroup1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ConfirmPopUpSkin_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.baseline = -15;
         _loc1_.initialized(this,"iconDisplay");
         this.iconDisplay = _loc1_;
         BindingManager.executeBindings(this,"iconDisplay",this.iconDisplay);
         return _loc1_;
      }
      
      private function _ConfirmPopUpSkin_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 10;
         _loc1_.mxmlContent = [this._ConfirmPopUpSkin_Label1_i(),this._ConfirmPopUpSkin_Label2_i(),this._ConfirmPopUpSkin_Label3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ConfirmPopUpSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("fontSize",21);
         _loc1_.setStyle("color",5267059);
         _loc1_.id = "titleDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.titleDisplay = _loc1_;
         BindingManager.executeBindings(this,"titleDisplay",this.titleDisplay);
         return _loc1_;
      }
      
      private function _ConfirmPopUpSkin_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("color",3355443);
         _loc1_.id = "messageLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.messageLabel = _loc1_;
         BindingManager.executeBindings(this,"messageLabel",this.messageLabel);
         return _loc1_;
      }
      
      private function _ConfirmPopUpSkin_Label3_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("fontSize",10);
         _loc1_.setStyle("color",6710886);
         _loc1_.id = "subMessageLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.subMessageLabel = _loc1_;
         BindingManager.executeBindings(this,"subMessageLabel",this.subMessageLabel);
         return _loc1_;
      }
      
      private function _ConfirmPopUpSkin_Button3_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.styleName = "closePopUp";
         _loc1_.top = 0;
         _loc1_.right = 0;
         _loc1_.width = 50;
         _loc1_.height = 50;
         _loc1_.buttonMode = true;
         _loc1_.id = "closeButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.closeButton = _loc1_;
         BindingManager.executeBindings(this,"closeButton",this.closeButton);
         return _loc1_;
      }
      
      private function _ConfirmPopUpSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = null;
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"panel.title");
         result[1] = new Binding(this,function():Boolean
         {
            return hostComponent.iconType != 0;
         },null,"iconDisplay.visible");
         result[2] = new Binding(this,function():Boolean
         {
            return hostComponent.iconType != 0;
         },null,"iconDisplay.includeInLayout");
         result[3] = new Binding(this,function():Boolean
         {
            return hostComponent.title != null;
         },null,"titleDisplay.visible");
         result[4] = new Binding(this,function():Boolean
         {
            return hostComponent.title != null;
         },null,"titleDisplay.includeInLayout");
         result[5] = new Binding(this,function():String
         {
            var _loc1_:* = hostComponent.title;
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"titleDisplay.text");
         result[6] = new Binding(this,function():Boolean
         {
            return hostComponent.subMessage != null;
         },null,"subMessageLabel.visible");
         result[7] = new Binding(this,function():Boolean
         {
            return hostComponent.subMessage != null;
         },null,"subMessageLabel.includeInLayout");
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
      public function get iconDisplay() : BitmapImage
      {
         return this._1031744009iconDisplay;
      }
      
      public function set iconDisplay(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1031744009iconDisplay;
         if(_loc2_ !== param1)
         {
            this._1031744009iconDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"iconDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get messageLabel() : Label
      {
         return this._1304200403messageLabel;
      }
      
      public function set messageLabel(param1:Label) : void
      {
         var _loc2_:Object = this._1304200403messageLabel;
         if(_loc2_ !== param1)
         {
            this._1304200403messageLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"messageLabel",_loc2_,param1));
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
      public function get subMessageLabel() : Label
      {
         return this._1574621811subMessageLabel;
      }
      
      public function set subMessageLabel(param1:Label) : void
      {
         var _loc2_:Object = this._1574621811subMessageLabel;
         if(_loc2_ !== param1)
         {
            this._1574621811subMessageLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"subMessageLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get titleDisplay() : Label
      {
         return this._1893287094titleDisplay;
      }
      
      public function set titleDisplay(param1:Label) : void
      {
         var _loc2_:Object = this._1893287094titleDisplay;
         if(_loc2_ !== param1)
         {
            this._1893287094titleDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"titleDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : ConfirmPopUp
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:ConfirmPopUp) : void
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
