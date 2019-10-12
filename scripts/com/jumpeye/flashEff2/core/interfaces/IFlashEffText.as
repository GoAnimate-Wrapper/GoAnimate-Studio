package com.jumpeye.flashEff2.core.interfaces
{
   import flash.text.TextField;
   
   public class IFlashEffText extends IFlashEffSymbolText
   {
       
      
      protected var _partialBlurAmount:Number = 0;
      
      protected var _partialStart:Number = 50;
      
      protected var _partialGroup:String = "letters";
      
      protected var _partialPercent:Number = 100;
      
      protected var _selectedStrings:Array;
      
      protected var _target:TextField;
      
      public function IFlashEffText()
      {
         super();
      }
      
      public function get partialPercent() : Number
      {
         return this._partialPercent;
      }
      
      public function get partialBlurAmount() : Number
      {
         return this._partialBlurAmount;
      }
      
      public function set partialPercent(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         else if(param1 > 100)
         {
            param1 = 100;
         }
         this._partialPercent = param1;
      }
      
      public function set partialStart(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         else if(param1 > 100)
         {
            param1 = 100;
         }
         this._partialStart = param1;
      }
      
      public function set selectedStrings(param1:Array) : void
      {
         this._selectedStrings = param1;
      }
      
      public function get target() : TextField
      {
         return this._target;
      }
      
      public function set partialBlurAmount(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         this._partialBlurAmount = param1;
      }
      
      public function get partialStart() : Number
      {
         return this._partialStart;
      }
      
      public function set target(param1:TextField) : void
      {
         this._target = param1;
      }
      
      public function get selectedStrings() : Array
      {
         return this._selectedStrings;
      }
      
      public function set partialGroup(param1:String) : void
      {
         this._partialGroup = param1;
      }
      
      public function get partialGroup() : String
      {
         return this._partialGroup;
      }
   }
}
