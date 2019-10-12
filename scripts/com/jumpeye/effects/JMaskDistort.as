package com.jumpeye.effects
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.filters.BitmapFilter;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.BlurFilter;
   import flash.filters.GradientGlowFilter;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public dynamic class JMaskDistort extends Sprite
   {
       
      
      private var bit1;
      
      private var bit2;
      
      private var hig;
      
      private var isLoaded:Boolean;
      
      private var __value = 0;
      
      private var wid;
      
      private var map1;
      
      private var map2:JColorMap;
      
      public var dissolveType:String;
      
      private var invBit:BitmapData;
      
      public var clip1;
      
      public var clip2;
      
      private var baseX;
      
      private var baseY:Number;
      
      public var invMc:Bitmap;
      
      private var bit1Clone;
      
      public var type;
      
      public function JMaskDistort(param1:*, param2:*, param3:Number = 100, param4:Number = 100, param5:Number = 7, param6:Number = 7, param7:Object = null)
      {
         super();
         this.wid = param3;
         this.hig = param4;
         this.type = param1;
         this.dissolveType = param2;
         this.baseX = param5;
         this.baseY = param6;
         this.createChildren(param7);
      }
      
      public function get value() : Number
      {
         return __value;
      }
      
      private function getGlow(param1:*) : BitmapFilter
      {
         var _loc2_:Number = 0;
         var _loc3_:* = 16777215;
         var _loc4_:Number = 0;
         var _loc5_:Array = [_loc3_,_loc3_];
         var _loc6_:Array = [0,1];
         var _loc7_:Array = [0,256];
         var _loc8_:Number = param1;
         var _loc9_:Number = param1;
         var _loc10_:Number = param1 / 5;
         var _loc11_:Number = 3;
         var _loc12_:String = "full";
         var _loc13_:Boolean = false;
         return new GradientGlowFilter(_loc2_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_,_loc13_);
      }
      
      private function invertBitmap(param1:*) : *
      {
         var _loc2_:* = bit1Clone.compare(param1);
         if(_loc2_ != 0)
         {
            invBit = bit1Clone.compare(param1);
            invMc.bitmapData = invBit;
         }
      }
      
      private function setEffect() : void
      {
         this.getDistort(value);
      }
      
      public function cleanAll() : void
      {
         if(this.contains(map1))
         {
            this.removeChild(map1);
         }
         if(this.contains(map2))
         {
            this.removeChild(map2);
         }
         if(invMc)
         {
            if(this.contains(invMc))
            {
               this.removeChild(invMc);
            }
         }
         if(bit1)
         {
            bit1.dispose();
         }
         if(bit2)
         {
            bit2.dispose();
         }
         if(bit1Clone)
         {
            bit1Clone.dispose();
         }
         if(invBit)
         {
            invBit.dispose();
         }
      }
      
      private function createChildren(param1:*) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         map1 = new JColorMap(dissolveType,this.wid,this.hig,baseX,baseY);
         this.addChild(map1);
         map1.visible = false;
         map2 = new JColorMap(dissolveType,this.wid,this.hig,baseX,baseY);
         this.addChild(map2);
         map2.visible = false;
         bit2 = getBitmap(map2);
         clip2 = new Bitmap(bit2);
         this.addChild(clip2);
         clip2.cacheAsBitmap = true;
         bit1 = getBitmap(map1);
         bit1Clone = bit1.clone();
         clip1 = new Bitmap(bit1);
         this.addChild(clip1);
         clip1.cacheAsBitmap = true;
         clip1.visible = type != "show";
         clip2.visible = false;
         invMc = new Bitmap();
         this.addChild(invMc);
         invMc.cacheAsBitmap = true;
         invMc.visible = type == "show";
         if(param1)
         {
            if(param1.blur)
            {
               _loc2_ = param1.blurX || 10;
               _loc3_ = param1.blurY || 10;
               if(type == "show")
               {
                  invMc.filters = [getGlow(10)];
               }
               else
               {
                  clip1.filters = [getGlow(10)];
               }
            }
         }
         isLoaded = true;
      }
      
      private function getDistort(param1:*) : *
      {
         bit1.threshold(bit2,new Rectangle(0,0,bit2.width,bit2.height),new Point(0,0),">=",param1 / 100 * 16777215,16777215,16777215,false);
         if(type == "show")
         {
            this.invertBitmap(bit1);
         }
         if(value == 0)
         {
            clip1.filters = [];
            invMc.filters = [];
         }
      }
      
      public function set value(param1:Number) : void
      {
         __value = param1;
         if(param1 < 100 && param1 > 0)
         {
            this.setEffect();
         }
      }
      
      private function getBlur(param1:*, param2:*) : BitmapFilter
      {
         return new BlurFilter(param1,param2,BitmapFilterQuality.HIGH);
      }
      
      private function getBitmap(param1:*) : BitmapData
      {
         var _loc2_:* = new BitmapData(param1.width,param1.height,true,0);
         var _loc3_:* = new Matrix();
         _loc2_.draw(param1,_loc3_);
         return _loc2_;
      }
   }
}
