package com.jumpeye.utils
{
   import flash.utils.Timer;
   
   public class JTimer extends Timer
   {
       
      
      public var data:Object;
      
      public function JTimer(param1:Number = 0, param2:int = 0)
      {
         data = {};
         super(param1,param2);
      }
   }
}
