package com.jumpeye.flashEff2.text
{
   import flash.display.Sprite;
   import flash.utils.getDefinitionByName;
   
   public class FeTable extends Sprite
   {
       
      
      private var _type:String = "FeTable";
      
      protected var _childs:Array;
      
      private var tempGroup:FeGroup;
      
      private var tempChar:FeChar;
      
      public function FeTable()
      {
         super();
         this.init();
         this._childs = [];
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function set childs(param1:Array) : void
      {
         var _loc2_:uint = param1.length;
         this._childs = [];
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            this.pushChild(param1[_loc3_]);
            _loc3_++;
         }
      }
      
      public function get childs() : Array
      {
         return this._childs;
      }
      
      private function init() : *
      {
      }
      
      public function pushChild(param1:Object) : Object
      {
         var classInstance:Class = null;
         var child:* = undefined;
         var arg:Object = param1;
         var className:String = arg.type;
         try
         {
            classInstance = getDefinitionByName("com.jumpeye.flashEff2.text." + className) as Class;
            child = new classInstance(arg.x,arg.y,arg);
            this.addChild(child);
            this._childs.push(child);
         }
         catch(e:*)
         {
            throw e;
         }
         return child;
      }
      
      public function removeChildAtIndex(param1:uint) : Object
      {
         this.removeChildAt(param1);
         return this._childs.splice(param1,1)[0];
      }
      
      public function removeChilds() : void
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
      
      public function cleanMe() : void
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
   }
}
