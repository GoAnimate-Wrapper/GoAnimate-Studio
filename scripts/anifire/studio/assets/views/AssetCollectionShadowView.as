package anifire.studio.assets.views
{
   import anifire.studio.assets.controllers.AssetCollectionController;
   import anifire.studio.assets.image.AssetCollectionImage;
   import anifire.studio.assets.models.AssetCollectionShadow;
   import anifire.studio.events.AssetEvent;
   import flash.events.IEventDispatcher;
   import flash.geom.Point;
   import mx.core.UIComponent;
   
   public class AssetCollectionShadowView extends UIComponent
   {
       
      
      private var _image:AssetCollectionImage;
      
      private var _shadow:AssetCollectionShadow;
      
      private var _controller:AssetCollectionController;
      
      private var _oldSize:Point;
      
      public function AssetCollectionShadowView()
      {
         this._oldSize = new Point();
         super();
         this._image = new AssetCollectionImage();
         this.addChild(this._image);
      }
      
      public function set controller(param1:AssetCollectionController) : void
      {
         this._image.collection = param1.viewCollection;
         this._image.move(-param1.width / 2,-param1.height / 2);
         this._oldSize.x = param1.width;
         this._oldSize.y = param1.height;
         this._controller = param1;
         this.shadow = param1.shadow as AssetCollectionShadow;
      }
      
      private function set shadow(param1:AssetCollectionShadow) : void
      {
         if(this._shadow != param1)
         {
            this.removeAssetEventListeners(this._shadow);
            this._shadow = param1;
            this.moveImage();
            this.addAssetEventListeners(this._shadow);
         }
      }
      
      private function addAssetEventListeners(param1:IEventDispatcher) : void
      {
         if(param1)
         {
            param1.addEventListener(AssetEvent.ASSET_RESIZED,this.onAssetResized);
            param1.addEventListener(AssetEvent.ASSET_MOVED,this.onAssetMoved);
         }
      }
      
      private function removeAssetEventListeners(param1:IEventDispatcher) : void
      {
         if(param1)
         {
            param1.removeEventListener(AssetEvent.ASSET_RESIZED,this.onAssetResized);
            param1.removeEventListener(AssetEvent.ASSET_MOVED,this.onAssetMoved);
         }
      }
      
      private function onAssetResized(param1:AssetEvent) : void
      {
         this.resizeImage();
      }
      
      private function onAssetMoved(param1:AssetEvent) : void
      {
         this.moveImage();
      }
      
      private function resizeImage() : void
      {
         if(this._shadow && this._controller)
         {
            this.scaleX = this._shadow.width / this._oldSize.x;
            this.scaleY = this._shadow.height / this._oldSize.y;
         }
      }
      
      private function moveImage() : void
      {
         if(this._shadow && this._controller)
         {
            this.move(this._shadow.x,this._shadow.y);
         }
      }
   }
}
