package anifire.managers
{
   import anifire.component.EyeDropperScreenOverlay;
   
   public class ColorUtils
   {
      
      public static var eyeDropperScreenOverlay:EyeDropperScreenOverlay;
       
      
      public function ColorUtils()
      {
         super();
      }
      
      public static function colorToHex(param1:uint, param2:String = "") : String
      {
         var _loc3_:uint = 251658240 | param1 & 16777215;
         var _loc4_:String = _loc3_.toString(16);
         var _loc5_:String = param2 + _loc4_.substring(1).toUpperCase();
         return _loc5_;
      }
      
      public static function rgbToColor(param1:int, param2:int, param3:int) : uint
      {
         return param1 << 16 | param2 << 8 | param3;
      }
      
      public static function colorToRgb(param1:uint) : Array
      {
         var _loc2_:Array = [];
         _loc2_.push(param1 >> 16 & 255);
         _loc2_.push(param1 >> 8 & 255);
         _loc2_.push(param1 & 255);
         return _loc2_;
      }
   }
}
