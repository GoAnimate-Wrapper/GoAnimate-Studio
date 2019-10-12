package com.jumpeye.flashEff2.text.patternsPresets
{
   import flash.display.Sprite;
   import flash.utils.getDefinitionByName;
   
   public class JFET3DPreset
   {
       
      
      public function JFET3DPreset()
      {
         super();
      }
      
      public static function writePresetFunction(param1:Number, param2:Object, param3:Sprite) : *
      {
         var presetClass:Class = null;
         var presetFunc:Function = null;
         var preset:Number = param1;
         var propOwner:Object = param2;
         var textOwnerClip:Sprite = param3;
         try
         {
            presetClass = getDefinitionByName("com.jumpeye.flashEff2.presets.JFETP3D" + preset) as Class;
            presetFunc = presetClass["fep"];
            if(presetFunc != null)
            {
               presetFunc(propOwner,textOwnerClip);
            }
            return;
         }
         catch(e:Error)
         {
            if(preset != 1)
            {
               trace("FLASHEFF2 WARNING: The selected preset is not in the Library ! Please drag the JFETP3D" + preset + " from the Components panel over the Library panel.");
            }
            propOwner.teorecticSpace = 0.01;
            propOwner.getZPosition = function(param1:Number, param2:Number, param3:Number = 0, param4:Number = 0, param5:Number = 0):Number
            {
               return 0;
            };
            return;
         }
      }
   }
}
