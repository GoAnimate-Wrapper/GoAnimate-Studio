package anifire.util
{
   import anifire.constant.AnimeConstants;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.net.URLRequest;
   import flash.net.URLStream;
   import flash.utils.Timer;
   
   public class UtilURLStream extends URLStream
   {
      
      public static var TIME_OUT:String = "timeOut";
       
      
      private var myTimer:Timer = null;
      
      private var useTimer:Boolean = true;
      
      public var name:String;
      
      public function UtilURLStream(param1:Boolean = true)
      {
         super();
         this.useTimer = param1;
      }
      
      override public function load(param1:URLRequest) : void
      {
         this.addEventListener(IOErrorEvent.IO_ERROR,this.onErrorHandler);
         this.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onErrorHandler);
         this.addEventListener(ProgressEvent.PROGRESS,this.onProgressHandler);
         this.addEventListener(Event.COMPLETE,this.onCompleteHandler);
         if(this.useTimer && this.myTimer == null)
         {
            this.myTimer = new Timer(AnimeConstants.TIME_OUT,1);
            this.myTimer.addEventListener(TimerEvent.TIMER,this.timerEventHandler);
            this.myTimer.addEventListener(TimerEvent.TIMER_COMPLETE,this.timerCompleteEventHandler);
            this.myTimer.start();
         }
         super.load(param1);
      }
      
      private function onProgressHandler(param1:ProgressEvent) : void
      {
         if(param1.bytesLoaded < param1.bytesTotal)
         {
            this.myTimer.removeEventListener(TimerEvent.TIMER,this.timerEventHandler);
            this.myTimer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.timerCompleteEventHandler);
            this.myTimer.stop();
            this.myTimer = new Timer(AnimeConstants.TIME_OUT,1);
            this.myTimer.addEventListener(TimerEvent.TIMER,this.timerEventHandler);
            this.myTimer.addEventListener(TimerEvent.TIMER_COMPLETE,this.timerCompleteEventHandler);
            this.myTimer.start();
         }
      }
      
      private function timerEventHandler(param1:TimerEvent) : void
      {
         this.close();
         this.dispatchEvent(new Event(TIME_OUT));
      }
      
      private function timerCompleteEventHandler(param1:Event) : void
      {
         if(this.myTimer != null)
         {
            if(this.myTimer.hasEventListener(TimerEvent.TIMER))
            {
               this.myTimer.removeEventListener(TimerEvent.TIMER,this.timerEventHandler);
            }
            if(this.myTimer.hasEventListener(TimerEvent.TIMER_COMPLETE))
            {
               this.myTimer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.timerCompleteEventHandler);
            }
            this.myTimer = null;
         }
      }
      
      private function onCompleteHandler(param1:Event) : void
      {
         this.timerCompleteEventHandler(null);
         this.removeAllEventListener();
      }
      
      private function onErrorHandler(param1:*) : void
      {
         if(param1 is ErrorEvent)
         {
            this.timerCompleteEventHandler(null);
            this.removeAllEventListener();
            this.dispatchEvent(param1);
         }
      }
      
      private function removeAllEventListener() : void
      {
         this.removeEventListener(IOErrorEvent.IO_ERROR,this.onErrorHandler);
         this.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onErrorHandler);
         this.removeEventListener(Event.COMPLETE,this.onCompleteHandler);
      }
   }
}
