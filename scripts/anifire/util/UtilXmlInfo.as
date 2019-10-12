package anifire.util
{
   import anifire.constant.AnimeConstants;
   
   public class UtilXmlInfo
   {
       
      
      public function UtilXmlInfo()
      {
         super();
      }
      
      public static function getThemeIdFromFileName(param1:String) : String
      {
         return param1.split(".")[0];
      }
      
      public static function getThumbIdFromFileName(param1:String) : String
      {
         var _loc2_:String = ".";
         var _loc3_:Array = param1.split(_loc2_);
         if(param1.indexOf(".head.") != -1)
         {
            return String(_loc3_[_loc3_.length - 4]) + _loc2_ + String(_loc3_[_loc3_.length - 3]) + _loc2_ + String(_loc3_[_loc3_.length - 2]) + _loc2_ + String(_loc3_[_loc3_.length - 1]);
         }
         return (_loc3_[_loc3_.length - 2] as String) + _loc2_ + (_loc3_[_loc3_.length - 1] as String);
      }
      
      public static function getFacialThumbIdFromFileName(param1:String) : String
      {
         var _loc2_:String = ".";
         var _loc3_:Array = param1.split(_loc2_);
         return (_loc3_[0] as String) + _loc2_ + (_loc3_[1] as String);
      }
      
      public static function getFacialIdFromFileName(param1:String) : String
      {
         var _loc2_:String = ".";
         var _loc3_:Array = param1.split(_loc2_);
         var _loc4_:String = _loc3_[_loc3_.length - 1] as String;
         if(_loc4_ == "zip")
         {
            _loc4_ = "xml";
         }
         return (_loc3_[_loc3_.length - 2] as String) + _loc2_ + _loc4_;
      }
      
      public static function getFileNameExtension(param1:String) : String
      {
         var _loc2_:String = ".";
         var _loc3_:Array = param1.split(_loc2_);
         return _loc3_[_loc3_.length - 1];
      }
      
      public static function getCharIdFromFileName(param1:String) : String
      {
         var _loc2_:String = ".";
         var _loc3_:Array = param1.split(_loc2_);
         return _loc3_[_loc3_.length - 3] as String;
      }
      
      public static function getCharIdFromFacialFileName(param1:String) : String
      {
         var _loc2_:String = ".";
         var _loc3_:Array = param1.split(_loc2_);
         return _loc3_[_loc3_.length - 4] as String;
      }
      
      public static function getPropIdFromFileName(param1:String) : String
      {
         var _loc2_:String = ".";
         var _loc3_:Array = param1.split(_loc2_);
         if(_loc3_.length > 3)
         {
            return _loc3_[_loc3_.length - 3] as String;
         }
         return _loc3_[_loc3_.length - 2] + "." + _loc3_[_loc3_.length - 1];
      }
      
      public static function getPropStateIdFromFileName(param1:String) : String
      {
         var _loc2_:String = ".";
         var _loc3_:Array = param1.split(_loc2_);
         if(_loc3_.length > 3)
         {
            return _loc3_[_loc3_.length - 2] + "." + _loc3_[_loc3_.length - 1];
         }
         return null;
      }
      
      public static function getThemeIdFromThemeXML(param1:XML) : String
      {
         return param1.attribute("id");
      }
      
      public static function getAndSortXMLattribute(param1:XML, param2:String, param3:String = null) : Array
      {
         var _loc7_:XML = null;
         var _loc4_:Array = new Array();
         var _loc5_:XMLList = param1.elements();
         if(_loc5_ == null)
         {
            return _loc4_;
         }
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_.length())
         {
            _loc7_ = _loc5_[_loc6_];
            if(_loc7_.name() == param3 || param3 == null)
            {
               if(_loc7_.attribute(param2).length() > 0)
               {
                  _loc4_.push(Number(_loc7_.attribute(param2).toString()));
               }
            }
            _loc6_++;
         }
         _loc4_.sort(Array.NUMERIC);
         return _loc4_;
      }
      
      public static function getZipFileNameOfBg(param1:String) : String
      {
         return param1.replace(".",".bg.");
      }
      
      public static function getZipFileNameOfProp(param1:String) : String
      {
         return param1.replace(".",".prop.");
      }
      
      public static function getZipFileNameOfSound(param1:String) : String
      {
         return param1.replace(".",".sound.");
      }
      
      public static function getZipFileNameOfBehaviour(param1:String, param2:Boolean) : String
      {
         var _loc3_:String = !!param2?"char":"prop";
         return param1.replace(".","." + _loc3_ + ".");
      }
      
      public static function getCompFileNameOfBehaviour(param1:String) : String
      {
         var _loc2_:Array = param1.split(".");
         return _loc2_[0] + "." + AnimeConstants.ASSET_TYPE_CHAR + "." + _loc2_[2] + "." + _loc2_[_loc2_.length - 1];
      }
      
      public static function getZipFileNameOfEffect(param1:String) : String
      {
         return param1.replace(".",".effect.");
      }
      
      public static function getZipFileNameOfSegment(param1:String) : String
      {
         return param1.replace(".",".segment.");
      }
      
      public static function generateBehaviourFileName(param1:String, param2:String, param3:String) : String
      {
         return param1 + "." + param2 + "." + param3;
      }
      
      public static function xmlEscape(param1:String) : String
      {
         if(param1 != null)
         {
            param1 = param1.replace(/&/g,"&amp;");
            param1 = param1.replace(/"/g,"&quot;");
            param1 = param1.replace(/'/g,"&#039;");
            param1 = param1.replace(/</g,"&lt;");
            param1 = param1.replace(/>/g,"&gt;");
         }
         return param1;
      }
      
      public static function getPropXMLfromThemeXML(param1:String, param2:UtilHashArray) : XML
      {
         var propFileName:String = param1;
         var themeXmls:UtilHashArray = param2;
         var splitedPropFilename:Array = propFileName.split(".");
         var themeId:String = splitedPropFilename[0] as String;
         var themeXML:XML = themeXmls.getValueByKey(themeId) as XML;
         var propId:String = (splitedPropFilename[splitedPropFilename.length - 2] as String) + "." + (splitedPropFilename[splitedPropFilename.length - 1] as String);
         return XMLList(themeXML.prop.(@id == propId))[0];
      }
      
      public static function convertUploadedAssetXmlToThumbXml(param1:XML) : XML
      {
         var _loc2_:* = "";
         if(param1.child("type") == "prop")
         {
            _loc2_ = "<prop" + " id=\"" + param1.child("file") + "\"" + " name=\"" + xmlEscape(param1.child("title")) + "\"" + " holdable=\"" + param1.child("holdable") + "\"" + " placeable=\"" + param1.child("placeable") + "\"" + " width=\"" + param1.child("width") + "\"" + " height=\"" + param1.child("height") + "\"" + " duration=\"" + param1.child("duration") + "\"" + " facing=\"" + "left" + "\"" + " thumb=\"" + "" + "\"" + " />";
         }
         return new XML(_loc2_);
      }
      
      public static function createThemeXml(param1:String, param2:String) : XML
      {
         return new XML("<?xml version=\"1.0\" encoding=\"utf-8\"?><theme id=\"" + UtilXmlInfo.xmlEscape(param1) + "\" name=\"" + UtilXmlInfo.xmlEscape(param2) + "\" />");
      }
      
      public static function merge2ThemeXml(param1:XML, param2:XML, param3:String, param4:String, param5:Boolean = false) : XML
      {
         var i:int = 0;
         var curNode:XML = null;
         var mergedThemeXML:XML = null;
         var newXmlChildLength:Number = NaN;
         var existingCurNode:XML = null;
         var curTypeXML:XMLList = null;
         var curNodeName:String = null;
         var oldXML:XML = param1;
         var newXML:XML = param2;
         var themeId:String = param3;
         var themeName:String = param4;
         var shouldReplaceOldXml:Boolean = param5;
         if(oldXML == null)
         {
            oldXML = createThemeXml(themeId,themeName);
         }
         if(newXML == null)
         {
            newXML = createThemeXml(themeId,themeName);
         }
         if(shouldReplaceOldXml)
         {
            mergedThemeXML = oldXML;
         }
         else
         {
            mergedThemeXML = oldXML.copy();
         }
         var listNodeName:String = "";
         newXmlChildLength = newXML.children().length();
         i = 0;
         while(i < newXmlChildLength)
         {
            curNode = newXML.children()[i] as XML;
            existingCurNode = null;
            curNodeName = curNode.name();
            if(curNodeName != listNodeName)
            {
               curTypeXML = mergedThemeXML.child(curNodeName) as XMLList;
               listNodeName = curNodeName;
            }
            existingCurNode = curTypeXML.(@id == curNode.@id)[0] as XML;
            if(existingCurNode != null)
            {
               if(curNode.children().length() >= existingCurNode.children().length())
               {
                  existingCurNode.setName("DELETED_NODE");
                  mergedThemeXML.appendChild(curNode.copy());
               }
            }
            else
            {
               mergedThemeXML.appendChild(curNode.copy());
            }
            i++;
         }
         return mergedThemeXML;
      }
      
      public static function cdata(param1:String) : String
      {
         var _loc2_:* = "<![CDATA[" + param1 + "]]>";
         return _loc2_;
      }
      
      public static function cdataXML(param1:String) : XML
      {
         var _loc2_:XML = new XML("<![CDATA[" + param1 + "]]>");
         return _loc2_;
      }
      
      public static function getSuffixFromStateIdByThumbId(param1:String, param2:String) : String
      {
         var _loc3_:Number = param1.length + 1;
         return param2.substring(_loc3_);
      }
   }
}
