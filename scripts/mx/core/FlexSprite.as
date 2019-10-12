package mx.core
{
   import flash.display.Sprite;
   import mx.utils.NameUtil;
   
   use namespace mx_internal;
   
   public class FlexSprite extends Sprite
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      public function FlexSprite()
      {
         super();
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
