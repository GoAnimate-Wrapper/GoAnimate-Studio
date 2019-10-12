package com.jac.ogg
{
   import cmodule.oggvorbisencoder.CLibInit;
   import com.jac.ogg.events.OggEncoderEvent;
   import flash.events.EventDispatcher;
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   
   public class OggEncoder extends EventDispatcher
   {
      
      private static var myOggEncoder:OggEncoder = null;
       
      
      private var _loader:CLibInit;
      
      private var _lib:Object;
      
      private var _encodedBytes:ByteArray;
      
      private var _wavBytes:ByteArray;
      
      private var _isBusy:Boolean;
      
      private var _decodedBytes:ByteArray;
      
      public function OggEncoder()
      {
         super();
         this._loader = new CLibInit();
         this._lib = this._loader.init();
         this._isBusy = false;
      }
      
      public static function getInstance() : OggEncoder
      {
         if(myOggEncoder == null)
         {
            myOggEncoder = new OggEncoder();
         }
         return myOggEncoder;
      }
      
      public function encode(param1:ByteArray, param2:OggComments = null) : void
      {
         if(!this._isBusy)
         {
            this._isBusy = true;
            if(param2 == null)
            {
               param2 = new OggComments();
            }
            param1.position = 0;
            this._wavBytes = new ByteArray();
            this._wavBytes.endian = Endian.LITTLE_ENDIAN;
            this._wavBytes.writeBytes(param1);
            this._wavBytes.position = 0;
            this._encodedBytes = new ByteArray();
            this._encodedBytes.endian = Endian.LITTLE_ENDIAN;
            this._lib.startAsyncEncode(this.encodeComplete,this,this._wavBytes,this._encodedBytes,1,1,param2);
         }
      }
      
      private function encodeComplete(param1:ByteArray) : void
      {
         this._isBusy = false;
         dispatchEvent(new OggEncoderEvent(OggEncoderEvent.ENCODE_COMPLETE,param1));
      }
      
      public function handleProgress(param1:int, param2:int) : void
      {
         dispatchEvent(new OggEncoderEvent(OggEncoderEvent.ENCODE_PROGRESS,param1 / param2));
      }
      
      public function get encodedBytes() : ByteArray
      {
         return this._encodedBytes;
      }
      
      public function get wavBytes() : ByteArray
      {
         return this._wavBytes;
      }
      
      public function get isBusy() : Boolean
      {
         return this._isBusy;
      }
   }
}
