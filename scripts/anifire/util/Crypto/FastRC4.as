package anifire.util.Crypto
{
   import flash.utils.ByteArray;
   
   public class FastRC4
   {
       
      
      private var i:int = 0;
      
      private var j:int = 0;
      
      private var S:ByteArray;
      
      private const psize:uint = 256;
      
      public function FastRC4(param1:ByteArray = null)
      {
         super();
         this.S = new ByteArray();
         if(param1)
         {
            this.init(param1);
         }
      }
      
      public function getPoolSize() : int
      {
         return this.psize;
      }
      
      public function init(param1:ByteArray) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = 0;
         var _loc4_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < 256)
         {
            this.S[_loc2_] = _loc2_;
            _loc2_++;
         }
         _loc3_ = 0;
         var _loc5_:int = 0;
         var _loc6_:int = param1.length;
         _loc2_ = 0;
         while(_loc2_ < 256)
         {
            if(_loc5_ >= _loc6_)
            {
               _loc5_ = 0;
            }
            _loc3_ = _loc3_ + this.S[_loc2_] + param1[_loc5_] & 255;
            _loc4_ = this.S[_loc2_];
            this.S[_loc2_] = this.S[_loc3_];
            this.S[_loc3_] = _loc4_;
            _loc2_++;
            _loc5_++;
         }
         this.i = 0;
         this.j = 0;
      }
      
      public function getBlockSize() : int
      {
         return 1;
      }
      
      public function encrypt(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         var _loc4_:int = param1.length;
         while(_loc2_ < _loc4_)
         {
            this.i = this.i + 1 & 255;
            this.j = this.j + this.S[this.i] & 255;
            _loc3_ = this.S[this.i];
            this.S[this.i] = this.S[this.j];
            this.S[this.j] = _loc3_;
            param1[_loc2_++] = param1[_loc2_++] ^ this.S[_loc3_ + this.S[this.i] & 255];
         }
      }
      
      public function decrypt(param1:ByteArray) : void
      {
         this.encrypt(param1);
         param1.position = 0;
      }
      
      public function toString() : String
      {
         return "rc4";
      }
   }
}
