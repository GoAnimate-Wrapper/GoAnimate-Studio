package anifire.studio.skins
{
   import anifire.studio.components.ArrowTipContainer;
   import anifire.studio.components.BehaviorItemRenderer;
   import anifire.studio.components.DropDownList;
   import anifire.studio.components.FaceThumbSparkImage;
   import anifire.studio.components.PopUpAnchor;
   import anifire.studio.models.FacePreviewModel;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
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
   import spark.components.DataGroup;
   import spark.components.Group;
   import spark.components.Label;
   import spark.components.Scroller;
   import spark.layouts.VerticalLayout;
   import spark.skins.SparkSkin;
   
   use namespace mx_internal;
   
   public class ExpressionDropDownListSkin extends SparkSkin implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _1751797770arrowGroup:ArrowTipContainer;
      
      private var _385593099dataGroup:DataGroup;
      
      private var _433014735dropDown:Group;
      
      private var _65116251faceDisplay:FaceThumbSparkImage;
      
      private var _1184053038labelDisplay:Label;
      
      private var _137111012openButton:Button;
      
      private var _106851532popUp:PopUpAnchor;
      
      private var _402164678scroller:Scroller;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:DropDownList;
      
      public function ExpressionDropDownListSkin()
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
         bindings = this._ExpressionDropDownListSkin_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_skins_ExpressionDropDownListSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ExpressionDropDownListSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._ExpressionDropDownListSkin_Button1_i(),this._ExpressionDropDownListSkin_Group2_c()];
         this.currentState = "normal";
         var _ExpressionDropDownListSkin_PopUpAnchor1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ExpressionDropDownListSkin_PopUpAnchor1_i,this._ExpressionDropDownListSkin_PopUpAnchor1_r);
         states = [new State({
            "name":"normal",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"popUp",
               "name":"displayPopUp",
               "value":false
            })]
         }),new State({
            "name":"open",
            "overrides":[new AddItems().initializeFromObject({
               "destructionPolicy":"auto",
               "itemsFactory":_ExpressionDropDownListSkin_PopUpAnchor1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new SetProperty().initializeFromObject({
               "target":"popUp",
               "name":"displayPopUp",
               "value":true
            })]
         }),new State({
            "name":"disabled",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"openButton",
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
         ExpressionDropDownListSkin._watcherSetupUtil = param1;
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
      
      private function _ExpressionDropDownListSkin_PopUpAnchor1_i() : PopUpAnchor
      {
         var _loc1_:PopUpAnchor = new PopUpAnchor();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.autoClose = false;
         _loc1_.popUpWidthMatchesAnchorWidth = false;
         _loc1_.popUp = this._ExpressionDropDownListSkin_Group1_i();
         _loc1_.id = "popUp";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.popUp = _loc1_;
         BindingManager.executeBindings(this,"popUp",this.popUp);
         return _loc1_;
      }
      
      private function _ExpressionDropDownListSkin_PopUpAnchor1_r() : void
      {
      }
      
      private function _ExpressionDropDownListSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._ExpressionDropDownListSkin_ArrowTipContainer1_i()];
         _loc1_.id = "dropDown";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dropDown = _loc1_;
         BindingManager.executeBindings(this,"dropDown",this.dropDown);
         return _loc1_;
      }
      
      private function _ExpressionDropDownListSkin_ArrowTipContainer1_i() : ArrowTipContainer
      {
         var _loc1_:ArrowTipContainer = new ArrowTipContainer();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.targetWidth = 31;
         _loc1_.offset = 10;
         _loc1_.content = [this._ExpressionDropDownListSkin_Scroller1_i()];
         _loc1_.id = "arrowGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.arrowGroup = _loc1_;
         BindingManager.executeBindings(this,"arrowGroup",this.arrowGroup);
         return _loc1_;
      }
      
      private function _ExpressionDropDownListSkin_Scroller1_i() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.hasFocusableChildren = false;
         _loc1_.minViewportInset = 1;
         _loc1_.viewport = this._ExpressionDropDownListSkin_DataGroup1_i();
         _loc1_.setStyle("horizontalScrollPolicy","off");
         _loc1_.id = "scroller";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.scroller = _loc1_;
         BindingManager.executeBindings(this,"scroller",this.scroller);
         return _loc1_;
      }
      
      private function _ExpressionDropDownListSkin_DataGroup1_i() : DataGroup
      {
         var _loc1_:DataGroup = new DataGroup();
         _loc1_.itemRenderer = this._ExpressionDropDownListSkin_ClassFactory1_c();
         _loc1_.layout = this._ExpressionDropDownListSkin_VerticalLayout1_c();
         _loc1_.id = "dataGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dataGroup = _loc1_;
         BindingManager.executeBindings(this,"dataGroup",this.dataGroup);
         return _loc1_;
      }
      
      private function _ExpressionDropDownListSkin_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = BehaviorItemRenderer;
         return _loc1_;
      }
      
      private function _ExpressionDropDownListSkin_VerticalLayout1_c() : VerticalLayout
      {
         var _loc1_:VerticalLayout = new VerticalLayout();
         _loc1_.gap = 0;
         _loc1_.horizontalAlign = "contentJustify";
         _loc1_.useVirtualLayout = false;
         _loc1_.requestedMinRowCount = 1;
         _loc1_.requestedMaxRowCount = 7;
         return _loc1_;
      }
      
      private function _ExpressionDropDownListSkin_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.focusEnabled = false;
         _loc1_.tabEnabled = false;
         _loc1_.setStyle("skinClass",FlatDropDownListOpenButtonSkin);
         _loc1_.id = "openButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.openButton = _loc1_;
         BindingManager.executeBindings(this,"openButton",this.openButton);
         return _loc1_;
      }
      
      private function _ExpressionDropDownListSkin_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 10;
         _loc1_.right = 30;
         _loc1_.verticalCenter = 0;
         _loc1_.mouseEnabled = false;
         _loc1_.mouseChildren = false;
         _loc1_.mxmlContent = [this._ExpressionDropDownListSkin_Group3_c(),this._ExpressionDropDownListSkin_Label1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ExpressionDropDownListSkin_Group3_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 31;
         _loc1_.height = 31;
         _loc1_.mxmlContent = [this._ExpressionDropDownListSkin_FaceThumbSparkImage1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ExpressionDropDownListSkin_FaceThumbSparkImage1_i() : FaceThumbSparkImage
      {
         var _loc1_:FaceThumbSparkImage = new FaceThumbSparkImage();
         _loc1_.left = 2;
         _loc1_.right = 2;
         _loc1_.top = 2;
         _loc1_.bottom = 2;
         _loc1_.id = "faceDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.faceDisplay = _loc1_;
         BindingManager.executeBindings(this,"faceDisplay",this.faceDisplay);
         return _loc1_;
      }
      
      private function _ExpressionDropDownListSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.maxDisplayedLines = 1;
         _loc1_.left = 45;
         _loc1_.right = 0;
         _loc1_.top = 2;
         _loc1_.bottom = 4;
         _loc1_.width = 75;
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.setStyle("paddingTop",4);
         _loc1_.setStyle("color",5331305);
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",this.labelDisplay);
         return _loc1_;
      }
      
      private function _ExpressionDropDownListSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = hostComponent.popUpPosition;
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"popUp.popUpPosition");
         result[1] = new Binding(this,function():Number
         {
            return openButton.width;
         },null,"dropDown.minWidth");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = hostComponent.popUpPosition;
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"arrowGroup.tipPosition");
         result[3] = new Binding(this,function():FacePreviewModel
         {
            return hostComponent.selectedItem.value;
         },null,"faceDisplay.model");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get arrowGroup() : ArrowTipContainer
      {
         return this._1751797770arrowGroup;
      }
      
      public function set arrowGroup(param1:ArrowTipContainer) : void
      {
         var _loc2_:Object = this._1751797770arrowGroup;
         if(_loc2_ !== param1)
         {
            this._1751797770arrowGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"arrowGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dataGroup() : DataGroup
      {
         return this._385593099dataGroup;
      }
      
      public function set dataGroup(param1:DataGroup) : void
      {
         var _loc2_:Object = this._385593099dataGroup;
         if(_loc2_ !== param1)
         {
            this._385593099dataGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dataGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dropDown() : Group
      {
         return this._433014735dropDown;
      }
      
      public function set dropDown(param1:Group) : void
      {
         var _loc2_:Object = this._433014735dropDown;
         if(_loc2_ !== param1)
         {
            this._433014735dropDown = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dropDown",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get faceDisplay() : FaceThumbSparkImage
      {
         return this._65116251faceDisplay;
      }
      
      public function set faceDisplay(param1:FaceThumbSparkImage) : void
      {
         var _loc2_:Object = this._65116251faceDisplay;
         if(_loc2_ !== param1)
         {
            this._65116251faceDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"faceDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get labelDisplay() : Label
      {
         return this._1184053038labelDisplay;
      }
      
      public function set labelDisplay(param1:Label) : void
      {
         var _loc2_:Object = this._1184053038labelDisplay;
         if(_loc2_ !== param1)
         {
            this._1184053038labelDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"labelDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get openButton() : Button
      {
         return this._137111012openButton;
      }
      
      public function set openButton(param1:Button) : void
      {
         var _loc2_:Object = this._137111012openButton;
         if(_loc2_ !== param1)
         {
            this._137111012openButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"openButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get popUp() : PopUpAnchor
      {
         return this._106851532popUp;
      }
      
      public function set popUp(param1:PopUpAnchor) : void
      {
         var _loc2_:Object = this._106851532popUp;
         if(_loc2_ !== param1)
         {
            this._106851532popUp = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"popUp",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scroller() : Scroller
      {
         return this._402164678scroller;
      }
      
      public function set scroller(param1:Scroller) : void
      {
         var _loc2_:Object = this._402164678scroller;
         if(_loc2_ !== param1)
         {
            this._402164678scroller = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scroller",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : DropDownList
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:DropDownList) : void
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
