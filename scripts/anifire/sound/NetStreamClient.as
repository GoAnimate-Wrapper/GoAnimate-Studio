package anifire.sound
{
   import anifire.event.NetStreamClientEvent;
   import flash.events.EventDispatcher;
   
   public class NetStreamClient extends EventDispatcher
   {
       
      
      public function NetStreamClient()
      {
         super();
      }
      
      public function onMetaData(param1:Object) : void
      {
         this.traceInfo(param1);
         var _loc2_:NetStreamClientEvent = new NetStreamClientEvent(NetStreamClientEvent.META_DATA_READY,this);
         _loc2_.infoObject = param1;
         this.dispatchEvent(_loc2_);
      }
      
      public function onCuePoint(param1:Object) : void
      {
         this.traceInfo(param1);
         var _loc2_:NetStreamClientEvent = new NetStreamClientEvent(NetStreamClientEvent.CUE_POINT_READY,this);
         _loc2_.infoObject = param1;
         this.dispatchEvent(_loc2_);
      }
      
      public function onPlayStatus(param1:Object) : void
      {
         this.traceInfo(param1);
         var _loc2_:NetStreamClientEvent = new NetStreamClientEvent(NetStreamClientEvent.PLAY_STATUS_READY,this);
         _loc2_.infoObject = param1;
         this.dispatchEvent(_loc2_);
      }
      
      public function onID3(param1:Object) : void
      {
         this.traceInfo(param1);
         var _loc2_:NetStreamClientEvent = new NetStreamClientEvent(NetStreamClientEvent.ID3_READY,this);
         _loc2_.infoObject = param1;
         this.dispatchEvent(_loc2_);
      }
      
      private function traceInfo(param1:Object) : void
      {
         var _loc2_:* = null;
         for(_loc2_ in param1)
         {
         }
      }
   }
}
