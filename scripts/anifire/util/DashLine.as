package anifire.util
{
   import flash.display.Graphics;
   import flash.geom.Point;
   
   public class DashLine
   {
       
      
      public var graphics:Graphics;
      
      public var dashsize:Number;
      
      public var spacesize:Number;
      
      private var blocksize:Number;
      
      private var px:Number;
      
      private var py:Number;
      
      private var draw_start:Number;
      
      public function DashLine(param1:Graphics, param2:Number, param3:Number)
      {
         super();
         this.graphics = param1;
         this.dashsize = param2;
         this.spacesize = param3;
         this.blocksize = this.dashsize + this.spacesize;
         this.px = this.py = 0;
         this.draw_start = 0;
      }
      
      public function moveTo(param1:Number, param2:Number, param3:Number = 0) : void
      {
         this.graphics.moveTo(param1,param2);
         this.px = param1;
         this.py = param2;
         this.draw_start = param3 % this.blocksize;
         if(this.draw_start <= -this.dashsize)
         {
            this.draw_start = this.draw_start + this.blocksize;
         }
      }
      
      public function lineTo(param1:Number, param2:Number) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc3_:Point = new Point(param1 - this.px,param2 - this.py);
         var _loc4_:Number = _loc3_.length;
         if(this.draw_start >= _loc4_)
         {
            this.draw_start = this.draw_start - _loc4_;
         }
         else if(this.draw_start < 0 && this.dashsize + this.draw_start > _loc4_)
         {
            this.graphics.lineTo(param1,param2);
            this.draw_start = this.draw_start - _loc4_;
         }
         else
         {
            _loc3_.normalize(1);
            _loc5_ = this.dashsize * _loc3_.x;
            _loc6_ = this.dashsize * _loc3_.y;
            if(this.draw_start < 0)
            {
               _loc7_ = this.dashsize + this.draw_start;
               this.graphics.lineTo(this.px + _loc7_ * _loc3_.x,this.py + _loc7_ * _loc3_.y);
               this.draw_start = this.draw_start + this.blocksize;
            }
            if(this.draw_start < _loc4_)
            {
               _loc10_ = this.draw_start;
               _loc11_ = _loc4_ - this.blocksize;
               _loc10_ = this.draw_start;
               while(_loc10_ < _loc11_)
               {
                  _loc8_ = this.px + _loc10_ * _loc3_.x;
                  _loc9_ = this.py + _loc10_ * _loc3_.y;
                  this.graphics.moveTo(_loc8_,_loc9_);
                  this.graphics.lineTo(_loc8_ + _loc5_,_loc9_ + _loc6_);
                  _loc10_ = _loc10_ + this.blocksize;
               }
               _loc8_ = this.px + _loc10_ * _loc3_.x;
               _loc9_ = this.py + _loc10_ * _loc3_.y;
               _loc12_ = _loc4_ - _loc10_;
               if(_loc12_ > this.dashsize)
               {
                  this.draw_start = this.blocksize - _loc12_;
                  _loc12_ = this.dashsize;
               }
               else
               {
                  this.draw_start = -_loc12_;
               }
               this.graphics.moveTo(_loc8_,_loc9_);
               this.graphics.lineTo(_loc8_ + _loc12_ * _loc3_.x,_loc9_ + _loc12_ * _loc3_.y);
            }
            else
            {
               this.draw_start = this.draw_start - _loc4_;
            }
         }
         this.px = param1;
         this.py = param2;
      }
      
      public function curveTo(param1:Number, param2:Number, param3:Number, param4:Number) : void
      {
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Point = null;
         var _loc5_:Bezje2D = new Bezje2D(new Point(this.px,this.py),new Point(param3,param4),new Point(param1,param2));
         var _loc6_:Number = _loc5_.length;
         if(this.draw_start >= _loc6_)
         {
            this.draw_start = this.draw_start - _loc6_;
         }
         else if(this.draw_start < 0 && this.dashsize + this.draw_start > _loc6_)
         {
            this.graphics.curveTo(param1,param2,param3,param4);
            this.draw_start = this.draw_start - _loc6_;
         }
         else
         {
            if(this.draw_start < 0)
            {
               _loc7_ = this.dashsize + this.draw_start;
               _loc8_ = _loc5_.length2T(_loc7_,0.1);
               this.drawSegmentCurve(new Point(this.px,this.py),_loc5_.f(_loc8_),_loc5_.diff(0),_loc5_.diff(_loc8_));
               this.draw_start = this.draw_start + this.blocksize;
            }
            if(this.draw_start < _loc6_)
            {
               _loc9_ = this.draw_start;
               _loc10_ = _loc6_ - this.blocksize;
               _loc9_ = this.draw_start;
               while(_loc9_ < _loc10_)
               {
                  this.drawCurve(_loc5_,_loc9_,_loc9_ + this.dashsize);
                  _loc9_ = _loc9_ + this.blocksize;
               }
               _loc11_ = _loc6_ - _loc9_;
               if(_loc11_ > this.dashsize)
               {
                  this.draw_start = this.blocksize - _loc11_;
                  this.drawCurve(_loc5_,_loc9_,_loc9_ + this.dashsize);
               }
               else
               {
                  _loc12_ = _loc5_.length2T(_loc9_,0.1);
                  _loc13_ = _loc5_.f(_loc12_);
                  this.graphics.moveTo(_loc13_.x,_loc13_.y);
                  this.drawSegmentCurve(_loc13_,new Point(param3,param4),_loc5_.diff(_loc12_),_loc5_.diff(1));
                  this.draw_start = -_loc11_;
               }
            }
            else
            {
               this.draw_start = this.draw_start - _loc6_;
            }
         }
         this.px = param3;
         this.py = param4;
      }
      
      private function drawCurve(param1:Bezje2D, param2:Number, param3:Number) : void
      {
         var _loc4_:Number = param1.length2T(param2,0.1);
         var _loc5_:Number = param1.length2T(param3,0.1);
         var _loc6_:Point = param1.f(_loc4_);
         this.graphics.moveTo(_loc6_.x,_loc6_.y);
         this.drawSegmentCurve(_loc6_,param1.f(_loc5_),param1.diff(_loc4_),param1.diff(_loc5_));
      }
      
      private function drawSegmentCurve(param1:Point, param2:Point, param3:Point, param4:Point) : void
      {
         var _loc7_:Number = NaN;
         var _loc5_:Number = param2.x - param1.x;
         var _loc6_:Number = param2.y - param1.y;
         if(_loc5_ != 0)
         {
            _loc7_ = _loc5_ / (param4.x + param3.x);
            this.graphics.curveTo(param1.x + _loc7_ * param3.x,param1.y + _loc7_ * param3.y,param2.x,param2.y);
         }
         else if(_loc6_ != 0)
         {
            _loc7_ = _loc6_ / (param4.y + param3.y);
            this.graphics.curveTo(param1.x + _loc7_ * param3.x,param1.y + _loc7_ * param3.y,param2.x,param2.y);
         }
      }
   }
}
