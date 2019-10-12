package com.jumpeye.flashEff2.utils.distort
{
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   
   public class JDistortImage
   {
       
      
      private var _yMax:Number;
      
      private var _hsLen:Number;
      
      private var _hseg:Number;
      
      private var _vsLen:Number;
      
      public var texture:BitmapData;
      
      private var _xMin:Number;
      
      private var _h:Number;
      
      private var _xMax:Number;
      
      private var _tri:Array;
      
      public var smooth:Boolean = false;
      
      private var _p:Array;
      
      private var _aMcs:Array;
      
      private var _mc:Sprite;
      
      private var _w:Number;
      
      private var _vseg:Number;
      
      private var _yMin:Number;
      
      public function JDistortImage(param1:Sprite, param2:*, param3:Number, param4:Number)
      {
         super();
         _mc = param1;
         texture = param2;
         _vseg = param3;
         _hseg = param4;
         _w = texture.width;
         _h = texture.height;
         _aMcs = new Array();
         _p = new Array();
         _tri = new Array();
         init();
      }
      
      public function setTransform(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number) : void
      {
         var _loc16_:Object = null;
         var _loc17_:* = undefined;
         var _loc18_:* = undefined;
         var _loc19_:* = undefined;
         var _loc20_:* = undefined;
         var _loc9_:Number = _w;
         var _loc10_:Number = _h;
         var _loc11_:Number = param7 - param1;
         var _loc12_:Number = param8 - param2;
         var _loc13_:Number = param5 - param3;
         var _loc14_:Number = param6 - param4;
         var _loc15_:Number = _p.length;
         while(--_loc15_ > -1)
         {
            _loc16_ = _p[_loc15_];
            _loc17_ = (_loc16_.x - _xMin) / _loc9_;
            _loc18_ = (_loc16_.y - _yMin) / _loc10_;
            _loc19_ = param1 + _loc18_ * _loc11_;
            _loc20_ = param2 + _loc18_ * _loc12_;
            _loc16_.sx = _loc19_ + _loc17_ * (param3 + _loc18_ * _loc13_ - _loc19_);
            _loc16_.sy = _loc20_ + _loc17_ * (param4 + _loc18_ * _loc14_ - _loc20_);
         }
         render();
      }
      
      private function addTriangle(param1:Object, param2:Object, param3:Object) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Object = {};
         _loc4_ = param1.x;
         _loc5_ = param1.y;
         _loc6_ = param2.x;
         _loc7_ = param2.y;
         _loc8_ = param3.x;
         _loc9_ = param3.y;
         _loc10_.tx = -_loc5_ * (_w / (_loc7_ - _loc5_));
         _loc10_.ty = -_loc4_ * (_h / (_loc8_ - _loc4_));
         _loc10_.a = _loc10_.d = 0;
         _loc10_.b = _h / (_loc8_ - _loc4_);
         _loc10_.c = _w / (_loc7_ - _loc5_);
         _tri.push([param1,param2,param3,_loc10_]);
      }
      
      private function init() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Object = null;
         var _loc8_:Object = null;
         var _loc9_:Object = null;
         _p = new Array();
         _tri = new Array();
         var _loc3_:Number = _w / 2;
         var _loc4_:Number = _h / 2;
         _xMin = _yMin = 0;
         _xMax = _w;
         _yMax = _h;
         _hsLen = _w / (_hseg + 1);
         _vsLen = _h / (_vseg + 1);
         _loc1_ = 0;
         while(_loc1_ < _hseg + 2)
         {
            _loc2_ = 0;
            while(_loc2_ < _vseg + 2)
            {
               _loc5_ = _loc1_ * _hsLen;
               _loc6_ = _loc2_ * _vsLen;
               _p.push({
                  "x":_loc5_,
                  "y":_loc6_,
                  "sx":_loc5_,
                  "sy":_loc6_
               });
               _loc2_++;
            }
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < _vseg + 1)
         {
            _loc2_ = 0;
            while(_loc2_ < _hseg + 1)
            {
               _loc7_ = _p[_loc2_ + _loc1_ * (_hseg + 2)];
               _loc8_ = _p[_loc2_ + _loc1_ * (_hseg + 2) + 1];
               _loc9_ = _p[_loc2_ + (_loc1_ + 1) * (_hseg + 2)];
               addTriangle(_loc7_,_loc8_,_loc9_);
               _loc7_ = _p[_loc2_ + (_loc1_ + 1) * (_vseg + 2) + 1];
               _loc8_ = _p[_loc2_ + (_loc1_ + 1) * (_vseg + 2)];
               _loc9_ = _p[_loc2_ + _loc1_ * (_vseg + 2) + 1];
               addTriangle(_loc7_,_loc8_,_loc9_);
               _loc2_++;
            }
            _loc1_++;
         }
         render();
      }
      
      private function concat(param1:*, param2:*) : Object
      {
         var _loc3_:Matrix = new Matrix();
         _loc3_.a = param1.c * param2.b;
         _loc3_.b = param1.d * param2.b;
         _loc3_.c = param1.a * param2.c;
         _loc3_.d = param1.b * param2.c;
         _loc3_.tx = param1.a * param2.tx + param1.c * param2.ty + param1.tx;
         _loc3_.ty = param1.b * param2.tx + param1.d * param2.ty + param1.ty;
         return _loc3_;
      }
      
      private function render() : void
      {
         var _loc1_:Array = null;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:Object = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc10_:Array = null;
         var _loc7_:Number = 1 / _h;
         var _loc8_:Number = 1 / _w;
         var _loc9_:Sprite = _mc;
         _loc9_.graphics.clear();
         var _loc11_:* = new Matrix();
         var _loc12_:* = {};
         var _loc13_:Number = _tri.length;
         while(--_loc13_ > -1)
         {
            _loc10_ = _tri[_loc13_];
            _loc2_ = _loc10_[0];
            _loc3_ = _loc10_[1];
            _loc4_ = _loc10_[2];
            _loc12_ = _loc10_[3];
            _loc11_.a = (_loc3_.sx - (_loc5_ = _loc2_.sx)) * _loc8_;
            _loc11_.b = (_loc3_.sy - (_loc6_ = _loc2_.sy)) * _loc8_;
            _loc11_.c = (_loc4_.sx - _loc5_) * _loc7_;
            _loc11_.d = (_loc4_.sy - _loc6_) * _loc7_;
            _loc11_.tx = _loc5_;
            _loc11_.ty = _loc6_;
            _loc11_ = this.concat(_loc11_,_loc12_);
            _loc9_.graphics.beginBitmapFill(texture,_loc11_,false,this.smooth);
            _loc9_.graphics.moveTo(_loc5_,_loc6_);
            _loc9_.graphics.lineTo(_loc3_.sx,_loc3_.sy);
            _loc9_.graphics.lineTo(_loc4_.sx,_loc4_.sy);
            _loc9_.graphics.endFill();
         }
      }
   }
}
