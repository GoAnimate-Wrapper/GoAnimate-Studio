package anifire.studio.components
{
   import anifire.studio.core.PropThumb;
   import anifire.studio.models.ThumbModel;
   import anifire.util.UtilUser;
   import flash.events.MouseEvent;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColorStroke;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.primitives.Rect;
   
   public class IconWidgetDisplay extends ThumbRendererBase implements IStateClient2
   {
       
      
      private var _1090677368_IconWidgetDisplay_SolidColorStroke1:SolidColorStroke;
      
      private var _2024940825imageDisplay:ProductThumbSparkImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _model:ThumbModel;
      
      protected var _dataSource:PropThumb;
      
      protected var _colorSetId:String = "";
      
      public function IconWidgetDisplay()
      {
         super();
         mx_internal::_document = this;
         this.width = 60;
         this.height = 60;
         this.buttonMode = true;
         this.mxmlContent = [this._IconWidgetDisplay_ProductThumbSparkImage1_i(),this._IconWidgetDisplay_Rect1_c()];
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_IconWidgetDisplay_SolidColorStroke1",
               "name":"color",
               "value":5093288
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
            this._dataSource = this._model.thumb as PropThumb;
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
      
      override public function get baselinePosition() : Number
      {
         return 30;
      }
      
      private function _IconWidgetDisplay_ProductThumbSparkImage1_i() : ProductThumbSparkImage
      {
         var _loc1_:ProductThumbSparkImage = new ProductThumbSparkImage();
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
      
      private function _IconWidgetDisplay_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._IconWidgetDisplay_SolidColorStroke1_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _IconWidgetDisplay_SolidColorStroke1_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 14672866;
         this._IconWidgetDisplay_SolidColorStroke1 = _loc1_;
         BindingManager.executeBindings(this,"_IconWidgetDisplay_SolidColorStroke1",this._IconWidgetDisplay_SolidColorStroke1);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _IconWidgetDisplay_SolidColorStroke1() : SolidColorStroke
      {
         return this._1090677368_IconWidgetDisplay_SolidColorStroke1;
      }
      
      public function set _IconWidgetDisplay_SolidColorStroke1(param1:SolidColorStroke) : void
      {
         var _loc2_:Object = this._1090677368_IconWidgetDisplay_SolidColorStroke1;
         if(_loc2_ !== param1)
         {
            this._1090677368_IconWidgetDisplay_SolidColorStroke1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_IconWidgetDisplay_SolidColorStroke1",_loc2_,param1));
            }
         }
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
