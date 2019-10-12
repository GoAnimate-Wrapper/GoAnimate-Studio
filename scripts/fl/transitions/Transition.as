package fl.transitions
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.geom.Rectangle;
   
   public class Transition extends EventDispatcher
   {
      
      public static const IN:uint = 0;
      
      public static const OUT:uint = 1;
       
      
      public var ID:int;
      
      protected var _content:MovieClip;
      
      protected var _manager:TransitionManager;
      
      protected var _direction:uint = 0;
      
      protected var _duration:Number = 2;
      
      protected var _easing:Function;
      
      protected var _progress:Number;
      
      protected var _innerBounds:Rectangle;
      
      protected var _outerBounds:Rectangle;
      
      protected var _width:Number = NaN;
      
      protected var _height:Number = NaN;
      
      protected var _twn:Tween;
      
      public function Transition(param1:MovieClip, param2:Object, param3:TransitionManager)
      {
         super();
         this.content = param1;
         this.direction = param2.direction;
         this.duration = param2.duration;
         this.easing = param2.easing;
         this.manager = param3;
         this._innerBounds = this.manager._innerBounds;
         this._outerBounds = this.manager._outerBounds;
         this._width = this.manager._width;
         this._height = this.manager._height;
         this._resetTween();
      }
      
      public function get type() : Class
      {
         return Transition;
      }
      
      public function set manager(param1:TransitionManager) : void
      {
         if(this._manager)
         {
            this.removeEventListener("transitionInDone",this._manager.transitionInDone);
            this.removeEventListener("transitionOutDone",this._manager.transitionOutDone);
         }
         this._manager = param1;
         this.addEventListener("transitionInDone",this._manager.transitionInDone);
         this.addEventListener("transitionOutDone",this._manager.transitionOutDone);
      }
      
      public function get manager() : TransitionManager
      {
         return this._manager;
      }
      
      public function set content(param1:MovieClip) : void
      {
         if(param1)
         {
            this._content = param1;
            if(this._twn)
            {
               this._twn.obj = param1;
            }
         }
      }
      
      public function get content() : MovieClip
      {
         return this._content;
      }
      
      public function get direction() : Number
      {
         return this._direction;
      }
      
      public function set direction(param1:Number) : void
      {
         this._direction = !!param1?uint(1):uint(0);
      }
      
      public function get duration() : Number
      {
         return this._duration;
      }
      
      public function set duration(param1:Number) : void
      {
         if(param1)
         {
            this._duration = param1;
            if(this._twn)
            {
               this._twn.duration = param1;
            }
         }
      }
      
      public function get easing() : Function
      {
         return this._easing;
      }
      
      public function set easing(param1:Function) : void
      {
         this._easing = param1;
         if(this._twn)
         {
            this._twn.func = param1;
         }
      }
      
      public function set progress(param1:Number) : void
      {
         if(this._progress == param1)
         {
            return;
         }
         this._progress = param1;
         if(this._direction)
         {
            this._render(1 - param1);
         }
         else
         {
            this._render(param1);
         }
         this.dispatchEvent(new Event("transitionProgress"));
      }
      
      public function get progress() : Number
      {
         return this._progress;
      }
      
      public function start() : void
      {
         this.content.visible = true;
         this._twn.start();
      }
      
      public function stop() : void
      {
         this._twn.fforward();
         this._twn.stop();
      }
      
      public function cleanUp() : void
      {
         this.removeEventListener("transitionInDone",this._manager.transitionInDone);
         this.removeEventListener("transitionOutDone",this._manager.transitionOutDone);
         this.stop();
      }
      
      public function drawBox(param1:MovieClip, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         param1.graphics.moveTo(param2,param3);
         param1.graphics.lineTo(param2 + param4,param3);
         param1.graphics.lineTo(param2 + param4,param3 + param5);
         param1.graphics.lineTo(param2,param3 + param5);
         param1.graphics.lineTo(param2,param3);
      }
      
      public function drawCircle(param1:MovieClip, param2:Number, param3:Number, param4:Number) : void
      {
         param1.graphics.moveTo(param2 + param4,param3);
         param1.graphics.curveTo(param4 + param2,Math.tan(Math.PI / 8) * param4 + param3,Math.sin(Math.PI / 4) * param4 + param2,Math.sin(Math.PI / 4) * param4 + param3);
         param1.graphics.curveTo(Math.tan(Math.PI / 8) * param4 + param2,param4 + param3,param2,param4 + param3);
         param1.graphics.curveTo(-Math.tan(Math.PI / 8) * param4 + param2,param4 + param3,-Math.sin(Math.PI / 4) * param4 + param2,Math.sin(Math.PI / 4) * param4 + param3);
         param1.graphics.curveTo(-param4 + param2,Math.tan(Math.PI / 8) * param4 + param3,-param4 + param2,param3);
         param1.graphics.curveTo(-param4 + param2,-Math.tan(Math.PI / 8) * param4 + param3,-Math.sin(Math.PI / 4) * param4 + param2,-Math.sin(Math.PI / 4) * param4 + param3);
         param1.graphics.curveTo(-Math.tan(Math.PI / 8) * param4 + param2,-param4 + param3,param2,-param4 + param3);
         param1.graphics.curveTo(Math.tan(Math.PI / 8) * param4 + param2,-param4 + param3,Math.sin(Math.PI / 4) * param4 + param2,-Math.sin(Math.PI / 4) * param4 + param3);
         param1.graphics.curveTo(param4 + param2,-Math.tan(Math.PI / 8) * param4 + param3,param4 + param2,param3);
      }
      
      protected function _render(param1:Number) : void
      {
      }
      
      private function _resetTween() : void
      {
         if(this._twn)
         {
            this._twn.stop();
            this._twn.removeEventListener(TweenEvent.MOTION_FINISH,this.onMotionFinished);
         }
         this._twn = new Tween(this,"",this.easing,0,1,this.duration,true);
         this._twn.stop();
         this._twn.prop = "progress";
         this._twn.addEventListener(TweenEvent.MOTION_FINISH,this.onMotionFinished,false,0,true);
      }
      
      private function _noEase(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         return param3 * param1 / param4 + param2;
      }
      
      public function onMotionFinished(param1:Object) : void
      {
         if(this.direction == Transition.OUT)
         {
            this.dispatchEvent(new Event("transitionOutDone"));
         }
         else
         {
            this.dispatchEvent(new Event("transitionInDone"));
         }
      }
   }
}
