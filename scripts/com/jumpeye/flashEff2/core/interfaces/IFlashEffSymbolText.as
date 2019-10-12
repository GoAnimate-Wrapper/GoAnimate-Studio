package com.jumpeye.flashEff2.core.interfaces
{
   import flash.utils.getDefinitionByName;
   
   public class IFlashEffSymbolText extends IFlashEffPattern
   {
       
      
      protected var _tweenDuration:Number = 1.7;
      
      protected var _tweenType:String = "Strong";
      
      protected var _easeType:String = "easeInOut";
      
      public function IFlashEffSymbolText()
      {
         super();
      }
      
      public function hide() : void
      {
      }
      
      public function remove() : void
      {
      }
      
      public function get tweenType() : String
      {
         return this._tweenType;
      }
      
      public function get easeType() : String
      {
         return this._easeType;
      }
      
      public function set tweenType(param1:String) : void
      {
         this._tweenType = param1;
      }
      
      public function set easeType(param1:String) : void
      {
         this._easeType = param1;
      }
      
      public function get easeFunc() : Function
      {
         var easeFunc:* = undefined;
         try
         {
            easeFunc = getDefinitionByName("com.jumpeye.transitions.easing." + this.tweenType) as Class;
            return easeFunc[this.easeType];
         }
         catch(e:ReferenceError)
         {
            throw "FlashEff2 WARNING:  The selected ease function is not in the Library ! Please drag the " + this.tweenType + "Ease from the Components panel over the Library panel.";
         }
         return null;
      }
      
      public function show() : void
      {
      }
      
      public function set tweenDuration(param1:Number) : void
      {
         if(param1 < 0.001)
         {
            param1 = 0.001;
         }
         this._tweenDuration = param1;
      }
      
      public function get tweenDuration() : Number
      {
         return this._tweenDuration;
      }
   }
}
