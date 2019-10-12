package anifire.studio.events
{
   import flash.events.Event;
   
   public class ImporterEvent extends Event
   {
      
      public static const IMPORTER_STATUS:String = "importerStatus";
      
      public static const IMPORTER_UPLOAD_COMPLETE:String = "importerUploadComplete";
      
      public static const IMPORTER_ASSET_READY:String = "importerAssetReady";
      
      public static const IMPORTER_ADD_ASSET:String = "importerAddAsset";
       
      
      public var assetType:String;
      
      public var assetId:String;
      
      public var status:String;
      
      public function ImporterEvent(param1:String)
      {
         super(param1);
      }
   }
}
