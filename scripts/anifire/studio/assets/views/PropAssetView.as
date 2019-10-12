package anifire.studio.assets.views
{
   import anifire.studio.assets.image.IAssetImageProvider;
   import anifire.studio.core.Asset;
   import anifire.studio.events.AssetEvent;
   import anifire.studio.interfaces.IColorable;
   import anifire.studio.interfaces.IFlippable;
   import anifire.studio.interfaces.IMovable;
   import anifire.studio.interfaces.IRotatable;
   import anifire.studio.interfaces.IScalable;
   
   public class PropAssetView extends AssetView
   {
       
      
      protected var _eyeController:AssetViewEyeController;
      
      protected var _mouthController:AssetViewMouthController;
      
      public function PropAssetView(param1:Asset, param2:IAssetImageProvider = null)
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
         }
      }
      
      override protected function handleImageReady() : void
      {
         flipImage(_asset as IFlippable);
         colorImage(_asset as IColorable);
         super.handleImageReady();
      }
      
      override public function destroy(param1:String = "rip") : void
      {
         this._eyeController.destroy(param1);
         this._mouthController.destroy(param1);
         super.destroy(param1);
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
   }
}
