package com.jac.ogg.events
{
   import flash.events.Event;
   
   public class OggEncoderEvent extends Event
   {
      
      public static const ENCODE_COMPLETE:String = "oggEncodeComplete";
      
      public static const ENCODE_PROGRESS:String = "oggEncodeProgress";
       
      
      private var _data:Object;
      
      public function OggEncoderEvent(param1:String, param2:Object = null, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this._data = param2;
      }
      
      override public function clone() : Event
      {
         return new OggEncoderEvent(type,this._data,bubbles,cancelable);
      }
      
      override public function toString() : String
      {
         return formatToString("OggEncoderEvent","type","data","bubbles","cancelable","eventPhase");
      }
      
      public function get data() : Object
      {
         return this._data;
      }
   }
}
