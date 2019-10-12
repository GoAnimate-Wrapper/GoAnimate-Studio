package anifire.studio.utils
{
   import anifire.studio.core.sound.ISoundable;
   
   public class UtilSound
   {
       
      
      public function UtilSound()
      {
         super();
      }
      
      public static function customMusicFadeByCurrentTime(param1:ISoundable, param2:Number) : Number
      {
         var _loc3_:Number = param1.inner_volume;
         var _loc4_:Number = 1;
         var _loc5_:Number = param1.startTime + param1.customFadeInDuration;
         var _loc6_:Number = param1.endTime - param1.customFadeOutDuration;
         if(param1.customFadeInDuration + param1.customFadeOutDuration > param1.endTime)
         {
            _loc4_ = _loc3_;
         }
         else if(param2 >= _loc5_ && param2 <= _loc6_)
         {
            _loc4_ = _loc3_;
         }
         else if(param2 <= _loc5_)
         {
            _loc4_ = (_loc3_ - param1.customFadeInVolume) * ((param2 - param1.startTime) / param1.customFadeInDuration) + param1.customFadeInVolume;
         }
         else if(param2 >= _loc6_ && param2 <= param1.endTime)
         {
            _loc4_ = (_loc3_ - param1.customFadeOutVolume) * ((param1.endTime - param2) / param1.customFadeOutDuration) + param1.customFadeOutVolume;
         }
         else
         {
            _loc4_ = 0;
         }
         _loc4_ = _loc4_ / _loc3_;
         return _loc4_;
      }
   }
}
