package anifire.studio.skins
{
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.containers.utilityClasses.ConstraintColumn;
   import mx.containers.utilityClasses.ConstraintRow;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.FormItem;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.RichText;
   import spark.components.VGroup;
   import spark.components.supportClasses.Skin;
   import spark.layouts.FormItemLayout;
   import spark.primitives.Path;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class PublishFormItemSkin extends Skin implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _1403938145_PublishFormItemSkin_HGroup1:HGroup;
      
      private var _1863788498_PublishFormItemSkin_VGroup2:VGroup;
      
      private var _264525383contentCol:ConstraintColumn;
      
      private var _809612678contentGroup:Group;
      
      private var _1455485010errorContentGroup:Group;
      
      private var _66023341errorTextDisplay:RichText;
      
      private var _205258905helpContentGroup:Group;
      
      private var _1959283220labelCol:ConstraintColumn;
      
      private var _1184053038labelDisplay:Label;
      
      private var _363087201requiredCol:ConstraintColumn;
      
      private var _3506583row1:ConstraintRow;
      
      private var _3506584row2:ConstraintRow;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:FormItem;
      
      public function PublishFormItemSkin()
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
         bindings = this._PublishFormItemSkin_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_skins_PublishFormItemSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return PublishFormItemSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.layout = this._PublishFormItemSkin_FormItemLayout1_c();
         this.mxmlContent = [this._PublishFormItemSkin_VGroup1_c()];
         this.currentState = "normal";
         var _PublishFormItemSkin_Group1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._PublishFormItemSkin_Group1_i);
         var _PublishFormItemSkin_Group3_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._PublishFormItemSkin_Group3_i);
         states = [new State({
            "name":"normal",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_PublishFormItemSkin_Group1_factory,
               "destination":"_PublishFormItemSkin_HGroup1",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["labelDisplay"]
            })]
         }),new State({
            "name":"disabled",
            "stateGroups":["disabledStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_PublishFormItemSkin_Group1_factory,
               "destination":"_PublishFormItemSkin_HGroup1",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["labelDisplay"]
            }),new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            })]
         }),new State({
            "name":"error",
            "stateGroups":["errorStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_PublishFormItemSkin_Group3_factory,
               "destination":"_PublishFormItemSkin_VGroup2",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["contentGroup"]
            })]
         }),new State({
            "name":"required",
            "stateGroups":["requiredStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_PublishFormItemSkin_Group1_factory,
               "destination":"_PublishFormItemSkin_HGroup1",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["labelDisplay"]
            })]
         }),new State({
            "name":"requiredAndDisabled",
            "stateGroups":["disabledStates","requiredStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_PublishFormItemSkin_Group1_factory,
               "destination":"_PublishFormItemSkin_HGroup1",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["labelDisplay"]
            }),new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            })]
         }),new State({
            "name":"requiredAndError",
            "stateGroups":["errorStates","requiredStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_PublishFormItemSkin_Group3_factory,
               "destination":"_PublishFormItemSkin_VGroup2",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["contentGroup"]
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
         PublishFormItemSkin._watcherSetupUtil = param1;
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
      
      private function _PublishFormItemSkin_FormItemLayout1_c() : FormItemLayout
      {
         var _loc1_:FormItemLayout = new FormItemLayout();
         _loc1_.constraintColumns = new <ConstraintColumn>[this._PublishFormItemSkin_ConstraintColumn1_i(),this._PublishFormItemSkin_ConstraintColumn2_i(),this._PublishFormItemSkin_ConstraintColumn3_i()];
         _loc1_.constraintRows = new <ConstraintRow>[this._PublishFormItemSkin_ConstraintRow1_i(),this._PublishFormItemSkin_ConstraintRow2_i()];
         return _loc1_;
      }
      
      private function _PublishFormItemSkin_ConstraintColumn1_i() : ConstraintColumn
      {
         var _loc1_:ConstraintColumn = new ConstraintColumn();
         _loc1_.initialized(this,"labelCol");
         this.labelCol = _loc1_;
         BindingManager.executeBindings(this,"labelCol",this.labelCol);
         return _loc1_;
      }
      
      private function _PublishFormItemSkin_ConstraintColumn2_i() : ConstraintColumn
      {
         var _loc1_:ConstraintColumn = new ConstraintColumn();
         _loc1_.initialized(this,"requiredCol");
         this.requiredCol = _loc1_;
         BindingManager.executeBindings(this,"requiredCol",this.requiredCol);
         return _loc1_;
      }
      
      private function _PublishFormItemSkin_ConstraintColumn3_i() : ConstraintColumn
      {
         var _loc1_:ConstraintColumn = new ConstraintColumn();
         _loc1_.percentWidth = 100;
         _loc1_.initialized(this,"contentCol");
         this.contentCol = _loc1_;
         BindingManager.executeBindings(this,"contentCol",this.contentCol);
         return _loc1_;
      }
      
      private function _PublishFormItemSkin_ConstraintRow1_i() : ConstraintRow
      {
         var _loc1_:ConstraintRow = new ConstraintRow();
         _loc1_.baseline = "maxAscent:5";
         _loc1_.percentHeight = 100;
         _loc1_.initialized(this,"row1");
         this.row1 = _loc1_;
         BindingManager.executeBindings(this,"row1",this.row1);
         return _loc1_;
      }
      
      private function _PublishFormItemSkin_ConstraintRow2_i() : ConstraintRow
      {
         var _loc1_:ConstraintRow = new ConstraintRow();
         _loc1_.baseline = "maxAscent:7";
         _loc1_.percentHeight = 100;
         _loc1_.initialized(this,"row2");
         this.row2 = _loc1_;
         BindingManager.executeBindings(this,"row2",this.row2);
         return _loc1_;
      }
      
      private function _PublishFormItemSkin_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.left = "contentCol:0";
         _loc1_.right = "contentCol:1";
         _loc1_.baseline = "row1:0";
         _loc1_.bottom = "row1:5";
         _loc1_.mxmlContent = [this._PublishFormItemSkin_HGroup1_i(),this._PublishFormItemSkin_VGroup2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _PublishFormItemSkin_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = 2;
         _loc1_.verticalAlign = "baseline";
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._PublishFormItemSkin_Label1_i()];
         _loc1_.id = "_PublishFormItemSkin_HGroup1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._PublishFormItemSkin_HGroup1 = _loc1_;
         BindingManager.executeBindings(this,"_PublishFormItemSkin_HGroup1",this._PublishFormItemSkin_HGroup1);
         return _loc1_;
      }
      
      private function _PublishFormItemSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("color",5331305);
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",this.labelDisplay);
         return _loc1_;
      }
      
      private function _PublishFormItemSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("fontWeight","normal");
         _loc1_.setStyle("color",9937845);
         _loc1_.id = "helpContentGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.helpContentGroup = _loc1_;
         BindingManager.executeBindings(this,"helpContentGroup",this.helpContentGroup);
         return _loc1_;
      }
      
      private function _PublishFormItemSkin_VGroup2_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = -4;
         _loc1_.mxmlContent = [this._PublishFormItemSkin_Group2_i()];
         _loc1_.id = "_PublishFormItemSkin_VGroup2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._PublishFormItemSkin_VGroup2 = _loc1_;
         BindingManager.executeBindings(this,"_PublishFormItemSkin_VGroup2",this._PublishFormItemSkin_VGroup2);
         return _loc1_;
      }
      
      private function _PublishFormItemSkin_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("showErrorTip",false);
         _loc1_.setStyle("showErrorSkin",true);
         _loc1_.id = "contentGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.contentGroup = _loc1_;
         BindingManager.executeBindings(this,"contentGroup",this.contentGroup);
         return _loc1_;
      }
      
      private function _PublishFormItemSkin_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._PublishFormItemSkin_Path1_c(),this._PublishFormItemSkin_Group4_c()];
         _loc1_.id = "errorContentGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.errorContentGroup = _loc1_;
         BindingManager.executeBindings(this,"errorContentGroup",this.errorContentGroup);
         return _loc1_;
      }
      
      private function _PublishFormItemSkin_Path1_c() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.left = 6;
         _loc1_.top = 0;
         _loc1_.data = "M 0 6 l 6 -6 l 6 6 Z";
         _loc1_.fill = this._PublishFormItemSkin_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _PublishFormItemSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 13184304;
         return _loc1_;
      }
      
      private function _PublishFormItemSkin_Group4_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.top = 6;
         _loc1_.mxmlContent = [this._PublishFormItemSkin_Rect1_c(),this._PublishFormItemSkin_RichText1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _PublishFormItemSkin_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.radiusX = 4;
         _loc1_.fill = this._PublishFormItemSkin_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _PublishFormItemSkin_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 13184304;
         return _loc1_;
      }
      
      private function _PublishFormItemSkin_RichText1_i() : RichText
      {
         var _loc1_:RichText = new RichText();
         _loc1_.maxDisplayedLines = -1;
         _loc1_.setStyle("paddingLeft",10);
         _loc1_.setStyle("paddingRight",10);
         _loc1_.setStyle("paddingTop",7);
         _loc1_.setStyle("paddingBottom",7);
         _loc1_.setStyle("fontWeight","normal");
         _loc1_.setStyle("color",16777215);
         _loc1_.setStyle("fontSize",14);
         _loc1_.id = "errorTextDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.errorTextDisplay = _loc1_;
         BindingManager.executeBindings(this,"errorTextDisplay",this.errorTextDisplay);
         return _loc1_;
      }
      
      private function _PublishFormItemSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Boolean
         {
            return hostComponent.label != null;
         },null,"_PublishFormItemSkin_HGroup1.visible");
         result[1] = new Binding(this,function():Boolean
         {
            return hostComponent.label != null;
         },null,"_PublishFormItemSkin_HGroup1.includeInLayout");
         result[2] = new Binding(this,function():Number
         {
            return errorContentGroup.width;
         },null,"errorTextDisplay.maxWidth");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _PublishFormItemSkin_HGroup1() : HGroup
      {
         return this._1403938145_PublishFormItemSkin_HGroup1;
      }
      
      public function set _PublishFormItemSkin_HGroup1(param1:HGroup) : void
      {
         var _loc2_:Object = this._1403938145_PublishFormItemSkin_HGroup1;
         if(_loc2_ !== param1)
         {
            this._1403938145_PublishFormItemSkin_HGroup1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_PublishFormItemSkin_HGroup1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _PublishFormItemSkin_VGroup2() : VGroup
      {
         return this._1863788498_PublishFormItemSkin_VGroup2;
      }
      
      public function set _PublishFormItemSkin_VGroup2(param1:VGroup) : void
      {
         var _loc2_:Object = this._1863788498_PublishFormItemSkin_VGroup2;
         if(_loc2_ !== param1)
         {
            this._1863788498_PublishFormItemSkin_VGroup2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_PublishFormItemSkin_VGroup2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get contentCol() : ConstraintColumn
      {
         return this._264525383contentCol;
      }
      
      public function set contentCol(param1:ConstraintColumn) : void
      {
         var _loc2_:Object = this._264525383contentCol;
         if(_loc2_ !== param1)
         {
            this._264525383contentCol = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"contentCol",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get contentGroup() : Group
      {
         return this._809612678contentGroup;
      }
      
      public function set contentGroup(param1:Group) : void
      {
         var _loc2_:Object = this._809612678contentGroup;
         if(_loc2_ !== param1)
         {
            this._809612678contentGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"contentGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get errorContentGroup() : Group
      {
         return this._1455485010errorContentGroup;
      }
      
      public function set errorContentGroup(param1:Group) : void
      {
         var _loc2_:Object = this._1455485010errorContentGroup;
         if(_loc2_ !== param1)
         {
            this._1455485010errorContentGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"errorContentGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get errorTextDisplay() : RichText
      {
         return this._66023341errorTextDisplay;
      }
      
      public function set errorTextDisplay(param1:RichText) : void
      {
         var _loc2_:Object = this._66023341errorTextDisplay;
         if(_loc2_ !== param1)
         {
            this._66023341errorTextDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"errorTextDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get helpContentGroup() : Group
      {
         return this._205258905helpContentGroup;
      }
      
      public function set helpContentGroup(param1:Group) : void
      {
         var _loc2_:Object = this._205258905helpContentGroup;
         if(_loc2_ !== param1)
         {
            this._205258905helpContentGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"helpContentGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get labelCol() : ConstraintColumn
      {
         return this._1959283220labelCol;
      }
      
      public function set labelCol(param1:ConstraintColumn) : void
      {
         var _loc2_:Object = this._1959283220labelCol;
         if(_loc2_ !== param1)
         {
            this._1959283220labelCol = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"labelCol",_loc2_,param1));
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
      public function get requiredCol() : ConstraintColumn
      {
         return this._363087201requiredCol;
      }
      
      public function set requiredCol(param1:ConstraintColumn) : void
      {
         var _loc2_:Object = this._363087201requiredCol;
         if(_loc2_ !== param1)
         {
            this._363087201requiredCol = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"requiredCol",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get row1() : ConstraintRow
      {
         return this._3506583row1;
      }
      
      public function set row1(param1:ConstraintRow) : void
      {
         var _loc2_:Object = this._3506583row1;
         if(_loc2_ !== param1)
         {
            this._3506583row1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"row1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get row2() : ConstraintRow
      {
         return this._3506584row2;
      }
      
      public function set row2(param1:ConstraintRow) : void
      {
         var _loc2_:Object = this._3506584row2;
         if(_loc2_ !== param1)
         {
            this._3506584row2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"row2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : FormItem
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:FormItem) : void
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
