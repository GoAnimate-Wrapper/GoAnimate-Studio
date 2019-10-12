package com.jumpeye.flashEff2.core.interfaces
{
   import flash.display.DisplayObject;
   import flash.utils.getDefinitionByName;
   
   public class IFlashEffButtonEffect extends IFlashEffPattern
   {
       
      
      protected var _tweenDuration:Number = 0.3;
      
      protected var _easeType:String = "easeOut";
      
      protected var _tweenType:String = "Linear";
      
      protected var _target:DisplayObject;
      
      public function IFlashEffButtonEffect()
      {
         super();
      }
      
      public function remove() : void
      {
      }
      
      public function apply() : void
      {
      }
      
      public function buttonRollOver() : void
      {
      }
      
      public function buttonRollOut() : void
      {
      }
      
      public function buttonPress() : void
      {
      }
      
      public function buttonRelease() : void
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
      
      public function set easeType(param1:String) : void
      {
         this._easeType = param1;
      }
      
      public function get easeType() : String
      {
         return this._easeType;
      }
      
      public function set tweenType(param1:String) : void
      {
         this._tweenType = param1;
      }
      
      public function get tweenType() : String
      {
         return this._tweenType;
      }
      
      public function set tweenDuration(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         this._tweenDuration = param1;
      }
      
      public function get tweenDuration() : Number
      {
         return this._tweenDuration;
      }
      
      protected function get easeFunc() : Function
      {
         var easeFunc:* = undefined;
         try
         {
            easeFunc = getDefinitionByName("com.jumpeye.transitions.easing." + this._tweenType) as Class;
            return easeFunc[this._easeType];
         }
         catch(e:ReferenceError)
         {
            throw "FlashEff2 WARNING: The selected ease function is not in the Library ! Please drag the " + this.tweenType + "Ease from the Components panel over the Library panel.";
         }
         return null;
      }
   }
}
