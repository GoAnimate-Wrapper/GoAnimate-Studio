package anifire.studio.assets.views
{
   import anifire.studio.events.AssetEvent;
   import anifire.studio.events.CharacterAssetEvent;
   import anifire.studio.interfaces.IMouth;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   
   public class AssetViewMouthController extends AbstractAssetViewController
   {
       
      
      public function AssetViewMouthController()
      {
         super();
      }
      
      override protected function onAssetImageChange(param1:Event) : void
      {
         this.updateMouth();
      }
      
      public function updateMouth() : void
      {
         if(this.asset is IMouth && this.assetImage is IMouth)
         {
            IMouth(super.assetImage).demoSpeech = (asset as IMouth).demoSpeech;
         }
      }
      
      override protected function addAssetEventListeners(param1:IEventDispatcher) : void
      {
         if(param1)
         {
            param1.addEventListener(CharacterAssetEvent.MOUTH_CHANGE,this.onMouthChanged);
         }
      }
      
      override protected function removeAssetEventListeners(param1:IEventDispatcher) : void
      {
         if(param1)
         {
            param1.removeEventListener(CharacterAssetEvent.MOUTH_CHANGE,this.onMouthChanged);
         }
      }
      
      private function onMouthChanged(param1:AssetEvent) : void
      {
         this.updateMouth();
      }
   }
}
