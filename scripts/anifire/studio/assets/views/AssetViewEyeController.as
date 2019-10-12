package anifire.studio.assets.views
{
   import anifire.studio.events.AssetEvent;
   import anifire.studio.interfaces.IEye;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   
   public class AssetViewEyeController extends AbstractAssetViewController
   {
       
      
      public function AssetViewEyeController()
      {
         super();
      }
      
      override protected function addAssetEventListeners(param1:IEventDispatcher) : void
      {
         if(param1)
         {
            param1.addEventListener(AssetEvent.EYE_CHANGE,this.onEyeChanged);
         }
      }
      
      override protected function removeAssetEventListeners(param1:IEventDispatcher) : void
      {
         if(param1)
         {
            param1.removeEventListener(AssetEvent.EYE_CHANGE,this.onEyeChanged);
         }
      }
      
      private function onEyeChanged(param1:AssetEvent) : void
      {
         this.updateEye();
      }
      
      public function updateEye() : void
      {
         if(this.asset is IEye && this.assetImage is IEye)
         {
            (super.assetImage as IEye).lookAtCamera = (asset as IEye).lookAtCamera;
         }
      }
      
      override protected function onAssetImageChange(param1:Event) : void
      {
         this.updateEye();
      }
   }
}
