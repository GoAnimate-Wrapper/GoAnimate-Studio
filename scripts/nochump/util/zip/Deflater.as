package nochump.util.zip
{
   import flash.utils.ByteArray;
   
   public class Deflater
   {
       
      
      private var buf:ByteArray;
      
      private var compressed:Boolean;
      
      private var totalIn:uint;
      
      private var totalOut:uint;
      
      public function Deflater()
      {
         super();
         reset();
      }
      
      public function reset() : void
      {
         buf = new ByteArray();
         compressed = false;
         totalIn = 0;
         totalOut = 0;
      }
      
      public function setInput(param1:ByteArray) : void
      {
         buf.writeBytes(param1);
         totalIn = buf.length;
      }
      
      public function deflate(param1:ByteArray) : uint
      {
         if(!compressed)
         {
            buf.compress();
            compressed = true;
         }
         param1.writeBytes(buf,2,buf.length - 6);
         totalOut = param1.length;
         return 0;
      }
      
      public function getBytesRead() : uint
      {
         return totalIn;
      }
      
      public function getBytesWritten() : uint
      {
         return totalOut;
      }
   }
}
