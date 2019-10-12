package anifire.util
{
   import anifire.util.Crypto.FastRC4;
   import anifire.util.Crypto.TEA;
   import flash.utils.ByteArray;
   
   public class UtilCrypto
   {
      
      public static const MODE_DECRYPT_SWF:int = 0;
      
      public static const MODE_DECRYPT_RTMPE_TOKEN:int = 1;
      
      private static const KEY_MODE_DECRYPT_RTMPE_TOKEN:String = "gaGh0hiaEb8wa4wi";
       
      
      private var _mode:int;
      
      private var _legacyCryptKey:ByteArray;
      
      public function UtilCrypto(param1:int = 0)
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         super();
         this._mode = param1;
         if(this._mode == MODE_DECRYPT_SWF)
         {
            _loc2_ = "g0o1a2n3i4m5a6t7e";
            this._legacyCryptKey = new ByteArray();
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length)
            {
               this._legacyCryptKey[_loc3_] = _loc2_.charCodeAt(_loc3_) as uint;
               _loc3_++;
            }
         }
         else if(this._mode == MODE_DECRYPT_RTMPE_TOKEN)
         {
         }
      }
      
      public function decrypt(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = null;
         if(this._mode == MODE_DECRYPT_SWF)
         {
            _loc2_ = new ByteArray();
            param1.position = 0;
            param1.readBytes(_loc2_,0,10);
            this.decryptBytes(_loc2_);
            if(this.isFlashPrefix(_loc2_))
            {
               this.decryptBytes(param1);
            }
            else
            {
               param1.position = 0;
               param1.readBytes(_loc2_,0,10);
               this.decryptBytesWithLegacyAlgorithm(_loc2_);
               if(this.isFlashPrefix(_loc2_))
               {
                  this.decryptBytesWithLegacyAlgorithm(param1);
               }
            }
         }
      }
      
      public function decryptString(param1:String) : String
      {
         var _loc2_:String = null;
         if(this._mode == MODE_DECRYPT_RTMPE_TOKEN)
         {
            _loc2_ = TEA.decrypt(param1,KEY_MODE_DECRYPT_RTMPE_TOKEN);
         }
         return _loc2_;
      }
      
      private function isFlashPrefix(param1:ByteArray) : Boolean
      {
         var _loc2_:String = param1.toString().substr(0,3);
         return _loc2_ == "CWS" || _loc2_ == "FWS";
      }
      
      private function decryptBytes(param1:ByteArray) : void
      {
         var _loc2_:FastRC4 = new FastRC4(UtilMath.instance.randomizeKebo());
         _loc2_.decrypt(param1);
      }
      
      private function decryptBytesWithLegacyAlgorithm(param1:ByteArray) : void
      {
         var _loc2_:FastRC4 = new FastRC4(this._legacyCryptKey);
         _loc2_.decrypt(param1);
      }
   }
}
