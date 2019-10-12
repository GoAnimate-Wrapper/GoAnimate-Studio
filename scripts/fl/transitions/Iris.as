package fl.transitions
{
   import flash.display.MovieClip;
   import flash.geom.Rectangle;
   
   public class Iris extends Transition
   {
      
      public static const SQUARE:String = "SQUARE";
      
      public static const CIRCLE:String = "CIRCLE";
       
      
      protected var _mask:MovieClip;
      
      protected var _startPoint:uint = 5;
      
      protected var _cornerMode:Boolean = false;
      
      protected var _shape:String = "SQUARE";
      
      protected var _maxDimension:Number = NaN;
      
      protected var _minDimension:Number = NaN;
      
      protected var _renderFunction:Function;
      
      public function Iris(param1:MovieClip, param2:Object, param3:TransitionManager)
      {
         super(param1,param2,param3);
         if(param2.startPoint)
         {
            this._startPoint = param2.startPoint;
         }
         if(param2.shape)
         {
            this._shape = param2.shape;
         }
         this._maxDimension = Math.max(this._width,this._height);
         this._minDimension = Math.min(this._width,this._height);
         if(this._startPoint % 2)
         {
            this._cornerMode = true;
         }
         if(this._shape == SQUARE)
         {
            if(this._cornerMode)
            {
               this._renderFunction = this._renderSquareCorner;
            }
            else
            {
               this._renderFunction = this._renderSquareEdge;
            }
         }
         else if(this._shape == CIRCLE)
         {
            this._renderFunction = this._renderCircle;
         }
         this._initMask();
      }
      
      override public function get type() : Class
      {
         return Iris;
      }
      
      override public function start() : void
      {
         this._content.mask = this._mask;
         super.start();
      }
      
      override public function cleanUp() : void
      {
         this._content.removeChild(this._mask);
         this._content.mask = null;
         super.cleanUp();
      }
      
      protected function _initMask() : void
      {
         var _loc1_:MovieClip = this._mask = new MovieClip();
         _loc1_.visible = false;
         this._content.addChild(_loc1_);
         var _loc2_:Rectangle = this._innerBounds;
         switch(this._startPoint)
         {
            case 1:
               _loc1_.x = _loc2_.left;
               _loc1_.y = _loc2_.top;
               break;
            case 4:
               _loc1_.x = _loc2_.left;
               _loc1_.y = (_loc2_.top + _loc2_.bottom) * 0.5;
               break;
            case 3:
               _loc1_.rotation = 90;
               _loc1_.x = _loc2_.right;
               _loc1_.y = _loc2_.top;
               break;
            case 2:
               _loc1_.rotation = 90;
               _loc1_.x = (_loc2_.left + _loc2_.right) * 0.5;
               _loc1_.y = _loc2_.top;
               break;
            case 9:
               _loc1_.rotation = 180;
               _loc1_.x = _loc2_.right;
               _loc1_.y = _loc2_.bottom;
               break;
            case 6:
               _loc1_.rotation = 180;
               _loc1_.x = _loc2_.right;
               _loc1_.y = (_loc2_.top + _loc2_.bottom) * 0.5;
               break;
            case 7:
               _loc1_.rotation = -90;
               _loc1_.x = _loc2_.left;
               _loc1_.y = _loc2_.bottom;
               break;
            case 8:
               _loc1_.rotation = -90;
               _loc1_.x = (_loc2_.left + _loc2_.right) * 0.5;
               _loc1_.y = _loc2_.bottom;
               break;
            case 5:
               _loc1_.x = (_loc2_.left + _loc2_.right) * 0.5;
               _loc1_.y = (_loc2_.top + _loc2_.bottom) * 0.5;
         }
      }
      
      override protected function _render(param1:Number) : void
      {
         this._renderFunction(param1);
      }
      
      protected function _renderCircle(param1:Number) : void
      {
         var _loc2_:MovieClip = this._mask;
         _loc2_.graphics.clear();
         _loc2_.graphics.beginFill(16711680);
         var _loc3_:Number = 0;
         if(this._startPoint == 5)
         {
            _loc3_ = 0.5 * Math.sqrt(this._width * this._width + this._height * this._height);
            this.drawCircle(_loc2_,0,0,param1 * _loc3_);
         }
         else if(this._cornerMode)
         {
            _loc3_ = Math.sqrt(this._width * this._width + this._height * this._height);
            this._drawQuarterCircle(_loc2_,param1 * _loc3_);
         }
         else
         {
            if(this._startPoint == 4 || this._startPoint == 6)
            {
               _loc3_ = Math.sqrt(this._width * this._width + 0.25 * this._height * this._height);
            }
            else if(this._startPoint == 2 || this._startPoint == 8)
            {
               _loc3_ = Math.sqrt(0.25 * this._width * this._width + this._height * this._height);
            }
            this._drawHalfCircle(_loc2_,param1 * _loc3_);
         }
         _loc2_.graphics.endFill();
      }
      
      protected function _drawQuarterCircle(param1:MovieClip, param2:Number) : void
      {
         var _loc3_:Number = 0;
         var _loc4_:Number = 0;
         param1.graphics.lineTo(param2,0);
         param1.graphics.curveTo(param2 + _loc3_,Math.tan(Math.PI / 8) * param2 + _loc4_,Math.sin(Math.PI / 4) * param2 + _loc3_,Math.sin(Math.PI / 4) * param2 + _loc4_);
         param1.graphics.curveTo(Math.tan(Math.PI / 8) * param2 + _loc3_,param2 + _loc4_,_loc3_,param2 + _loc4_);
      }
      
      protected function _drawHalfCircle(param1:MovieClip, param2:Number) : void
      {
         var _loc3_:Number = 0;
         var _loc4_:Number = 0;
         param1.graphics.lineTo(0,-param2);
         param1.graphics.curveTo(Math.tan(Math.PI / 8) * param2 + _loc3_,-param2 + _loc4_,Math.sin(Math.PI / 4) * param2 + _loc3_,-Math.sin(Math.PI / 4) * param2 + _loc4_);
         param1.graphics.curveTo(param2 + _loc3_,-Math.tan(Math.PI / 8) * param2 + _loc4_,param2 + _loc3_,_loc4_);
         param1.graphics.curveTo(param2 + _loc3_,Math.tan(Math.PI / 8) * param2 + _loc4_,Math.sin(Math.PI / 4) * param2 + _loc3_,Math.sin(Math.PI / 4) * param2 + _loc4_);
         param1.graphics.curveTo(Math.tan(Math.PI / 8) * param2 + _loc3_,param2 + _loc4_,_loc3_,param2 + _loc4_);
         param1.graphics.lineTo(0,0);
      }
      
      protected function _renderSquareEdge(param1:Number) : void
      {
         var _loc2_:MovieClip = this._mask;
         _loc2_.graphics.clear();
         _loc2_.graphics.beginFill(16711680);
         var _loc3_:uint = this._startPoint;
         var _loc4_:Number = param1 * this._width;
         var _loc5_:Number = param1 * this._height;
         var _loc6_:Number = param1 * this._maxDimension;
         if(_loc3_ == 4 || _loc3_ == 6)
         {
            this.drawBox(_loc2_,0,-0.5 * _loc5_,_loc4_,_loc5_);
         }
         else if(this._height < this._width)
         {
            this.drawBox(_loc2_,0,-0.5 * _loc6_,_loc5_,_loc4_);
         }
         else
         {
            this.drawBox(_loc2_,0,-0.5 * _loc6_,_loc6_,_loc6_);
         }
         _loc2_.graphics.endFill();
      }
      
      protected function _renderSquareCorner(param1:Number) : void
      {
         var _loc2_:MovieClip = this._mask;
         _loc2_.graphics.clear();
         _loc2_.graphics.beginFill(16711680);
         var _loc3_:uint = this._startPoint;
         var _loc4_:Number = param1 * this._width;
         var _loc5_:Number = param1 * this._height;
         if(_loc3_ == 5)
         {
            this.drawBox(_loc2_,-0.5 * _loc4_,-0.5 * _loc5_,_loc4_,_loc5_);
         }
         else if(_loc3_ == 3 || _loc3_ == 7)
         {
            this.drawBox(_loc2_,0,0,_loc5_,_loc4_);
         }
         else
         {
            this.drawBox(_loc2_,0,0,_loc4_,_loc5_);
         }
         _loc2_.graphics.endFill();
      }
   }
}
