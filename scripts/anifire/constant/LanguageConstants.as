package anifire.constant
{
   import anifire.util.UtilHashArray;
   
   public class LanguageConstants
   {
       
      
      public function LanguageConstants()
      {
         super();
      }
      
      public static function get SHORT_LANG_CODES() : UtilHashArray
      {
         var _loc1_:UtilHashArray = new UtilHashArray();
         _loc1_.push("de","Deutsch");
         _loc1_.push("en","English");
         _loc1_.push("es","Español");
         _loc1_.push("fr","Français");
         _loc1_.push("it","Italiano");
         _loc1_.push("jp","日本語 (Japanese)");
         _loc1_.push("kr","한국어 (Korean)");
         _loc1_.push("pt","Português");
         _loc1_.push("sc","简体中文 (Simplified Chinese)");
         _loc1_.push("th","ไทย (Thai)");
         _loc1_.push("tc","繁體中文 (Traditional Chinese)");
         return _loc1_;
      }
      
      public static function get SHORT_TO_MEDIUM_LANG_CODES_MAPPING() : UtilHashArray
      {
         var _loc1_:UtilHashArray = new UtilHashArray();
         _loc1_.push("sc","zh_CN");
         _loc1_.push("tc","zh_TW");
         _loc1_.push("en","en_US");
         _loc1_.push("th","th_TH");
         _loc1_.push("jp","ja_JP");
         _loc1_.push("kr","ko_KR");
         _loc1_.push("es","es_ES");
         _loc1_.push("de","de_DE");
         _loc1_.push("fr","fr_FR");
         _loc1_.push("it","it_IT");
         _loc1_.push("pt","pt_PT");
         return _loc1_;
      }
      
      public static function get MEDIUM_LANG_CODES() : UtilHashArray
      {
         var _loc4_:String = null;
         var _loc1_:UtilHashArray = SHORT_LANG_CODES;
         var _loc2_:UtilHashArray = new UtilHashArray();
         var _loc3_:UtilHashArray = SHORT_TO_MEDIUM_LANG_CODES_MAPPING;
         var _loc5_:int = 0;
         while(_loc5_ < _loc1_.length)
         {
            _loc4_ = _loc1_.getKey(_loc5_);
            _loc2_.push(_loc3_.getValueByKey(_loc4_),_loc1_.getValueByKey(_loc4_));
            _loc5_++;
         }
         return _loc2_;
      }
      
      public static function get MEDIUM_TO_SHORT_LANG_CODES_MAPPING() : UtilHashArray
      {
         var _loc1_:UtilHashArray = new UtilHashArray();
         var _loc2_:UtilHashArray = SHORT_TO_MEDIUM_LANG_CODES_MAPPING;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc1_.push(_loc2_.getValueByIndex(_loc3_),_loc2_.getKey(_loc3_));
            _loc3_++;
         }
         return _loc1_;
      }
   }
}
