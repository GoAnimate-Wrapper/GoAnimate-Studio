package anifire.studio.skins
{
   import mx.binding.BindingManager;
   import mx.containers.utilityClasses.ConstraintColumn;
   import mx.containers.utilityClasses.ConstraintRow;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.FormItem;
   import spark.components.Group;
   import spark.components.Label;
   import spark.components.supportClasses.Skin;
   import spark.layouts.FormItemLayout;
   import spark.layouts.VerticalLayout;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   public class WidgetFormItemSkin extends Skin implements IStateClient2
   {
       
      
      private var _1332194002background:Rect;
      
      private var _1391998104bgFill:SolidColor;
      
      private var _264525383contentCol:ConstraintColumn;
      
      private var _809612678contentGroup:Group;
      
      private var _1184053038labelDisplay:Label;
      
      private var _3506583row1:ConstraintRow;
      
      private var _3506584row2:ConstraintRow;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:FormItem;
      
      public function WidgetFormItemSkin()
      {
         super();
         mx_internal::_document = this;
         this.layout = this._WidgetFormItemSkin_FormItemLayout1_c();
         this.mxmlContent = [this._WidgetFormItemSkin_Rect1_i(),this._WidgetFormItemSkin_Label1_i(),this._WidgetFormItemSkin_Group1_i(),this._WidgetFormItemSkin_Line1_c()];
         this.currentState = "normal";
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
            "overrides":[]
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
            "overrides":[]
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
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         if(isNaN(getStyle("backgroundColor")))
         {
            this.background.visible = false;
         }
         else
         {
            this.background.visible = true;
            this.bgFill.color = getStyle("backgroundColor");
            this.bgFill.alpha = getStyle("backgroundAlpha");
         }
         super.updateDisplayList(param1,param2);
      }
      
      override public function setCurrentState(param1:String, param2:Boolean = true) : void
      {
         super.setCurrentState(param1,param2);
         invalidateDisplayList();
      }
      
      private function _WidgetFormItemSkin_FormItemLayout1_c() : FormItemLayout
      {
         var _loc1_:FormItemLayout = new FormItemLayout();
         _loc1_.constraintColumns = new <ConstraintColumn>[this._WidgetFormItemSkin_ConstraintColumn1_i()];
         _loc1_.constraintRows = new <ConstraintRow>[this._WidgetFormItemSkin_ConstraintRow1_i(),this._WidgetFormItemSkin_ConstraintRow2_c(),this._WidgetFormItemSkin_ConstraintRow3_i()];
         return _loc1_;
      }
      
      private function _WidgetFormItemSkin_ConstraintColumn1_i() : ConstraintColumn
      {
         var _loc1_:ConstraintColumn = new ConstraintColumn();
         _loc1_.percentWidth = 100;
         _loc1_.initialized(this,"contentCol");
         this.contentCol = _loc1_;
         BindingManager.executeBindings(this,"contentCol",this.contentCol);
         return _loc1_;
      }
      
      private function _WidgetFormItemSkin_ConstraintRow1_i() : ConstraintRow
      {
         var _loc1_:ConstraintRow = new ConstraintRow();
         _loc1_.baseline = "maxAscent:10";
         _loc1_.initialized(this,"row1");
         this.row1 = _loc1_;
         BindingManager.executeBindings(this,"row1",this.row1);
         return _loc1_;
      }
      
      private function _WidgetFormItemSkin_ConstraintRow2_c() : ConstraintRow
      {
         var _loc1_:ConstraintRow = new ConstraintRow();
         _loc1_.height = 6;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _WidgetFormItemSkin_ConstraintRow3_i() : ConstraintRow
      {
         var _loc1_:ConstraintRow = new ConstraintRow();
         _loc1_.percentHeight = 100;
         _loc1_.initialized(this,"row2");
         this.row2 = _loc1_;
         BindingManager.executeBindings(this,"row2",this.row2);
         return _loc1_;
      }
      
      private function _WidgetFormItemSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._WidgetFormItemSkin_SolidColor1_i();
         _loc1_.initialized(this,"background");
         this.background = _loc1_;
         BindingManager.executeBindings(this,"background",this.background);
         return _loc1_;
      }
      
      private function _WidgetFormItemSkin_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         this.bgFill = _loc1_;
         BindingManager.executeBindings(this,"bgFill",this.bgFill);
         return _loc1_;
      }
      
      private function _WidgetFormItemSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.left = "contentCol:15";
         _loc1_.right = "contentCol:15";
         _loc1_.bottom = "row1:5";
         _loc1_.baseline = "row1:0";
         _loc1_.setStyle("typographicCase","uppercase");
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",this.labelDisplay);
         return _loc1_;
      }
      
      private function _WidgetFormItemSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = "contentCol:15";
         _loc1_.right = "contentCol:15";
         _loc1_.top = "row2:10";
         _loc1_.bottom = "row2:0";
         _loc1_.baseline = "row2:0";
         _loc1_.layout = this._WidgetFormItemSkin_VerticalLayout1_c();
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
      
      private function _WidgetFormItemSkin_VerticalLayout1_c() : VerticalLayout
      {
         var _loc1_:VerticalLayout = new VerticalLayout();
         return _loc1_;
      }
      
      private function _WidgetFormItemSkin_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.left = "contentCol:0";
         _loc1_.right = "contentCol:0";
         _loc1_.bottom = 0;
         _loc1_.stroke = this._WidgetFormItemSkin_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _WidgetFormItemSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13421772;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get background() : Rect
      {
         return this._1332194002background;
      }
      
      public function set background(param1:Rect) : void
      {
         var _loc2_:Object = this._1332194002background;
         if(_loc2_ !== param1)
         {
            this._1332194002background = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"background",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bgFill() : SolidColor
      {
         return this._1391998104bgFill;
      }
      
      public function set bgFill(param1:SolidColor) : void
      {
         var _loc2_:Object = this._1391998104bgFill;
         if(_loc2_ !== param1)
         {
            this._1391998104bgFill = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bgFill",_loc2_,param1));
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
