package anifire.studio.components
{
   import anifire.studio.core.WidgetThumb;
   import anifire.studio.models.ThumbModel;
   import anifire.util.UtilUser;
   import flash.events.MouseEvent;
   import mx.binding.BindingManager;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.State;
   import spark.primitives.Rect;
   
   public class SwapWidgetRenderer extends ThumbRendererBase implements IStateClient2
   {
       
      
      public var _SwapWidgetRenderer_Rect1:Rect;
      
      private var _2024940825imageDisplay:ProductThumbSparkImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _model:ThumbModel;
      
      protected var _dataSource:WidgetThumb;
      
      protected var _colorSetId:String = "";
      
      public function SwapWidgetRenderer()
      {
         super();
         mx_internal::_document = this;
         this.width = 60;
         this.height = 60;
         this.buttonMode = true;
         this.mxmlContent = [this._SwapWidgetRenderer_ProductThumbSparkImage1_i()];
         this.currentState = "normal";
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._SwapWidgetRenderer_Rect1_i);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["imageDisplay"]
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
            this._dataSource = this._model.thumb as WidgetThumb;
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
      
      private function _SwapWidgetRenderer_ProductThumbSparkImage1_i() : ProductThumbSparkImage
      {
         var _loc1_:ProductThumbSparkImage = new ProductThumbSparkImage();
         _loc1_.showTransition = false;
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
      
      private function _SwapWidgetRenderer_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._SwapWidgetRenderer_SolidColorStroke1_c();
         _loc1_.initialized(this,"_SwapWidgetRenderer_Rect1");
         this._SwapWidgetRenderer_Rect1 = _loc1_;
         BindingManager.executeBindings(this,"_SwapWidgetRenderer_Rect1",this._SwapWidgetRenderer_Rect1);
         return _loc1_;
      }
      
      private function _SwapWidgetRenderer_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 5093288;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get imageDisplay() : ProductThumbSparkImage
      {
         return this._2024940825imageDisplay;
      }
      
      public function set imageDisplay(param1:ProductThumbSparkImage) : void
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
   }
}
