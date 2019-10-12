package anifire.event
{
   import flash.events.Event;
   
   public class NetStreamClientEvent extends ExtraDataEvent
   {
      
      public static const META_DATA_READY:String = "meta_data_ready";
      
      public static const CUE_POINT_READY:String = "cue_point_ready";
      
      public static const PLAY_STATUS_READY:String = "play_status_ready";
      
      public static const ID3_READY:String = "id3_ready";
       
      
      public var infoObject:Object;
      
      public function NetStreamClientEvent(param1:String, param2:Object, param3:Object = null, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param2,param3,param4,param5);
      }
      
      override public function clone() : Event
      {
         var _loc1_:NetStreamClientEvent = new NetStreamClientEvent(this.type,this.getEventCreater(),this.getData(),this.bubbles,this.cancelable);
         _loc1_.infoObject = this.infoObject;
         return _loc1_;
      }
   }
}
