package com.jumpeye.flashEff2.presets
{
   import flash.display.Sprite;
   
   public class JFETP3D4 extends Sprite
   {
       
      
      public function JFETP3D4()
      {
         super();
      }
      
      public static function fep(param1:Object, param2:Sprite) : void
      {
         var propOwner:Object = param1;
         var textOwnerClip:Sprite = param2;
         propOwner.teorecticSpace = textOwnerClip.width / 2;
         propOwner.getZPosition = function(param1:Number, param2:Number, param3:Number = 0, param4:Number = 0, param5:Number = 0):Number
         {
            var _loc6_:Number = param1 - param3;
            var _loc7_:Number = param2 - param4;
            var _loc8_:Number = propOwner.teorecticSpace;
            return Math.sqrt(_loc8_ * _loc8_ - _loc6_ * _loc6_) - propOwner.teorecticSpace;
         };
      }
   }
}
