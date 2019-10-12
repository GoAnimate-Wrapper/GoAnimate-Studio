package anifire.studio.events
{
   import flash.events.Event;
   
   public class AssetCollectionEvent extends Event
   {
      
      public static const COLLECTION_CHANGED:String = "assetCollectionChanged";
      
      public static const KEYWORD_UPDATED:String = "keywordUpdated";
       
      
      public function AssetCollectionEvent(param1:String = "assetCollectionChanged")
      {
         super(param1);
      }
   }
}
