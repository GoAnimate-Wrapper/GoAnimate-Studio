package anifire.bubble
{
   import flash.display.DisplayObject;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class GMath
   {
       
      
      public function GMath()
      {
         super();
      }
      
      public static function getRegPoints(param1:Circle, param2:Point) : Object
      {
         var _loc3_:Number = Point.distance(param2,param1.point);
         var _loc4_:Number = Math.atan(param1.r / _loc3_);
         var _loc5_:Number = Math.sqrt(param1.r * param1.r + _loc3_ * _loc3_);
         var _loc6_:Object = iPolar(param1.point,param2);
         var _loc7_:Number = Point.polar(_loc5_,_loc6_.angle - _loc4_).x + param2.x;
         var _loc8_:Number = Point.polar(_loc5_,_loc6_.angle - _loc4_).y + param2.y;
         var _loc9_:Number = Point.polar(_loc5_,_loc6_.angle + _loc4_).x + param2.x;
         var _loc10_:Number = Point.polar(_loc5_,_loc6_.angle + _loc4_).y + param2.y;
         var _loc11_:Point = new Point(_loc7_,_loc8_);
         var _loc12_:Point = new Point(_loc9_,_loc10_);
         var _loc13_:Object = {
            "p1":_loc11_,
            "p2":_loc12_
         };
         return _loc13_;
      }
      
      public static function iPolar(param1:Point, param2:Point = null) : Object
      {
         if(param2 == null)
         {
            param2 = new Point(0,0);
         }
         var _loc3_:Number = Math.atan2(param1.y - param2.y,param1.x - param2.x);
         var _loc4_:Number = Math.sqrt((param1.x - param2.x) * (param1.x - param2.x) + (param1.y - param2.y) * (param1.y - param2.y));
         return {
            "angle":_loc3_,
            "len":_loc4_
         };
      }
      
      public static function rad2Deg(param1:Number) : Number
      {
         return param1 * 360 / (2 * Math.PI);
      }
      
      public static function insideEllipse(param1:Number, param2:Number, param3:Number, param4:Number) : Boolean
      {
         param1 = param1 - param3 / 2;
         param2 = param2 - param4 / 2;
         return Math.pow(param2,2) / Math.pow(param4 / 2,2) + Math.pow(param1,2) / Math.pow(param3 / 2,2) < 1;
      }
      
      public static function insideRect(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : Boolean
      {
         param1 = param1 - param4 / 2;
         param2 = param2 - param5 / 2;
         var _loc6_:Number = 0;
         if(param3 != 0)
         {
            _loc6_ = param3;
         }
         if(param1 > -param4 / 2 + _loc6_ && param1 < param4 / 2 - _loc6_ && param2 > -param5 / 2 + _loc6_ && param2 < param5 / 2 - _loc6_)
         {
            return true;
         }
         return false;
      }
      
      public static function getBubbleBounds(param1:Number, param2:Number, param3:String = "NONE", param4:DisplayObject = null, param5:Number = 0) : Rectangle
      {
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = 5;
         var _loc14_:Number = 0;
         var _loc15_:Number = 0;
         _loc6_ = param2 / param1;
         _loc7_ = _loc15_ - _loc6_ * _loc14_;
         _loc8_ = Math.sqrt(Math.pow(param2,2) + Math.pow(param1,2));
         _loc10_ = _loc14_;
         _loc9_ = _loc15_;
         var _loc16_:Point = new Point();
         var _loc17_:Rectangle = new Rectangle();
         var _loc18_:Number = 1;
         while(_loc18_ < _loc8_)
         {
            if((param3 == BubbleMgr.CLOUD || param3 == BubbleMgr.HEART) && insideEllipse(_loc10_,_loc9_,param1,param2))
            {
               _loc17_.x = _loc10_;
               _loc17_.y = _loc9_;
               break;
            }
            if(param3 == BubbleMgr.BOOM)
            {
               param5 = Math.min(param1 / _loc13_,param2 / _loc13_,80);
               if(insideRect(_loc10_,_loc9_,param5,param1,param2))
               {
                  _loc17_.x = _loc10_;
                  _loc17_.y = _loc9_;
                  break;
               }
            }
            else
            {
               if(param3 == BubbleMgr.ELLIPSE && insideEllipse(_loc10_,_loc9_,param1,param2))
               {
                  _loc17_.x = _loc10_;
                  _loc17_.y = _loc9_;
                  break;
               }
               if(param3 == BubbleMgr.RECTANGULAR && insideRect(_loc10_,_loc9_,0,param1,param2))
               {
                  _loc17_.x = _loc10_;
                  _loc17_.y = _loc9_;
                  break;
               }
               if(param3 == BubbleMgr.ROUNDRECTANGULAR && insideRect(_loc10_,_loc9_,2,param1,param2))
               {
                  _loc17_.x = _loc10_;
                  _loc17_.y = _loc9_;
                  break;
               }
            }
            _loc10_ = _loc10_ + 1;
            _loc9_ = _loc6_ * _loc10_ + _loc7_;
            if(_loc18_ + 1 >= _loc8_)
            {
               _loc17_.x = 0;
               _loc17_.y = 0;
            }
            _loc18_++;
         }
         _loc12_ = _loc14_ + param1;
         _loc11_ = _loc15_;
         _loc10_ = _loc14_;
         _loc9_ = _loc15_ + param2;
         var _loc19_:Number = _loc10_ - _loc12_;
         var _loc20_:Number = _loc9_ - _loc11_;
         _loc6_ = _loc20_ / _loc19_;
         _loc7_ = _loc11_ - _loc6_ * _loc12_;
         _loc8_ = Math.sqrt(Math.pow(_loc20_,2) + Math.pow(_loc19_,2));
         _loc18_ = 1;
         while(_loc18_ < _loc8_)
         {
            if((param3 == BubbleMgr.CLOUD || param3 == BubbleMgr.HEART) && insideEllipse(_loc12_,_loc11_,param1,param2))
            {
               _loc17_.width = _loc12_ - _loc17_.x;
               _loc17_.height = param2 - _loc17_.y * 1.5;
               break;
            }
            if(param3 == BubbleMgr.BOOM)
            {
               param5 = Math.min(param1 / _loc13_,param2 / _loc13_,80);
               if(insideRect(_loc12_,_loc11_,param5,param1,param2))
               {
                  _loc17_.width = _loc12_ - _loc17_.x;
                  _loc17_.height = param2 - _loc17_.y * 2;
                  break;
               }
            }
            else
            {
               if(param3 == BubbleMgr.ELLIPSE && insideEllipse(_loc12_,_loc11_,param1,param2))
               {
                  _loc17_.width = _loc12_ - _loc17_.x;
                  _loc17_.height = param2 - _loc17_.y;
                  break;
               }
               if(param3 == BubbleMgr.RECTANGULAR && insideRect(_loc12_,_loc11_,0,param1,param2))
               {
                  _loc17_.width = _loc12_ - _loc17_.x;
                  _loc17_.height = param2 - _loc17_.y;
                  break;
               }
               if(param3 == BubbleMgr.ROUNDRECTANGULAR && insideRect(_loc12_,_loc11_,2,param1,param2))
               {
                  _loc17_.width = _loc12_ - _loc17_.x;
                  _loc17_.height = param2 - _loc17_.y;
                  break;
               }
            }
            _loc12_--;
            _loc11_ = _loc6_ * _loc12_ + _loc7_;
            _loc18_++;
         }
         return _loc17_;
      }
   }
}
