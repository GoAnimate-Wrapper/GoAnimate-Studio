package anifire.studio.components
{
   import mx.binding.BindingManager;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.graphics.SolidColor;
   import mx.states.AddItems;
   import mx.states.SetStyle;
   import mx.states.State;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.supportClasses.ItemRenderer;
   import spark.primitives.Rect;
   
   public class SearchSuggestionListItemRenderer extends ItemRenderer implements IStateClient2
   {
       
      
      public var _SearchSuggestionListItemRenderer_Rect1:Rect;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function SearchSuggestionListItemRenderer()
      {
         super();
         mx_internal::_document = this;
         this.autoDrawBackground = false;
         this.minHeight = 0;
         this.percentWidth = 100;
         this.mxmlContent = [this._SearchSuggestionListItemRenderer_HGroup1_c()];
         this.currentState = "normal";
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._SearchSuggestionListItemRenderer_Rect1_i);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "stateGroups":["hoveredStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new SetStyle().initializeFromObject({
               "target":"labelDisplay",
               "name":"color",
               "value":16777215
            })]
         }),new State({
            "name":"selected",
            "stateGroups":["hoveredStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new SetStyle().initializeFromObject({
               "target":"labelDisplay",
               "name":"color",
               "value":16777215
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
      
      private function _SearchSuggestionListItemRenderer_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 3;
         _loc1_.right = 3;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._SearchSuggestionListItemRenderer_SolidColor1_c();
         _loc1_.initialized(this,"_SearchSuggestionListItemRenderer_Rect1");
         this._SearchSuggestionListItemRenderer_Rect1 = _loc1_;
         BindingManager.executeBindings(this,"_SearchSuggestionListItemRenderer_Rect1",this._SearchSuggestionListItemRenderer_Rect1);
         return _loc1_;
      }
      
      private function _SearchSuggestionListItemRenderer_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 6142119;
         return _loc1_;
      }
      
      private function _SearchSuggestionListItemRenderer_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.paddingLeft = 8;
         _loc1_.paddingRight = 8;
         _loc1_.paddingTop = 5;
         _loc1_.paddingBottom = 5;
         _loc1_.mxmlContent = [this._SearchSuggestionListItemRenderer_Label1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SearchSuggestionListItemRenderer_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.top = 5;
         _loc1_.bottom = 5;
         _loc1_.left = 8;
         _loc1_.right = 8;
         _loc1_.maxDisplayedLines = 0;
         _loc1_.setStyle("paddingTop",1);
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.setStyle("lineBreak","toFit");
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",labelDisplay);
         return _loc1_;
      }
   }
}
