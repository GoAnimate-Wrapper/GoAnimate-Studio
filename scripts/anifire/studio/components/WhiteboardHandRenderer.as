package anifire.studio.components
{
   import anifire.studio.models.WhiteboardHandModel;
   import mx.binding.BindingManager;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Image;
   import spark.components.supportClasses.ItemRenderer;
   import spark.primitives.BitmapImage;
   import spark.primitives.Rect;
   
   public class WhiteboardHandRenderer extends ItemRenderer implements IStateClient2
   {
       
      
      public var _WhiteboardHandRenderer_BitmapImage1:BitmapImage;
      
      public var _WhiteboardHandRenderer_Rect2:Rect;
      
      private var _1589805360_WhiteboardHandRenderer_SolidColorStroke1:SolidColorStroke;
      
      private var _670429015watermarkImage:Image;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__styles_images_hands_hand_selected_png_1867645449:Class;
      
      public function WhiteboardHandRenderer()
      {
         this._embed_mxml__styles_images_hands_hand_selected_png_1867645449 = WhiteboardHandRenderer__embed_mxml__styles_images_hands_hand_selected_png_1867645449;
         super();
         mx_internal::_document = this;
         this.width = 128;
         this.height = 128;
         this.autoDrawBackground = false;
         this.buttonMode = true;
         this.mxmlContent = [this._WhiteboardHandRenderer_Rect1_c(),this._WhiteboardHandRenderer_Image1_i(),this._WhiteboardHandRenderer_Rect2_i()];
         this.currentState = "normal";
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._WhiteboardHandRenderer_BitmapImage1_i);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "stateGroups":["hoveredAndSelected"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_WhiteboardHandRenderer_SolidColorStroke1",
               "name":"color",
               "value":498053
            }),new SetProperty().initializeFromObject({
               "target":"_WhiteboardHandRenderer_SolidColorStroke1",
               "name":"weight",
               "value":3
            })]
         }),new State({
            "name":"selected",
            "stateGroups":["hoveredAndSelected"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_WhiteboardHandRenderer_Rect2"]
            }),new SetProperty().initializeFromObject({
               "target":"_WhiteboardHandRenderer_SolidColorStroke1",
               "name":"color",
               "value":5486248
            }),new SetProperty().initializeFromObject({
               "target":"_WhiteboardHandRenderer_SolidColorStroke1",
               "name":"weight",
               "value":3
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
         var _loc2_:WhiteboardHandModel = param1 as WhiteboardHandModel;
         if(_loc2_)
         {
            this.watermarkImage.source = _loc2_.image;
         }
      }
      
      private function _WhiteboardHandRenderer_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.radiusX = 4;
         _loc1_.fill = this._WhiteboardHandRenderer_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _WhiteboardHandRenderer_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _WhiteboardHandRenderer_Image1_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.smooth = true;
         _loc1_.maxWidth = 128;
         _loc1_.maxHeight = 128;
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalAlign = "middle";
         _loc1_.horizontalAlign = "center";
         _loc1_.id = "watermarkImage";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.watermarkImage = _loc1_;
         BindingManager.executeBindings(this,"watermarkImage",this.watermarkImage);
         return _loc1_;
      }
      
      private function _WhiteboardHandRenderer_Rect2_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.radiusX = 4;
         _loc1_.stroke = this._WhiteboardHandRenderer_SolidColorStroke1_i();
         _loc1_.initialized(this,"_WhiteboardHandRenderer_Rect2");
         this._WhiteboardHandRenderer_Rect2 = _loc1_;
         BindingManager.executeBindings(this,"_WhiteboardHandRenderer_Rect2",this._WhiteboardHandRenderer_Rect2);
         return _loc1_;
      }
      
      private function _WhiteboardHandRenderer_SolidColorStroke1_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 14277081;
         this._WhiteboardHandRenderer_SolidColorStroke1 = _loc1_;
         BindingManager.executeBindings(this,"_WhiteboardHandRenderer_SolidColorStroke1",this._WhiteboardHandRenderer_SolidColorStroke1);
         return _loc1_;
      }
      
      private function _WhiteboardHandRenderer_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__styles_images_hands_hand_selected_png_1867645449;
         _loc1_.top = -8;
         _loc1_.right = -12;
         _loc1_.initialized(this,"_WhiteboardHandRenderer_BitmapImage1");
         this._WhiteboardHandRenderer_BitmapImage1 = _loc1_;
         BindingManager.executeBindings(this,"_WhiteboardHandRenderer_BitmapImage1",this._WhiteboardHandRenderer_BitmapImage1);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _WhiteboardHandRenderer_SolidColorStroke1() : SolidColorStroke
      {
         return this._1589805360_WhiteboardHandRenderer_SolidColorStroke1;
      }
      
      public function set _WhiteboardHandRenderer_SolidColorStroke1(param1:SolidColorStroke) : void
      {
         var _loc2_:Object = this._1589805360_WhiteboardHandRenderer_SolidColorStroke1;
         if(_loc2_ !== param1)
         {
            this._1589805360_WhiteboardHandRenderer_SolidColorStroke1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_WhiteboardHandRenderer_SolidColorStroke1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get watermarkImage() : Image
      {
         return this._670429015watermarkImage;
      }
      
      public function set watermarkImage(param1:Image) : void
      {
         var _loc2_:Object = this._670429015watermarkImage;
         if(_loc2_ !== param1)
         {
            this._670429015watermarkImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"watermarkImage",_loc2_,param1));
            }
         }
      }
   }
}
