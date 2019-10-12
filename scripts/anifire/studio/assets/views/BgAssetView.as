package anifire.studio.assets.views
{
   import anifire.studio.assets.image.IAssetImageProvider;
   import anifire.studio.core.Asset;
   import anifire.studio.core.Background;
   import anifire.studio.events.AssetEvent;
   import anifire.studio.interfaces.IColorable;
   import anifire.studio.interfaces.IMovable;
   
   public class BgAssetView extends AssetView
   {
       
      
      public function BgAssetView(param1:Asset, param2:IAssetImageProvider = null)
      {
         super(param1,param2);
      }
      
      override protected function init(param1:Asset) : void
      {
         super.init(param1);
         moveImage(_asset as IMovable);
      }
      
      override protected function handleImageReady() : void
      {
         colorImage(_asset as IColorable);
         this.updateImageVisiblity();
         super.handleImageReady();
      }
      
      override protected function addAssetEventListeners() : void
      {
         super.addAssetEventListeners();
         if(_asset)
         {
            _asset.addEventListener(AssetEvent.ASSET_MOVED,this.onAssetMoved);
            _asset.addEventListener(AssetEvent.COLOR_CHANGE,this.onAssetColorChange);
            _asset.addEventListener(AssetEvent.BASE_VISIBILITY_CHANGE,this.onBaseVisibilityChange);
         }
      }
      
      override protected function removeAssetEventListeners() : void
      {
         super.removeAssetEventListeners();
         if(_asset)
         {
            _asset.removeEventListener(AssetEvent.ASSET_MOVED,this.onAssetMoved);
            _asset.removeEventListener(AssetEvent.COLOR_CHANGE,this.onAssetColorChange);
            _asset.removeEventListener(AssetEvent.BASE_VISIBILITY_CHANGE,this.onBaseVisibilityChange);
         }
      }
      
      protected function onAssetColorChange(param1:AssetEvent) : void
      {
         colorImage(param1.asset as IColorable);
      }
      
      protected function onAssetMoved(param1:AssetEvent) : void
      {
         moveImage(param1.asset as IMovable);
      }
      
      protected function updateImageVisiblity() : void
      {
         var _loc1_:Background = _asset as Background;
         if(_loc1_)
         {
            _assetImage.visible = _loc1_.baseVisible;
         }
      }
      
      protected function onBaseVisibilityChange(param1:AssetEvent) : void
      {
         this.updateImageVisiblity();
      }
   }
}
