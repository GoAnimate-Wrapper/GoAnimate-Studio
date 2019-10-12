package com.jumpeye.core
{
   import flash.events.Event;
   import flash.utils.Dictionary;
   import mx.flash.UIMovieClip;
   
   public dynamic class JUIComponent extends UIMovieClip
   {
      
      public static var inCallLaterPhase:Boolean = false;
       
      
      protected var callLaterMethods:Dictionary;
      
      protected var invalidateFlag:Boolean = false;
      
      protected var invalidHash:Object;
      
      public function JUIComponent()
      {
         super();
         removeEventListener(Event.ENTER_FRAME,enterFrameHandler);
         this.invalidHash = {};
         this.callLaterMethods = new Dictionary();
         this.configUI();
         this.invalidate("all");
      }
      
      public function validateNow() : void
      {
         this.invalidate("all",false);
         this.draw();
      }
      
      public function invalidate(param1:String = "all", param2:Boolean = true) : void
      {
         this.invalidHash[param1] = true;
         if(param2)
         {
            this.callLater(this.draw);
         }
      }
      
      public function drawNow() : void
      {
         this.draw();
      }
      
      protected function configUI() : void
      {
         if(numChildren > 0)
         {
            removeChildAt(0);
         }
         this.graphics.beginFill(0,0);
         this.graphics.drawRect(0,0,1,1);
         stop();
      }
      
      protected function isInvalid(param1:String, ... rest) : Boolean
      {
         if(this.invalidHash[param1] || this.invalidHash["all"])
         {
            return true;
         }
         while(rest.length > 0)
         {
            if(this.invalidHash[rest.pop()])
            {
               return true;
            }
         }
         return false;
      }
      
      protected function validate() : void
      {
         this.invalidHash = {};
      }
      
      protected function draw() : void
      {
         this.graphics.clear();
         this.enterFrameHandler(null);
         this.validate();
      }
      
      public function callLater(param1:Function, param2:Array = null) : void
      {
         if(inCallLaterPhase)
         {
            return;
         }
         this.callLaterMethods[param1] = true;
         if(stage != null)
         {
            stage.addEventListener(Event.RENDER,this.callLaterDispatcher,false,0,true);
            stage.invalidate();
         }
         else
         {
            addEventListener(Event.ADDED_TO_STAGE,this.callLaterDispatcher,false,0,true);
         }
      }
      
      private function callLaterDispatcher(param1:Event) : void
      {
         var _loc3_:* = null;
         if(param1.type == Event.ADDED_TO_STAGE)
         {
            removeEventListener(Event.ADDED_TO_STAGE,this.callLaterDispatcher);
            stage.addEventListener(Event.RENDER,this.callLaterDispatcher,false,0,true);
            stage.invalidate();
            return;
         }
         param1.target.removeEventListener(Event.RENDER,this.callLaterDispatcher);
         if(stage == null)
         {
            addEventListener(Event.ADDED_TO_STAGE,this.callLaterDispatcher,false,0,true);
            return;
         }
         inCallLaterPhase = true;
         var _loc2_:Dictionary = this.callLaterMethods;
         for(_loc3_ in _loc2_)
         {
            _loc3_();
            delete _loc2_[_loc3_];
         }
         inCallLaterPhase = false;
      }
   }
}
