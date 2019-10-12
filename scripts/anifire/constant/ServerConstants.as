package anifire.constant
{
   import anifire.managers.AppConfigManager;
   
   public class ServerConstants
   {
      
      private static var _configManager:AppConfigManager = AppConfigManager.instance;
      
      public static const ACTION_SEND_BUG_REPORT:String = SERVER_API_PATH + "clientbug/";
      
      public static const ACTION_GET_CHAR:String = SERVER_API_PATH + "getCharacter/";
      
      public static const ACTION_GET_UGC_CHAR_ACTION:String = SERVER_API_PATH + "getCharacterAction/";
      
      public static const ACTION_GET_CC_CHAR_COMPOSITION_XML:String = SERVER_API_PATH + "getCcCharCompositionXml/";
      
      public static const ACTION_GET_INIT_PARAMS:String = SERVER_API_PATH + "getInitParams/";
      
      public static const ACTION_GET_CC_CHAR_COUNT:String = SERVER_API_PATH + "getCcCharacterCount/";
      
      public static const ACTION_GET_THEMELIST:String = SERVER_API_PATH + "getThemeList/";
      
      public static const MOVIE_PATH:String = HOST_PATH + "go/movie/";
      
      public static const YOUTUBE_CREATE_MOVIE_PATH:String = HOST_PATH + "create";
      
      public static const SKOLETUBE_CREATE_MOVIE_PATH:String = HOST_PATH + "create";
      
      public static const USER_PATH:String = HOST_PATH + "go/user/";
      
      public static const LOGIN_PAGE_PATH:String = HOST_PATH + "login";
      
      public static const STUDIO_PAGE_PATH:String = HOST_PATH + "go/studio/";
      
      public static const STUDIO_PAGE_PATH_NEW:String = HOST_PATH + "go/videomaker/";
      
      public static const MY_VIDEOS_PATH:String = HOST_PATH + "myvideos/";
      
      public static const SCHOOL_VIDEOS_PATH:String = HOST_PATH + "movies/";
      
      public static const WIX_VIDEOS_PATH:String = HOST_PATH + "myvideos/";
      
      public static const STUDIO_FULLSCREEN_PAGE_PATH:String = HOST_PATH + "go/studioFullscreen/";
      
      public static const CC_PAGE_PATH:String = HOST_PATH + "go/character_creator";
      
      public static const CLIENT_THEME_PATH:String = HOST_PATH + "static/client_theme/";
      
      public static const CLIENT_LOCALE_PATH:String = HOST_PATH + "static/client_theme/";
      
      public static const ACTION_SCHOOLPLUS_SIGNUP:String = HOST_PATH + "/public_signup/";
      
      public static const UPGRADE_PAGE_PATH:String = HOST_PATH + "plusfeatures";
      
      public static const BUSINESS_PLAN_PAGE_PATH:String = HOST_PATH + "business/videoplans";
      
      public static const YOUR_VIDEOS_PATH:String = HOST_PATH + "dashboard/videos";
      
      public static const ACTION_GET_THEME:String = SERVER_API_PATH + "getTheme/";
      
      public static const ACTION_GET_LATEST_ASSET:String = SERVER_API_PATH + "getLatestAsset/";
      
      public static const ACTION_GET_LATEST_ASSET_ID:String = SERVER_API_PATH + "getLatestAssetId/";
      
      public static const ACTION_GET_THEME_COMPLETE:String = SERVER_API_PATH + "themeCompleted/";
      
      public static const ACTION_GET_CC_PRE_MADE_CHARACTERS:String = SERVER_API_PATH + "getCCPreMadeCharacters";
      
      public static const ACTION_DELETE_ASSET:String = SERVER_API_PATH + "deleteAsset/";
      
      public static const ACTION_DELETE_ASSET_V2:String = SERVER_API_PATH_V2 + "asset/delete/";
      
      public static const ACTION_DELETE_STARTER:String = SERVER_API_PATH + "deleteUserTemplate/";
      
      public static const ACTION_UPDATE_FOLDER_V2:String = SERVER_API_PATH_V2 + "folder/update/";
      
      public static const ACTION_DELETE_FOLDER_V2:String = SERVER_API_PATH_V2 + "folder/delete/";
      
      public static const ACTION_UPDATE_ASSET:String = SERVER_API_PATH + "updateAsset/";
      
      public static const ACTION_UPDATE_ASSET_V2:String = SERVER_API_PATH_V2 + "asset/update/";
      
      public static const ACTION_GET_ASSET_V2:String = SERVER_API_PATH_V2 + "asset/get";
      
      public static const ACTION_GET_TEAM_MEMBERS_V2:String = SERVER_API_PATH_V2 + "team/members";
      
      public static const ACTION_GOOGLE_ANALYTIC:String = SERVER_API_PATH + "logActionToGA/";
      
      public static const ACTION_RSS_PATH:String = HOST_PATH;
      
      public static const ACTION_GET_USER_ASSETS_V2:String = SERVER_API_PATH_V2 + "assets/imported";
      
      public static const ACTION_GET_SHARED_ASSETS_V2:String = SERVER_API_PATH_V2 + "assets/shared";
      
      public static const ACTION_GET_TEAM_ASSETS_V2:String = SERVER_API_PATH_V2 + "assets/team";
      
      public static const ACTION_GET_STUDIO_PREFERENCE:String = SERVER_API_PATH_V2 + "studio_preference/get";
      
      public static const ACTION_CATEGORY_UPDATE_FAVORITE_ORDER:String = SERVER_API_PATH_V2 + "asset_category/update_favorite_order";
      
      public static const ACTION_CATEGORY_ADD_FAVORITE:String = SERVER_API_PATH_V2 + "asset_category/add_favorite";
      
      public static const ACTION_CATEGORY_REMOVE_FAVORITE:String = SERVER_API_PATH_V2 + "asset_category/remove_favorite";
      
      public static const ACTION_CATEGORY_ADD_FEATURED:String = SERVER_API_PATH_V2 + "asset_category/add_featured";
      
      public static const ACTION_CATEGORY_REMOVE_FEATURED:String = SERVER_API_PATH_V2 + "asset_category/remove_featured";
      
      public static const ACTION_TEXT_COMPONENT_GET_LIST:String = SERVER_API_PATH_V2 + "text_component/get_list";
      
      public static const ACTION_TEXT_COMPONENT_GET:String = SERVER_API_PATH_V2 + "text_component/get";
      
      public static const ACTION_TEXT_COMPONENT_ADD:String = SERVER_API_PATH_V2 + "text_component/add";
      
      public static const ACTION_TEXT_COMPONENT_UPDATE:String = SERVER_API_PATH_V2 + "text_component/update";
      
      public static const ACTION_TEXT_COMPONENT_DELETE:String = SERVER_API_PATH_V2 + "text_component/delete";
      
      public static const PARAM_THEME_ID:String = "themeId";
      
      public static const PARAM_SEGMENT:String = "segment";
      
      public static const PARAM_CHAR:String = "char";
      
      public static const PARAM_CHAR_ACTION:String = "char_action";
      
      public static const PARAM_CHAR_FACIAL:String = "char_facial";
      
      public static const PARAM_SOUND:String = "sound";
      
      public static const PARAM_BG:String = "bg";
      
      public static const PARAM_PROP:String = "prop";
      
      public static const PARAM_BUBBLE:String = "bubble";
      
      public static const PARAM_PROP_EX:String = "propex";
      
      public static const PARAM_PROP_STATE:String = "prop_state";
      
      public static const PARAM_PREVIOUS_ASSET_ID:String = "pre_aid";
      
      public static const PARAM_EFFECT:String = "effect";
      
      public static const PARAM_APPCODE:String = "appCode";
      
      public static const DEFAULT_APPCODE:String = "go";
      
      public static const PARAM_BOX_PHP_SESSION_ID:String = "PHPSESSID";
      
      public static const PARAM_FLASHVAR_PHP_SESSION_ID:String = "ps";
      
      public static const PARAM_ORIGINAL_ID:String = "originalId";
      
      public static const PARAM_MOVIE_ID:String = "movieId";
      
      public static const PARAM_RSS_PATH:String = "rsspath";
      
      public static const PARAM_RSS_MOVIENUM:String = "movieNum";
      
      public static const PARAM_RSS_CHANNEL:String = "channel";
      
      public static const PARAM_IS_PUBLISHED:String = "is_published";
      
      public static const PARAM_IS_PRIVATESHARED:String = "is_private_shared";
      
      public static const PARAM_IS_PASSWORD_PROTECTED:String = "is_password_protected";
      
      public static const PARAM_BADTERMS:String = "badterms";
      
      public static const PARAM_BODY:String = "body";
      
      public static const PARAM_BODY_ZIP:String = "body_zip";
      
      public static const PARAM_LANG:String = "lang";
      
      public static const PARAM_SAVE_THUMBNAIL:String = "save_thumbnail";
      
      public static const PARAM_AUTOSAVE:String = "autosave";
      
      public static const PARAM_IS_TRIGGER_BY_AUTOSAVE:String = "is_triggered_by_autosave";
      
      public static const PARAM_THUMBNAIL:String = "thumbnail";
      
      public static const PARAM_THUMBNAIL_LARGE:String = "thumbnail_large";
      
      public static const PARAM_COMMONITEM:String = "commonItem";
      
      public static const PARAM_ISOFFLINE:String = "isOffline";
      
      public static const PARAM_GROUP_ID:String = "school_group_id";
      
      public static const PARAM_GROUP_NAME:String = "group_name";
      
      public static const PARAM_YOUTUBE_PUBLISH:String = "youtube_publish";
      
      public static const PARAM_SKOLETUBE_PUBLISH:String = "skoletube_publish";
      
      public static const PARAM_U_INFO:String = "u_info";
      
      public static const PARAM_U_INFO_SCHOOL:String = PARAM_U_INFO + "_school";
      
      public static const PARAM_CATEGORY:String = "category";
      
      public static const PARAM_ROLE:String = "role";
      
      public static const PARAM_BODYSHAPE:String = "bs";
      
      public static const ACTION_GET_MOVIE:String = SERVER_API_PATH + "getMovie/";
      
      public static const ACTION_GET_MOVIE_INFO:String = SERVER_API_PATH + "getMovieInfo/";
      
      public static const PARAM_USER_ID:String = "userId";
      
      public static const PARAM_MOVIE_OWNER_ID:String = "movieOwnerId";
      
      public static const PARAM_USER_TOKEN:String = "ut";
      
      public static const PARAM_INITIAL_THEME_CODE:String = "ithm";
      
      public static const PARAM_IS_EDIT_MODE:String = "editMode";
      
      public static const ACTION_SAVE_JPEG:String = SERVER_API_PATH + "jpg_download/screen.jpg";
      
      public static const ACTION_SAVE_SOUND:String = SERVER_API_PATH + "saveSound/";
      
      public static const ACTION_TEXT_TO_SPEECH:String = SERVER_API_PATH + "convertTextToSoundAsset/";
      
      public static const ACTION_GET_USERASSETS:String = SERVER_API_PATH + "getUserAssets/";
      
      public static const ACTION_GET_USER_ASSETS_XML:String = SERVER_API_PATH + "getUserAssetsXml/";
      
      public static const ACTION_SEARCH_TEMPLATE_CC:String = SERVER_API_PATH + "searchTemplateCCs/";
      
      public static const ACTION_GET_PUBLICTEMPLATE:String = SERVER_API_PATH + "getSysTemplates/";
      
      public static const ACTION_UPDATE_TEMPLATE_INFO:String = SERVER_API_PATH + "updateSysTemplateAttributes/";
      
      public static const ACTION_GET_USER_FONTLIST:String = SERVER_API_PATH + "getUserFontList/";
      
      public static const ACTION_GET_ASSET_TAGS:String = SERVER_API_PATH + "getAssetTags";
      
      public static const ACTION_GET_COMMUNITYASSETS:String = SERVER_API_PATH + "getCommunityAssets/";
      
      public static const ACTION_GET_TTSVOICE:String = SERVER_API_PATH + "getTextToSpeechVoices/";
      
      public static const ACTION_GET_ASSET_EX:String = SERVER_API_PATH + "getAssetEx/";
      
      public static const ACTION_GET_WATERMARKS:String = SERVER_API_PATH + "getUserWatermarks/";
      
      public static const ACTION_ASSIGN_WATERMARK:String = SERVER_API_PATH + "assignwatermark/movie/";
      
      public static const ACTION_SEARCH_ASSET:String = SERVER_API_PATH + "searchCommunityAssets/";
      
      public static const PARAM_ASSET_ID:String = "assetId";
      
      public static const PARAM_ENC_ASSET_ID:String = "enc_asset_id";
      
      public static const PARAM_SIGNATURE:String = "signature";
      
      public static const PARAM_ISEMBED_ID:String = "isEmbed";
      
      public static const PARAM_ISSLIDE:String = "is_slideshow";
      
      public static const PARAM_GOOGLE_ANALYTIC_ACTION:String = "ga_action";
      
      public static const ACTION_GET_STREAM_SOUND:String = "rtmpe://rtmp.voxcdn.com/3420.file";
      
      public static const ACTION_GET_ALL_FAV_JSON:String = SERVER_API_PATH + "getAllFavoriteAssets/";
      
      public static const ACTION_ADD_FAV_JSON:String = SERVER_API_PATH + "addThemeAssetToFavorite/";
      
      public static const ACTION_REMOVE_FAV_JSON:String = SERVER_API_PATH + "removeThemeAssetFromFavorite/";
      
      public static const ACTION_RESTART_TUTORIAL:String = HOST_PATH + "videomaker/full/tutorial";
      
      public static const ERROR_CODE_MOVIE_NOT_FOUND:String = "NOTFOUND";
      
      public static const ERROR_CODE_MOVIE_DELETED:String = "MOVIE_DELETED";
      
      public static const ERROR_CODE_MOVIE_NOT_SHARE:String = "NOT_SHARE_VIEWABLE";
      
      public static const ERROR_CODE_MOVIE_MODERATING:String = "MOVIE_UNDER_MODERATION";
      
      public static const ERROR_CODE_NO_ACCESS:String = "NO_ACCESS";
      
      public static const ERROR_CODE_SAVE_MOVIE_BLOCKED_BY_VIDEO_RECORDING:String = "video_block_save";
      
      public static const ERROR_CODE_LOGGED_OUT:String = "ERR_LOGGED_OUT";
      
      public static const FLASHVAR_THUMBNAIL:String = "thumbnailURL";
      
      public static const FLASHVAR_IS_VIDEO_RECORD_MODE:String = "isVideoRecord";
      
      public static const FLASHVAR_CUSTOM_PLAYER_WIDTH:String = "playerWidth";
      
      public static const FLASHVAR_CUSTOM_PLAYER_HEIGHT:String = "playerHeight";
      
      public static const FLASHVAR_CHAIN_MOVIE_ID:String = "chain_mids";
      
      public static const FLASHVAR_AUTOSTART:String = "autostart";
      
      public static const FLASHVAR_NEXT_URL:String = "nextUrl";
      
      public static const FLASHVAR_ED_USER_TYPE:String = "edUserType";
      
      public static const FLASHVAR_NEXT_URL_PLACEHOLDER:String = "<movieId>";
      
      public static const FLASHVAR_CLIENT_THEME_PATH:String = "clientThemePath";
      
      public static const FLASHVAR_CLIENT_THEME_PLACEHOLDER:String = "<client_theme>";
      
      public static const FLASHVAR_STORE_PATH:String = "storePath";
      
      public static const FLASHVAR_STORE_PLACEHOLDER:String = "<store>";
      
      public static const POPUP_WINDOW_NAME:String = "wndstudio";
      
      public static const FLASHVAR_S3_SHOULD_BE_USED:String = "useS3";
      
      public static const FLASHVAR_S3_URL:String = "s3base";
      
      public static const FLASHVAR_APISERVER:String = "apiserver";
      
      public static const FLASHVAR_SHOWSHARE:String = "showshare";
      
      public static const FLASHVAR_IS_PUBLISHED_PLAYER:String = "isPublished";
      
      public static const FLASHVAR_IS_PSHARED:String = "is_private_shared";
      
      public static const FLASHVAR_IS_COPYABLE:String = "copyable";
      
      public static const FLASHVAR_MOVIE_LICENSE_ID:String = "movieLid";
      
      public static const FLASHVAR_CLIENT_THEME_CODE:String = "ctc";
      
      public static const FLASHVAR_THEME_COLOR:String = "themeColor";
      
      public static const FLASHVAR_CLIENT_THEME_LANG_CODE:String = "tlang";
      
      public static const FLASHVAR_SITE_ID:String = "siteId";
      
      public static const FLASHVAR_USER_ID:String = "userId";
      
      public static const FLASHVAR_THEME_ID:String = "thmid";
      
      public static const FLASHVAR_MONEY_MODE:String = "m_mode";
      
      public static const FLASHVAR_CC_START_PAGE:String = "page";
      
      public static const FLASHVAR_IS_USER_LOGIN_MODE:String = "isLogin";
      
      public static const FLASHVAR_IS_ADMIN:String = "uisa";
      
      public static const FLASHVAR_IS_IN_SPEEDY_MODE:String = "isSpeedy";
      
      public static const FLASHVAR_DEFAULT_TRAYTHEME:String = "tray";
      
      public static const FLASHVAR_IS_GOLITE_PREVIEW:String = "is_golite_preview";
      
      public static const END_CREDIT_MOVIE_ID:String = "0_aFnt5s2_8o";
      
      public static const FLASHVAR_IS_WIDE:String = "isWide";
      
      public static const FLASHVAR_IS_WIX_PAID:String = "isWixPaid";
      
      public static const FLASHVAR_MOVIE_CREATE_DATETIME:String = "create_dt";
      
      public static const FLASHVAR_RESTART_TUTORIAL:String = "retut";
      
      public static const FLASHVAR_NO_SKIP_TUTORIAL:String = "noSkipTutorial";
      
      public static const FLASHVAR_IS_FREE_TRIAL:String = "free_trial";
      
      public static const FLASHVAR_LICENSE_ID:String = "lid";
      
      public static const FLASHVAR_IS_CONTENT_ADMIN:String = "contentAdmin";
      
      private static var _version:String;
      
      private static var _apiServer:String;
      
      private static var _isWixPaid:String;
      
      private static var _myAppCode:String;
      
      private static var _serverApiPath:String;
      
      private static var _serverApiPathV2:String;
       
      
      public function ServerConstants()
      {
         super();
      }
      
      public static function get STORE_VERSION() : int
      {
         return Number(version);
      }
      
      public static function get_ACTION_SAVE_MOVIE() : String
      {
         return get_server_path() + "saveMovie/";
      }
      
      public static function get ACTION_SAVE_STARTER() : String
      {
         return SERVER_API_PATH + "saveTemplate/";
      }
      
      private static function get version() : String
      {
         if(!_version)
         {
            _version = _configManager.getValue("v");
         }
         return _version;
      }
      
      private static function get apiServer() : String
      {
         if(!_apiServer)
         {
            _apiServer = _configManager.getValue(FLASHVAR_APISERVER);
         }
         return _apiServer;
      }
      
      private static function get isWixPaid() : String
      {
         if(!_isWixPaid)
         {
            _isWixPaid = _configManager.getValue(FLASHVAR_IS_WIX_PAID);
         }
         return _isWixPaid;
      }
      
      private static function get myAppCode() : String
      {
         if(!_myAppCode)
         {
            _myAppCode = _configManager.getValue(PARAM_APPCODE);
            if(!_myAppCode)
            {
               _myAppCode = DEFAULT_APPCODE;
            }
         }
         return _myAppCode;
      }
      
      public static function get HOST_PATH() : String
      {
         return apiServer;
      }
      
      public static function get HOST_PATH_HTTPS() : String
      {
         var _loc1_:String = HOST_PATH;
         return !!_loc1_?_loc1_.replace(/^http:/,"https:"):"";
      }
      
      public static function get SERVER_API_PATH() : String
      {
         if(!_serverApiPath)
         {
            _serverApiPath = apiServer + myAppCode + "api/";
         }
         return _serverApiPath;
      }
      
      public static function get SERVER_API_PATH_V2() : String
      {
         if(!_serverApiPathV2)
         {
            _serverApiPathV2 = apiServer + "api_v2/";
         }
         return _serverApiPathV2;
      }
      
      public static function get_server_path() : String
      {
         return SERVER_API_PATH;
      }
      
      public static function getPOList(param1:String) : Array
      {
         if(param1 == "slideplayer")
         {
            return ["player","slideplayer"];
         }
         if(param1 == "cc")
         {
            return ["cc","store"];
         }
         if(param1 == "go")
         {
            return ["go","player","store","emessage"];
         }
         if(param1 == "player")
         {
            return ["player"];
         }
         if(param1 == "import")
         {
            return ["import"];
         }
         return [];
      }
      
      public static function isLookAtCameraEnabled() : Boolean
      {
         return true;
      }
      
      public static function get IS_WIX() : Boolean
      {
         if(isWixPaid)
         {
            return true;
         }
         return false;
      }
      
      public static function get IS_WIX_PAID() : Boolean
      {
         if(isWixPaid)
         {
            return isWixPaid == "1";
         }
         return false;
      }
   }
}
