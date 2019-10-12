package com.jumpeye.effects
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.filters.BitmapFilter;
   import flash.filters.DisplacementMapFilter;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public dynamic class JColorMap extends Sprite
   {
       
      
      private var col:uint;
      
      private var hig;
      
      private var bck:Shape;
      
      public var dissolveType:String;
      
      private var wid;
      
      private var map:Sprite;
      
      private var baseX;
      
      private var baseY:Number;
      
      private var blackAndWhite:Array;
      
      private var baseColArr;
      
      public function JColorMap(param1:*, param2:Number = 100, param3:Number = 100, param4:Number = 7, param5:Number = 7)
      {
         super();
         this.wid = param2;
         this.hig = param3;
         baseColArr = ["red","blue","green"];
         blackAndWhite = [0,16777215];
         this.dissolveType = param1;
         this.baseX = param4;
         this.baseY = param5;
         this.createChildren();
      }
      
      private function makePix(param1:*, param2:*, param3:*, param4:*, param5:*, param6:*) : Shape
      {
         var _loc7_:* = new Shape();
         colorGradient(_loc7_,param1,param1,"radial",param2,param3,param4,Math.PI / 2,wid,hig);
         _loc7_.graphics.drawCircle(0,0,param1);
         _loc7_.graphics.endFill();
         _loc7_.x = param5 + param1;
         _loc7_.y = param6 + param1;
         return _loc7_;
      }
      
      private function getDistort(param1:*, param2:*) : BitmapFilter
      {
         var _loc3_:* = new BitmapData(param2.width,param2.height);
         _loc3_.perlinNoise(param2.width,param2.height,10,Math.round(Math.random() * 100),false,true,1,true);
         var _loc4_:* = new DisplacementMapFilter(_loc3_,new Point(0,0),1,1,param1,param1,"color");
         return _loc4_;
      }
      
      private function createChildren() : *
      {
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         var _loc9_:BitmapData = null;
         var _loc10_:Bitmap = null;
         var _loc11_:Number = NaN;
         var _loc1_:* = Math.min(wid / 2,hig / 2);
         var _loc2_:* = 3;
         var _loc3_:* = 255 / _loc2_;
         var _loc4_:* = 3;
         map = new Sprite();
         if(dissolveType == "radial")
         {
            _loc5_ = [16777215,0];
            _loc6_ = [1,1];
            _loc7_ = [0,255];
            _loc8_ = new Shape();
            colorGradient(_loc8_,wid * _loc4_,hig * _loc4_,"radial",_loc5_,_loc6_,_loc7_,Math.PI / 2,wid * _loc4_,hig * _loc4_);
            _loc8_.graphics.drawRect(0,0,wid * _loc4_,hig * _loc4_);
            _loc8_.graphics.endFill();
            _loc8_.filters = [getDistort(250,_loc8_)];
            _loc8_.x = wid / 2 - _loc8_.width / 2;
            _loc8_.y = hig / 2 - _loc8_.height / 2;
            map.addChild(_loc8_);
         }
         else
         {
            _loc9_ = new BitmapData(wid,hig,false,13421772);
            _loc10_ = new Bitmap(_loc9_);
            _loc11_ = Math.floor(Math.random() * 10);
            _loc9_.perlinNoise(wid / baseX,hig / baseY,10,_loc11_,false,true,1,true,null);
            map.addChild(_loc10_);
         }
         this.addChild(map);
      }
      
      private function randomColor(param1:String, param2:Number) : Number
      {
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:Number = NaN;
         var _loc3_:* = Math.floor(Math.random() * 16777215);
         switch(param1)
         {
            case "red":
               _loc4_ = ((_loc3_ & 16711680) >> 16) + param2;
               _loc4_ = _loc4_ >= 255?255:_loc4_;
               break;
            case "green":
               _loc5_ = ((_loc3_ & 65280) >> 8) + param2;
               _loc5_ = _loc5_ >= 255?255:_loc5_;
               break;
            case "blue":
               _loc6_ = (_loc3_ & 255) + param2;
               _loc6_ = _loc6_ >= 255?Number(255):Number(_loc6_);
               break;
            case undefined:
               _loc4_ = (_loc3_ & 16711680) >> 16;
               _loc5_ = (_loc3_ & 65280) >> 8;
               _loc6_ = _loc3_ & 255;
         }
         var _loc7_:* = _loc4_ << 16 | _loc5_ << 8 | _loc6_;
         return _loc7_;
      }
      
      private function rand(param1:Number, param2:Number) : Number
      {
         var _loc3_:Number = Math.floor(Math.random() * (param2 - param1 + 1)) + param1;
         return _loc3_;
      }
      
      public function colorGradient(param1:Shape, param2:*, param3:*, param4:*, param5:*, param6:*, param7:*, param8:*, param9:*, param10:*) : *
      {
         param1.graphics.clear();
         var _loc11_:String = param4;
         var _loc12_:Array = param5;
         var _loc13_:Array = param6;
         var _loc14_:Array = param7;
         var _loc15_:Matrix = new Matrix();
         _loc15_.createGradientBox(param2,param3,param8,param9 / 2 - param2 / 2,param10 / 2 - param3 / 2);
         var _loc16_:String = "pad";
         param1.graphics.beginGradientFill(_loc11_,_loc12_,_loc13_,_loc14_,_loc15_,_loc16_);
      }
   }
}
