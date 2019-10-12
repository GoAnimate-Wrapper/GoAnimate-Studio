package com.jumpeye.flashEff2.presets
{
   import flash.display.Sprite;
   
   public class JFETP3D7 extends Sprite
   {
       
      
      public function JFETP3D7()
      {
         super();
      }
      
      public static function fep(param1:Object, param2:Sprite) : void
      {
         var propOwner:Object = param1;
         var textOwnerClip:Sprite = param2;
         propOwner.teorecticSpace = textOwnerClip.width;
         propOwner.getZPosition = function(param1:Number, param2:Number, param3:Number = 0, param4:Number = 0, param5:Number = 0):Number
         {
            return param1 - propOwner.teorecticSpace;
         };
      }
   }
}
