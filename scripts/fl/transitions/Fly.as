package fl.transitions
{
   import flash.display.MovieClip;
   import flash.display.Stage;
   import flash.display.StageScaleMode;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class Fly extends Transition
   {
       
      
      public var className:String = "Fly";
      
      protected var _startPoint:Number = 4;
      
      protected var _xFinal:Number;
      
      protected var _yFinal:Number;
      
      protected var _xInitial:Number;
      
      protected var _yInitial:Number;
      
      protected var _stagePoints:Object;
      
      public function Fly(param1:MovieClip, param2:Object, param3:TransitionManager)
      {
         var _loc7_:* = null;
         var _loc8_:Rectangle = null;
         super(param1,param2,param3);
         if(param2.startPoint)
         {
            this._startPoint = param2.startPoint;
         }
         this._xFinal = this.manager.contentAppearance.x;
         this._yFinal = this.manager.contentAppearance.y;
         var _loc4_:Stage = param1.stage;
         var _loc5_:String = _loc4_.scaleMode;
         _loc4_.scaleMode = StageScaleMode.SHOW_ALL;
         var _loc6_:Object = this._stagePoints = {};
         _loc6_[1] = new Point(0,0);
         _loc6_[2] = new Point(0,0);
         _loc6_[3] = new Point(_loc4_.stageWidth,0);
         _loc6_[4] = new Point(0,0);
         _loc6_[5] = new Point(_loc4_.stageWidth / 2,_loc4_.stageHeight / 2);
         _loc6_[6] = new Point(_loc4_.stageWidth,0);
         _loc6_[7] = new Point(0,_loc4_.stageHeight);
         _loc6_[8] = new Point(0,_loc4_.stageHeight);
         _loc6_[9] = new Point(_loc4_.stageWidth,_loc4_.stageHeight);
         for(_loc7_ in _loc6_)
         {
            this._content.parent.globalToLocal(_loc6_[_loc7_]);
         }
         _loc8_ = this._innerBounds;
         _loc6_[1].x = _loc6_[1].x - _loc8_.right;
         _loc6_[1].y = _loc6_[1].y - _loc8_.bottom;
         _loc6_[2].x = this.manager.contentAppearance.x;
         _loc6_[2].y = _loc6_[2].y - _loc8_.bottom;
         _loc6_[3].x = _loc6_[3].x - _loc8_.left;
         _loc6_[3].y = _loc6_[3].y - _loc8_.bottom;
         _loc6_[4].x = _loc6_[4].x - _loc8_.right;
         _loc6_[4].y = this.manager.contentAppearance.y;
         _loc6_[5].x = _loc6_[5].x - (_loc8_.right + _loc8_.left) / 2;
         _loc6_[5].y = _loc6_[5].y - (_loc8_.bottom + _loc8_.top) / 2;
         _loc6_[6].x = _loc6_[6].x - _loc8_.left;
         _loc6_[6].y = this.manager.contentAppearance.y;
         _loc6_[7].x = _loc6_[7].x - _loc8_.right;
         _loc6_[7].y = _loc6_[7].y - _loc8_.top;
         _loc6_[8].x = this.manager.contentAppearance.x;
         _loc6_[8].y = _loc6_[8].y - _loc8_.top;
         _loc6_[9].x = _loc6_[9].x - _loc8_.left;
         _loc6_[9].y = _loc6_[9].y - _loc8_.top;
         this._xInitial = this._stagePoints[this._startPoint].x;
         this._yInitial = this._stagePoints[this._startPoint].y;
         _loc4_.scaleMode = _loc5_;
      }
      
      override public function get type() : Class
      {
         return Fly;
      }
      
      override protected function _render(param1:Number) : void
      {
         this._content.x = this._xFinal + (this._xInitial - this._xFinal) * (1 - param1);
         this._content.y = this._yFinal + (this._yInitial - this._yFinal) * (1 - param1);
      }
   }
}
