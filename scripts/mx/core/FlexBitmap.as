package mx.core
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import mx.utils.NameUtil;
   
   use namespace mx_internal;
   
   public class FlexBitmap extends Bitmap
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      public function FlexBitmap(param1:BitmapData = null, param2:String = "auto", param3:Boolean = false)
      {
         super(param1,param2,param3);
         try
         {
            name = NameUtil.createUniqueName(this);
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      override public function toString() : String
      {
         return NameUtil.displayObjectToString(this);
      }
   }
}
