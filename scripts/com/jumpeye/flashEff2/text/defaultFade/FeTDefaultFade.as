package com.jumpeye.flashEff2.text.defaultFade
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffSymbol;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.filters.BitmapFilter;
   import flash.filters.BlurFilter;
   import flash.utils.Timer;
   
   public class FeTDefaultFade extends IFlashEffSymbol
   {
       
      
      private var _partialStart:Number = 50;
      
      private var _partialBlurAmount:Number = 0;
      
      protected var tweenTimer:Timer;
      
      protected var time:Number = 0;
      
      protected var delay:Number;
      
      protected var duration:Number = 1;
      
      protected var isTimer:Boolean = false;
      
      protected var startPos:uint;
      
      protected var finishPos:uint;
      
      protected var change:int;
      
      public function FeTDefaultFade(param1:JUIComponent = null)
      {
         super();
         this.component = param1;
         _easeType = "easeOut";
         _tweenType = "Quadratic";
      }
      
      public function set partialStart(param1:Number) : void
      {
         this._partialStart = param1;
      }
      
      public function get partialStart() : Number
      {
         return this._partialStart;
      }
      
      public function set partialBlurAmount(param1:Number) : void
      {
         this._partialBlurAmount = param1;
      }
      
      public function get partialBlurAmount() : Number
      {
         return this._partialBlurAmount;
      }
      
      override public function show() : void
      {
         if(this.target != null)
         {
            this.startTransition(true);
         }
      }
      
      override public function hide() : void
      {
         if(this.target != null)
         {
            this.startTransition(false);
         }
      }
      
      protected function startTransition(param1:Boolean = true) : void
      {
         this.startPos = 1;
         this.finishPos = 0;
         if(param1 == true)
         {
            this.startPos = 0;
            this.finishPos = 1;
         }
         this.change = this.finishPos - this.startPos;
         this.target.alpha = this.startPos;
         this.duration = this.tweenDuration * (1 - this.partialStart / 100) * 1000;
         if(this.duration <= 0)
         {
            this.duration = 1;
         }
         this.delay = 30;
         if(this.duration > this.delay / 2)
         {
            this.tweenTimer = new Timer(this.delay);
            this.tweenTimer.addEventListener(TimerEvent.TIMER,this.timerHandler);
            this.time = 0;
            this.isTimer = true;
            this.tweenTimer.start();
            this.component.addEventListener(Event.ENTER_FRAME,this.enterFrame);
         }
         else
         {
            this.time = this.duration;
            this.enterFrame();
         }
      }
      
      protected function timerHandler(param1:TimerEvent) : void
      {
         this.time = this.time + this.delay;
         if(this.time > this.duration)
         {
            this.time = this.duration;
            this.tweenTimer.removeEventListener(TimerEvent.TIMER,this.timerHandler);
            this.isTimer = false;
         }
      }
      
      protected function enterFrame(param1:Event = null) : void
      {
         var _loc6_:FLASHEFFEvents = null;
         var _loc2_:Number = this.change * this.time / this.duration + this.startPos;
         this.target.alpha = _loc2_;
         var _loc3_:Number = this.partialBlurAmount * (1 - _loc2_);
         var _loc4_:BitmapFilter = new BlurFilter(_loc3_,_loc3_,2);
         var _loc5_:Array = new Array();
         _loc5_.push(_loc4_);
         this.target.filters = _loc5_;
         if(this.isTimer == false)
         {
            this.remove();
            _loc6_ = new FLASHEFFEvents("defaultPatternFinish");
            this.component.dispatchEvent(_loc6_);
         }
      }
      
      protected function motionFinish(param1:Event) : void
      {
      }
      
      override public function remove() : void
      {
         if(this.tweenTimer != null)
         {
            this.tweenTimer.removeEventListener(TimerEvent.TIMER,this.timerHandler);
         }
         if(this.component != null)
         {
            this.component.removeEventListener(Event.ENTER_FRAME,this.enterFrame);
         }
         this.tweenTimer = null;
         if(this.target != null)
         {
            this.target.filters = [];
         }
      }
   }
}
