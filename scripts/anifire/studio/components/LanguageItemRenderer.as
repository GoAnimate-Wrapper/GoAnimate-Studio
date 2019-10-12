package anifire.studio.components
{
   import anifire.studio.interfaces.ILanguageModel;
   import mx.binding.BindingManager;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.states.AddItems;
   import mx.states.SetStyle;
   import mx.states.State;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.supportClasses.ItemRenderer;
   import spark.primitives.Rect;
   
   public class LanguageItemRenderer extends ItemRenderer implements IStateClient2
   {
       
      
      public var _LanguageItemRenderer_Rect1:Rect;
      
      private var _578797494flagDisplay:LanguageIcon;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function LanguageItemRenderer()
      {
         super();
         mx_internal::_document = this;
         this.width = 160;
         this.buttonMode = true;
         this.autoDrawBackground = false;
         this.mxmlContent = [this._LanguageItemRenderer_HGroup1_c()];
         this.currentState = "normal";
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._LanguageItemRenderer_Rect1_i);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "stateGroups":["overAndSelectedState"],
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
            "stateGroups":["overAndSelectedState"],
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
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         var _loc2_:ILanguageModel = data as ILanguageModel;
         if(_loc2_)
         {
            this.flagDisplay.iconName = _loc2_.iconName;
            labelDisplay.text = _loc2_.desc;
         }
      }
      
      private function _LanguageItemRenderer_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 3;
         _loc1_.right = 3;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._LanguageItemRenderer_SolidColor1_c();
         _loc1_.initialized(this,"_LanguageItemRenderer_Rect1");
         this._LanguageItemRenderer_Rect1 = _loc1_;
         BindingManager.executeBindings(this,"_LanguageItemRenderer_Rect1",this._LanguageItemRenderer_Rect1);
         return _loc1_;
      }
      
      private function _LanguageItemRenderer_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 6142119;
         return _loc1_;
      }
      
      private function _LanguageItemRenderer_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.paddingLeft = 5;
         _loc1_.paddingRight = 5;
         _loc1_.paddingTop = 5;
         _loc1_.paddingBottom = 5;
         _loc1_.mxmlContent = [this._LanguageItemRenderer_LanguageIcon1_i(),this._LanguageItemRenderer_Label1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _LanguageItemRenderer_LanguageIcon1_i() : LanguageIcon
      {
         var _loc1_:LanguageIcon = new LanguageIcon();
         _loc1_.id = "flagDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.flagDisplay = _loc1_;
         BindingManager.executeBindings(this,"flagDisplay",this.flagDisplay);
         return _loc1_;
      }
      
      private function _LanguageItemRenderer_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
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
      
      [Bindable(event="propertyChange")]
      public function get flagDisplay() : LanguageIcon
      {
         return this._578797494flagDisplay;
      }
      
      public function set flagDisplay(param1:LanguageIcon) : void
      {
         var _loc2_:Object = this._578797494flagDisplay;
         if(_loc2_ !== param1)
         {
            this._578797494flagDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"flagDisplay",_loc2_,param1));
            }
         }
      }
   }
}
