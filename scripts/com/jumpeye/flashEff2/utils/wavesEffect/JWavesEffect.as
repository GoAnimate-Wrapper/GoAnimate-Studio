package com.jumpeye.flashEff2.utils.wavesEffect
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.filters.BitmapFilter;
   import flash.filters.BlurFilter;
   import flash.filters.DisplacementMapFilter;
   import flash.geom.Point;
   
   public class JWavesEffect extends Sprite
   {
       
      
      public var intervalId;
      
      private var hig:Number;
      
      private var target;
      
      private var wid;
      
      public var decrInterval:Number;
      
      private var offsetPoints:Array;
      
      public var blurX;
      
      public var blurY;
      
      private var map:Bitmap;
      
      private var blurQuality:Number;
      
      private var __value = 0;
      
      public var baseX;
      
      public var baseY;
      
      public var bitmap:BitmapData;
      
      private var bounds:Object;
      
      public var fractalNoiseVal;
      
      public function JWavesEffect(param1:*, param2:Boolean, param3:Number, param4:Number = 0, param5:Number = 0)
      {
         super();
         blurQuality = param3;
         this.target = param1;
         this.map = new Bitmap();
         this.map.smoothing = param2;
         this.addChild(map);
         this.baseX = baseX || 100;
         this.baseY = baseY || 100;
         this.blurX = blurX || 0;
         this.blurY = blurY || 0;
         this.fractalNoiseVal = fractalNoiseVal || true;
         this.offsetPoints = new Array();
         this.offsetPoints[0] = new Point();
         this.wid = param4 == 0?param1.width:param4;
         this.hig = param5 == 0?Number(param1.height):Number(param5);
         this.wid = this.wid > 2880?2880:this.wid;
         this.hig = this.hig > 2880?Number(2880):Number(this.hig);
         this.bitmap = new BitmapData(this.wid + 2,this.hig + 2,true,0);
      }
      
      public function set value(param1:Number) : void
      {
         __value = param1;
         this.setEffect();
      }
      
      public function get value() : Number
      {
         return __value;
      }
      
      private function initFilters(param1:*) : void
      {
         var _loc2_:* = getDisplacement(param1);
         var _loc3_:* = getBlur(0);
         var _loc4_:Array = [];
         _loc4_.push(_loc2_);
         _loc4_.push(_loc3_);
         target.filters = [_loc2_];
      }
      
      private function getDisplacement(param1:*) : BitmapFilter
      {
         var _loc2_:Point = new Point(0,0);
         var _loc3_:DisplacementMapFilter = new DisplacementMapFilter(this.bitmap,_loc2_,1,1,param1 / 3,param1 / 3,"color");
         return _loc3_;
      }
      
      private function setEffect() : void
      {
         this.initFilters(value);
         var _loc1_:Array = this.target.filters;
         this.offsetPoints[0].x = this.value;
         this.offsetPoints[0].y = this.value;
         this.bitmap.perlinNoise(this.baseX,this.baseY,2,100,true,this.fractalNoiseVal,7,true,this.offsetPoints);
         _loc1_[0].mapBitmap = this.bitmap;
         this.target.filters = _loc1_;
         map.bitmapData = bitmap;
      }
      
      private function getBlur(param1:*) : BitmapFilter
      {
         var _loc2_:Number = param1;
         var _loc3_:Number = param1;
         return new BlurFilter(_loc2_,_loc3_,blurQuality);
      }
   }
}
