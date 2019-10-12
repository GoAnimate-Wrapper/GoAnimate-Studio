package com.jumpeye.effects
{
   import flash.filters.BitmapFilter;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.BlurFilter;
   import flash.filters.GlowFilter;
   
   public class JGlow
   {
       
      
      private var __value = 0;
      
      private var glowColor:uint;
      
      private var target;
      
      public function JGlow(param1:*, param2:uint = 16777215)
      {
         super();
         this.target = param1;
         this.glowColor = param2;
      }
      
      private function getGlow(param1:*) : BitmapFilter
      {
         var _loc2_:Number = glowColor;
         var _loc3_:Number = 1;
         var _loc4_:Number = 0;
         var _loc5_:Number = 0;
         var _loc6_:Number = param1 * 40 / 100;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:Number = BitmapFilterQuality.HIGH;
         return new GlowFilter(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc9_,_loc7_,_loc8_);
      }
      
      public function set value(param1:Number) : void
      {
         __value = param1;
         this.setEffect();
      }
      
      private function setEffect() : void
      {
         if(value != 0)
         {
            this.target.filters = [getBlur(value),getGlow(value)];
         }
         else
         {
            this.target.filters = [];
         }
      }
      
      public function get value() : Number
      {
         return __value;
      }
      
      private function getBlur(param1:*) : BitmapFilter
      {
         var _loc2_:Number = param1 * 20 / 100;
         var _loc3_:Number = param1 * 20 / 100;
         return new BlurFilter(_loc2_,_loc3_,BitmapFilterQuality.HIGH);
      }
   }
}
