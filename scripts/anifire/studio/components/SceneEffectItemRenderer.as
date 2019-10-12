package anifire.studio.components
{
   import anifire.studio.core.EffectThumb;
   import anifire.studio.models.ThumbModel;
   import anifire.util.UtilUser;
   import mx.binding.BindingManager;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.SetStyle;
   import mx.states.State;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.supportClasses.ItemRenderer;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   public class SceneEffectItemRenderer extends ItemRenderer implements IStateClient2
   {
       
      
      public var _SceneEffectItemRenderer_Rect1:Rect;
      
      private var _2024940825imageDisplay:EffectThumbSparkImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _model:ThumbModel;
      
      protected var _dataSource:EffectThumb;
      
      protected var _1692934083_editable:Boolean;
      
      protected var _1222364469_toolTipContent:String;
      
      public function SceneEffectItemRenderer()
      {
         super();
         mx_internal::_document = this;
         this.autoDrawBackground = false;
         this.buttonMode = true;
         this.minHeight = 28;
         this.mxmlContent = [this._SceneEffectItemRenderer_HGroup1_c(),this._SceneEffectItemRenderer_Line1_c()];
         this.currentState = "normal";
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._SceneEffectItemRenderer_Rect1_i);
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
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         this._model = data as ThumbModel;
         if(this._model)
         {
            this._dataSource = this._model.thumb as EffectThumb;
         }
         else
         {
            this._dataSource = null;
         }
         if(this._dataSource)
         {
            this.updateThumbData();
         }
         this.imageDisplay.model = this._model;
         labelDisplay.text = this._dataSource.name;
      }
      
      protected function updateThumbData() : void
      {
         this._toolTipContent = this._dataSource.name;
         if(UtilUser.hasAdminFeatures)
         {
            this._toolTipContent = this._dataSource.toString();
         }
         this._editable = this._dataSource.editable;
      }
      
      private function _SceneEffectItemRenderer_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 3;
         _loc1_.right = 3;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._SceneEffectItemRenderer_SolidColor1_c();
         _loc1_.initialized(this,"_SceneEffectItemRenderer_Rect1");
         this._SceneEffectItemRenderer_Rect1 = _loc1_;
         BindingManager.executeBindings(this,"_SceneEffectItemRenderer_Rect1",this._SceneEffectItemRenderer_Rect1);
         return _loc1_;
      }
      
      private function _SceneEffectItemRenderer_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 6142119;
         return _loc1_;
      }
      
      private function _SceneEffectItemRenderer_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.paddingLeft = 8;
         _loc1_.paddingRight = 8;
         _loc1_.paddingTop = 5;
         _loc1_.paddingBottom = 5;
         _loc1_.height = 66;
         _loc1_.mxmlContent = [this._SceneEffectItemRenderer_Group1_c(),this._SceneEffectItemRenderer_Label1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SceneEffectItemRenderer_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._SceneEffectItemRenderer_Rect2_c(),this._SceneEffectItemRenderer_EffectThumbSparkImage1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SceneEffectItemRenderer_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._SceneEffectItemRenderer_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SceneEffectItemRenderer_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _SceneEffectItemRenderer_EffectThumbSparkImage1_i() : EffectThumbSparkImage
      {
         var _loc1_:EffectThumbSparkImage = new EffectThumbSparkImage();
         _loc1_.width = 50;
         _loc1_.height = 45;
         _loc1_.left = 5;
         _loc1_.right = 5;
         _loc1_.top = 5;
         _loc1_.bottom = 5;
         _loc1_.id = "imageDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.imageDisplay = _loc1_;
         BindingManager.executeBindings(this,"imageDisplay",this.imageDisplay);
         return _loc1_;
      }
      
      private function _SceneEffectItemRenderer_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.height = 18;
         _loc1_.setStyle("paddingTop",1);
         _loc1_.setStyle("verticalAlign","middle");
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
      
      private function _SceneEffectItemRenderer_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.bottom = -1;
         _loc1_.percentWidth = 100;
         _loc1_.left = 8;
         _loc1_.right = 8;
         _loc1_.stroke = this._SceneEffectItemRenderer_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SceneEffectItemRenderer_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 15658734;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get imageDisplay() : EffectThumbSparkImage
      {
         return this._2024940825imageDisplay;
      }
      
      public function set imageDisplay(param1:EffectThumbSparkImage) : void
      {
         var _loc2_:Object = this._2024940825imageDisplay;
         if(_loc2_ !== param1)
         {
            this._2024940825imageDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _editable() : Boolean
      {
         return this._1692934083_editable;
      }
      
      protected function set _editable(param1:Boolean) : void
      {
         var _loc2_:Object = this._1692934083_editable;
         if(_loc2_ !== param1)
         {
            this._1692934083_editable = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_editable",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _toolTipContent() : String
      {
         return this._1222364469_toolTipContent;
      }
      
      protected function set _toolTipContent(param1:String) : void
      {
         var _loc2_:Object = this._1222364469_toolTipContent;
         if(_loc2_ !== param1)
         {
            this._1222364469_toolTipContent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_toolTipContent",_loc2_,param1));
            }
         }
      }
   }
}
