package anifire.studio.components
{
   import anifire.constant.AnimeConstants;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   import mx.binding.BindingManager;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.primitives.BitmapImage;
   
   public class BackgroundThumbSparkImage extends ThumbImageBase implements IStateClient2
   {
      
      protected static var __clipRect:Rectangle = new Rectangle(0,0,AnimeConstants.SCREEN_WIDTH,AnimeConstants.SCREEN_HEIGHT);
       
      
      public var _BackgroundThumbSparkImage_BusyIndicator1:BusyIndicator;
      
      private var _2024940825imageDisplay:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _loader:Loader;
      
      protected var _bitmapData:BitmapData;
      
      protected var _displayWidth:Number = 135;
      
      protected var _displayHeight:Number = 90;
      
      protected var _displayMatrix:Matrix;
      
      public var wideMode:Boolean;
      
      public function BackgroundThumbSparkImage()
      {
         this._loader = new Loader();
         this._displayMatrix = new Matrix();
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._BackgroundThumbSparkImage_BitmapImage1_i()];
         this.currentState = "normal";
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._BackgroundThumbSparkImage_BusyIndicator1_i);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"loading",
            "stateGroups":["busyStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["imageDisplay"]
            })]
         }),new State({
            "name":"processing",
            "stateGroups":["busyStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["imageDisplay"]
            })]
         }),new State({
            "name":"ready",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"imageDisplay",
               "name":"visible",
               "value":true
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
      
      override protected function loadProductImage() : void
      {
         if(_product)
         {
            if(_product.imageData)
            {
               onLoadingComplete();
            }
            else
            {
               super.loadProductImage();
            }
         }
      }
      
      override protected function processProductImage() : void
      {
         if(_product.imageData is ByteArray)
         {
            _processing = true;
            this._loader.contentLoaderInfo.addEventListener(Event.INIT,this.onImageLoaderInit);
            this._loader.loadBytes(ByteArray(_product.imageData));
         }
         else
         {
            this.onImageLoaderInit();
         }
      }
      
      override protected function cancelProcessing() : void
      {
         if(_processing)
         {
            this._loader.contentLoaderInfo.removeEventListener(Event.INIT,this.onImageLoaderInit);
            _processing = false;
         }
      }
      
      protected function onImageLoaderInit(param1:Event = null) : void
      {
         this.cancelProcessing();
         updateThumbColor(this._loader.content);
         if(_product.themeId != "ugc" && !(this._loader.content is Bitmap))
         {
            this.createBitmap(this._loader.content);
         }
         else
         {
            this.imageDisplay.source = this._loader.content;
         }
         displayImage();
      }
      
      override protected function removeImage() : void
      {
         if(this._bitmapData)
         {
            this._bitmapData.dispose();
            this._bitmapData = null;
            this.imageDisplay.source = null;
         }
      }
      
      protected function createBitmap(param1:DisplayObject) : void
      {
         if(this.wideMode)
         {
            this._displayWidth = 180;
            this._displayHeight = 99;
         }
         this._bitmapData = new BitmapData(this._displayWidth,this._displayHeight);
         this._displayMatrix.a = this._displayWidth / Math.min(param1.width,__clipRect.width);
         this._displayMatrix.d = this._displayHeight / Math.min(param1.height,__clipRect.height);
         this._bitmapData.draw(param1,this._displayMatrix,new ColorTransform(),null,__clipRect,true);
         this.imageDisplay.source = this._bitmapData;
      }
      
      private function _BackgroundThumbSparkImage_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.smooth = true;
         _loc1_.scaleMode = "zoom";
         _loc1_.verticalAlign = "middle";
         _loc1_.horizontalAlign = "center";
         _loc1_.visible = false;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.initialized(this,"imageDisplay");
         this.imageDisplay = _loc1_;
         BindingManager.executeBindings(this,"imageDisplay",this.imageDisplay);
         return _loc1_;
      }
      
      private function _BackgroundThumbSparkImage_BusyIndicator1_i() : BusyIndicator
      {
         var _loc1_:BusyIndicator = new BusyIndicator();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("symbolColor",0);
         _loc1_.id = "_BackgroundThumbSparkImage_BusyIndicator1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._BackgroundThumbSparkImage_BusyIndicator1 = _loc1_;
         BindingManager.executeBindings(this,"_BackgroundThumbSparkImage_BusyIndicator1",this._BackgroundThumbSparkImage_BusyIndicator1);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get imageDisplay() : BitmapImage
      {
         return this._2024940825imageDisplay;
      }
      
      public function set imageDisplay(param1:BitmapImage) : void
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
