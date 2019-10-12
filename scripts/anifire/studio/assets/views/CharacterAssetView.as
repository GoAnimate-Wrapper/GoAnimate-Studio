package anifire.studio.assets.views
{
   import anifire.studio.assets.image.IAssetImageProvider;
   import anifire.studio.core.Asset;
   import anifire.studio.events.AssetEvent;
   import anifire.studio.events.AssetViewEvent;
   import anifire.studio.interfaces.IColorable;
   import anifire.studio.interfaces.IFlippable;
   import anifire.studio.interfaces.IMovable;
   import anifire.studio.interfaces.IRotatable;
   import anifire.studio.interfaces.IScalable;
   import flash.events.Event;
   
   public class CharacterAssetView extends AssetView
   {
       
      
      protected var _viewLoaded:Boolean;
      
      protected var _eyeController:AssetViewEyeController;
      
      protected var _mouthController:AssetViewMouthController;
      
      protected var _handPropController:AssetViewHandPropController;
      
      protected var _headWearController:AssetViewHeadWearController;
      
      protected var _facialController:AssetViewFacialController;
      
      public function CharacterAssetView(param1:Asset, param2:IAssetImageProvider = null)
      {
         super(param1,param2);
      }
      
      override protected function init(param1:Asset) : void
      {
         super.init(param1);
         moveImage(_asset as IMovable);
         rotateImage(_asset as IRotatable);
         scaleImage(_asset as IScalable);
         this._eyeController = new AssetViewEyeController();
         this._eyeController.assetView = this;
         this._mouthController = new AssetViewMouthController();
         this._mouthController.assetView = this;
         this._handPropController = new AssetViewHandPropController();
         this._handPropController.assetView = this;
         this._handPropController.addEventListener(AssetViewEvent.VIEW_IMAGE_CHANGE,this.onHandPropImageChange);
         this._headWearController = new AssetViewHeadWearController();
         this._headWearController.assetView = this;
         this._headWearController.addEventListener(AssetViewEvent.VIEW_IMAGE_CHANGE,this.onHeadWearImageChange);
         this._facialController = new AssetViewFacialController();
         this._facialController.assetView = this;
         this._facialController.addEventListener(AssetViewEvent.VIEW_IMAGE_CHANGE,this.onFacialImageChange);
      }
      
      override protected function handleImageReady() : void
      {
         flipImage(_asset as IFlippable);
         this._viewLoaded = true;
         dispatchEvent(new AssetViewEvent(AssetViewEvent.VIEW_CHANGE,true));
         dispatchEvent(new AssetViewEvent(AssetViewEvent.VIEW_IMAGE_CHANGE,true));
         this.checkAllImageReady();
      }
      
      protected function checkAllImageReady() : void
      {
         if(this._viewLoaded && this._handPropController.isImageReady && this._headWearController.isImageReady && this._facialController.isImageReady)
         {
            this.dispatchViewLoadComplete();
         }
      }
      
      protected function onHandPropImageChange(param1:Event) : void
      {
         this.checkAllImageReady();
      }
      
      protected function onHeadWearImageChange(param1:Event) : void
      {
         this.checkAllImageReady();
      }
      
      protected function onFacialImageChange(param1:Event) : void
      {
         this.checkAllImageReady();
      }
      
      protected function dispatchViewLoadComplete() : void
      {
         colorImage(_asset as IColorable);
         alpha = 1;
         dispatchEvent(new AssetViewEvent(AssetViewEvent.VIEW_LOAD_COMPLETE,true));
      }
      
      override public function destroy(param1:String = "rip") : void
      {
         this._eyeController.destroy(param1);
         this._mouthController.destroy(param1);
         this._handPropController.destroy(param1);
         this._headWearController.destroy(param1);
         this._facialController.destroy(param1);
         super.destroy(param1);
      }
      
      override protected function addAssetEventListeners() : void
      {
         super.addAssetEventListeners();
         if(_asset)
         {
            _asset.addEventListener(AssetEvent.ASSET_MOVED,this.onAssetMoved);
            _asset.addEventListener(AssetEvent.ASSET_ROTATED,this.onAssetRotated);
            _asset.addEventListener(AssetEvent.ASSET_RESIZED,this.onAssetResized);
            _asset.addEventListener(AssetEvent.ASSET_HFLIPPED,this.onAssetHFlipped);
            _asset.addEventListener(AssetEvent.COLOR_CHANGE,this.onAssetColorChange);
            _asset.addEventListener(AssetEvent.CHARACTER_SWAP_START,this.onSwapStart);
         }
      }
      
      override protected function removeAssetEventListeners() : void
      {
         super.removeAssetEventListeners();
         if(_asset)
         {
            _asset.removeEventListener(AssetEvent.ASSET_MOVED,this.onAssetMoved);
            _asset.removeEventListener(AssetEvent.ASSET_ROTATED,this.onAssetRotated);
            _asset.removeEventListener(AssetEvent.ASSET_RESIZED,this.onAssetResized);
            _asset.removeEventListener(AssetEvent.ASSET_HFLIPPED,this.onAssetHFlipped);
            _asset.removeEventListener(AssetEvent.COLOR_CHANGE,this.onAssetColorChange);
            _asset.removeEventListener(AssetEvent.CHARACTER_SWAP_START,this.onSwapStart);
         }
      }
      
      protected function onAssetMoved(param1:AssetEvent) : void
      {
         moveImage(param1.asset as IMovable);
      }
      
      protected function onAssetRotated(param1:AssetEvent) : void
      {
         rotateImage(param1.asset as IRotatable);
      }
      
      protected function onAssetResized(param1:AssetEvent) : void
      {
         scaleImage(param1.asset as IScalable);
      }
      
      protected function onAssetHFlipped(param1:AssetEvent) : void
      {
         flipImage(param1.asset as IFlippable);
      }
      
      protected function onAssetColorChange(param1:AssetEvent) : void
      {
         colorImage(param1.asset as IColorable);
      }
      
      protected function onSwapStart(param1:AssetEvent) : void
      {
         alpha = 0.5;
      }
   }
}
