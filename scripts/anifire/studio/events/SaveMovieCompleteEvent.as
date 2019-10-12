package anifire.studio.events
{
   import flash.events.Event;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   
   public class SaveMovieCompleteEvent extends Event
   {
       
      
      public const STATUS_FAILED:String = "-1";
      
      private var body:ByteArray;
      
      public function SaveMovieCompleteEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1);
      }
      
      public static function getInstance(param1:IDataInput) : SaveMovieCompleteEvent
      {
         var _loc2_:SaveMovieCompleteEvent = new SaveMovieCompleteEvent(Event.COMPLETE);
         var _loc3_:ByteArray = new ByteArray();
         param1.readBytes(_loc3_);
         _loc2_.body = _loc3_;
         return _loc2_;
      }
      
      override public function get type() : String
      {
         if(this.status == "0")
         {
            return Event.COMPLETE;
         }
         return this.STATUS_FAILED;
      }
      
      public function get message() : String
      {
         if(this.status == this.STATUS_FAILED)
         {
            return this.body.toString();
         }
         return this.body.toString().substr(1);
      }
      
      public function get status() : String
      {
         var _loc1_:uint = 0;
         try
         {
            _loc1_ = this.body[0];
            if(_loc1_ >= "0".charCodeAt() && _loc1_ <= "9".charCodeAt())
            {
               return String.fromCharCode(_loc1_);
            }
         }
         catch(e:Error)
         {
         }
         return this.STATUS_FAILED;
      }
   }
}
