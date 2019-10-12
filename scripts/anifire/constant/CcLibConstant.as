package anifire.constant
{
   import anifire.managers.AppConfigManager;
   import anifire.util.UtilHashArray;
   import anifire.util.UtilLicense;
   import anifire.util.UtilUser;
   import flash.geom.Point;
   
   public class CcLibConstant
   {
      
      public static const COMPONENT_GROUP_UPPER_LOWER:String = "componentGroupClothes";
      
      public static const COMPONENT_TYPE_FACIAL_DECORATION:String = "facedecoration";
      
      public static const COMPONENT_TYPE_EYE:String = "eye";
      
      public static const COMPONENT_TYPE_GLASSES:String = "glasses";
      
      public static const COMPONENT_TYPE_EAR:String = "ear";
      
      public static const COMPONENT_TYPE_MOUTH:String = "mouth";
      
      public static const COMPONENT_TYPE_NOSE:String = "nose";
      
      public static const COMPONENT_TYPE_MUSTACHE:String = "mustache";
      
      public static const COMPONENT_TYPE_BEARD:String = "beard";
      
      public static const COMPONENT_TYPE_EYEBROW:String = "eyebrow";
      
      public static const COMPONENT_TYPE_FACESHAPE:String = "faceshape";
      
      public static const COMPONENT_TYPE_HAIR:String = "hair";
      
      public static const COMPONENT_TYPE_FRONT_HAIR:String = "fronthair";
      
      public static const COMPONENT_TYPE_BACK_HAIR:String = "backhair";
      
      public static const COMPONENT_TYPE_UPPER_BODY:String = "upper_body";
      
      public static const COMPONENT_TYPE_LOWER_BODY:String = "lower_body";
      
      public static const COMPONENT_TYPE_SKELETON:String = "skeleton";
      
      public static const COMPONENT_TYPE_BODYSHAPE:String = "bodyshape";
      
      public static const COMPONENT_TYPE_FREEACTION:String = "freeaction";
      
      public static const LIBRARY_TYPE_GOUPPER:String = "GoUpper";
      
      public static const LIBRARY_TYPE_GOLOWER:String = "GoLower";
      
      public static const LIBRARY_TYPE_GOHANDS:String = "GoHands";
      
      public static const LIBRARY_TYPE_GOBEHINDBODY:String = "GoBehindBody";
      
      public static const LIBRARY_TYPE_GOPROP:String = "GoProp";
      
      public static const LIBRARY_TYPE_GOFEET:String = "GoFeet";
      
      public static const LIBRARY_TYPE_GOHAIR:String = "GoHair";
      
      public static const COMPONENT_CAT_BODY:String = "body";
      
      public static const COMPONENT_CAT_HEAD:String = "head";
      
      public static const SWF_EXT:String = ".swf";
      
      public static const NODE_COMPONENT:String = "component";
      
      public static const NODE_COLOR:String = "color";
      
      public static const XML_DESC:String = "desc.xml";
      
      public static const CLIPUPPER:String = "theUpper";
      
      public static const CLIPLOWER:String = "theLower";
      
      public static const LIB_LEFT:String = "Left";
      
      public static const LIB_RIGHT:String = "Right";
      
      public static const MC_NAME_EXT:String = "MC";
      
      public static const NODE_LIBRARY:String = "library";
      
      public static const COMPONENT_THUMB_CHOOSER_THUMBNAIL_WIDTH:Number = 60;
      
      public static const COMPONENT_THUMB_CHOOSER_THUMBNAIL_HEIGHT:Number = 60;
      
      public static const COMPONENT_THUMB_CHOOSER_BIGGER_THUMBNAIL_ENLARGE_RATIO:Number = 1.2;
      
      public static const COMPONENT_THUMB_CHOOSER_DETAIL_PART_HEIGHT:Number = 25;
      
      public static const COMPONENT_THUMB_CHOOSER_TILE_PADDING_SIZE:Number = 0;
      
      public static const COMPONENT_THUMB_CHOOSER_TILE_GAP_SIZE:Number = 2;
      
      public static const SHOULD_DECRYPT:Boolean = true;
      
      public static const MONEY_MODE_NORMAL:int = 0;
      
      public static const MONEY_MODE_FREE:int = 1;
      
      public static const MONEY_MODE_DONT_NEED_MONEY:int = 2;
      
      public static const MONEY_MODE_SCHOOL:int = 3;
      
      public static const USER_LEVEL_NORMAL:int = 0;
      
      public static const USER_LEVEL_SUPER:int = 999;
      
      public static const PROBABILITY_OPTIONAL_COMPONENT_APPEAR_IN_RANDOMIZE:Number = 0.3;
      
      public static const PROBABILITY_RANDOM_FROM_PRE_MADE_CHAR:Number = 1;
      
      public static var COMPONENT_SCALE:Number = 1;
      
      public static const COMPONENT_SCALE_MALE:Number = 1;
      
      public static const COMPONENT_SCALE_FEMALE:Number = 0.9;
      
      public static const RIGHT:String = "Right";
      
      public static const LEFT:String = "Left";
      
      public static const COUPON_VALUE:Number = 100;
      
      public static const MODE_SAVE:int = 0;
      
      public static const MODE_ADDBUCKS:int = 1;
      
      public static const MODE_REFRESH:int = 2;
      
      public static const MODE_ADDPOINTS:int = 3;
      
      public static const MODE_NEEDLOGIN:int = 4;
      
      public static const MODE_NEEDSUBSCRIBE:int = 5;
      
      public static const TEMPLATE_CCTHUMB_WIDTH:int = 120;
      
      public static const TEMPLATE_CHAR_THUMB_WIDTH:int = 130;
      
      private static var _configManager:AppConfigManager = AppConfigManager.instance;
      
      private static var _themeId:String;
      
      protected static var __headRelatedLibrary:Array;
      
      protected static var __allHeadComponentTypes:Array;
      
      protected static var __allLibraryTypes:Array;
      
      protected static var __allBodyComponentTypes:Array;
      
      protected static var __componentOrderInHead:Array;
      
      protected static var __allMultipleComponentTypes:Array;
      
      protected static var __allNonLipSyncThemes:Array;
       
      
      public function CcLibConstant()
      {
         super();
      }
      
      private static function get themeId() : String
      {
         if(!_themeId)
         {
            _themeId = _configManager.getValue(ServerConstants.PARAM_THEME_ID);
         }
         return _themeId;
      }
      
      public static function get DEFAULT_HEADSCALES() : Array
      {
         if(themeId == "cc2")
         {
            return [0.83,1,1.49,1.18];
         }
         if(themeId == ThemeConstants.CHIBI_THEME_ID)
         {
            return [1,0.9,1.1,1.25];
         }
         if(themeId == ThemeConstants.NINJA_THEME_ID)
         {
            return [1,0.9,1.1,1.25];
         }
         if(themeId == ThemeConstants.BUSINESS_THEME_ID)
         {
            return [1.4];
         }
         return [0.8,1,1.2,1.6];
      }
      
      public static function get DEFAULT_BODYSCALES() : Array
      {
         if(themeId == "cc2")
         {
            return [1.35,1,0.74,1];
         }
         if(themeId == ThemeConstants.CHIBI_THEME_ID)
         {
            return [1,1.1,0.9,0.8];
         }
         if(themeId == ThemeConstants.NINJA_THEME_ID)
         {
            return [1,1.1,0.9,0.8];
         }
         if(themeId == ThemeConstants.BUSINESS_THEME_ID)
         {
            return [0.7];
         }
         return [1.2,1,0.8,0.8];
      }
      
      public static function get DEFAULT_HEADPOS() : Array
      {
         var _loc1_:Array = new Array();
         if(themeId == "cc2")
         {
            _loc1_.push(new Point(0,4));
            _loc1_.push(new Point(0,0));
            _loc1_.push(new Point(0,-6));
            _loc1_.push(new Point(-13,20));
         }
         else
         {
            _loc1_.push(new Point(0,0));
            _loc1_.push(new Point(0,0));
            _loc1_.push(new Point(0,0));
            _loc1_.push(new Point(0,0));
         }
         return _loc1_;
      }
      
      public static function get RANDOM_CHAR() : Boolean
      {
         return true;
      }
      
      public static function get CHANGE_CHAR_SCALE() : Boolean
      {
         if(UtilUser.hasAdminFeatures)
         {
            return true;
         }
         if(THEME_RUN_TAG_INSTEAD_OF_BODYSHAPE(themeId))
         {
            return false;
         }
         return true;
      }
      
      public static function GET_COMPONENT_TYPE_OCCURANCE_PROBABILITY(param1:String) : Number
      {
         var _loc2_:UtilHashArray = new UtilHashArray();
         _loc2_.push(COMPONENT_TYPE_EYE,1);
         _loc2_.push(COMPONENT_TYPE_GLASSES,0.3);
         _loc2_.push(COMPONENT_TYPE_EAR,1);
         _loc2_.push(COMPONENT_TYPE_MOUTH,1);
         _loc2_.push(COMPONENT_TYPE_NOSE,1);
         _loc2_.push(COMPONENT_TYPE_MUSTACHE,0.1);
         _loc2_.push(COMPONENT_TYPE_BEARD,0.1);
         _loc2_.push(COMPONENT_TYPE_EYEBROW,1);
         _loc2_.push(COMPONENT_TYPE_FACESHAPE,1);
         _loc2_.push(COMPONENT_TYPE_HAIR,0.95);
         _loc2_.push(COMPONENT_TYPE_FACIAL_DECORATION,0);
         _loc2_.push(COMPONENT_TYPE_UPPER_BODY,1);
         _loc2_.push(COMPONENT_TYPE_LOWER_BODY,1);
         _loc2_.push(COMPONENT_TYPE_SKELETON,1);
         _loc2_.push(LIBRARY_TYPE_GOBEHINDBODY,0.3);
         _loc2_.push(LIBRARY_TYPE_GOHANDS,1);
         _loc2_.push(LIBRARY_TYPE_GOLOWER,1);
         _loc2_.push(LIBRARY_TYPE_GOPROP,0);
         _loc2_.push(LIBRARY_TYPE_GOUPPER,1);
         _loc2_.push(LIBRARY_TYPE_GOFEET,1);
         var _loc3_:Array = ALL_MULTIPLE_COMPONENT_TYPES;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc2_.push(_loc3_[_loc4_],0);
            _loc4_++;
         }
         if(_loc2_.containsKey(param1))
         {
            return _loc2_.getValueByKey(param1) as Number;
         }
         return 1;
      }
      
      public static function get OPTIONAL_COMPONENTS() : UtilHashArray
      {
         var _loc1_:UtilHashArray = new UtilHashArray();
         _loc1_.push(COMPONENT_TYPE_GLASSES,COMPONENT_TYPE_GLASSES);
         _loc1_.push(COMPONENT_TYPE_MUSTACHE,COMPONENT_TYPE_MUSTACHE);
         _loc1_.push(COMPONENT_TYPE_BEARD,COMPONENT_TYPE_BEARD);
         _loc1_.push(COMPONENT_TYPE_EYEBROW,COMPONENT_TYPE_EYEBROW);
         _loc1_.push(COMPONENT_TYPE_HAIR,COMPONENT_TYPE_HAIR);
         _loc1_.push(COMPONENT_TYPE_EAR,COMPONENT_TYPE_EAR);
         _loc1_.push(COMPONENT_TYPE_FACESHAPE,COMPONENT_TYPE_FACESHAPE);
         _loc1_.push(LIBRARY_TYPE_GOBEHINDBODY,LIBRARY_TYPE_GOBEHINDBODY);
         if(themeId != ThemeConstants.BUSINESS_THEME_ID)
         {
            _loc1_.push(COMPONENT_TYPE_EYE,COMPONENT_TYPE_EYE);
            _loc1_.push(COMPONENT_TYPE_MOUTH,COMPONENT_TYPE_MOUTH);
            _loc1_.push(COMPONENT_TYPE_NOSE,COMPONENT_TYPE_NOSE);
         }
         return _loc1_;
      }
      
      public static function get USER_CHOOSE_ABLE_HEAD_COMPONENT_TYPES() : Array
      {
         var _loc1_:Array = new Array();
         _loc1_.push(COMPONENT_TYPE_EYE);
         _loc1_.push(COMPONENT_TYPE_GLASSES);
         _loc1_.push(COMPONENT_TYPE_EAR);
         _loc1_.push(COMPONENT_TYPE_NOSE);
         _loc1_.push(COMPONENT_TYPE_MOUTH);
         _loc1_.push(COMPONENT_TYPE_MUSTACHE);
         _loc1_.push(COMPONENT_TYPE_BEARD);
         _loc1_.push(COMPONENT_TYPE_EYEBROW);
         _loc1_.push(COMPONENT_TYPE_FACESHAPE);
         _loc1_.push(COMPONENT_TYPE_HAIR);
         _loc1_.push(COMPONENT_TYPE_FACIAL_DECORATION);
         return _loc1_;
      }
      
      public static function get USER_CHOOSE_ABLE_BODY_COMPONENT_TYPES() : Array
      {
         var _loc1_:Array = new Array();
         _loc1_.push(COMPONENT_TYPE_BODYSHAPE);
         _loc1_.push(COMPONENT_TYPE_UPPER_BODY);
         _loc1_.push(COMPONENT_TYPE_LOWER_BODY);
         _loc1_.push(LIBRARY_TYPE_GOUPPER);
         _loc1_.push(LIBRARY_TYPE_GOLOWER);
         _loc1_.push(LIBRARY_TYPE_GOHANDS);
         _loc1_.push(LIBRARY_TYPE_GOBEHINDBODY);
         _loc1_.push(LIBRARY_TYPE_GOFEET);
         _loc1_.push(LIBRARY_TYPE_GOHAIR);
         return _loc1_;
      }
      
      public static function GET_COMPONENT_RELATED_LIBRARY(param1:String) : String
      {
         switch(param1)
         {
            case COMPONENT_TYPE_HAIR:
               return LIBRARY_TYPE_GOHAIR;
            case LIBRARY_TYPE_GOLOWER:
               if(themeId == "anime")
               {
               }
         }
         return "";
      }
      
      public static function get HEAD_RELATED_LIBRARY() : Array
      {
         if(!__headRelatedLibrary)
         {
            __headRelatedLibrary = [];
            __headRelatedLibrary.push(LIBRARY_TYPE_GOHAIR);
         }
         return __headRelatedLibrary;
      }
      
      public static function get COMPONENT_TYPE_CHOOSER_COMPONENT_GROUP() : Array
      {
         var _loc1_:Array = new Array();
         _loc1_.push(COMPONENT_GROUP_UPPER_LOWER);
         return _loc1_;
      }
      
      public static function get BODYSHAPE_CHOOSABLE() : Boolean
      {
         if(themeId == ThemeConstants.ANIME_THEME_ID || themeId == ThemeConstants.NINJAANIME_THEME_ID)
         {
            if(UtilUser.hasAdminFeatures)
            {
               return true;
            }
            return false;
         }
         return true;
      }
      
      public static function get COMPONENT_TYPE_CHOOSER_ORDERING_VER2() : Array
      {
         var _loc1_:Array = new Array();
         _loc1_.push(LIBRARY_TYPE_GOUPPER);
         _loc1_.push(LIBRARY_TYPE_GOLOWER);
         _loc1_.push(LIBRARY_TYPE_GOHANDS);
         _loc1_.push(LIBRARY_TYPE_GOBEHINDBODY);
         _loc1_.push(LIBRARY_TYPE_GOFEET);
         _loc1_.push(COMPONENT_TYPE_FACESHAPE);
         _loc1_.push(COMPONENT_TYPE_HAIR);
         _loc1_.push(COMPONENT_TYPE_EYE);
         _loc1_.push(COMPONENT_TYPE_EYEBROW);
         _loc1_.push(COMPONENT_TYPE_NOSE);
         _loc1_.push(COMPONENT_TYPE_MOUTH);
         _loc1_.push(COMPONENT_TYPE_EAR);
         _loc1_.push(COMPONENT_TYPE_GLASSES);
         _loc1_.push(COMPONENT_TYPE_FACIAL_DECORATION);
         return _loc1_;
      }
      
      public static function get LOAD_DEFAULT_ON_SWITCH_SHAPE() : Boolean
      {
         if(themeId == ThemeConstants.BUSINESS_THEME_ID)
         {
            return true;
         }
         if(themeId == ThemeConstants.ANIME_THEME_ID)
         {
            return true;
         }
         return false;
      }
      
      public static function get CHOOSE_TAG_TYPE_SEX() : Boolean
      {
         if(THEME_RUN_TAG_INSTEAD_OF_BODYSHAPE(themeId))
         {
            return true;
         }
         return false;
      }
      
      public static function get COMPONENT_TYPE_CHOOSER_ORDERING_VER1() : Array
      {
         var _loc1_:Array = new Array();
         if(UtilLicense.getCurrentLicenseId() == "8")
         {
            _loc1_.push(COMPONENT_GROUP_UPPER_LOWER);
         }
         else
         {
            _loc1_.push(COMPONENT_TYPE_UPPER_BODY);
            _loc1_.push(COMPONENT_TYPE_LOWER_BODY);
         }
         _loc1_.push(COMPONENT_TYPE_FACESHAPE);
         _loc1_.push(COMPONENT_TYPE_HAIR);
         _loc1_.push(COMPONENT_TYPE_EYE);
         _loc1_.push(COMPONENT_TYPE_EYEBROW);
         _loc1_.push(COMPONENT_TYPE_NOSE);
         _loc1_.push(COMPONENT_TYPE_MUSTACHE);
         _loc1_.push(COMPONENT_TYPE_BEARD);
         _loc1_.push(COMPONENT_TYPE_MOUTH);
         _loc1_.push(COMPONENT_TYPE_EAR);
         _loc1_.push(COMPONENT_TYPE_GLASSES);
         _loc1_.push(COMPONENT_TYPE_FACIAL_DECORATION);
         return _loc1_;
      }
      
      public static function get ALL_HEAD_COMPONENT_TYPES() : Array
      {
         if(!__allHeadComponentTypes)
         {
            __allHeadComponentTypes = [];
            __allHeadComponentTypes.push(COMPONENT_TYPE_EYE);
            __allHeadComponentTypes.push(COMPONENT_TYPE_GLASSES);
            __allHeadComponentTypes.push(COMPONENT_TYPE_EAR);
            __allHeadComponentTypes.push(COMPONENT_TYPE_MOUTH);
            __allHeadComponentTypes.push(COMPONENT_TYPE_NOSE);
            __allHeadComponentTypes.push(COMPONENT_TYPE_MUSTACHE);
            __allHeadComponentTypes.push(COMPONENT_TYPE_BEARD);
            __allHeadComponentTypes.push(COMPONENT_TYPE_EYEBROW);
            __allHeadComponentTypes.push(COMPONENT_TYPE_FACESHAPE);
            __allHeadComponentTypes.push(COMPONENT_TYPE_HAIR);
            __allHeadComponentTypes.push(COMPONENT_TYPE_FACIAL_DECORATION);
         }
         return __allHeadComponentTypes;
      }
      
      public static function get ALL_LIBRARY_TYPES() : Array
      {
         if(!__allLibraryTypes)
         {
            __allLibraryTypes = [];
            __allLibraryTypes.push(LIBRARY_TYPE_GOUPPER);
            __allLibraryTypes.push(LIBRARY_TYPE_GOLOWER);
            __allLibraryTypes.push(LIBRARY_TYPE_GOHANDS);
            __allLibraryTypes.push(LIBRARY_TYPE_GOBEHINDBODY);
            __allLibraryTypes.push(LIBRARY_TYPE_GOFEET);
            __allLibraryTypes.push(LIBRARY_TYPE_GOHAIR);
         }
         return __allLibraryTypes;
      }
      
      public static function get ALL_BODY_COMPONENT_TYPES() : Array
      {
         if(!__allBodyComponentTypes)
         {
            __allBodyComponentTypes = [];
            __allBodyComponentTypes.push(COMPONENT_TYPE_UPPER_BODY);
            __allBodyComponentTypes.push(COMPONENT_TYPE_LOWER_BODY);
            __allBodyComponentTypes.push(COMPONENT_TYPE_SKELETON);
            __allBodyComponentTypes.push(COMPONENT_TYPE_FREEACTION);
            __allBodyComponentTypes.push(LIBRARY_TYPE_GOUPPER);
            __allBodyComponentTypes.push(LIBRARY_TYPE_GOLOWER);
            __allBodyComponentTypes.push(LIBRARY_TYPE_GOHANDS);
            __allBodyComponentTypes.push(LIBRARY_TYPE_GOBEHINDBODY);
            __allBodyComponentTypes.push(LIBRARY_TYPE_GOFEET);
            __allBodyComponentTypes.push(LIBRARY_TYPE_GOHAIR);
         }
         return __allBodyComponentTypes;
      }
      
      public static function get ALL_OFFSETABLE_COMPONENT_TYPES() : Array
      {
         var _loc1_:Array = new Array();
         _loc1_.push(COMPONENT_TYPE_EYE);
         _loc1_.push(COMPONENT_TYPE_GLASSES);
         _loc1_.push(COMPONENT_TYPE_EYEBROW);
         return _loc1_;
      }
      
      public static function get ALL_COMPONENT_TYPES() : Array
      {
         return ALL_HEAD_COMPONENT_TYPES.concat(ALL_BODY_COMPONENT_TYPES);
      }
      
      public static function get GET_COMPONENT_ORDER_IN_HEAD() : Array
      {
         if(!__componentOrderInHead)
         {
            __componentOrderInHead = [];
            __componentOrderInHead.push(COMPONENT_TYPE_BACK_HAIR);
            __componentOrderInHead.push(COMPONENT_TYPE_FACESHAPE);
            __componentOrderInHead.push(COMPONENT_TYPE_MOUTH);
            __componentOrderInHead.push(COMPONENT_TYPE_BEARD);
            __componentOrderInHead.push(COMPONENT_TYPE_MUSTACHE);
            __componentOrderInHead.push(COMPONENT_TYPE_HAIR);
            __componentOrderInHead.push(COMPONENT_TYPE_EAR);
            __componentOrderInHead.push(COMPONENT_TYPE_EYE + RIGHT);
            __componentOrderInHead.push(COMPONENT_TYPE_GLASSES + RIGHT);
            __componentOrderInHead.push(COMPONENT_TYPE_EYEBROW + RIGHT);
            __componentOrderInHead.push(COMPONENT_TYPE_NOSE);
            __componentOrderInHead.push(COMPONENT_TYPE_EYE + LEFT);
            __componentOrderInHead.push(COMPONENT_TYPE_GLASSES + LEFT);
            __componentOrderInHead.push(COMPONENT_TYPE_EYEBROW + LEFT);
            __componentOrderInHead.push(COMPONENT_TYPE_FRONT_HAIR);
            __componentOrderInHead.push(COMPONENT_TYPE_FACIAL_DECORATION);
         }
         return __componentOrderInHead;
      }
      
      public static function get ALL_MULTIPLE_COMPONENT_TYPES() : Array
      {
         if(!__allMultipleComponentTypes)
         {
            __allMultipleComponentTypes = [];
            __allMultipleComponentTypes.push(COMPONENT_TYPE_FACIAL_DECORATION);
         }
         return __allMultipleComponentTypes;
      }
      
      public static function COLORS_BY_COMPONENT(param1:String) : Array
      {
         if(param1 == COMPONENT_TYPE_EYE)
         {
            return ["ccEyeLib","ccEyeIris","ccSkinColor"];
         }
         if(param1 == COMPONENT_TYPE_MOUTH)
         {
            return ["ccMouthLip","ccSkinColor"];
         }
         return null;
      }
      
      public static function IS_TAKE_ORIGINAL_COLOR(param1:String) : Boolean
      {
         if(ALL_LIBRARY_TYPES.indexOf(param1) > -1)
         {
            return true;
         }
         if(param1 == COMPONENT_TYPE_HAIR)
         {
            return true;
         }
         return false;
      }
      
      public static function get ALL_COLOR_CODE_USED() : Array
      {
         var _loc1_:Array = new Array();
         _loc1_.push("ccSkinColor");
         _loc1_.push("ccFaceHairColor");
         _loc1_.push("ccUpperMain");
         _loc1_.push("ccUpperMinor");
         _loc1_.push("ccLowerMainA");
         _loc1_.push("ccLowerMain");
         _loc1_.push("ccLowerMinor");
         _loc1_.push("ccFeetMain");
         _loc1_.push("ccDecMajor");
         _loc1_.push("ccDecMinor");
         _loc1_.push("ccEyeLib");
         _loc1_.push("ccEyeIris");
         _loc1_.push("ccMouthLip");
         _loc1_.push("ccGlassesFrame");
         _loc1_.push("ccGlassesLens");
         _loc1_.push("ccHairMajor");
         _loc1_.push("ccHairMinor");
         _loc1_.push("ccEyebrow");
         _loc1_.push("ccHandMain");
         _loc1_.push("ccHandMinor");
         _loc1_.push("ccBackMajor");
         _loc1_.push("ccBackMinor");
         _loc1_.push("ccBeard");
         _loc1_.push("ccMustache");
         _loc1_.push("ccEarrings");
         return _loc1_;
      }
      
      public static function get CC_PREVIEW_DY() : Number
      {
         if(themeId == ThemeConstants.CHIBI_THEME_ID)
         {
            return 45;
         }
         if(themeId == ThemeConstants.NINJA_THEME_ID)
         {
            return 45;
         }
         if(themeId == "cc2")
         {
            return 45;
         }
         return 35;
      }
      
      public static function get DEFAULT_PREVIEW_SCALE() : Number
      {
         if(themeId == ThemeConstants.ANIME_THEME_ID)
         {
            return 1.2;
         }
         if(themeId == ThemeConstants.NINJAANIME_THEME_ID)
         {
            return 1.2;
         }
         if(THEME_RUN_TAG_INSTEAD_OF_BODYSHAPE(themeId))
         {
            return 1.4;
         }
         return 1;
      }
      
      public static function THEME_RUN_TAG_INSTEAD_OF_BODYSHAPE(param1:String) : Boolean
      {
         switch(param1)
         {
            case ThemeConstants.BUSINESS_THEME_ID:
            case ThemeConstants.WHITEBOARD_THEME_ID:
               return true;
            default:
               return false;
         }
      }
      
      public static function ALLOW_SHOW_DETAIL_FOR_PAIR(param1:String) : Boolean
      {
         return THEME_RUN_TAG_INSTEAD_OF_BODYSHAPE(param1);
      }
      
      public static function get HAS_DETAIL_CONTROL() : Boolean
      {
         switch(themeId)
         {
            case ThemeConstants.CHIBI_THEME_ID:
            case ThemeConstants.NINJA_THEME_ID:
            case ThemeConstants.ANIME_THEME_ID:
            case ThemeConstants.NINJAANIME_THEME_ID:
               return false;
            case ThemeConstants.BUSINESS_THEME_ID:
            case ThemeConstants.WHITEBOARD_THEME_ID:
               if(UtilUser.hasAdminFeatures)
               {
                  return true;
               }
               return false;
            default:
               return true;
         }
      }
      
      public static function get IS_WHITEBOARD_THEME() : Boolean
      {
         switch(themeId)
         {
            case ThemeConstants.WHITEBOARD_THEME_ID:
               return true;
            default:
               return false;
         }
      }
      
      public static function get IS_BUSINESS_THEME() : Boolean
      {
         switch(themeId)
         {
            case ThemeConstants.BUSINESS_THEME_ID:
               return true;
            default:
               return false;
         }
      }
      
      public static function get PHOTO_SIZE() : Number
      {
         if(themeId == ThemeConstants.ANIME_THEME_ID)
         {
            return 50;
         }
         if(themeId == ThemeConstants.NINJAANIME_THEME_ID)
         {
            return 50;
         }
         return 100;
      }
      
      public static function CHAR_TAG_MATCH_CURR_THEME(param1:Array) : Boolean
      {
         if(THEME_RUN_TAG_INSTEAD_OF_BODYSHAPE(themeId))
         {
            if(param1.indexOf(_configManager.getValue("ft")) > -1)
            {
               return true;
            }
            return false;
         }
         return true;
      }
      
      public static function CHAR_WITH_FREEACTION(param1:String) : Boolean
      {
         switch(param1)
         {
            case ThemeConstants.POLITIC_2_THEME_ID:
            case ThemeConstants.COMEDY_WORLD_THEME_ID:
            case ThemeConstants.FAMILY_THEME_ID:
            case ThemeConstants.STICKLY_BIZ_THEME_ID:
            case ThemeConstants.BIZ_MODEL_THEME_ID:
            case ThemeConstants.BOTDF_THEME_ID:
            case ThemeConstants.COMMON_CRAFT_THEME_ID:
               return false;
            default:
               return true;
         }
      }
      
      public static function get ALL_NON_LIP_SYNC_THEMES() : Array
      {
         if(!__allNonLipSyncThemes)
         {
            __allNonLipSyncThemes = [];
            __allNonLipSyncThemes.push(ThemeConstants.BOTDF_THEME_ID);
            __allNonLipSyncThemes.push(ThemeConstants.BIZ_MODEL_THEME_ID);
            __allNonLipSyncThemes.push(ThemeConstants.CHRISTMAS_THEME_ID);
            __allNonLipSyncThemes.push(ThemeConstants.COMMON_CRAFT_THEME_ID);
            __allNonLipSyncThemes.push(ThemeConstants.COMMON_THEME_ID);
            __allNonLipSyncThemes.push(ThemeConstants.COMMUNITY_THEME_ID);
            __allNonLipSyncThemes.push(ThemeConstants.INFOGRAPHICS_THEME_ID);
            __allNonLipSyncThemes.push(ThemeConstants.MONSTERMSH_THEME_ID);
            __allNonLipSyncThemes.push(ThemeConstants.POLITIC_THEME_ID);
            __allNonLipSyncThemes.push(ThemeConstants.POLITIC_2_THEME_ID);
            __allNonLipSyncThemes.push(ThemeConstants.RETRO_THEME_ID);
            __allNonLipSyncThemes.push(ThemeConstants.STARTREK_THEME_ID);
            __allNonLipSyncThemes.push(ThemeConstants.STICK_THEME_ID);
            __allNonLipSyncThemes.push(ThemeConstants.STICKLY_BIZ_THEME_ID);
            __allNonLipSyncThemes.push(ThemeConstants.TOON_ADVENTURE_THEME_ID);
            __allNonLipSyncThemes.push(ThemeConstants.USER_THEME_ID);
         }
         return __allNonLipSyncThemes;
      }
   }
}
