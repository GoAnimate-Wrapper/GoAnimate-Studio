package com.jumpeye.flashEff2.presets
{
   import flash.display.Sprite;
   
   public class JFETP3D16 extends Sprite
   {
       
      
      public function JFETP3D16()
      {
         super();
      }
      
      public static function fep(param1:Object, param2:Sprite) : void
      {
         var propOwner:Object = param1;
         var textOwnerClip:Sprite = param2;
         propOwner.teorecticSpace = Math.sqrt(textOwnerClip.width * textOwnerClip.width + textOwnerClip.height * textOwnerClip.height) / 2;
         propOwner.getZPosition = function(param1:Number, param2:Number, param3:Number = 0, param4:Number = 0, param5:Number = 0):Number
         {
            var _loc6_:Number = param1 - param3;
            var _loc7_:Number = param2 - param4;
            return Math.sqrt(Math.abs(propOwner.teorecticSpace * propOwner.teorecticSpace - _loc6_ * _loc6_ - _loc7_ * _loc7_)) - propOwner.teorecticSpace;
         };
      }
   }
}
