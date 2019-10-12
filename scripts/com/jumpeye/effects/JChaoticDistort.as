package com.jumpeye.effects
{
   import flash.display.Sprite;
   import flash.filters.BitmapFilter;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.BlurFilter;
   import flash.geom.Matrix;
   
   public class JChaoticDistort extends Sprite
   {
       
      
      public var minScaleX;
      
      public var minScaleY:Number;
      
      public var blurMax:Number;
      
      public var maxSkewX;
      
      public var maxSkewY;
      
      public var rotMax;
      
      private var target;
      
      public var maxScaleX;
      
      public var maxScaleY;
      
      public var rotMin;
      
      private var __value = 0;
      
      public var posMaxX;
      
      public var posMaxY;
      
      public var blurMin;
      
      public var difX;
      
      public var posMinX;
      
      public var posMinY;
      
      public var minSkew;
      
      public var difY;
      
      public function JChaoticDistort(param1:*, param2:*, param3:*, param4:*, param5:*, param6:*, param7:*)
      {
         super();
         this.target = param1;
         this.difX = param2;
         this.difY = param3;
         this.minScaleX = 1;
         this.maxScaleX = param4;
         this.minScaleY = 1;
         this.maxScaleY = param4;
         this.posMinX = param1.x;
         this.posMaxX = param1.x + param2;
         this.posMinY = param1.y;
         this.posMaxY = param1.y + param3;
         this.minSkew = 0;
         this.maxSkewX = param5;
         this.maxSkewY = param6;
         this.blurMin = 0;
         this.blurMax = param7;
      }
      
      public function set value(param1:Number) : void
      {
         __value = param1;
         this.setEffect();
      }
      
      private function centerRotate(param1:*) : *
      {
         target.rotation = param1;
      }
      
      private function randRange(param1:Number, param2:Number) : Number
      {
         var _loc3_:Number = Math.floor(Math.random() * (param2 - param1 + 1)) + param1;
         return _loc3_;
      }
      
      private function getRadian(param1:*) : Number
      {
         var _loc2_:Number = NaN;
         _loc2_ = param1 / 180 * Math.PI;
         return _loc2_;
      }
      
      public function get value() : Number
      {
         return __value;
      }
      
      private function getBlur(param1:*, param2:Number = 0) : BitmapFilter
      {
         var _loc3_:Number = param1;
         var _loc4_:Number = 0;
         return new BlurFilter(_loc3_,_loc4_,BitmapFilterQuality.HIGH);
      }
      
      private function skewObject(param1:*, param2:*, param3:*, param4:*, param5:*, param6:*, param7:*) : *
      {
         var _loc8_:* = new Matrix();
         _loc8_.a = param2;
         _loc8_.b = param6;
         _loc8_.c = param6;
         _loc8_.d = param3;
         _loc8_.tx = param4;
         _loc8_.ty = param5;
         param1.transform.matrix = _loc8_;
      }
      
      private function setEffect() : void
      {
         var _loc1_:* = minScaleX + Math.abs(value) * (maxScaleX - minScaleX) / 100;
         var _loc2_:* = minScaleY + Math.abs(value) * (maxScaleY - minScaleY) / 100;
         var _loc3_:* = minSkew + value * (maxSkewX - minSkew) / 10000;
         var _loc4_:* = minSkew + value * (maxSkewY - minSkew) / 10000;
         var _loc5_:* = posMinX + value * (posMaxX - posMinX) / 100;
         var _loc6_:* = posMinY + value * (posMaxY - posMinY) / 100;
         var _loc7_:* = rotMin + value * (rotMax - rotMin) / 100;
         var _loc8_:* = blurMin + Math.abs(value) * (blurMax - blurMin) / 100;
         this.skewObject(target,_loc1_,_loc2_,_loc5_,_loc6_,_loc3_,_loc4_);
         target.filters = [getBlur(_loc8_)];
      }
   }
}
