package anifire.studio.assets.views
{
   import anifire.studio.assets.image.FlowFrameImage;
   import anifire.studio.assets.image.IAssetImageProvider;
   import anifire.studio.core.Asset;
   import anifire.studio.core.FlowFrame;
   import anifire.studio.events.AssetEvent;
   import anifire.studio.events.FlowFrameEvent;
   import anifire.studio.interfaces.IFlippable;
   import anifire.studio.interfaces.IMovable;
   import anifire.studio.interfaces.IRotatable;
   import anifire.studio.interfaces.IScalable;
   
   public class FlowFrameView extends AssetView
   {
       
      
      protected var _flowFrame:FlowFrame;
      
      protected var _flowFrameImage:FlowFrameImage;
      
      public function FlowFrameView(param1:Asset, param2:IAssetImageProvider = null)
      {
         super(param1,param2);
      }
      
      override protected function init(param1:Asset) : void
      {
         super.init(param1);
         this._flowFrame = param1 as FlowFrame;
         moveImage(this._flowFrame);
         rotateImage(this._flowFrame);
         scaleImage(this._flowFrame);
         this.resizeImage(this._flowFrame);
      }
      
      override protected function createImage(param1:Asset) : void
      {
         super.createImage(param1);
         this._flowFrameImage = _assetImage as FlowFrameImage;
      }
      
      override protected function addAssetEventListeners() : void
      {
         super.addAssetEventListeners();
         if(_asset)
         {
            _asset.addEventListener(AssetEvent.ASSET_MOVED,this.assetMovedHandler);
            _asset.addEventListener(AssetEvent.ASSET_ROTATED,this.assetRotatedHandler);
            _asset.addEventListener(AssetEvent.ASSET_RESIZED,this.assetResizedHandler);
            _asset.addEventListener(AssetEvent.ASSET_HFLIPPED,this.assetHFlippedHandler);
            _asset.addEventListener(AssetEvent.COLOR_CHANGE,this.assetColorChangeHandler);
            _asset.addEventListener(FlowFrameEvent.IMAGE_CHANGE,this.asset_imageChangeHandler);
            _asset.addEventListener(FlowFrameEvent.IMAGE_MOVE,this.asset_imageMoveHandler);
            _asset.addEventListener(FlowFrameEvent.IMAGE_SCALE,this.asset_imageScaleHandler);
            _asset.addEventListener(FlowFrameEvent.IMAGE_ROTATE,this.asset_imageRotateHandler);
            _asset.addEventListener(FlowFrameEvent.FRAME_RESIZE,this.asset_frameResizeHandler);
            _asset.addEventListener(FlowFrameEvent.EDIT_MODE_START,this.asset_editModeStartHandler);
            _asset.addEventListener(FlowFrameEvent.EDIT_MODE_COMPLETE,this.asset_editModeCompleteHandler);
            _asset.addEventListener(FlowFrameEvent.FIT_MODE_CHANGE,this.asset_fitModeChangeHandler);
         }
      }
      
      override protected function removeAssetEventListeners() : void
      {
         super.removeAssetEventListeners();
         if(_asset)
         {
            _asset.removeEventListener(AssetEvent.ASSET_MOVED,this.assetMovedHandler);
            _asset.removeEventListener(AssetEvent.ASSET_ROTATED,this.assetRotatedHandler);
            _asset.removeEventListener(AssetEvent.ASSET_RESIZED,this.assetResizedHandler);
            _asset.removeEventListener(AssetEvent.ASSET_HFLIPPED,this.assetHFlippedHandler);
            _asset.removeEventListener(AssetEvent.COLOR_CHANGE,this.assetColorChangeHandler);
            _asset.removeEventListener(FlowFrameEvent.IMAGE_CHANGE,this.asset_imageChangeHandler);
            _asset.removeEventListener(FlowFrameEvent.IMAGE_MOVE,this.asset_imageMoveHandler);
            _asset.removeEventListener(FlowFrameEvent.IMAGE_SCALE,this.asset_imageScaleHandler);
            _asset.removeEventListener(FlowFrameEvent.IMAGE_ROTATE,this.asset_imageRotateHandler);
            _asset.removeEventListener(FlowFrameEvent.FRAME_RESIZE,this.asset_frameResizeHandler);
            _asset.removeEventListener(FlowFrameEvent.EDIT_MODE_START,this.asset_editModeStartHandler);
            _asset.removeEventListener(FlowFrameEvent.EDIT_MODE_COMPLETE,this.asset_editModeCompleteHandler);
            _asset.removeEventListener(FlowFrameEvent.FIT_MODE_CHANGE,this.asset_fitModeChangeHandler);
         }
      }
      
      override protected function handleImageReady() : void
      {
         this._flowFrameImage = _assetImage as FlowFrameImage;
         flipImage(this._flowFrame);
         this.updateFrameColor(this._flowFrame);
         this.moveInnerImage(this._flowFrame);
         this.scaleInnerImage(this._flowFrame);
         this.rotateInnerImage(this._flowFrame);
         super.handleImageReady();
      }
      
      protected function assetMovedHandler(param1:AssetEvent) : void
      {
         moveImage(param1.asset as IMovable);
      }
      
      protected function assetRotatedHandler(param1:AssetEvent) : void
      {
         rotateImage(param1.asset as IRotatable);
      }
      
      protected function assetResizedHandler(param1:AssetEvent) : void
      {
         scaleImage(param1.asset as IScalable);
      }
      
      protected function asset_frameResizeHandler(param1:FlowFrameEvent) : void
      {
         this.resizeImage(this._flowFrame);
      }
      
      protected function asset_editModeStartHandler(param1:FlowFrameEvent) : void
      {
         var _loc2_:FlowFrameImage = this.assetImage as FlowFrameImage;
         if(_loc2_)
         {
            _loc2_.hideInnerImage();
         }
      }
      
      protected function asset_editModeCompleteHandler(param1:FlowFrameEvent) : void
      {
         var _loc2_:FlowFrameImage = this.assetImage as FlowFrameImage;
         if(_loc2_)
         {
            _loc2_.showInnerImage();
         }
      }
      
      protected function assetHFlippedHandler(param1:AssetEvent) : void
      {
         flipImage(param1.asset as IFlippable);
      }
      
      protected function assetColorChangeHandler(param1:AssetEvent) : void
      {
         this.updateFrameColor(param1.asset as FlowFrame);
      }
      
      protected function asset_imageChangeHandler(param1:FlowFrameEvent) : void
      {
         this.updateInnerImage(this._flowFrame);
      }
      
      protected function asset_fitModeChangeHandler(param1:FlowFrameEvent) : void
      {
         this.updateFitMode(this._flowFrame);
      }
      
      protected function asset_imageMoveHandler(param1:FlowFrameEvent) : void
      {
         this.moveInnerImage(this._flowFrame);
      }
      
      protected function asset_imageScaleHandler(param1:FlowFrameEvent) : void
      {
         this.scaleInnerImage(this._flowFrame);
      }
      
      protected function asset_imageRotateHandler(param1:FlowFrameEvent) : void
      {
         this.rotateInnerImage(this._flowFrame);
      }
      
      private function updateInnerImage(param1:FlowFrame) : void
      {
         if(param1 && this._flowFrameImage)
         {
            this._flowFrameImage.updateInnerImage(param1.innerImageThemeId,param1.innerImageAssetId,param1.autoFlowInnerImage);
         }
      }
      
      private function updateFitMode(param1:FlowFrame) : void
      {
         if(param1 && this._flowFrameImage)
         {
            this._flowFrameImage.updateFitMode(param1.fitMode);
         }
      }
      
      private function moveInnerImage(param1:FlowFrame) : void
      {
         if(param1 && this._flowFrameImage)
         {
            this._flowFrameImage.moveInnerImage(param1.innerImageX,param1.innerImageY);
         }
      }
      
      private function scaleInnerImage(param1:FlowFrame) : void
      {
         if(param1 && this._flowFrameImage)
         {
            this._flowFrameImage.scaleInnerImage(param1.innerImageScaleX,param1.innerImageScaleY);
         }
      }
      
      private function rotateInnerImage(param1:FlowFrame) : void
      {
         if(param1 && this._flowFrameImage)
         {
            this._flowFrameImage.rotateInnerImage(param1.innerImageRotation);
         }
      }
      
      private function updateFrameColor(param1:FlowFrame) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc2_:FlowFrameImage = this.assetImage as FlowFrameImage;
         if(!_loc2_)
         {
            return;
         }
         _loc2_.setColor(param1.color,param1.opacity);
      }
      
      private function resizeImage(param1:FlowFrame) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc2_:FlowFrameImage = this.assetImage as FlowFrameImage;
         if(!_loc2_)
         {
            return;
         }
         _loc2_.resizeFrame(param1.width,param1.height);
      }
   }
}
