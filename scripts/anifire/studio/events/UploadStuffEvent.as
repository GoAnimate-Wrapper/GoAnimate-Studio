package anifire.studio.events
{
   import anifire.studio.core.Thumb;
   import flash.events.Event;
   
   public class UploadStuffEvent extends Event
   {
      
      public static const UPLOAD_STUFF_FAIL:String = "UPLOAD_STUFF_FAIL";
      
      public static const UPLOAD_STUFF_COMPLETE:String = "UPLOAD_STUFF_COMPLETE";
       
      
      private var _thumb:Thumb;
      
      public function UploadStuffEvent(param1:String, param2:Thumb = null, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this._thumb = param2;
      }
      
      public function get thumb() : Thumb
      {
         return this._thumb;
      }
   }
}
