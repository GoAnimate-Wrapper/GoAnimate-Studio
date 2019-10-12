package anifire.effect
{
   import flash.display.MovieClip;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class Particle extends MovieClip
   {
       
      
      protected var position:Point;
      
      protected var vectorPoint:Point;
      
      private var gravity:int;
      
      private var friction:Number;
      
      protected var update_i:Timer;
      
      public function Particle()
      {
         super();
      }
      
      public function init(param1:Point, param2:Point, param3:int, param4:Number) : void
      {
         this.position = param1;
         this.vectorPoint = param2;
         this.gravity = param3;
         this.friction = param4;
         this.scaleX = this.scaleX + 0.5;
         this.scaleY = this.scaleY + 0.5;
         this.update_i = new Timer(25,70 + int(Math.random() * 30));
         this.update_i.addEventListener(TimerEvent.TIMER,this.update,false,0,true);
         this.update_i.addEventListener(TimerEvent.TIMER_COMPLETE,this.finish);
         this.update_i.start();
      }
      
      public function update(param1:TimerEvent) : void
      {
         this.position.x = this.position.x + this.vectorPoint.x;
         this.position.y = this.position.y + this.vectorPoint.y;
         this.vectorPoint.y = this.vectorPoint.y + this.gravity;
         this.vectorPoint.x = this.vectorPoint.x * this.friction;
         this.setPosition(param1);
      }
      
      public function setPosition(param1:TimerEvent) : void
      {
         this.x = this.position.x;
         this.y = this.position.y;
         if(this.vectorPoint.y >= 0)
         {
            this.alpha = Math.random();
            this.gravity = 0.1;
         }
      }
      
      public function finish(param1:TimerEvent) : void
      {
         this.visible = false;
      }
   }
}
