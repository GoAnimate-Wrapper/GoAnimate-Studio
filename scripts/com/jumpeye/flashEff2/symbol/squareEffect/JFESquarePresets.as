package com.jumpeye.flashEff2.symbol.squareEffect
{
   import flash.utils.getDefinitionByName;
   
   public dynamic class JFESquarePresets
   {
       
      
      public function JFESquarePresets()
      {
         super();
      }
      
      public static function getPresetsArray(param1:uint, param2:uint, param3:uint, param4:Array, param5:Object = null) : Array
      {
         var i:* = undefined;
         var j:uint = 0;
         var presetClass:Class = null;
         var presetFunc:* = undefined;
         var preset:uint = param1;
         var lin:uint = param2;
         var col:uint = param3;
         var matrix:Array = param4;
         var timeLineSquares:Object = param5;
         var max:Number = 0;
         try
         {
            presetClass = getDefinitionByName("com.jumpeye.flashEff2.presets.JFESP" + preset) as Class;
            presetFunc = presetClass["fep"];
            if(presetFunc != null)
            {
               return presetFunc(preset,lin,col,matrix,timeLineSquares);
            }
         }
         catch(e:Error)
         {
            if(preset > 1)
            {
               trace("FLASHEFF2 WARNING: The selected preset is not in the Library ! Please drag the JFESP" + preset + " from the Components panel over the Library panel.");
            }
            i = 0;
            while(i < lin)
            {
               j = 0;
               while(j < col)
               {
                  matrix[i][j] = j;
                  j++;
               }
               i++;
            }
            max = col;
         }
         if(timeLineSquares != null)
         {
            timeLineSquares.MAX = max;
         }
         return matrix;
      }
      
      public static function getModifiedPresetsArray(param1:uint, param2:uint, param3:uint, param4:Array, param5:Object = null) : Array
      {
         var i:* = undefined;
         var j:uint = 0;
         var presetClass:Class = null;
         var presetFunc:* = undefined;
         var preset:uint = param1;
         var lin:uint = param2;
         var col:uint = param3;
         var matrix:Array = param4;
         var timeLineSquares:Object = param5;
         var max:Number = 0;
         if(preset > 8)
         {
            return JFESquarePresets.getPresetsArray(preset,lin,col,matrix,timeLineSquares);
         }
         try
         {
            presetClass = getDefinitionByName("com.jumpeye.flashEff2.presets.JFESPM" + preset) as Class;
            presetFunc = presetClass["fep"];
            if(presetFunc != null)
            {
               return presetFunc(preset,lin,col,matrix,timeLineSquares);
            }
         }
         catch(e:Error)
         {
            if(preset > 1)
            {
               trace("FLASHEFF2 WARNING: The selected preset is not in the Library ! Please drag the JFESPM" + preset + " from the Components panel over the Library panel.");
            }
            i = 0;
            while(i < lin)
            {
               j = 0;
               while(j < col)
               {
                  matrix[i][j] = i * (col - 1) + j;
                  j++;
               }
               i++;
            }
            max = col * lin;
         }
         if(timeLineSquares != null)
         {
            timeLineSquares.MAX = max;
         }
         return matrix;
      }
   }
}
