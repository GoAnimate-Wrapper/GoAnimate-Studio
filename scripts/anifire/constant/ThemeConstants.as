package anifire.constant
{
   public class ThemeConstants
   {
      
      public static const USER_THEME_ID:String = "User";
      
      public static const TEAM_THEME_ID:String = "Team";
      
      public static const SHARED_THEME_ID:String = "Shared";
      
      public static const COMMUNITY_THEME_ID:String = "Comm";
      
      public static const UGC_THEME_ID:String = "ugc";
      
      public static const COMMON_THEME_ID:String = "common";
      
      public static const RETRO_THEME_ID:String = "retro";
      
      public static const CHRISTMAS_THEME_ID:String = "christmas";
      
      public static const MONSTERMSH_THEME_ID:String = "monstermsh";
      
      public static const STICK_THEME_ID:String = "stick";
      
      public static const STARTREK_THEME_ID:String = "startrek";
      
      public static const POLITIC_THEME_ID:String = "politic";
      
      public static const POLITIC_2_THEME_ID:String = "politics2";
      
      public static const COMEDY_WORLD_THEME_ID:String = "custom";
      
      public static const FAMILY_THEME_ID:String = "family";
      
      public static const LIL_PEEPZ_THEME_ID:String = "action";
      
      public static const LIL_PETZ_THEME_ID:String = "animal";
      
      public static const TOON_ADVENTURE_THEME_ID:String = "toonadv";
      
      public static const CHIBI_THEME_ID:String = "chibi";
      
      public static const SPACE_THEME_ID:String = "space";
      
      public static const VIETNAM_THEME_ID:String = "vietnam";
      
      public static const NINJA_THEME_ID:String = "ninja";
      
      public static const BUSINESS_THEME_ID:String = "business";
      
      public static const STICKLY_BIZ_THEME_ID:String = "sticklybiz";
      
      public static const BIZ_MODEL_THEME_ID:String = "bizmodels";
      
      public static const ANIME_THEME_ID:String = "anime";
      
      public static const NINJAANIME_THEME_ID:String = "ninjaanime";
      
      public static const SPACE_CITIZEN_THEME_ID:String = "spacecitizen";
      
      public static const BOTDF_THEME_ID:String = "botdf";
      
      public static const COMMON_CRAFT_THEME_ID:String = "commoncraft";
      
      public static const WHITEBOARD_THEME_ID:String = "whiteboard";
      
      public static const INFOGRAPHICS_THEME_ID:String = "infographics";
      
      public static const THEME_GROUP_CC1:String = "family";
      
      public static const THEME_GROUP_CC2:String = "cc2";
       
      
      public function ThemeConstants()
      {
         super();
      }
      
      public static function isThumbCategorySupported(param1:String) : Boolean
      {
         switch(param1)
         {
            case BUSINESS_THEME_ID:
            case WHITEBOARD_THEME_ID:
            case INFOGRAPHICS_THEME_ID:
               return true;
            default:
               return false;
         }
      }
      
      public static function isThemeRetired(param1:String) : Boolean
      {
         switch(param1)
         {
            case RETRO_THEME_ID:
            case CHRISTMAS_THEME_ID:
            case MONSTERMSH_THEME_ID:
            case STICK_THEME_ID:
            case STARTREK_THEME_ID:
            case MONSTERMSH_THEME_ID:
            case POLITIC_THEME_ID:
            case POLITIC_2_THEME_ID:
            case FAMILY_THEME_ID:
            case LIL_PEEPZ_THEME_ID:
            case LIL_PETZ_THEME_ID:
            case TOON_ADVENTURE_THEME_ID:
            case CHIBI_THEME_ID:
            case SPACE_THEME_ID:
            case VIETNAM_THEME_ID:
            case NINJA_THEME_ID:
            case STICKLY_BIZ_THEME_ID:
            case BIZ_MODEL_THEME_ID:
            case ANIME_THEME_ID:
            case NINJAANIME_THEME_ID:
            case SPACE_CITIZEN_THEME_ID:
            case BOTDF_THEME_ID:
               return true;
            default:
               return false;
         }
      }
   }
}
