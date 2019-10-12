package com.jumpeye.flashEff2.text.patternsPresets
{
   import flash.utils.getDefinitionByName;
   
   public class JFETPreset
   {
       
      
      public function JFETPreset()
      {
         super();
      }
      
      public static function getAliasPreset(param1:*) : Object
      {
         if(isNaN(param1))
         {
            param1 = 1;
         }
         else if(Number(param1) > 55)
         {
            param1 = 1;
         }
         var _loc2_:String = "chars";
         if(param1 > 9)
         {
            if(param1 < 19)
            {
               _loc2_ = "words";
               param1 = param1 - 9;
            }
            else if(param1 < 22)
            {
               _loc2_ = "lines";
               param1 = param1 + 7;
            }
            else if(param1 < 38)
            {
               _loc2_ = "chars";
               param1 = param1 - 12;
            }
            else if(param1 < 54)
            {
               _loc2_ = "words";
               param1 = param1 - 28;
            }
            else
            {
               _loc2_ = "lines";
               param1 = param1 - 25;
            }
         }
         return {
            "preset":param1,
            "splitter":_loc2_
         };
      }
      
      public static function getPresetsArray(param1:uint, param2:Array) : Object
      {
         var presetClass:Class = null;
         var presetFunc:Function = null;
         var i:* = undefined;
         var j:int = 0;
         var timeMatrix:Array = null;
         var lin:uint = 0;
         var col:uint = 0;
         var count:uint = 0;
         var preset:uint = param1;
         var matrix:Array = param2;
         try
         {
            presetClass = getDefinitionByName("com.jumpeye.flashEff2.presets.JFETP" + preset) as Class;
            presetFunc = presetClass["fep"];
            if(presetFunc != null)
            {
               return presetFunc(matrix);
            }
         }
         catch(e:Error)
         {
            if(preset > 1)
            {
               trace("FLASHEFF2 WARNING: The selected preset is not in the Library ! Please drag the JFETP" + preset + " from the Components panel over the Library panel.");
            }
            timeMatrix = [];
            lin = matrix.length;
            count = 0;
            i = 0;
            while(i < lin)
            {
               col = matrix[i].length;
               timeMatrix[i] = [];
               j = 0;
               while(j < col)
               {
                  timeMatrix[i][j] = count++;
                  j++;
               }
               i++;
            }
            return {
               "maxItems":count,
               "timeMatrix":timeMatrix
            };
         }
         return {
            "maxItems":0,
            "timeMatrix":[]
         };
      }
   }
}
