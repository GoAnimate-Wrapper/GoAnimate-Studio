package anifire.studio.components
{
   import mx.binding.BindingManager;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.SetStyle;
   import mx.states.State;
   import spark.components.Label;
   import spark.components.supportClasses.ItemRenderer;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   import spark.primitives.RectangularDropShadow;
   
   public class SearchExplorerCategoryRenderer extends ItemRenderer implements IStateClient2
   {
       
      
      public var _SearchExplorerCategoryRenderer_Line1:Line;
      
      public var _SearchExplorerCategoryRenderer_Rect1:Rect;
      
      public var _SearchExplorerCategoryRenderer_Rect2:Rect;
      
      public var _SearchExplorerCategoryRenderer_RectangularDropShadow1:RectangularDropShadow;
      
      private var _1391998104bgFill:SolidColor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function SearchExplorerCategoryRenderer()
      {
         super();
         mx_internal::_document = this;
         this.autoDrawBackground = false;
         this.buttonMode = true;
         this.width = 150;
         this.mxmlContent = [this._SearchExplorerCategoryRenderer_Rect1_i(),this._SearchExplorerCategoryRenderer_Label1_i()];
         this.currentState = "normal";
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._SearchExplorerCategoryRenderer_Line1_i);
         var _loc2_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._SearchExplorerCategoryRenderer_Rect2_i);
         var _loc3_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._SearchExplorerCategoryRenderer_RectangularDropShadow1_i);
         states = [new State({
            "name":"normal",
            "stateGroups":["upStates"],
            "overrides":[]
         }),new State({
            "name":"hovered",
            "stateGroups":["hoveredStates"],
            "overrides":[new SetStyle().initializeFromObject({
               "target":"labelDisplay",
               "name":"color",
               "value":14840854
            })]
         }),new State({
            "name":"selected",
            "stateGroups":["selectedStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc3_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_SearchExplorerCategoryRenderer_Rect1"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_SearchExplorerCategoryRenderer_Rect1"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_SearchExplorerCategoryRenderer_Rect1"]
            }),new SetProperty().initializeFromObject({
               "target":"bgFill",
               "name":"alpha",
               "value":1
            }),new SetStyle().initializeFromObject({
               "target":"labelDisplay",
               "name":"color",
               "value":14840854
            })]
         }),new State({
            "name":"empty",
            "stateGroups":["emptyStates","upStates"],
            "overrides":[]
         }),new State({
            "name":"hoveredAndEmpty",
            "stateGroups":["hoveredStates","emptyStates"],
            "overrides":[new SetStyle().initializeFromObject({
               "target":"labelDisplay",
               "name":"color",
               "value":14840854
            })]
         }),new State({
            "name":"selectedAndEmpty",
            "stateGroups":["selectedStates","emptyStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc3_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_SearchExplorerCategoryRenderer_Rect1"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_SearchExplorerCategoryRenderer_Rect1"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_SearchExplorerCategoryRenderer_Rect1"]
            }),new SetProperty().initializeFromObject({
               "target":"bgFill",
               "name":"alpha",
               "value":1
            }),new SetStyle().initializeFromObject({
               "target":"labelDisplay",
               "name":"color",
               "value":14840854
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
      
      private function _SearchExplorerCategoryRenderer_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 5;
         _loc1_.bottom = 0;
         _loc1_.fill = this._SearchExplorerCategoryRenderer_SolidColor1_i();
         _loc1_.initialized(this,"_SearchExplorerCategoryRenderer_Rect1");
         this._SearchExplorerCategoryRenderer_Rect1 = _loc1_;
         BindingManager.executeBindings(this,"_SearchExplorerCategoryRenderer_Rect1",this._SearchExplorerCategoryRenderer_Rect1);
         return _loc1_;
      }
      
      private function _SearchExplorerCategoryRenderer_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         _loc1_.alpha = 0;
         this.bgFill = _loc1_;
         BindingManager.executeBindings(this,"bgFill",this.bgFill);
         return _loc1_;
      }
      
      private function _SearchExplorerCategoryRenderer_Rect2_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 1;
         _loc1_.top = 0;
         _loc1_.height = 5;
         _loc1_.fill = this._SearchExplorerCategoryRenderer_SolidColor2_c();
         _loc1_.initialized(this,"_SearchExplorerCategoryRenderer_Rect2");
         this._SearchExplorerCategoryRenderer_Rect2 = _loc1_;
         BindingManager.executeBindings(this,"_SearchExplorerCategoryRenderer_Rect2",this._SearchExplorerCategoryRenderer_Rect2);
         return _loc1_;
      }
      
      private function _SearchExplorerCategoryRenderer_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 15301947;
         return _loc1_;
      }
      
      private function _SearchExplorerCategoryRenderer_Line1_i() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.right = 0;
         _loc1_.top = 5;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._SearchExplorerCategoryRenderer_SolidColorStroke1_c();
         _loc1_.initialized(this,"_SearchExplorerCategoryRenderer_Line1");
         this._SearchExplorerCategoryRenderer_Line1 = _loc1_;
         BindingManager.executeBindings(this,"_SearchExplorerCategoryRenderer_Line1",this._SearchExplorerCategoryRenderer_Line1);
         return _loc1_;
      }
      
      private function _SearchExplorerCategoryRenderer_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13619151;
         return _loc1_;
      }
      
      private function _SearchExplorerCategoryRenderer_RectangularDropShadow1_i() : RectangularDropShadow
      {
         var _loc1_:RectangularDropShadow = new RectangularDropShadow();
         _loc1_.left = 0;
         _loc1_.right = 1;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.angle = 270;
         _loc1_.blurX = 8;
         _loc1_.blurY = 8;
         _loc1_.distance = 4;
         _loc1_.alpha = 0.3;
         _loc1_.id = "_SearchExplorerCategoryRenderer_RectangularDropShadow1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SearchExplorerCategoryRenderer_RectangularDropShadow1 = _loc1_;
         BindingManager.executeBindings(this,"_SearchExplorerCategoryRenderer_RectangularDropShadow1",this._SearchExplorerCategoryRenderer_RectangularDropShadow1);
         return _loc1_;
      }
      
      private function _SearchExplorerCategoryRenderer_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.maxDisplayedLines = 1;
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("typographicCase","lowercaseToSmallCaps");
         _loc1_.setStyle("color",5331305);
         _loc1_.setStyle("paddingTop",14);
         _loc1_.setStyle("paddingBottom",10);
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",labelDisplay);
         return _loc1_;
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
   }
}
