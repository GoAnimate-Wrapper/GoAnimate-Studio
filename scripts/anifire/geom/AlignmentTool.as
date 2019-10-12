package anifire.geom
{
   import anifire.util.UtilMath;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class AlignmentTool
   {
       
      
      private const HORIZONTAL_SNAP_TOLERANCE:Number = 5;
      
      private const VERTICAL_SNAP_TOLERANCE:Number = 5;
      
      private var _rects:Array;
      
      private var _topEdges:Array;
      
      private var _bottomEdges:Array;
      
      private var _leftEdges:Array;
      
      private var _rightEdges:Array;
      
      private var _verticalCenters:Array;
      
      private var _horizontalCenters:Array;
      
      private var _minDisplacement:Point;
      
      private var _snappedDisplacement:Point;
      
      private var _snappedPosition:Point;
      
      private var _edgeWithSameHorizontalEdge:AlignmentEdge;
      
      private var _edgeWithSameVerticalEdge:AlignmentEdge;
      
      private var _snappedSpacing:Point;
      
      private var _rectsWithEqualHorizontalSpacing:Array;
      
      private var _rectsWithEqualVerticalSpacing:Array;
      
      private var _scaleFactor:Number = 1;
      
      public function AlignmentTool()
      {
         this._rects = new Array();
         this._topEdges = new Array();
         this._bottomEdges = new Array();
         this._leftEdges = new Array();
         this._rightEdges = new Array();
         this._verticalCenters = new Array();
         this._horizontalCenters = new Array();
         this._rectsWithEqualHorizontalSpacing = new Array();
         this._rectsWithEqualVerticalSpacing = new Array();
         super();
      }
      
      public function reset() : void
      {
         this._rects = new Array();
         this._topEdges = new Array();
         this._bottomEdges = new Array();
         this._leftEdges = new Array();
         this._rightEdges = new Array();
         this._horizontalCenters = new Array();
         this._verticalCenters = new Array();
      }
      
      public function set scaleFactor(param1:Number) : void
      {
         if(param1 > 0)
         {
            this._scaleFactor = param1;
         }
      }
      
      public function get scaleFactor() : Number
      {
         return this._scaleFactor;
      }
      
      public function addRectangle(param1:Rectangle, param2:String = null) : void
      {
         this._rects.push(param1);
         this._topEdges.push(new AlignmentEdge(param1.top,param1,param2));
         this._bottomEdges.push(new AlignmentEdge(param1.bottom,param1,param2));
         this._leftEdges.push(new AlignmentEdge(param1.left,param1,param2));
         this._rightEdges.push(new AlignmentEdge(param1.right,param1,param2));
         this.addCenter(UtilMath.getCenter(param1),param1,param2);
      }
      
      public function addCenter(param1:Point, param2:Rectangle, param3:String) : void
      {
         this._verticalCenters.push(new AlignmentEdge(param1.x,param2,param3));
         this._horizontalCenters.push(new AlignmentEdge(param1.y,param2,param3));
      }
      
      public function get rects() : Array
      {
         return this._rects;
      }
      
      public function get rectsWithEqualHorizontalSpacing() : Array
      {
         return this._rectsWithEqualHorizontalSpacing;
      }
      
      public function get rectsWithEqualVerticalSpacing() : Array
      {
         return this._rectsWithEqualVerticalSpacing;
      }
      
      public function get edgeWithSameVerticalEdge() : AlignmentEdge
      {
         return this._edgeWithSameVerticalEdge;
      }
      
      public function get edgeWithSameHorizontalEdge() : AlignmentEdge
      {
         return this._edgeWithSameHorizontalEdge;
      }
      
      public function get snappedDisplacement() : Point
      {
         return this._snappedDisplacement;
      }
      
      public function get snappedPosition() : Point
      {
         return this._snappedPosition;
      }
      
      public function get snappedSpacing() : Point
      {
         return this._snappedSpacing;
      }
      
      public function getSnappedDisplacement(param1:Rectangle) : Point
      {
         this._minDisplacement = new Point(9999,9999);
         this._snappedPosition = new Point();
         this._snappedSpacing = new Point();
         this._snappedDisplacement = new Point();
         this.checkAlignment(param1);
         this.checkSpacing(param1);
         return this._snappedDisplacement;
      }
      
      private function checkAlignment(param1:Rectangle) : void
      {
         var _loc2_:AlignmentEdge = null;
         this._edgeWithSameHorizontalEdge = null;
         this._edgeWithSameVerticalEdge = null;
         if(param1)
         {
            for each(_loc2_ in this._topEdges)
            {
               if(_loc2_)
               {
                  if(this.checkY(_loc2_.value,param1.top))
                  {
                     this._edgeWithSameHorizontalEdge = _loc2_;
                  }
               }
            }
            for each(_loc2_ in this._bottomEdges)
            {
               if(_loc2_)
               {
                  if(this.checkY(_loc2_.value,param1.bottom))
                  {
                     this._edgeWithSameHorizontalEdge = _loc2_;
                  }
               }
            }
            for each(_loc2_ in this._leftEdges)
            {
               if(_loc2_)
               {
                  if(this.checkX(_loc2_.value,param1.left))
                  {
                     this._edgeWithSameVerticalEdge = _loc2_;
                  }
               }
            }
            for each(_loc2_ in this._rightEdges)
            {
               if(_loc2_)
               {
                  if(this.checkX(_loc2_.value,param1.right))
                  {
                     this._edgeWithSameVerticalEdge = _loc2_;
                  }
               }
            }
            for each(_loc2_ in this._verticalCenters)
            {
               if(_loc2_)
               {
                  if(this.checkX(_loc2_.value,param1.left + param1.width / 2))
                  {
                     this._edgeWithSameVerticalEdge = _loc2_;
                  }
               }
            }
            for each(_loc2_ in this._horizontalCenters)
            {
               if(_loc2_)
               {
                  if(this.checkY(_loc2_.value,param1.top + param1.height / 2))
                  {
                     this._edgeWithSameHorizontalEdge = _loc2_;
                  }
               }
            }
         }
      }
      
      private function checkSpacing(param1:Rectangle) : void
      {
         var _loc2_:Rectangle = null;
         var _loc3_:Rectangle = null;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         this._rectsWithEqualHorizontalSpacing = new Array();
         this._rectsWithEqualVerticalSpacing = new Array();
         if(param1)
         {
            _loc4_ = 0;
            while(_loc4_ < this._rects.length)
            {
               _loc5_ = _loc4_;
               while(_loc5_ < this._rects.length)
               {
                  _loc2_ = this._rects[_loc4_] as Rectangle;
                  _loc3_ = this._rects[_loc5_] as Rectangle;
                  this.checkHorizontalSpacing(_loc2_,_loc3_,param1);
                  this.checkVerticalSpacing(_loc2_,_loc3_,param1);
                  _loc5_++;
               }
               _loc4_++;
            }
            this._rectsWithEqualHorizontalSpacing.sortOn("x",Array.NUMERIC);
            this._rectsWithEqualVerticalSpacing.sortOn("y",Array.NUMERIC);
         }
      }
      
      private function checkHorizontalSpacing(param1:Rectangle, param2:Rectangle, param3:Rectangle) : Boolean
      {
         var _loc4_:Rectangle = null;
         var _loc5_:Point = null;
         var _loc6_:Number = NaN;
         if(param1 && param2 && param3)
         {
            _loc5_ = new Point();
            if(param2.x < param1.x)
            {
               _loc4_ = param1;
               param1 = param2;
               param2 = _loc4_;
            }
            if(param1.right < param2.left && UtilMath.checkOverlap(param1.top,param1.bottom,param2.top,param2.bottom))
            {
               _loc6_ = param2.left - param1.right;
               if(UtilMath.checkOverlap(param1.top,param1.bottom,param3.top,param3.bottom))
               {
                  _loc5_.x = param1.left - _loc6_;
                  _loc5_.y = (param1.y + param2.y) / 2;
                  if(this.checkX(_loc5_.x,param3.right))
                  {
                     this._edgeWithSameVerticalEdge = null;
                     this._rectsWithEqualHorizontalSpacing.splice(0);
                     this._rectsWithEqualHorizontalSpacing.push(param1,param2,param3);
                     this._snappedSpacing.x = _loc6_;
                  }
               }
               if(_loc6_ > param3.width)
               {
                  if(UtilMath.checkOverlap(Math.max(param1.top,param2.top),Math.min(param1.bottom,param2.bottom),param3.top,param3.bottom))
                  {
                     _loc5_.x = (param1.right + param2.left) / 2;
                     if(this.checkX(_loc5_.x,UtilMath.getCenter(param3).x))
                     {
                        this._edgeWithSameVerticalEdge = null;
                        this._rectsWithEqualHorizontalSpacing.splice(0);
                        this._rectsWithEqualHorizontalSpacing.push(param1,param2,param3);
                        this._snappedSpacing.x = _loc6_;
                     }
                  }
               }
               if(UtilMath.checkOverlap(param2.top,param2.bottom,param3.top,param3.bottom))
               {
                  _loc5_.x = param2.right + _loc6_;
                  if(this.checkX(_loc5_.x,param3.left))
                  {
                     this._edgeWithSameVerticalEdge = null;
                     this._rectsWithEqualHorizontalSpacing.splice(0);
                     this._rectsWithEqualHorizontalSpacing.push(param1,param2,param3);
                     this._snappedSpacing.x = _loc6_;
                  }
               }
            }
         }
         return false;
      }
      
      private function checkVerticalSpacing(param1:Rectangle, param2:Rectangle, param3:Rectangle) : Boolean
      {
         var _loc4_:Rectangle = null;
         var _loc5_:Point = null;
         var _loc6_:Number = NaN;
         if(param1 && param2 && param3)
         {
            _loc5_ = new Point();
            if(param2.y < param1.y)
            {
               _loc4_ = param1;
               param1 = param2;
               param2 = _loc4_;
            }
            if(param1.bottom < param2.top && UtilMath.checkOverlap(param1.left,param1.right,param2.left,param2.right))
            {
               _loc6_ = param2.top - param1.bottom;
               if(UtilMath.checkOverlap(param1.left,param1.right,param3.left,param3.right))
               {
                  _loc5_.y = param1.top - _loc6_;
                  _loc5_.x = (param1.x + param2.x) / 2;
                  if(this.checkY(_loc5_.y,param3.bottom))
                  {
                     this._edgeWithSameHorizontalEdge = null;
                     this._rectsWithEqualVerticalSpacing.splice(0);
                     this._rectsWithEqualVerticalSpacing.push(param1,param2,param3);
                     this._snappedSpacing.y = _loc6_;
                  }
               }
               if(_loc6_ > param3.height)
               {
                  if(UtilMath.checkOverlap(Math.max(param2.left,param1.left),Math.min(param2.right,param1.right),param3.left,param3.right))
                  {
                     _loc5_.y = (param1.bottom + param2.top) / 2;
                     if(this.checkY(_loc5_.y,UtilMath.getCenter(param3).y))
                     {
                        this._edgeWithSameHorizontalEdge = null;
                        this._rectsWithEqualVerticalSpacing.splice(0);
                        this._rectsWithEqualVerticalSpacing.push(param1,param2,param3);
                        this._snappedSpacing.y = _loc6_;
                     }
                  }
               }
               if(UtilMath.checkOverlap(param2.left,param2.right,param3.left,param3.right))
               {
                  _loc5_.y = param2.bottom + _loc6_;
                  if(this.checkY(_loc5_.y,param3.top))
                  {
                     this._edgeWithSameHorizontalEdge = null;
                     this._rectsWithEqualVerticalSpacing.splice(0);
                     this._rectsWithEqualVerticalSpacing.push(param1,param2,param3);
                     this._snappedSpacing.y = _loc6_;
                  }
               }
            }
         }
         return false;
      }
      
      private function checkX(param1:Number, param2:Number) : Boolean
      {
         if(Math.abs(param1 - param2) < Math.abs(this._minDisplacement.x))
         {
            this._minDisplacement.x = param1 - param2;
            if(Math.abs(this._minDisplacement.x) < this.HORIZONTAL_SNAP_TOLERANCE * this._scaleFactor)
            {
               this._snappedDisplacement.x = this._minDisplacement.x;
               this._snappedPosition.x = param1;
               return true;
            }
         }
         return false;
      }
      
      private function checkY(param1:Number, param2:Number) : Boolean
      {
         if(Math.abs(param1 - param2) < Math.abs(this._minDisplacement.y))
         {
            this._minDisplacement.y = param1 - param2;
            if(Math.abs(this._minDisplacement.y) < this.VERTICAL_SNAP_TOLERANCE * this._scaleFactor)
            {
               this._snappedDisplacement.y = this._minDisplacement.y;
               this._snappedPosition.y = param1;
               return true;
            }
         }
         return false;
      }
   }
}
