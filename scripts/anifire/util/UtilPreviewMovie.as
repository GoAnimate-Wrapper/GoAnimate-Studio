package anifire.util
{
   import anifire.models.creator.CCCharacterActionModel;
   import flash.utils.ByteArray;
   import mx.utils.Base64Decoder;
   import mx.utils.Base64Encoder;
   
   public class UtilPreviewMovie
   {
      
      private static const ITEM_TYPE_HASHARRAY:String = "3";
      
      private static const ITEM_TYPE_ARRAY:String = "2";
      
      private static const ITEM_TYPE_OBJECT:String = "4";
      
      private static const ITEM_TYPE_XML:String = "5";
      
      private static const ITEM_TYPE_BYTE_ARRAY:String = "1";
      
      private static const ITEM_TYPE_NULL:String = "0";
      
      private static const ITEM_TYPE_STRING:String = "6";
      
      private static const ITEM_TYPE_HASHBYTES:String = "7";
      
      private static const ITEM_TYPE_CAM:String = "8";
      
      private static const SPLIT_LENGTH:int = 300;
      
      private static const DELIMITER:String = "DELIMITERoooooooooDELIMITER\n";
       
      
      public function UtilPreviewMovie()
      {
         super();
      }
      
      public static function serializeSingleImageData(param1:String, param2:Object) : String
      {
         var _loc4_:Object = null;
         var _loc5_:int = 0;
         var _loc6_:ByteArray = null;
         var _loc7_:Base64Encoder = null;
         var _loc8_:Array = null;
         var _loc9_:UtilHashArray = null;
         var _loc10_:UtilHashBytes = null;
         var _loc11_:XML = null;
         var _loc12_:String = null;
         var _loc13_:* = null;
         var _loc3_:* = "";
         if(param2 == null)
         {
            _loc3_ = _loc3_ + "<item type=\"" + ITEM_TYPE_NULL + "\" id=\"" + xmlEscape(param1) + "\" />";
         }
         else if(param2 is CCCharacterActionModel)
         {
            _loc3_ = _loc3_ + "<item type=\"" + ITEM_TYPE_CAM + "\" id=\"" + xmlEscape(param1) + "\">";
            _loc3_ = _loc3_ + xmlEscape(CCCharacterActionModel(param2).serialize().toXMLString());
            _loc3_ = _loc3_ + "</item>";
         }
         else if(param2 is ByteArray)
         {
            _loc6_ = param2 as ByteArray;
            _loc7_ = new Base64Encoder();
            _loc7_.reset();
            _loc7_.encodeBytes(_loc6_);
            _loc3_ = _loc3_ + "<item type=\"" + ITEM_TYPE_BYTE_ARRAY + "\" id=\"" + xmlEscape(param1) + "\">" + xmlEscape(_loc7_.toString()) + "</item>";
         }
         else if(param2 is Array)
         {
            _loc8_ = param2 as Array;
            _loc3_ = _loc3_ + "<item type=\"" + ITEM_TYPE_ARRAY + "\" id=\"" + xmlEscape(param1) + "\">";
            _loc5_ = 0;
            while(_loc5_ < _loc8_.length)
            {
               _loc4_ = _loc8_[_loc5_];
               _loc3_ = _loc3_ + serializeSingleImageData("",_loc4_);
               _loc5_++;
            }
            _loc3_ = _loc3_ + "</item>";
         }
         else if(param2 is UtilHashArray)
         {
            _loc9_ = param2 as UtilHashArray;
            _loc3_ = _loc3_ + "<item type=\"" + ITEM_TYPE_HASHARRAY + "\" id=\"" + xmlEscape(param1) + "\">";
            _loc5_ = 0;
            while(_loc5_ < _loc9_.length)
            {
               _loc4_ = _loc9_.getValueByIndex(_loc5_);
               _loc3_ = _loc3_ + serializeSingleImageData(_loc9_.getKey(_loc5_),_loc4_);
               _loc5_++;
            }
            _loc3_ = _loc3_ + "</item>";
         }
         else if(param2 is UtilHashBytes)
         {
            _loc10_ = param2 as UtilHashBytes;
            _loc3_ = _loc3_ + "<item type=\"" + ITEM_TYPE_HASHBYTES + "\" id=\"" + xmlEscape(param1) + "\">";
            _loc5_ = 0;
            while(_loc5_ < _loc10_.length)
            {
               _loc4_ = _loc10_.getValueByIndex(_loc5_);
               _loc3_ = _loc3_ + serializeSingleImageData(_loc10_.getKey(_loc5_),_loc4_);
               _loc5_++;
            }
            _loc3_ = _loc3_ + "</item>";
         }
         else if(param2 is XML)
         {
            _loc11_ = param2 as XML;
            _loc3_ = _loc3_ + "<item type=\"" + ITEM_TYPE_XML + "\" id=\"" + xmlEscape(param1) + "\">" + xmlEscape(_loc11_.toXMLString()) + "</item>";
         }
         else if(param2 is String)
         {
            _loc12_ = param2 as String;
            _loc3_ = _loc3_ + "<item type=\"" + ITEM_TYPE_STRING + "\" id=\"" + xmlEscape(param1) + "\">" + xmlEscape(_loc12_) + "</item>";
         }
         else if(param2 is Object)
         {
            _loc3_ = _loc3_ + "<item type=\"" + ITEM_TYPE_OBJECT + "\" id=\"" + xmlEscape(param1) + "\">";
            for(_loc13_ in param2)
            {
               _loc3_ = _loc3_ + serializeSingleImageData(_loc13_,param2[_loc13_]);
            }
            _loc3_ = _loc3_ + "</item>";
         }
         return _loc3_;
      }
      
      public static function deserializeSingleImageData(param1:XML) : Object
      {
         var _loc3_:XML = null;
         var _loc4_:Base64Decoder = null;
         var _loc5_:Array = null;
         var _loc6_:UtilHashArray = null;
         var _loc7_:UtilHashBytes = null;
         var _loc8_:CCCharacterActionModel = null;
         var _loc9_:Object = null;
         var _loc2_:String = param1.@type;
         if(_loc2_ == ITEM_TYPE_BYTE_ARRAY)
         {
            _loc4_ = new Base64Decoder();
            _loc4_.reset();
            _loc4_.decode(xmlUnescape(param1.toString()));
            return _loc4_.toByteArray();
         }
         if(_loc2_ == ITEM_TYPE_ARRAY)
         {
            _loc5_ = new Array();
            for each(_loc3_ in param1.child("item"))
            {
               _loc5_.push(deserializeSingleImageData(_loc3_));
            }
            return _loc5_;
         }
         if(_loc2_ == ITEM_TYPE_HASHARRAY)
         {
            _loc6_ = new UtilHashArray();
            for each(_loc3_ in param1.child("item"))
            {
               _loc6_.push(xmlUnescape(_loc3_.@id),deserializeSingleImageData(_loc3_));
            }
            return _loc6_;
         }
         if(_loc2_ == ITEM_TYPE_HASHBYTES)
         {
            _loc7_ = new UtilHashBytes();
            for each(_loc3_ in param1.child("item"))
            {
               _loc7_.push(xmlUnescape(_loc3_.@id),deserializeSingleImageData(_loc3_) as ByteArray);
            }
            return _loc7_;
         }
         if(_loc2_ == ITEM_TYPE_XML)
         {
            return new XML(xmlUnescape(param1.toString()));
         }
         if(_loc2_ == ITEM_TYPE_STRING)
         {
            return xmlUnescape(param1.toString());
         }
         if(_loc2_ == ITEM_TYPE_CAM)
         {
            _loc8_ = new CCCharacterActionModel();
            _loc8_.deserialize(new XML(xmlUnescape(param1.toString())));
            return _loc8_;
         }
         if(_loc2_ == ITEM_TYPE_OBJECT)
         {
            _loc9_ = new Object();
            for each(_loc3_ in param1.child("item"))
            {
               _loc9_[xmlUnescape(_loc3_.@id)] = deserializeSingleImageData(_loc3_);
            }
            return _loc9_;
         }
         return null;
      }
      
      public static function serializePreviewMovieData(param1:XML, param2:UtilHashArray, param3:UtilHashArray) : String
      {
         var _loc4_:int = 0;
         var _loc5_:Object = null;
         var _loc6_:XML = null;
         var _loc7_:String = null;
         var _loc8_:Base64Encoder = new Base64Encoder();
         var _loc9_:* = "<filmxml>" + xmlEscape(param1.toXMLString()) + "</filmxml>";
         var _loc10_:* = "<imagedata>";
         _loc4_ = 0;
         while(_loc4_ < param2.length)
         {
            _loc7_ = param2.getKey(_loc4_);
            _loc5_ = param2.getValueByIndex(_loc4_);
            _loc10_ = _loc10_ + serializeSingleImageData(_loc7_,_loc5_);
            _loc4_++;
         }
         _loc10_ = _loc10_ + "</imagedata>";
         var _loc11_:* = "<themexml>";
         _loc4_ = 0;
         while(_loc4_ < param3.length)
         {
            _loc7_ = param3.getKey(_loc4_);
            _loc6_ = param3.getValueByIndex(_loc4_) as XML;
            if(_loc6_ != null)
            {
               _loc11_ = _loc11_ + "<item id=\"" + xmlEscape(_loc7_) + "\">" + xmlEscape(_loc6_.toXMLString()) + "</item>";
            }
            _loc4_++;
         }
         _loc11_ = _loc11_ + "</themexml>";
         var _loc12_:* = "<?xml version=\"1.0\" encoding=\"utf-8\"?><data>" + _loc9_ + _loc10_ + _loc11_ + "</data>";
         return _loc12_;
      }
      
      public static function splitStr(param1:String) : String
      {
         var _loc2_:String = "";
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_ = _loc2_ + param1.substr(_loc3_,SPLIT_LENGTH);
            _loc2_ = _loc2_ + DELIMITER;
            _loc3_ = _loc3_ + SPLIT_LENGTH;
         }
         return _loc2_;
      }
      
      public static function combineStr(param1:String) : String
      {
         return param1.replace(new RegExp(DELIMITER,"g"),"");
      }
      
      public static function deserializePreviewMovieData(param1:String, param2:Array, param3:UtilHashArray, param4:UtilHashArray) : void
      {
         var _loc9_:ByteArray = null;
         var _loc10_:XML = null;
         var _loc11_:XMLList = null;
         var _loc12_:XML = null;
         var _loc5_:XML = new XML(param1);
         var _loc6_:String = _loc5_.child("filmxml")[0].toString();
         var _loc7_:XML = new XML(xmlUnescape(_loc6_));
         param2.push(_loc7_);
         var _loc8_:XMLList = _loc5_.child("imagedata") as XMLList;
         for each(_loc10_ in _loc8_.child("item"))
         {
            param3.push(xmlUnescape(_loc10_.attribute("id")[0].toString()),deserializeSingleImageData(_loc10_));
         }
         _loc11_ = _loc5_.child("themexml");
         for each(_loc12_ in _loc11_.child("item"))
         {
            param4.push(xmlUnescape(_loc12_.attribute("id")[0]),new XML(xmlUnescape(_loc12_.toString())));
         }
      }
      
      private static function xmlEscape(param1:String) : String
      {
         return escape(param1);
      }
      
      private static function xmlUnescape(param1:String) : String
      {
         return unescape(param1);
      }
   }
}
