package anifire.util
{
   import flash.utils.ByteArray;
   
   public class UtilFileFormat
   {
       
      
      public function UtilFileFormat()
      {
         super();
      }
      
      public static function matchType(param1:String, param2:Array) : Boolean
      {
         if(param2.indexOf(param1) > -1)
         {
            return true;
         }
         return false;
      }
      
      public static function checkByteArrayMatchItsExt(param1:String, param2:ByteArray) : Boolean
      {
         var ext:String = null;
         var file_init:String = null;
         var id:String = param1;
         var bytes:ByteArray = param2;
         try
         {
            ext = String(id.substring(id.lastIndexOf(".") + 1)).toLowerCase();
            bytes.position = 0;
            if(matchType(ext,["jpg","jpeg"]))
            {
               file_init = bytes.readUTFBytes(3);
               if(file_init == "ÿØÿ")
               {
                  return true;
               }
            }
            else if(matchType(ext,["gif"]))
            {
               file_init = bytes.readUTFBytes(4);
               if(file_init == "GIF8")
               {
                  return true;
               }
            }
            else if(matchType(ext,["png"]))
            {
               file_init = bytes.readUTFBytes(8);
               if(file_init == "PNG\r\n\x1a\n")
               {
                  return true;
               }
            }
            else if(matchType(ext,["bmp"]))
            {
               file_init = bytes.readUTFBytes(2);
               if(file_init == "BM")
               {
                  return true;
               }
            }
            else if(matchType(ext,["swf"]))
            {
               file_init = bytes.readUTFBytes(3);
               if(file_init == "CWS" || file_init == "FWS")
               {
                  return true;
               }
            }
            else if(matchType(ext,["flv"]))
            {
               return true;
            }
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("UtilFileFormat:checkBytes",e);
         }
         return false;
      }
   }
}
