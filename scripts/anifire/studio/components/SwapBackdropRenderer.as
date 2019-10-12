package anifire.studio.components
{
   import anifire.studio.core.BackgroundThumb;
   import anifire.studio.models.ThumbModel;
   import anifire.util.UtilUser;
   import flash.events.MouseEvent;
   import mx.binding.BindingManager;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.State;
   import spark.components.Group;
   import spark.primitives.Rect;
   
   public class SwapBackdropRenderer extends ThumbRendererBase implements IStateClient2
   {
       
      
      private var _2024940825imageDisplay:BackdropImage;
      
      private var _263713807overlayGroup:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _model:ThumbModel;
      
      protected var _dataSource:BackgroundThumb;
      
      protected var _colorSetId:String = "";
      
      private var _1401767146wideMode:Boolean = true;
      
      private var _isBaseColor:Boolean;
      
      public function SwapBackdropRenderer()
      {
         super();
         mx_internal::_document = this;
         this.width = 180;
         this.height = 99;
         this.clipAndEnableScrolling = true;
         this.useHandCursor = true;
         this.buttonMode = true;
         this.mxmlContent = [this._SwapBackdropRenderer_BackdropImage1_i()];
         this.currentState = "normal";
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._SwapBackdropRenderer_Group1_i);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"selected",
            "stateGroups":["overAndSelectedStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["imageDisplay"]
            })]
         }),new State({
            "name":"hovered",
            "stateGroups":["overAndSelectedStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["imageDisplay"]
            })]
         }),new State({
            "name":"dragging",
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
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         this._model = data as ThumbModel;
         _toolTipContent = "";
         if(this._model)
         {
            this._dataSource = this._model.thumb as BackgroundThumb;
            this._colorSetId = this._model.colorSetId;
         }
         else
         {
            this._dataSource = null;
            this._colorSetId = "";
         }
         if(this._dataSource)
         {
            this.updateThumbData();
         }
         if(this._model && this._model.selected)
         {
            currentState = "selected";
         }
         this.imageDisplay.model = this._model;
      }
      
      protected function updateThumbData() : void
      {
         if(UtilUser.hasAdminFeatures)
         {
            _toolTipContent = this._dataSource.toString();
         }
         else
         {
            _toolTipContent = this._dataSource.name;
         }
      }
      
      override protected function shouldStartDrag(param1:MouseEvent) : Boolean
      {
         return false;
      }
      
      private function _SwapBackdropRenderer_BackdropImage1_i() : BackdropImage
      {
         var _loc1_:BackdropImage = new BackdropImage();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.id = "imageDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.imageDisplay = _loc1_;
         BindingManager.executeBindings(this,"imageDisplay",this.imageDisplay);
         return _loc1_;
      }
      
      private function _SwapBackdropRenderer_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.mxmlContent = [this._SwapBackdropRenderer_Rect1_c()];
         _loc1_.id = "overlayGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.overlayGroup = _loc1_;
         BindingManager.executeBindings(this,"overlayGroup",this.overlayGroup);
         return _loc1_;
      }
      
      private function _SwapBackdropRenderer_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._SwapBackdropRenderer_SolidColorStroke1_c();
         _loc1_.fill = this._SwapBackdropRenderer_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SwapBackdropRenderer_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 3062438;
         _loc1_.weight = 4;
         _loc1_.joints = "miter";
         return _loc1_;
      }
      
      private function _SwapBackdropRenderer_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.alpha = 0.5;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get imageDisplay() : BackdropImage
      {
         return this._2024940825imageDisplay;
      }
      
      public function set imageDisplay(param1:BackdropImage) : void
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
      public function get overlayGroup() : Group
      {
         return this._263713807overlayGroup;
      }
      
      public function set overlayGroup(param1:Group) : void
      {
         var _loc2_:Object = this._263713807overlayGroup;
         if(_loc2_ !== param1)
         {
            this._263713807overlayGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"overlayGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get wideMode() : Boolean
      {
         return this._1401767146wideMode;
      }
      
      public function set wideMode(param1:Boolean) : void
      {
         var _loc2_:Object = this._1401767146wideMode;
         if(_loc2_ !== param1)
         {
            this._1401767146wideMode = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"wideMode",_loc2_,param1));
            }
         }
      }
   }
}
