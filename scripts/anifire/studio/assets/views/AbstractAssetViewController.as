package anifire.studio.assets.views
{
   import anifire.studio.core.Asset;
   import anifire.studio.events.AssetViewEvent;
   import anifire.studio.interfaces.IAssetView;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   
   public class AbstractAssetViewController extends EventDispatcher
   {
       
      
      private var _assetView:IAssetView;
      
      private var _lastWords:String;
      
      public function AbstractAssetViewController()
      {
         super();
      }
      
      public function set assetView(param1:IAssetView) : void
      {
         if(this._assetView)
         {
            this._assetView.removeEventListener(AssetViewEvent.VIEW_IMAGE_CHANGE,this.onAssetImageChange);
            this.removeAssetEventListeners(this._assetView.asset);
         }
         if(param1 != this._assetView)
         {
            this._assetView = param1;
         }
         if(this._assetView)
         {
            this._assetView.addEventListener(AssetViewEvent.VIEW_IMAGE_CHANGE,this.onAssetImageChange);
            this.addAssetEventListeners(this._assetView.asset);
         }
      }
      
      protected function get assetImage() : DisplayObject
      {
         if(this._assetView)
         {
            return this._assetView.assetImage;
         }
         return null;
      }
      
      protected function get asset() : Asset
      {
         if(this._assetView)
         {
            return this._assetView.asset;
         }
         return null;
      }
      
      protected function addAssetEventListeners(param1:IEventDispatcher) : void
      {
      }
      
      protected function removeAssetEventListeners(param1:IEventDispatcher) : void
      {
      }
      
      protected function onAssetImageChange(param1:Event) : void
      {
      }
      
      public function destroy(param1:String = "rip") : void
      {
         if(this._assetView)
         {
            this._assetView.removeEventListener(AssetViewEvent.VIEW_IMAGE_CHANGE,this.onAssetImageChange);
            this.removeAssetEventListeners(this._assetView.asset);
            this._assetView = null;
         }
      }
   }
}
