package anifire.util
{
   public class BadwordFilter
   {
      
      private static const palette:String = "@#$&?!";
       
      
      private var _badwords:Array;
      
      private var _goodwords:Array;
      
      private var _replacement:String = "*";
      
      private var _result:Array;
      
      public function BadwordFilter(param1:Array = null, param2:String = null, param3:Array = null)
      {
         this._badwords = new Array();
         this._goodwords = new Array();
         this._result = new Array();
         super();
         this.setBadwords(param1);
         this.setGoodwords(param3);
         this.setReplacement(param2);
      }
      
      public function setBadwords(param1:Array = null) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this._badwords = param1;
         return true;
      }
      
      public function setGoodwords(param1:Array = null) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this._goodwords = param1;
         return true;
      }
      
      public function getBadwords() : Array
      {
         return this._badwords;
      }
      
      public function getGoodwords() : Array
      {
         return this._goodwords;
      }
      
      public function addBadwords(param1:Array = null) : Boolean
      {
         if(param1 != null)
         {
            this._badwords = this._badwords.concat(param1);
            return true;
         }
         return false;
      }
      
      public function setReplacement(param1:String = "") : Boolean
      {
         if(param1 == "")
         {
            return false;
         }
         this._replacement = param1;
         return true;
      }
      
      public function getReplacement() : String
      {
         return this._replacement;
      }
      
      public function filter(param1:String) : String
      {
         if(this._badwords.length < 1)
         {
            return param1;
         }
         var _loc2_:String = this.containsBadword(param1,true);
         if(_loc2_ == "")
         {
            return param1;
         }
         return _loc2_;
      }
      
      public function containsBadword(param1:String, param2:Boolean = false) : String
      {
         var _loc5_:Array = null;
         var _loc6_:String = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:String = null;
         var _loc10_:RegExp = null;
         var _loc11_:String = null;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc3_:String = "";
         param1 = param1.toLowerCase();
         var _loc4_:Array = new Array();
         _loc8_ = 0;
         while(_loc8_ < this._badwords.length)
         {
            if(this._badwords[_loc8_] != "")
            {
               _loc7_ = 0;
               _loc6_ = param1;
               _loc10_ = this.buildPattern(this._badwords[_loc8_]);
               do
               {
                  _loc5_ = _loc10_.exec(_loc6_);
                  if(_loc5_ != null)
                  {
                     _loc4_.push({
                        "index":_loc5_.index,
                        "lastIndex":_loc10_.lastIndex,
                        "result":_loc5_
                     });
                  }
               }
               while(_loc5_ != null);
               
            }
            _loc8_++;
         }
         _loc8_ = _loc4_.length - 1;
         while(_loc8_ >= 0)
         {
            _loc9_ = param1.substring(_loc4_[_loc8_].index,_loc4_[_loc8_].lastIndex);
            if(this.isWhiteword(_loc9_))
            {
               _loc4_.splice(_loc8_,1);
            }
            else if(param2)
            {
               _loc11_ = "";
               _loc12_ = _loc9_.length;
               _loc13_ = 0;
               while(_loc13_ < _loc12_)
               {
                  _loc11_ = _loc11_ + palette.charAt(Math.floor(Math.random() * palette.length));
                  _loc13_++;
               }
               param1 = param1.substring(0,_loc4_[_loc8_].index) + _loc11_ + param1.substring(_loc4_[_loc8_].lastIndex);
            }
            _loc8_--;
         }
         if(_loc4_.length > 0)
         {
            _loc3_ = param1;
         }
         return _loc3_;
      }
      
      public function isWhiteword(param1:String) : Boolean
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < this._goodwords.length)
         {
            if(param1.indexOf(this._goodwords[_loc2_]) > -1)
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      public function getMatches() : Array
      {
         return this._result;
      }
      
      public function buildPattern(param1:String) : RegExp
      {
         var _loc2_:Boolean = false;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         param1 = param1.toLowerCase();
         if(param1.substr(0,7) == "regexp:")
         {
            param1 = param1.substr(7);
            return new RegExp(param1);
         }
         _loc2_ = false;
         if(param1.substr(0,7) == "string:")
         {
            param1 = param1.substr(7);
         }
         if(param1.match(/\+(\d*)$/))
         {
            param1 = param1.replace(/\+(\d*)$/,"");
         }
         _loc3_ = new Array();
         _loc4_ = 0;
         while(_loc4_ < param1.length)
         {
            _loc3_.push(param1.charAt(_loc4_));
            _loc4_++;
         }
         _loc5_ = 0;
         while(_loc5_ < _loc3_.length)
         {
            switch(_loc3_[_loc5_])
            {
               case "a":
                  _loc3_[_loc5_] = "(a|@)";
                  break;
               case "b":
                  _loc3_[_loc5_] = "(b|d|8)";
                  break;
               case "c":
                  _loc3_[_loc5_] = "(c|x)";
                  break;
               case "i":
                  _loc3_[_loc5_] = "(i|1|\\||l)";
                  break;
               case "l":
                  _loc3_[_loc5_] = "(l|1|\\||i)";
            }
            _loc5_++;
         }
         return new RegExp("(\\w*)" + _loc3_.join("") + "(\\w*)","igm");
      }
   }
}
