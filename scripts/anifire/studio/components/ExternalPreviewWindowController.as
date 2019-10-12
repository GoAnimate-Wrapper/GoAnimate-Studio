package anifire.studio.components
{
   import anifire.util.UtilHashArray;
   import anifire.util.UtilPreviewMovie;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.external.ExternalInterface;
   import flash.net.LocalConnection;
   
   public class ExternalPreviewWindowController extends EventDispatcher
   {
       
      
      private var connSend:LocalConnection;
      
      private var connReceive:LocalConnection;
      
      private var _previewStartFrame:int = 1;
      
      public function ExternalPreviewWindowController()
      {
         super();
      }
      
      public function initExternalPreviewWindow(param1:XML, param2:UtilHashArray, param3:UtilHashArray, param4:int, param5:Boolean, param6:Array) : void
      {
         var _loc7_:String = UtilPreviewMovie.serializePreviewMovieData(param1,param2,param3);
         this._previewStartFrame = param4;
         ExternalInterface.call("initPreviewPlayer",_loc7_,String(this._previewStartFrame),param5,param6);
         ExternalInterface.addCallback("onExternalPreviewPlayerPublish",this.onPublish);
         ExternalInterface.addCallback("onExternalPreviewPlayerCancel",this.onCancel);
      }
      
      private function onCancel() : void
      {
         dispatchEvent(new Event(Event.CANCEL));
      }
      
      private function onPublish() : void
      {
         dispatchEvent(new Event(Event.CHANGE));
      }
   }
}
