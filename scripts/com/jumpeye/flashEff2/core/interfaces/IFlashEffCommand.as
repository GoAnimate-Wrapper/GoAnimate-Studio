package com.jumpeye.flashEff2.core.interfaces
{
   import flash.display.DisplayObject;
   
   public class IFlashEffCommand extends IFlashEffPattern
   {
       
      
      protected var _target:DisplayObject;
      
      private var _commandEventType:String;
      
      public function IFlashEffCommand()
      {
         super();
      }
      
      public function run() : void
      {
      }
      
      public function set target(param1:DisplayObject) : void
      {
         this._target = param1;
      }
      
      public function get target() : DisplayObject
      {
         return this._target;
      }
      
      public function get commandEventType() : String
      {
         return this._commandEventType;
      }
      
      public function set commandEventType(param1:String) : void
      {
         this._commandEventType = param1;
      }
   }
}
