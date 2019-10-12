package anifire.studio.core
{
   import Singularity.Geom.BezierSpline;
   import anifire.assets.motion.BezierSplineController;
   import anifire.interfaces.IXmlConvertable;
   import anifire.util.UtilMath;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.geom.Point;
   
   public class MotionData extends EventDispatcher implements IXmlConvertable
   {
      
      public static const XML_TAG_NAME:String = "assetMotion";
       
      
      private const VERSION_NONLINEAR_SPEED:String = "1";
      
      private const VERSION_CONSTANT_SPEED:String = "2";
      
      private var _interPoints:Vector.<Point>;
      
      private var _startPoint:Point;
      
      private var _endPoint:Point;
      
      private var _startRotation:Number = 0;
      
      private var _endRotation:Number = 0;
      
      private var _maxInterPointNum:uint = 99;
      
      private var _pathOriented:Boolean = false;
      
      private var _version:String = "2";
      
      private var _splineController:BezierSplineController;
      
      private var _motionFace:Number;
      
      private var _assetFace:Number;
      
      public function MotionData()
      {
         this._interPoints = new Vector.<Point>();
         this._startPoint = new Point();
         this._endPoint = new Point();
         super();
      }
      
      public function get assetFace() : Number
      {
         return this._assetFace;
      }
      
      public function set assetFace(param1:Number) : void
      {
         this._assetFace = param1;
      }
      
      public function get motionFace() : Number
      {
         return this._motionFace;
      }
      
      public function set motionFace(param1:Number) : void
      {
         this._motionFace = param1;
      }
      
      public function get pathOriented() : Boolean
      {
         return this._pathOriented;
      }
      
      public function set pathOriented(param1:Boolean) : void
      {
         if(this._pathOriented != param1)
         {
            this._pathOriented = param1;
            if(param1)
            {
               this.updateSpline();
            }
            this.dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      public function get version() : String
      {
         return this._version;
      }
      
      public function set version(param1:String) : void
      {
         this._version = param1;
      }
      
      public function get maxInterPointNum() : uint
      {
         return this._maxInterPointNum;
      }
      
      public function set maxInterPointNum(param1:uint) : void
      {
         this._maxInterPointNum = param1;
      }
      
      public function get path() : Vector.<Point>
      {
         var _loc1_:Vector.<Point> = new Vector.<Point>();
         _loc1_.push(this._startPoint);
         _loc1_ = _loc1_.concat(this._interPoints);
         _loc1_.push(this._endPoint);
         return _loc1_;
      }
      
      public function set path(param1:Vector.<Point>) : void
      {
         var _loc2_:uint = 0;
         if(param1.length > 1)
         {
            this._startPoint = Point(param1[0]).clone();
            this._interPoints = new Vector.<Point>();
            if(param1.length > 2)
            {
               _loc2_ = 1;
               while(_loc2_ < param1.length - 1)
               {
                  this._interPoints.push(Point(param1[_loc2_]).clone());
                  _loc2_++;
               }
            }
            this._endPoint = Point(param1[param1.length - 1]).clone();
            if(this._pathOriented)
            {
               this.updateSpline();
            }
            this.dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      public function clone() : MotionData
      {
         var _loc1_:MotionData = new MotionData();
         _loc1_.maxInterPointNum = this.maxInterPointNum;
         _loc1_.path = this.path;
         _loc1_.pathOriented = this.pathOriented;
         _loc1_.version = this.version;
         _loc1_.startRotation = this.startRotation;
         return _loc1_;
      }
      
      public function moveStartPoint(param1:Number, param2:Number) : void
      {
         if(this.startX != param1 || this.startY != param2)
         {
            this._startPoint.x = param1;
            this._startPoint.y = param2;
            if(this._pathOriented)
            {
               this.updateSpline();
            }
            this.dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      public function get startX() : Number
      {
         return this._startPoint.x;
      }
      
      public function set startX(param1:Number) : void
      {
         if(this.startX != param1)
         {
            this._startPoint.x = param1;
            if(this._pathOriented)
            {
               this.updateSpline();
            }
            this.dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      public function get startY() : Number
      {
         return this._startPoint.y;
      }
      
      public function set startY(param1:Number) : void
      {
         if(this.startY != param1)
         {
            this._startPoint.y = param1;
            if(this._pathOriented)
            {
               this.updateSpline();
            }
            this.dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      public function moveEndPoint(param1:Number, param2:Number) : void
      {
         if(this.endX != param1 || this.endY != param2)
         {
            this._endPoint.x = param1;
            this._endPoint.y = param2;
            if(this._pathOriented)
            {
               this.updateSpline();
            }
            this.dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      public function get endX() : Number
      {
         return this._endPoint.x;
      }
      
      public function set endX(param1:Number) : void
      {
         if(this.endX != param1)
         {
            this._endPoint.x = param1;
            if(this._pathOriented)
            {
               this.updateSpline();
            }
            this.dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      public function get endY() : Number
      {
         return this._endPoint.y;
      }
      
      public function set endY(param1:Number) : void
      {
         if(this.endY != param1)
         {
            this._endPoint.y = param1;
            if(this._pathOriented)
            {
               this.updateSpline();
            }
            this.dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      public function get displacementX() : Number
      {
         return this.endX - this.startX;
      }
      
      public function get displacementY() : Number
      {
         return this.endY - this.startY;
      }
      
      public function convertToXml() : XML
      {
         var _loc1_:XML = new XML("<" + XML_TAG_NAME + "/>");
         if(this._pathOriented)
         {
            _loc1_.@pathOriented = "1";
         }
         _loc1_.@ver = this._version;
         return _loc1_;
      }
      
      public function convertFromXml(param1:XML) : Boolean
      {
         if(param1)
         {
            if(param1.hasOwnProperty("@pathOriented") && String(param1.@pathOriented) == "1")
            {
               this.pathOriented = true;
            }
            if(param1.hasOwnProperty("@ver"))
            {
               this._version = String(param1.@ver);
            }
            else
            {
               this._version = "1";
            }
         }
         return true;
      }
      
      public function get startRotation() : Number
      {
         return this._startRotation;
      }
      
      public function set startRotation(param1:Number) : void
      {
         if(this._startRotation != param1)
         {
            this._startRotation = param1;
            this.dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      public function get endRotation() : Number
      {
         if(this._pathOriented)
         {
            return this.getRotation(1);
         }
         return this._endRotation;
      }
      
      public function set endRotation(param1:Number) : void
      {
         if(this._endRotation != param1)
         {
            this._endRotation = param1;
            this.dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      private function getRotation(param1:Number) : Number
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Point = null;
         var _loc6_:Point = null;
         var _loc7_:Number = NaN;
         var _loc2_:Number = this.startRotation;
         if(this._pathOriented)
         {
            if(this._interPoints.length > 0 && this._splineController)
            {
               _loc3_ = 100;
               _loc4_ = 0;
               _loc5_ = this._splineController.getPosition(0,this._version == this.VERSION_CONSTANT_SPEED);
               _loc6_ = this._splineController.getPosition(1 / _loc3_,this._version == this.VERSION_CONSTANT_SPEED);
               if(Point(this._interPoints[0]).x > this.startX)
               {
                  _loc4_ = Math.atan2(_loc6_.y - _loc5_.y,_loc6_.x - _loc5_.x) * 180 / Math.PI;
               }
               else
               {
                  _loc4_ = Math.atan2(-_loc6_.y + _loc5_.y,-_loc6_.x + _loc5_.x) * 180 / Math.PI;
               }
               _loc7_ = 0;
               _loc5_ = this._splineController.getPosition(Math.max(0,param1 - 1 / _loc3_),this._version == this.VERSION_CONSTANT_SPEED);
               _loc6_ = this._splineController.getPosition(Math.min(1,param1 + 1 / _loc3_),this._version == this.VERSION_CONSTANT_SPEED);
               if(Point(this._interPoints[0]).x > this.startX)
               {
                  _loc7_ = Math.atan2(_loc6_.y - _loc5_.y,_loc6_.x - _loc5_.x) * 180 / Math.PI;
               }
               else
               {
                  _loc7_ = Math.atan2(-_loc6_.y + _loc5_.y,-_loc6_.x + _loc5_.x) * 180 / Math.PI;
               }
               _loc2_ = _loc2_ + (_loc7_ - _loc4_);
            }
         }
         else
         {
            _loc2_ = UtilMath.linearInterpolation(this.startRotation,this._endRotation,param1);
         }
         return _loc2_;
      }
      
      private function updateSpline() : void
      {
         var _loc1_:Vector.<Point> = null;
         var _loc2_:BezierSpline = null;
         var _loc3_:uint = 0;
         if(this._pathOriented)
         {
            _loc1_ = this.path;
            if(_loc1_.length > 2)
            {
               _loc2_ = new BezierSpline();
               _loc3_ = 0;
               while(_loc3_ < _loc1_.length)
               {
                  _loc2_.addControlPoint(Point(_loc1_[_loc3_]).x,Point(_loc1_[_loc3_]).y);
                  _loc3_++;
               }
               this._splineController = new BezierSplineController(_loc2_);
            }
         }
      }
      
      public function translatePath(param1:Number, param2:Number) : void
      {
         var _loc3_:Point = null;
         this.moveStartPoint(this.startX + param1,this.startY + param2);
         for each(_loc3_ in this._interPoints)
         {
            _loc3_.offset(param1,param2);
         }
         this.moveEndPoint(this.endX + param1,this.endY + param2);
      }
   }
}
