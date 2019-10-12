package anifire.studio.components
{
   import anifire.studio.core.CharThumb;
   import anifire.studio.models.ThumbModel;
   import anifire.util.UtilUser;
   import flash.events.MouseEvent;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.primitives.Rect;
   
   public class SwapCharacterRenderer extends ThumbRendererBase implements IStateClient2
   {
       
      
      private var _120464420_SwapCharacterRenderer_SolidColorStroke1:SolidColorStroke;
      
      private var _2024940825imageDisplay:CharacterThumbSparkImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _model:ThumbModel;
      
      protected var _dataSource:CharThumb;
      
      protected var _colorSetId:String = "";
      
      public function SwapCharacterRenderer()
      {
         super();
         mx_internal::_document = this;
         this.width = 62;
         this.height = 90;
         this.buttonMode = true;
         this.mxmlContent = [this._SwapCharacterRenderer_Rect1_c(),this._SwapCharacterRenderer_CharacterThumbSparkImage1_i()];
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_SwapCharacterRenderer_SolidColorStroke1",
               "name":"alpha",
               "value":1
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
            this._dataSource = this._model.thumb as CharThumb;
            this._colorSetId = this._model.colorSetId;
            this.imageDisplay.model = this._model;
         }
         else
         {
            this._dataSource = null;
            this._colorSetId = "";
            this.imageDisplay.model = null;
         }
         if(this._dataSource)
         {
            this.updateThumbData();
         }
      }
      
      override protected function shouldStartDrag(param1:MouseEvent) : Boolean
      {
         return false;
      }
      
      protected function updateThumbData() : void
      {
         _toolTipContent = this._dataSource.name;
         if(UtilUser.hasAdminFeatures)
         {
            _toolTipContent = this._dataSource.toString();
         }
      }
      
      private function _SwapCharacterRenderer_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._SwapCharacterRenderer_SolidColorStroke1_i();
         _loc1_.fill = this._SwapCharacterRenderer_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SwapCharacterRenderer_SolidColorStroke1_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.alpha = 0;
         _loc1_.color = 5093288;
         this._SwapCharacterRenderer_SolidColorStroke1 = _loc1_;
         BindingManager.executeBindings(this,"_SwapCharacterRenderer_SolidColorStroke1",this._SwapCharacterRenderer_SolidColorStroke1);
         return _loc1_;
      }
      
      private function _SwapCharacterRenderer_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      private function _SwapCharacterRenderer_CharacterThumbSparkImage1_i() : CharacterThumbSparkImage
      {
         var _loc1_:CharacterThumbSparkImage = new CharacterThumbSparkImage();
         _loc1_.left = 7;
         _loc1_.right = 7;
         _loc1_.top = 7;
         _loc1_.bottom = 7;
         _loc1_.id = "imageDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.imageDisplay = _loc1_;
         BindingManager.executeBindings(this,"imageDisplay",this.imageDisplay);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _SwapCharacterRenderer_SolidColorStroke1() : SolidColorStroke
      {
         return this._120464420_SwapCharacterRenderer_SolidColorStroke1;
      }
      
      public function set _SwapCharacterRenderer_SolidColorStroke1(param1:SolidColorStroke) : void
      {
         var _loc2_:Object = this._120464420_SwapCharacterRenderer_SolidColorStroke1;
         if(_loc2_ !== param1)
         {
            this._120464420_SwapCharacterRenderer_SolidColorStroke1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SwapCharacterRenderer_SolidColorStroke1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get imageDisplay() : CharacterThumbSparkImage
      {
         return this._2024940825imageDisplay;
      }
      
      public function set imageDisplay(param1:CharacterThumbSparkImage) : void
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
