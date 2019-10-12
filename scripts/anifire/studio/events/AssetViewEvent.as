package anifire.studio.events
{
   import flash.events.Event;
   
   public class AssetViewEvent extends Event
   {
      
      public static const VIEW_LOAD_COMPLETE:String = "ASSET_VIEW_LOAD_COMPLETE";
      
      public static const VIEW_CHANGE:String = "ASSET_VIEW_CHANGE";
      
      public static const VIEW_IMAGE_CHANGE:String = "VIEW_IMAGE_CHANGE";
       
      
      public function AssetViewEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}
