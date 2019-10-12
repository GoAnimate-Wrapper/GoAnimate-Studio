package anifire.effect
{
   import anifire.constant.AnimeConstants;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.TimerEvent;
   import flash.geom.ColorTransform;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class Firework extends Sprite
   {
       
      
      private var _effectObject:Class;
      
      private var _myScale:Number;
      
      private var _myPoint:Point;
      
      private var _numOfBeam:Number;
      
      private var _myColor:ColorTransform;
      
      public function Firework()
      {
         this._effectObject = Firework__effectObject;
         super();
      }
      
      public function init() : void
      {
         this._myScale = 0.5 + Math.random() * 1.2;
         this._myPoint = new Point(Math.random() * AnimeConstants.SCREEN_WIDTH,Math.random() * AnimeConstants.SCREEN_HEIGHT);
         var _loc1_:Array = [16711935,16776960,65280,65535,16711680,10027263];
         this._myColor = new ColorTransform();
         this._myColor.color = Number(_loc1_[int(Math.random() * 6)]);
         this._numOfBeam = 15 + int(Math.random() * 10);
      }
      
      public function show(param1:Number) : void
      {
         var _loc2_:Timer = new Timer(param1,int(Math.random() * 2) + 1);
         _loc2_.addEventListener(TimerEvent.TIMER,this.showUp);
         _loc2_.start();
      }
      
      public function showUp(param1:TimerEvent) : void
      {
         var _loc3_:DisplayObject = null;
         this.x = this._myPoint.x;
         this.y = this._myPoint.y;
         this.scaleX = this.scaleY = this._myScale;
         this.transform.colorTransform = this._myColor;
         var _loc2_:Number = 0;
         while(_loc2_ < this._numOfBeam)
         {
            _loc3_ = new this._effectObject() as DisplayObject;
            _loc3_.rotation = Math.random() * 360;
            this.addChild(_loc3_);
            _loc2_++;
         }
         this.ShortTimer();
      }
      
      public function ShortTimer() : void
      {
         var _loc1_:Timer = new Timer(1000 / AnimeConstants.FRAME_PER_SEC,40);
         _loc1_.addEventListener(TimerEvent.TIMER,this.onTick);
         _loc1_.addEventListener(TimerEvent.TIMER_COMPLETE,this.onTimerComplete);
         _loc1_.start();
      }
      
      public function onTick(param1:TimerEvent) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(param1.target.currentCount >= 15)
         {
            _loc2_ = this.numChildren;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               this.getChildAt(_loc3_).alpha = Math.random() * 0.5 + 0.5;
               _loc3_++;
            }
         }
      }
      
      public function onTimerComplete(param1:TimerEvent) : void
      {
         var _loc2_:Number = this.numChildren;
         var _loc3_:Number = _loc2_ - 1;
         while(_loc3_ >= 0)
         {
            if(this.getChildAt(_loc3_) != null)
            {
               this.removeChildAt(_loc3_);
            }
            _loc3_--;
         }
         this.visible = false;
      }
   }
}
