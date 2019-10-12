package anifire.effect
{
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.TimerEvent;
   import flash.geom.ColorTransform;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class FireSpring extends Sprite
   {
       
      
      private var _effectGraphic:Class;
      
      private var _myScale:Number;
      
      private var _myPoint:Point;
      
      private var _numOfDot:Number;
      
      private var _myColor:ColorTransform;
      
      private var _lockColor:Number;
      
      private var _vx:Number;
      
      private var _vy:Number;
      
      public function FireSpring()
      {
         this._effectGraphic = FireSpring__effectGraphic;
         super();
      }
      
      public function init(param1:Point, param2:Number) : void
      {
         this._myScale = 1;
         this._myPoint = param1;
         this._lockColor = param2;
         this._numOfDot = 2;
         this._vx = (Math.random() - Math.random()) * 10;
         this._vy = -(14 + Math.random() * 6);
      }
      
      public function show(param1:Number) : void
      {
         var _loc2_:Timer = new Timer(param1,1);
         _loc2_.addEventListener(TimerEvent.TIMER,this.showUp);
         _loc2_.start();
      }
      
      public function showUp(param1:TimerEvent) : void
      {
         this.x = this._myPoint.x;
         this.y = this._myPoint.y;
         var _loc2_:Timer = new Timer(5,this._numOfDot);
         _loc2_.addEventListener(TimerEvent.TIMER,this.fire);
         _loc2_.start();
      }
      
      public function fire(param1:TimerEvent) : void
      {
         var _loc2_:Particle = new Particle();
         var _loc3_:DisplayObject = new this._effectGraphic() as DisplayObject;
         _loc2_.addChild(_loc3_);
         _loc2_.init(new Point(0,0),new Point(this._vx,this._vy),1,0.9);
         var _loc4_:Array = [1,1,1];
         _loc4_[this._lockColor] = Math.random() * 0.5 + 0.5;
         this._myColor = new ColorTransform(_loc4_[0],_loc4_[1],_loc4_[2]);
         _loc2_.transform.colorTransform = this._myColor;
         this.addChild(_loc2_);
      }
   }
}
