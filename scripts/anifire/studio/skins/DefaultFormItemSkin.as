package anifire.studio.skins
{
   import mx.binding.BindingManager;
   import mx.containers.utilityClasses.ConstraintColumn;
   import mx.containers.utilityClasses.ConstraintRow;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.FormItem;
   import spark.components.Group;
   import spark.components.Label;
   import spark.components.RichText;
   import spark.components.VGroup;
   import spark.components.supportClasses.Skin;
   import spark.layouts.FormItemLayout;
   import spark.layouts.VerticalLayout;
   
   public class DefaultFormItemSkin extends Skin implements IStateClient2
   {
       
      
      private var _1678607455_DefaultFormItemSkin_VGroup1:VGroup;
      
      private var _264525383contentCol:ConstraintColumn;
      
      private var _809612678contentGroup:Group;
      
      private var _66023341errorTextDisplay:RichText;
      
      private var _1959283220labelCol:ConstraintColumn;
      
      private var _1184053038labelDisplay:Label;
      
      private var _3506583row1:ConstraintRow;
      
      private var _805245441sequenceCol:ConstraintColumn;
      
      private var _832334223sequenceLabelDisplay:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:FormItem;
      
      public function DefaultFormItemSkin()
      {
         super();
         mx_internal::_document = this;
         this.layout = this._DefaultFormItemSkin_FormItemLayout1_c();
         this.mxmlContent = [this._DefaultFormItemSkin_Label1_i(),this._DefaultFormItemSkin_Label2_i(),this._DefaultFormItemSkin_VGroup1_i()];
         this.currentState = "normal";
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._DefaultFormItemSkin_RichText1_i);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"disabled",
            "stateGroups":["disabledStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            })]
         }),new State({
            "name":"error",
            "stateGroups":["errorStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":"_DefaultFormItemSkin_VGroup1",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["contentGroup"]
            })]
         }),new State({
            "name":"required",
            "stateGroups":["requiredStates"],
            "overrides":[]
         }),new State({
            "name":"requiredAndDisabled",
            "stateGroups":["disabledStates","requiredStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            })]
         }),new State({
            "name":"requiredAndError",
            "stateGroups":["errorStates","requiredStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":"_DefaultFormItemSkin_VGroup1",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["contentGroup"]
            })]
         })];
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
      
      private function _DefaultFormItemSkin_FormItemLayout1_c() : FormItemLayout
      {
         var _loc1_:FormItemLayout = new FormItemLayout();
         _loc1_.constraintColumns = new <ConstraintColumn>[this._DefaultFormItemSkin_ConstraintColumn1_i(),this._DefaultFormItemSkin_ConstraintColumn2_i(),this._DefaultFormItemSkin_ConstraintColumn3_i()];
         _loc1_.constraintRows = new <ConstraintRow>[this._DefaultFormItemSkin_ConstraintRow1_i()];
         return _loc1_;
      }
      
      private function _DefaultFormItemSkin_ConstraintColumn1_i() : ConstraintColumn
      {
         var _loc1_:ConstraintColumn = new ConstraintColumn();
         _loc1_.initialized(this,"sequenceCol");
         this.sequenceCol = _loc1_;
         BindingManager.executeBindings(this,"sequenceCol",this.sequenceCol);
         return _loc1_;
      }
      
      private function _DefaultFormItemSkin_ConstraintColumn2_i() : ConstraintColumn
      {
         var _loc1_:ConstraintColumn = new ConstraintColumn();
         _loc1_.initialized(this,"labelCol");
         this.labelCol = _loc1_;
         BindingManager.executeBindings(this,"labelCol",this.labelCol);
         return _loc1_;
      }
      
      private function _DefaultFormItemSkin_ConstraintColumn3_i() : ConstraintColumn
      {
         var _loc1_:ConstraintColumn = new ConstraintColumn();
         _loc1_.percentWidth = 100;
         _loc1_.initialized(this,"contentCol");
         this.contentCol = _loc1_;
         BindingManager.executeBindings(this,"contentCol",this.contentCol);
         return _loc1_;
      }
      
      private function _DefaultFormItemSkin_ConstraintRow1_i() : ConstraintRow
      {
         var _loc1_:ConstraintRow = new ConstraintRow();
         _loc1_.baseline = "maxAscent:10";
         _loc1_.percentHeight = 100;
         _loc1_.initialized(this,"row1");
         this.row1 = _loc1_;
         BindingManager.executeBindings(this,"row1",this.row1);
         return _loc1_;
      }
      
      private function _DefaultFormItemSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.left = "sequenceCol:10";
         _loc1_.right = "sequenceCol:5";
         _loc1_.bottom = "row1:10";
         _loc1_.baseline = "row1:0";
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.id = "sequenceLabelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sequenceLabelDisplay = _loc1_;
         BindingManager.executeBindings(this,"sequenceLabelDisplay",this.sequenceLabelDisplay);
         return _loc1_;
      }
      
      private function _DefaultFormItemSkin_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.left = "labelCol:0";
         _loc1_.right = "labelCol:5";
         _loc1_.bottom = "row1:10";
         _loc1_.baseline = "row1:0";
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
      
      private function _DefaultFormItemSkin_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.left = "contentCol:0";
         _loc1_.right = "contentCol:1";
         _loc1_.baseline = "row1:0";
         _loc1_.bottom = "row1:10";
         _loc1_.mxmlContent = [this._DefaultFormItemSkin_Group1_i()];
         _loc1_.id = "_DefaultFormItemSkin_VGroup1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._DefaultFormItemSkin_VGroup1 = _loc1_;
         BindingManager.executeBindings(this,"_DefaultFormItemSkin_VGroup1",this._DefaultFormItemSkin_VGroup1);
         return _loc1_;
      }
      
      private function _DefaultFormItemSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.layout = this._DefaultFormItemSkin_VerticalLayout1_c();
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
      
      private function _DefaultFormItemSkin_VerticalLayout1_c() : VerticalLayout
      {
         var _loc1_:VerticalLayout = new VerticalLayout();
         return _loc1_;
      }
      
      private function _DefaultFormItemSkin_RichText1_i() : RichText
      {
         var _loc1_:RichText = new RichText();
         _loc1_.percentWidth = 100;
         _loc1_.maxDisplayedLines = -1;
         _loc1_.setStyle("fontWeight","normal");
         _loc1_.setStyle("color",16646144);
         _loc1_.id = "errorTextDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.errorTextDisplay = _loc1_;
         BindingManager.executeBindings(this,"errorTextDisplay",this.errorTextDisplay);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _DefaultFormItemSkin_VGroup1() : VGroup
      {
         return this._1678607455_DefaultFormItemSkin_VGroup1;
      }
      
      public function set _DefaultFormItemSkin_VGroup1(param1:VGroup) : void
      {
         var _loc2_:Object = this._1678607455_DefaultFormItemSkin_VGroup1;
         if(_loc2_ !== param1)
         {
            this._1678607455_DefaultFormItemSkin_VGroup1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DefaultFormItemSkin_VGroup1",_loc2_,param1));
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
      public function get sequenceCol() : ConstraintColumn
      {
         return this._805245441sequenceCol;
      }
      
      public function set sequenceCol(param1:ConstraintColumn) : void
      {
         var _loc2_:Object = this._805245441sequenceCol;
         if(_loc2_ !== param1)
         {
            this._805245441sequenceCol = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sequenceCol",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sequenceLabelDisplay() : Label
      {
         return this._832334223sequenceLabelDisplay;
      }
      
      public function set sequenceLabelDisplay(param1:Label) : void
      {
         var _loc2_:Object = this._832334223sequenceLabelDisplay;
         if(_loc2_ !== param1)
         {
            this._832334223sequenceLabelDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sequenceLabelDisplay",_loc2_,param1));
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
