package anifire.studio.components
{
   import anifire.component.CCThumb;
   import anifire.constant.AnimeConstants;
   import anifire.event.LoadEmbedMovieEvent;
   import anifire.event.StudioEvent;
   import anifire.models.creator.CCCharacterActionModel;
   import anifire.studio.core.CharThumb;
   import anifire.studio.managers.ImageDataManager;
   import anifire.util.UtilCommonLoader;
   import anifire.util.UtilErrorLogger;
   import anifire.util.UtilHashBytes;
   import anifire.util.UtilPlain;
   import flash.display.BitmapData;
   import flash.display.DisplayObjectContainer;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.net.URLRequest;
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
   
   public class CharacterThumbSparkImage extends ThumbImageBase implements IStateClient2
   {
       
      
      public var _CharacterThumbSparkImage_BusyIndicator1:BusyIndicator;
      
      private var _1006495386imageContainer:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _charThumb:CharThumb;
      
      protected var _captureTarget:DisplayObjectContainer;
      
      protected var _propReady:Boolean;
      
      protected var _imageUpdated:Boolean;
      
      protected var _loader:Loader;
      
      protected var _propLoader:Loader;
      
      protected var _createThumbnailByModel:Boolean;
      
      protected var _creator:CCThumb;
      
      public function CharacterThumbSparkImage()
      {
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._CharacterThumbSparkImage_BitmapImage1_i()];
         this.currentState = "normal";
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._CharacterThumbSparkImage_BusyIndicator1_i);
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
               "relativeTo":["imageContainer"]
            })]
         }),new State({
            "name":"processing",
            "stateGroups":["busyStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["imageContainer"]
            })]
         }),new State({
            "name":"ready",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"imageContainer",
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
         this._charThumb = _product as CharThumb;
         var _loc1_:Object = ImageDataManager.instance.getImageData("charThumb",_product.themeId,_product.id);
         if(_loc1_)
         {
            this.imageContainer.source = _loc1_ as BitmapData;
            displayImage();
         }
         else if(this._charThumb.thumbnailUrl)
         {
            this.loadThumbnailUrl();
         }
         else if(this._charThumb.raceCode != 2 && _product.imageData)
         {
            onLoadingComplete();
         }
         else
         {
            super.loadProductImage();
         }
      }
      
      public function loadThumbnailUrl() : void
      {
         this._loader = new Loader();
         this._loader.contentLoaderInfo.addEventListener(Event.INIT,this.onImageLoaderInit);
         this._loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.onImageLoaderError);
         this._loader.load(new URLRequest(this._charThumb.thumbnailUrl));
      }
      
      override protected function cancelProcessing() : void
      {
         if(_processing)
         {
            if(this._loader)
            {
               this._loader.contentLoaderInfo.removeEventListener(Event.INIT,this.onImageLoaderInit);
               if(this._charThumb && this._charThumb.thumbnailUrl)
               {
                  this._loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,this.onImageLoaderError);
               }
            }
            if(this._creator)
            {
               this._creator.removeEventListener(LoadEmbedMovieEvent.COMPLETE_EVENT,this.onCharacterMakerReady);
            }
            if(this._createThumbnailByModel)
            {
               this._charThumb.removeEventListener(StudioEvent.BODY_MODEL_COMPLETE,this.onBodyModelComplete);
               this._createThumbnailByModel = false;
            }
            _processing = false;
         }
      }
      
      override protected function processProductImage() : void
      {
         var _loc2_:ByteArray = null;
         var _loc3_:Object = null;
         var _loc4_:XML = null;
         var _loc5_:CCCharacterActionModel = null;
         var _loc6_:UtilHashBytes = null;
         var _loc7_:ByteArray = null;
         var _loc1_:* = _product.imageData is ByteArray;
         if(_product.raceCode == 0 || _loc1_)
         {
            _loc2_ = !!_loc1_?_product.imageData as ByteArray:_product.imageData["figure"] as ByteArray;
            this._loader = new Loader();
            this._loader.contentLoaderInfo.addEventListener(Event.INIT,this.onImageLoaderInit);
            this._loader.loadBytes(_loc2_,UtilCommonLoader.externalLoaderContext);
         }
         else
         {
            this._creator = new CCThumb();
            _loc3_ = _product.imageData as Object;
            _loc4_ = _loc3_["xml"] as XML;
            _loc5_ = _loc3_["cam"] as CCCharacterActionModel;
            _loc6_ = _loc3_["imageData"] as UtilHashBytes;
            _loc7_ = _product.raceCode == 2?_loc3_["figure"]:null;
            this._creator.addEventListener(LoadEmbedMovieEvent.COMPLETE_EVENT,this.onCharacterMakerReady);
            if(_loc4_)
            {
               this._creator.init(_loc4_,_loc6_,(_product as CharThumb).getLibraries(),_product.raceCode,_loc7_);
            }
            else if(_loc5_)
            {
               this._creator.initByCCCharacterActionModel(_loc5_);
            }
         }
      }
      
      private function onCharacterMakerReady(param1:LoadEmbedMovieEvent) : void
      {
         this.cancelProcessing();
         this._captureTarget = this._creator;
         updateThumbColor(this._captureTarget);
         this.loadProp();
      }
      
      private function loadProp() : void
      {
         var _loc1_:ByteArray = this._charThumb.propImageData as ByteArray;
         if(_loc1_)
         {
            this._propLoader = new Loader();
            this._propLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onPropImageReady);
            this._propLoader.loadBytes(_loc1_);
         }
         else
         {
            this._propReady = true;
            invalidateDisplayList();
         }
      }
      
      private function onPropImageReady(param1:Event) : void
      {
         var _loc3_:DisplayObjectContainer = null;
         this._propLoader.removeEventListener(Event.COMPLETE,this.onPropImageReady);
         var _loc2_:DisplayObjectContainer = UtilPlain.getInstance(this._captureTarget,UtilPlain.THE_CHAR);
         if(_loc2_ != null)
         {
            _loc3_ = UtilPlain.getHead(_loc2_);
            if(_loc3_ != null)
            {
               this._propLoader.name = AnimeConstants.MOVIECLIP_THE_WEAR;
               _loc3_.addChild(this._propLoader);
            }
         }
         this._propReady = true;
         invalidateDisplayList();
      }
      
      private function onImageLoaderInit(param1:Event) : void
      {
         this.cancelProcessing();
         UtilPlain.stopFamily(this._loader.content);
         this._captureTarget = this._loader;
         updateThumbColor(this._captureTarget);
         this.loadProp();
      }
      
      private function onImageLoaderError(param1:Event) : void
      {
         UtilErrorLogger.getInstance().appendCustomError("Error loading thumbnail url: " + this._charThumb.thumbnailUrl);
         _processing = true;
         this._createThumbnailByModel = true;
         this._charThumb.addEventListener(StudioEvent.BODY_MODEL_COMPLETE,this.onBodyModelComplete);
         this._charThumb.loadDefaultActionByBodyModel();
      }
      
      private function onBodyModelComplete(param1:Event) : void
      {
         super.loadProductImage();
      }
      
      protected function captureBitmapData() : void
      {
         var _loc2_:BitmapData = null;
         var _loc1_:Rectangle = this._captureTarget.getBounds(this._captureTarget);
         if(_loc1_.width > 0 && _loc1_.height > 0)
         {
            _loc2_ = new BitmapData(_loc1_.width,_loc1_.height,true,0);
            _loc2_.draw(this._captureTarget,new Matrix(1,0,0,1,-_loc1_.x,-_loc1_.y));
            ImageDataManager.instance.setImageData("charThumb",_product.themeId,_product.id,_loc2_);
            this._captureTarget = null;
            this.imageContainer.source = _loc2_;
            displayImage();
         }
      }
      
      override protected function removeImage() : void
      {
         this._imageUpdated = false;
         this.imageContainer.source = null;
         if(this._loader)
         {
            this._loader.unload();
         }
         this._creator = null;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         if(this._captureTarget && this._propReady)
         {
            this.captureBitmapData();
         }
      }
      
      private function _CharacterThumbSparkImage_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.smooth = true;
         _loc1_.scaleMode = "letterbox";
         _loc1_.horizontalAlign = "center";
         _loc1_.verticalAlign = "middle";
         _loc1_.visible = false;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.initialized(this,"imageContainer");
         this.imageContainer = _loc1_;
         BindingManager.executeBindings(this,"imageContainer",this.imageContainer);
         return _loc1_;
      }
      
      private function _CharacterThumbSparkImage_BusyIndicator1_i() : BusyIndicator
      {
         var _loc1_:BusyIndicator = new BusyIndicator();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("symbolColor",0);
         _loc1_.id = "_CharacterThumbSparkImage_BusyIndicator1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CharacterThumbSparkImage_BusyIndicator1 = _loc1_;
         BindingManager.executeBindings(this,"_CharacterThumbSparkImage_BusyIndicator1",this._CharacterThumbSparkImage_BusyIndicator1);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get imageContainer() : BitmapImage
      {
         return this._1006495386imageContainer;
      }
      
      public function set imageContainer(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1006495386imageContainer;
         if(_loc2_ !== param1)
         {
            this._1006495386imageContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageContainer",_loc2_,param1));
            }
         }
      }
   }
}
