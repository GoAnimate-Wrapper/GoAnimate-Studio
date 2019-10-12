package anifire.core
{
   public class AssetLinkage
   {
      
      public static const LINK:String = "~~~";
      
      public static const XML_TAG:String = "linkage";
       
      
      private var _relationship:Array;
      
      public function AssetLinkage()
      {
         super();
         this._relationship = new Array();
      }
      
      public static function getSceneIdFromLinkage(param1:String) : String
      {
         return param1.split(LINK)[0];
      }
      
      public static function getCharIdFromLinkage(param1:String) : String
      {
         return param1.split(LINK)[1];
      }
      
      public function addLinkage(param1:String) : void
      {
         if(this._relationship.indexOf(param1) == -1)
         {
            this._relationship.push(param1);
         }
      }
      
      public function removeLinkage(param1:String) : String
      {
         return this._relationship.splice(this._relationship.indexOf(param1),1);
      }
      
      public function getSceneAndCharId() : Array
      {
         var _loc1_:Array = new Array();
         var _loc2_:int = 0;
         while(_loc2_ < this._relationship.length)
         {
            if(String(this._relationship[_loc2_]).indexOf(LINK) > -1)
            {
               _loc1_.push(this._relationship[_loc2_]);
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function getSceneId() : Array
      {
         var _loc3_:String = null;
         var _loc1_:Array = new Array();
         var _loc2_:int = 0;
         while(_loc2_ < this._relationship.length)
         {
            if(String(this._relationship[_loc2_]).indexOf(LINK) > -1)
            {
               _loc3_ = getSceneIdFromLinkage(this._relationship[_loc2_]);
               if(_loc3_ != "")
               {
                  _loc1_.push(_loc3_);
               }
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function getCharId() : Array
      {
         var _loc3_:String = null;
         var _loc1_:Array = new Array();
         var _loc2_:int = 0;
         while(_loc2_ < this._relationship.length)
         {
            if(String(this._relationship[_loc2_]).indexOf(LINK) > -1)
            {
               _loc3_ = getCharIdFromLinkage(String(this._relationship[_loc2_]));
               if(_loc3_ != "")
               {
                  _loc1_.push(_loc3_);
               }
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function getSoundId() : String
      {
         var _loc1_:String = null;
         var _loc2_:int = 0;
         while(_loc2_ < this._relationship.length)
         {
            if(String(this._relationship[_loc2_]).indexOf(LINK) == -1)
            {
               _loc1_ = this._relationship[_loc2_];
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function replaceBySoundId(param1:String) : void
      {
         this._relationship.splice(0,1,param1);
      }
      
      public function getLinkage() : Array
      {
         return this._relationship;
      }
      
      public function convertToXml() : XML
      {
         var _loc1_:XML = new XML();
         if(this._relationship.length >= 2)
         {
            _loc1_ = <linkage>{this._relationship.join(",")}</linkage>;
         }
         return _loc1_;
      }
      
      public function serialize() : String
      {
         return this.convertToXml().toXMLString();
      }
      
      public function deserialize(param1:String) : void
      {
         if(param1 != null)
         {
            this._relationship = param1.split(",");
         }
      }
   }
}
