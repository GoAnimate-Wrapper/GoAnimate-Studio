package com.jumpeye.flashEff2.text.fe3D.objects
{
   import flash.display.DisplayObject;
   import flash.filters.BitmapFilter;
   import flash.filters.BlurFilter;
   
   public class JFE3DObject
   {
       
      
      private var intialW:Number;
      
      private var firstChild:DisplayObject;
      
      private var __x:Number;
      
      private var __y:Number;
      
      private var __z:Number;
      
      private var __corners:Array;
      
      private var __content;
      
      private var intialH:Number;
      
      public function JFE3DObject(param1:*)
      {
         super();
         this.content = param1;
         if(this.content != null)
         {
            this.intialW = this.content.width;
            this.intialH = this.content.height;
            this.x = this.content.x;
            this.y = this.content.y;
         }
      }
      
      public function get y() : Number
      {
         return this.__y;
      }
      
      public function applyBlur(param1:Number, param2:Number = 1) : *
      {
         var _loc4_:Array = null;
         var _loc3_:BitmapFilter = new BlurFilter(param1,param1,param2);
         if(param1 > 0)
         {
            _loc4_ = new Array();
            _loc4_.push(_loc3_);
            this.content.filters = _loc4_;
         }
         else
         {
            this.content.filters = [];
         }
      }
      
      public function get content() : *
      {
         return this.__content;
      }
      
      public function set content(param1:*) : void
      {
         if(param1 != null)
         {
            this.__content = param1;
            this.firstChild = this.__content.getChildAt(0);
         }
      }
      
      private function distance(param1:Number, param2:Number) : Number
      {
         return Math.sqrt(param1 * param1 + param2 * param2);
      }
      
      public function set x(param1:Number) : void
      {
         this.__x = param1;
      }
      
      public function get x() : Number
      {
         return this.__x;
      }
      
      public function set y(param1:Number) : void
      {
         this.__y = param1;
      }
      
      public function get z() : Number
      {
         return this.__z;
      }
      
      public function set z(param1:Number) : void
      {
         this.__z = param1;
      }
      
      public function set corners(param1:Array) : void
      {
         this.__corners = param1;
      }
      
      public function get corners() : Array
      {
         return this.__corners;
      }
      
      public function updateContent(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : *
      {
         var _loc7_:* = this.intialW;
         var _loc8_:* = this.intialH;
         this.content.scaleY = 1;
         var _loc9_:* = Math.atan2(param6 - param2,param5 - param1);
         var _loc10_:* = Math.atan2(param4 - param2,param3 - param1);
         var _loc11_:* = (_loc10_ - _loc9_) / 2;
         var _loc12_:* = Math.SQRT1_2 / Math.cos(_loc11_);
         this.content.rotation = 180 / Math.PI * (_loc10_ - _loc11_);
         this.firstChild.rotation = -45;
         this.content.scaleY = Math.tan(_loc11_);
         var _loc13_:* = this.firstChild.scaleX;
         var _loc14_:* = this.firstChild.scaleY;
         this.firstChild.scaleX = distance(param2 - param6,param1 - param5) / _loc12_ / _loc7_;
         this.firstChild.scaleY = distance(param2 - param4,param1 - param3) / _loc12_ / _loc8_;
         this.content.x = param1;
         this.content.y = param2;
      }
   }
}
