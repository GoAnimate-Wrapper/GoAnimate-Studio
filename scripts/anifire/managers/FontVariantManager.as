package anifire.managers
{
   import anifire.util.FontManager;
   import anifire.util.InputLanguage;
   import flash.text.Font;
   
   public class FontVariantManager
   {
      
      public static const LANGUAGE_LATIN:String = "Latin";
      
      public static const LANGUAGE_ARABIC:String = "Arabic";
      
      public static const LANGUAGE_HEBREW:String = "Hebrew";
      
      public static const LANGUAGE_THAI:String = "Thai";
      
      public static const LANGUAGE_TELUGU:String = "Telugu";
      
      public static const LANGUAGE_TAMIL:String = "Tamil";
      
      public static const LANGUAGE_BENGALI:String = "Bengali";
      
      public static const LANGUAGE_DEVANAGARI:String = "Devanagari";
      
      public static const LANGUAGE_CHINESE:String = "CJK Unified Ideographs";
      
      public static const LANGUAGE_JAPANESE:String = "Japanese";
      
      public static const LANGUAGE_KOREAN:String = "Hangul";
      
      public static const LANGUAGE_UNKNOWN:String = "unknown";
      
      public static const FONT_VARIANT_NOTO_SANS_LATIN:String = "NotoSans";
      
      public static const FONT_VARIANT_NOTO_NASKH_ARABIC:String = "NotoNaskhArabic";
      
      public static const FONT_VARIANT_NOTO_SANS_HEBREW:String = "NotoSansHebrew";
      
      public static const FONT_VARIANT_NOTO_SANS_THAI:String = "NotoSansThai";
      
      public static const FONT_VARIANT_NOTO_SANS_TELUGU:String = "NotoSansTelugu";
      
      public static const FONT_VARIANT_NOTO_SANS_TAMIL:String = "NotoSansTamil";
      
      public static const FONT_VARIANT_NOTO_SANS_BENGALI:String = "NotoSansBengali";
      
      public static const FONT_VARIANT_NOTO_SANS_DEVANAGARI:String = "NotoSansDevanagari";
      
      public static const FONT_VARIANT_NOTO_CJK_TC:String = "NotoSansCJKtc";
      
      private static const SUPPORTED_LANGUAGES:Array = [LANGUAGE_LATIN,LANGUAGE_ARABIC,LANGUAGE_HEBREW,LANGUAGE_THAI,LANGUAGE_TELUGU,LANGUAGE_TAMIL,LANGUAGE_BENGALI,LANGUAGE_DEVANAGARI,LANGUAGE_CHINESE,LANGUAGE_JAPANESE,LANGUAGE_KOREAN];
      
      private static const FONT_LANGUAGE_LOOKUP:Object = {"Noto":{
         "Latin":FONT_VARIANT_NOTO_SANS_LATIN,
         "Arabic":FONT_VARIANT_NOTO_NASKH_ARABIC,
         "Hebrew":FONT_VARIANT_NOTO_SANS_HEBREW,
         "Thai":FONT_VARIANT_NOTO_SANS_THAI,
         "Telugu":FONT_VARIANT_NOTO_SANS_TELUGU,
         "Tamil":FONT_VARIANT_NOTO_SANS_TAMIL,
         "Bengali":FONT_VARIANT_NOTO_SANS_BENGALI,
         "Devanagari":FONT_VARIANT_NOTO_SANS_DEVANAGARI,
         "CJK Unified Ideographs":FONT_VARIANT_NOTO_CJK_TC,
         "Japanese":FONT_VARIANT_NOTO_CJK_TC,
         "Hangul":FONT_VARIANT_NOTO_CJK_TC
      }};
      
      private static var __instance:FontVariantManager;
       
      
      public function FontVariantManager()
      {
         super();
      }
      
      public static function get instance() : FontVariantManager
      {
         if(!__instance)
         {
            __instance = new FontVariantManager();
         }
         return __instance;
      }
      
      public function isVariantOfFont(param1:String, param2:String) : Boolean
      {
         if(param2 != FontManager.FONT_NAME_NOTO)
         {
            return false;
         }
         switch(param1)
         {
            case FONT_VARIANT_NOTO_SANS_LATIN:
            case FONT_VARIANT_NOTO_NASKH_ARABIC:
            case FONT_VARIANT_NOTO_SANS_HEBREW:
            case FONT_VARIANT_NOTO_SANS_THAI:
            case FONT_VARIANT_NOTO_SANS_TELUGU:
            case FONT_VARIANT_NOTO_SANS_TAMIL:
            case FONT_VARIANT_NOTO_SANS_BENGALI:
            case FONT_VARIANT_NOTO_SANS_DEVANAGARI:
            case FONT_VARIANT_NOTO_CJK_TC:
               return true;
            default:
               return false;
         }
      }
      
      public function textContainsInternationalCharacter(param1:String) : Boolean
      {
         var _loc4_:Number = NaN;
         var _loc2_:int = param1.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.charCodeAt(_loc3_);
            if(_loc4_ > 591)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function lookupFontLanguageVariant(param1:String, param2:String) : String
      {
         if(param1 != FontManager.FONT_NAME_NOTO || !param2)
         {
            return null;
         }
         var _loc3_:String = this.getSupportedDominantLanguageName(param2);
         if(!_loc3_)
         {
            return FONT_LANGUAGE_LOOKUP[param1][LANGUAGE_LATIN];
         }
         return FONT_LANGUAGE_LOOKUP[param1][_loc3_];
      }
      
      public function getSupportedDominantLanguageName(param1:String) : String
      {
         var _loc2_:InputLanguage = null;
         var _loc3_:* = null;
         var _loc4_:String = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:* = false;
         var _loc9_:Object = null;
         if(!param1)
         {
            return null;
         }
         var _loc8_:Object = this.getLanguagesFromText(param1);
         for(_loc3_ in _loc8_)
         {
            _loc9_ = _loc8_[_loc3_];
            _loc6_ = _loc9_.charCount;
            _loc2_ = _loc9_.language;
            _loc7_ = SUPPORTED_LANGUAGES.indexOf(_loc3_) >= 0;
            if(_loc7_ && _loc6_ > _loc5_)
            {
               _loc5_ = _loc6_;
               _loc4_ = _loc3_;
            }
         }
         return _loc4_;
      }
      
      public function logLanguageUsage(param1:String, param2:Font) : void
      {
         var _loc3_:int = 0;
         var _loc4_:InputLanguage = null;
         var _loc5_:* = null;
         var _loc6_:String = null;
         var _loc7_:InputLanguage = null;
         var _loc8_:int = 0;
         var _loc9_:Boolean = false;
         var _loc11_:Object = null;
         var _loc13_:int = 0;
         var _loc15_:Object = null;
         var _loc16_:* = false;
         if(!param1 || !param2)
         {
            return;
         }
         var _loc10_:AmplitudeAnalyticsManager = AmplitudeAnalyticsManager.instance;
         var _loc12_:Array = [];
         var _loc14_:Object = this.getLanguagesFromText(param1);
         for(_loc5_ in _loc14_)
         {
            _loc15_ = _loc14_[_loc5_];
            _loc13_ = _loc15_.charCount;
            _loc4_ = _loc15_.language;
            if(_loc6_)
            {
               _loc9_ = true;
            }
            if(_loc13_ > _loc8_)
            {
               _loc8_ = _loc13_;
               _loc6_ = _loc5_;
               _loc7_ = _loc4_;
            }
            if(_loc5_ != LANGUAGE_LATIN)
            {
               _loc16_ = SUPPORTED_LANGUAGES.indexOf(_loc5_) >= 0;
               _loc11_ = {
                  "character_set_ID":(!!_loc4_?_loc4_.toString():LANGUAGE_UNKNOWN),
                  "character_total":_loc13_,
                  "supported":(!!_loc16_?"yes":"no"),
                  "displayed":(!!param2.hasGlyphs(_loc15_.text)?"yes":"no")
               };
               _loc12_.push(_loc11_);
            }
         }
         if(_loc9_)
         {
            _loc11_ = {
               "dominant_font":(!!_loc7_?_loc7_.toString():LANGUAGE_UNKNOWN),
               "character_total":_loc8_
            };
            _loc10_.log(AmplitudeAnalyticsManager.EVENT_NAME_FONT_MIX,_loc11_);
         }
         var _loc17_:int = _loc12_.length;
         _loc3_ = 0;
         while(_loc3_ < _loc17_)
         {
            _loc10_.log(AmplitudeAnalyticsManager.EVENT_NAME_FONT_CHECK,_loc12_[_loc3_]);
            _loc3_++;
         }
      }
      
      private function getLanguagesFromText(param1:String) : Object
      {
         var _loc3_:int = 0;
         var _loc4_:InputLanguage = null;
         var _loc5_:InputLanguage = null;
         var _loc8_:String = null;
         var _loc9_:Object = null;
         var _loc2_:Object = {};
         var _loc6_:int = param1.length;
         var _loc7_:Number = 0;
         _loc3_ = 0;
         while(_loc3_ < _loc6_)
         {
            _loc7_ = param1.charCodeAt(_loc3_);
            if(_loc5_ && _loc5_.containsCharCode(_loc7_))
            {
               _loc4_ = _loc5_;
            }
            else
            {
               _loc4_ = InputLanguage.getLanguageFromCharCode(_loc7_);
               if(_loc4_)
               {
                  _loc5_ = _loc4_;
               }
            }
            _loc8_ = !!_loc4_?_loc4_.name:LANGUAGE_UNKNOWN;
            _loc9_ = _loc2_[_loc8_];
            if(!_loc9_)
            {
               _loc9_ = {
                  "language":_loc4_,
                  "charCount":0,
                  "text":""
               };
               _loc2_[_loc8_] = _loc9_;
            }
            _loc9_.charCount++;
            _loc9_.text = _loc9_.text + param1.charAt(_loc3_);
            _loc3_++;
         }
         return _loc2_;
      }
   }
}
