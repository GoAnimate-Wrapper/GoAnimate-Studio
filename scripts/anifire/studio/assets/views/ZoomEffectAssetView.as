package anifire.studio.assets.views
{
   import anifire.studio.assets.image.IAssetImageProvider;
   import anifire.studio.core.Asset;
   import anifire.studio.events.AssetEvent;
   import anifire.studio.events.AssetViewEvent;
   import anifire.studio.interfaces.IMovable;
   import anifire.studio.interfaces.IResizable;
   
   public class ZoomEffectAssetView extends AssetView
   {
       
      
      public function ZoomEffectAssetView(param1:Asset, param2:IAssetImageProvider = null)
      {
         super(param1,param2);
      }
      
      override protected function init(param1:Asset) : void
      {
         super.init(param1);
         this.updateResizable();
         this.updateMovable();
      }
      
      override protected function handleImageReady() : void
      {
         if(_asset is IResizable)
         {
            this.resizeImage(IResizable(_asset));
         }
         super.handleImageReady();
      }
      
      override protected function addAssetEventListeners() : void
      {
         super.addAssetEventListeners();
         if(_asset)
         {
            _asset.addEventListener(AssetEvent.ASSET_RESIZED,this.onAssetResized);
            _asset.addEventListener(AssetEvent.ASSET_MOVED,this.onAssetMoved);
         }
      }
      
      override protected function removeAssetEventListeners() : void
      {
         super.removeAssetEventListeners();
         if(_asset)
         {
            _asset.removeEventListener(AssetEvent.ASSET_RESIZED,this.onAssetResized);
            _asset.removeEventListener(AssetEvent.ASSET_MOVED,this.onAssetMoved);
         }
      }
      
      private function onAssetResized(param1:AssetEvent) : void
      {
         this.updateResizable();
      }
      
      private function onAssetMoved(param1:AssetEvent) : void
      {
         this.updateMovable();
      }
      
      protected function updateMovable() : void
      {
         if(_asset is IMovable)
         {
            moveImage(IMovable(_asset));
         }
      }
      
      protected function updateResizable() : void
      {
         if(_asset is IResizable)
         {
            this.resizeImage(IResizable(_asset));
         }
      }
      
      protected function resizeImage(param1:IResizable) : void
      {
         if(assetImage is IResizable)
         {
            IResizable(assetImage).width = param1.width;
            IResizable(assetImage).height = param1.height;
            dispatchEvent(new AssetViewEvent(AssetViewEvent.VIEW_CHANGE,true));
         }
      }
   }
}
