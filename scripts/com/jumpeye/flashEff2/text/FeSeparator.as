package com.jumpeye.flashEff2.text
{
   import flash.display.Sprite;
   
   public dynamic class FeSeparator extends Sprite
   {
       
      
      public var properties:Object;
      
      public var text:String;
      
      public var type:String = "FeGroup";
      
      public var id:Number;
      
      public var _childs:Array;
      
      public function FeSeparator(param1:*)
      {
         super();
         init();
         _childs = [param1];
         this.text = param1.text;
         this.id = param1.id;
         this.properties = param1.properties;
         this.addChild(param1);
         param1.x = 0;
         param1.y = 0;
      }
      
      public function removeChildAtIndex(param1:uint) : Object
      {
         this.removeChildAt(param1);
         return this._childs.splice(param1,1)[0];
      }
      
      public function cleanMe() : *
      {
         var _loc2_:* = undefined;
         var _loc1_:* = 0;
         while(_loc1_ < this._childs.length)
         {
            _loc2_ = this._childs[_loc1_];
            if(_loc2_.type != "FeChar")
            {
               _loc2_.cleanMe();
            }
            if(_loc2_.numChildren == 0)
            {
               this.removeChildAtIndex(_loc1_);
            }
            else
            {
               _loc1_++;
            }
         }
      }
      
      public function removeChilds() : *
      {
         var _loc1_:uint = this._childs.length;
         var _loc2_:uint = 0;
         while(_loc2_ < _loc1_)
         {
            if(this._childs[_loc2_].type == "FeGroup")
            {
               this._childs[_loc2_].removeChilds();
            }
            this.removeChild(this._childs[_loc2_]);
            _loc2_++;
         }
         this._childs = [];
      }
      
      private function init() : *
      {
      }
   }
}
