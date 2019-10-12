package com.jumpeye.utils
{
   import flash.display.Shape;
   import flash.display.Sprite;
   
   public class JLineMask extends Sprite
   {
       
      
      private var msk:Sprite;
      
      private var hig:Number;
      
      private var orientation:String;
      
      private var __value = 0;
      
      private var wid;
      
      private var dimD:Number;
      
      private var isCenter:Boolean = false;
      
      public function JLineMask(param1:Number = 100, param2:Number = 100, param3:String = "left", param4:Boolean = false)
      {
         super();
         this.wid = param1;
         this.hig = param2;
         this.isCenter = param4;
         this.orientation = param3;
         this.msk = new Sprite();
         var _loc5_:* = new Shape();
         _loc5_.graphics.beginFill(3368601,0.4);
         var _loc6_:* = param3 == "left" || param3 == "right"?1:param1;
         var _loc7_:* = param3 == "top" || param3 == "bottom"?1:param2;
         _loc5_.graphics.drawRect(0,0,_loc6_,_loc7_);
         _loc5_.graphics.endFill();
         msk.addChild(_loc5_);
         this.addChild(msk);
         value = 0;
      }
      
      public function set value(param1:Number) : void
      {
         __value = param1;
         this.setRedraw();
      }
      
      public function get value() : Number
      {
         return __value;
      }
      
      private function setRedraw() : void
      {
         var _loc1_:* = orientation == "left" || orientation == "right"?"width":"height";
         dimD = orientation == "left" || orientation == "right"?Number(wid):Number(hig);
         msk[_loc1_] = this.value;
         this.arrange();
      }
      
      private function arrange() : void
      {
         var _loc1_:* = orientation == "left" || orientation == "right"?"x":"y";
         var _loc2_:* = orientation == "left" || orientation == "right"?"width":"height";
         var _loc3_:* = orientation == "left" || orientation == "right"?wid:hig;
         if(!isCenter)
         {
            msk[_loc1_] = orientation == "right" || orientation == "bottom"?dimD - msk[_loc2_]:0;
         }
         else
         {
            msk[_loc1_] = orientation == "right" || orientation == "bottom"?dimD / 2 - msk[_loc2_] / 2:0;
         }
      }
   }
}
