package anifire.util
{
   import flash.display.DisplayObject;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class UtilDraw
   {
       
      
      public function UtilDraw()
      {
         super();
      }
      
      public static function dashTo(param1:Sprite, param2:Point, param3:Point, param4:Number = 3, param5:Number = 3) : void
      {
         var _loc6_:Number = param4 + param5;
         var _loc7_:Number = param3.x - param2.x;
         var _loc8_:Number = param3.y - param2.y;
         var _loc9_:Number = Math.sqrt(_loc7_ * _loc7_ + _loc8_ * _loc8_);
         var _loc10_:Number = Math.floor(Math.abs(_loc9_ / _loc6_));
         var _loc11_:Number = Math.atan2(_loc8_,_loc7_);
         var _loc12_:Number = param2.x;
         var _loc13_:Number = param2.y;
         _loc7_ = Math.cos(_loc11_) * _loc6_;
         _loc8_ = Math.sin(_loc11_) * _loc6_;
         var _loc14_:int = 0;
         while(_loc14_ < _loc10_)
         {
            param1.graphics.moveTo(_loc12_,_loc13_);
            param1.graphics.lineTo(_loc12_ + Math.cos(_loc11_) * param4,_loc13_ + Math.sin(_loc11_) * param4);
            _loc12_ = _loc12_ + _loc7_;
            _loc13_ = _loc13_ + _loc8_;
            _loc14_++;
         }
         param1.graphics.moveTo(_loc12_,_loc13_);
         _loc9_ = Math.sqrt((param3.x - _loc12_) * (param3.x - _loc12_) + (param3.y - _loc13_) * (param3.y - _loc13_));
         if(_loc9_ > param4)
         {
            param1.graphics.lineTo(_loc12_ + Math.cos(_loc11_) * param4,_loc13_ + Math.sin(_loc11_) * param4);
         }
         else if(_loc9_ > 0)
         {
            param1.graphics.lineTo(_loc12_ + Math.cos(_loc11_) * _loc9_,_loc13_ + Math.sin(_loc11_) * _loc9_);
         }
         param1.graphics.moveTo(param3.x,param3.y);
      }
      
      public static function drawDashLineWithArrow(param1:Sprite, param2:Point, param3:Point, param4:Number = 3, param5:Number = 3, param6:Number = 15) : void
      {
         var _loc7_:Number = Math.atan2(param2.y - param3.y,param2.x - param3.x);
         var _loc8_:Number = 30 / 180 * Math.PI;
         var _loc9_:Number = param3.y + param6 * Math.sin(_loc7_ + _loc8_);
         var _loc10_:Number = param3.x + param6 * Math.cos(_loc7_ + _loc8_);
         var _loc11_:Number = param3.y + param6 * Math.sin(_loc7_ - _loc8_);
         var _loc12_:Number = param3.x + param6 * Math.cos(_loc7_ - _loc8_);
         dashTo(param1,new Point(_loc10_,_loc9_),param3,param4,param5);
         dashTo(param1,new Point(_loc12_,_loc11_),param3,param4,param5);
         dashTo(param1,param2,param3,param4,param5);
      }
      
      public static function drawDashRect(param1:Sprite, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number = 3, param7:Number = 3) : void
      {
         var _loc8_:Point = new Point(param2,param3);
         var _loc9_:Point = new Point(param2 + param4,param3);
         var _loc10_:Point = new Point(param2 + param4,param3 + param5);
         var _loc11_:Point = new Point(param2,param3 + param5);
         dashTo(param1,_loc8_,_loc9_,param6,param7);
         dashTo(param1,_loc9_,_loc10_,param6,param7);
         dashTo(param1,_loc10_,_loc11_,param6,param7);
         dashTo(param1,_loc11_,_loc8_,param6,param7);
      }
      
      public static function drawPoly(param1:Sprite, param2:Number, param3:Number, param4:Number = 3, param5:Number = 10, param6:Number = 0) : void
      {
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc7_:Number = Math.abs(param4);
         if(_loc7_ > 2)
         {
            _loc8_ = Math.PI * 2 / param4;
            _loc9_ = param6 / 180 * Math.PI;
            param1.graphics.moveTo(param2 + Math.cos(_loc9_) * param5,param3 - Math.sin(_loc9_) * param5);
            _loc10_ = 1;
            while(_loc10_ <= _loc7_)
            {
               _loc11_ = param2 + Math.cos(_loc9_ + _loc8_ * _loc10_) * param5;
               _loc12_ = param3 - Math.sin(_loc9_ + _loc8_ * _loc10_) * param5;
               param1.graphics.lineTo(_loc11_,_loc12_);
               _loc10_++;
            }
         }
      }
      
      public static function duplicateDisplayObject(param1:DisplayObject, param2:Boolean = false) : DisplayObject
      {
         var _loc5_:Rectangle = null;
         var _loc3_:Class = param1["constructor"];
         var _loc4_:DisplayObject = new _loc3_();
         _loc4_.transform = param1.transform;
         _loc4_.filters = param1.filters;
         _loc4_.cacheAsBitmap = param1.cacheAsBitmap;
         _loc4_.opaqueBackground = param1.opaqueBackground;
         if(param1.scale9Grid)
         {
            _loc5_ = param1.scale9Grid;
            _loc5_.x = _loc5_.x / 20;
            _loc5_.y = _loc5_.y / 20;
            _loc5_.width = _loc5_.width / 20;
            _loc5_.height = _loc5_.height / 20;
            _loc4_.scale9Grid = _loc5_;
         }
         if(param2 && param1.parent)
         {
            param1.parent.addChild(_loc4_);
         }
         return _loc4_;
      }
      
      public static function drawCircleSector(param1:Graphics, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         var _loc7_:Point = null;
         var _loc8_:Number = NaN;
         var _loc9_:uint = 0;
         if(param1)
         {
            _loc7_ = new Point();
            _loc8_ = Math.abs(param6 - param5);
            param1.moveTo(param2,param3);
            _loc9_ = param5;
            while(_loc9_ < param5 + _loc8_)
            {
               _loc7_.x = param4 * Math.cos(_loc9_ * Math.PI / 180);
               _loc7_.y = param4 * Math.sin(_loc9_ * Math.PI / 180);
               _loc7_.offset(param2,param3);
               param1.lineTo(_loc7_.x,_loc7_.y);
               _loc9_++;
            }
         }
      }
      
      public static function drawArcFromPoint(param1:Graphics, param2:Point, param3:Point, param4:Number, param5:Boolean = false) : void
      {
         var _loc6_:Point = null;
         var _loc7_:Point = null;
         var _loc8_:Number = NaN;
         var _loc9_:int = 0;
         if(param1)
         {
            _loc6_ = param3.clone();
            _loc7_ = new Point(param3.x - param2.x,param3.y - param2.y);
            _loc8_ = _loc7_.length;
            _loc9_ = 0;
            param1.moveTo(param3.x,param3.y);
            if(param4 > 0)
            {
               _loc9_ = 0;
               while(_loc9_ < param4)
               {
                  _loc6_ = UtilMath.rotatePoint(param3,_loc9_,param2);
                  param1.lineTo(_loc6_.x,_loc6_.y);
                  _loc9_++;
               }
            }
            else if(param4 < 0)
            {
               _loc9_ = 0;
               while(_loc9_ > param4)
               {
                  _loc6_ = UtilMath.rotatePoint(param3,_loc9_,param2);
                  param1.lineTo(_loc6_.x,_loc6_.y);
                  _loc9_--;
               }
            }
            if(param5)
            {
               param1.moveTo(_loc6_.x,_loc6_.y);
            }
         }
      }
   }
}
