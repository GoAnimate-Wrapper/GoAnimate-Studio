package com.jumpeye.effects
{
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   
   public class JSwapMap extends Sprite
   {
       
      
      private var hig:Number;
      
      private var bckRed;
      
      private var bckGrey;
      
      private var wid;
      
      private var bckGreyC:Shape;
      
      private var map:Sprite;
      
      public function JSwapMap(param1:Number = 100, param2:Number = 100)
      {
         super();
         this.wid = param1;
         this.hig = param2;
         this.createChildren();
      }
      
      public function colorGradient(param1:Shape, param2:*, param3:*, param4:*, param5:*, param6:*, param7:*, param8:*, param9:*, param10:*) : *
      {
         param1.graphics.clear();
         var _loc11_:String = param4;
         var _loc12_:Array = param5;
         var _loc13_:Array = param6;
         var _loc14_:Array = param7;
         var _loc15_:Matrix = new Matrix();
         _loc15_.createGradientBox(param2,param3,param8,param9,param10);
         var _loc16_:String = "pad";
         param1.graphics.beginGradientFill(_loc11_,_loc12_,_loc13_,_loc14_,_loc15_,_loc16_);
      }
      
      private function createChildren() : *
      {
         map = new Sprite();
         this.addChild(map);
         var _loc1_:* = "linear";
         var _loc2_:* = [8421504,255];
         var _loc3_:* = [1,1];
         var _loc4_:* = [0,255];
         bckRed = new Shape();
         this.colorGradient(bckRed,wid,hig,"linear",_loc2_,_loc3_,_loc4_,-45 / 180 * Math.PI,0,0);
         bckRed.graphics.drawRect(0,0,wid,hig);
         map.addChild(bckRed);
         var _loc5_:* = "linear";
         var _loc6_:* = [8421504,8421504];
         var _loc7_:* = [1,0];
         var _loc8_:* = [0,255];
         bckGrey = new Shape();
         this.colorGradient(bckGrey,wid,hig,"linear",_loc6_,_loc7_,_loc8_,0,0,0);
         bckGrey.graphics.drawRect(0,0,wid,hig);
         map.addChild(bckGrey);
         var _loc9_:* = "linear";
         var _loc10_:* = [8421504,8421504];
         var _loc11_:* = [1,0];
         var _loc12_:* = [0,255];
         bckGreyC = new Shape();
         this.colorGradient(bckGreyC,wid,hig,"linear",_loc10_,_loc11_,_loc12_,-45 / 180 * Math.PI,0,0);
         bckGreyC.graphics.drawRect(0,0,wid,hig);
      }
   }
}
