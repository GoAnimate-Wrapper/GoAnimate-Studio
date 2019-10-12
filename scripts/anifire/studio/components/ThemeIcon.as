package anifire.studio.components
{
   import anifire.constant.ThemeConstants;
   import anifire.util.UtilSite;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.primitives.BitmapImage;
   
   public class ThemeIcon extends Group
   {
      
      private static const imgAnime:Class = ThemeIcon_imgAnime;
      
      private static const imgBusinessFriendly:Class = ThemeIcon_imgBusinessFriendly;
      
      private static const imgBusinessFriendlyLarge:Class = ThemeIcon_imgBusinessFriendlyLarge;
      
      private static const imgBusinessModel:Class = ThemeIcon_imgBusinessModel;
      
      private static const imgBusinessModelLarge:Class = ThemeIcon_imgBusinessModelLarge;
      
      private static const imgCartoonClassics:Class = ThemeIcon_imgCartoonClassics;
      
      private static const imgChibiNinja:Class = ThemeIcon_imgChibiNinja;
      
      private static const imgChibiPeepz:Class = ThemeIcon_imgChibiPeepz;
      
      private static const imgComedyWorld:Class = ThemeIcon_imgComedyWorld;
      
      private static const imgCommonCraft:Class = ThemeIcon_imgCommonCraft;
      
      private static const imgCommonCraftLarge:Class = ThemeIcon_imgCommonCraftLarge;
      
      private static const imgCommunity:Class = ThemeIcon_imgCommunity;
      
      private static const imgCommunityLarge:Class = ThemeIcon_imgCommunityLarge;
      
      private static const imgHoliday:Class = ThemeIcon_imgHoliday;
      
      private static const imgInfographics:Class = ThemeIcon_imgInfographics;
      
      private static const imgInfographicsLarge:Class = ThemeIcon_imgInfographicsLarge;
      
      private static const imgInThisVideo:Class = ThemeIcon_imgInThisVideo;
      
      private static const imgInThisVideoLarge:Class = ThemeIcon_imgInThisVideoLarge;
      
      private static const imgJungleWar:Class = ThemeIcon_imgJungleWar;
      
      private static const imgLilPeepz:Class = ThemeIcon_imgLilPeepz;
      
      private static const imgLilPetz:Class = ThemeIcon_imgLilPetz;
      
      private static const imgMonster:Class = ThemeIcon_imgMonster;
      
      private static const imgMore:Class = ThemeIcon_imgMore;
      
      private static const imgNinjaAnime:Class = ThemeIcon_imgNinjaAnime;
      
      private static const imgSearch:Class = ThemeIcon_imgSearch;
      
      private static const imgSearchLarge:Class = ThemeIcon_imgSearchLarge;
      
      private static const imgSkoletube:Class = ThemeIcon_imgSkoletube;
      
      private static const imgSkoletubeLarge:Class = ThemeIcon_imgSkoletubeLarge;
      
      private static const imgSpaceCitizens:Class = ThemeIcon_imgSpaceCitizens;
      
      private static const imgSpacePeepz:Class = ThemeIcon_imgSpacePeepz;
      
      private static const imgStickFigure:Class = ThemeIcon_imgStickFigure;
      
      private static const imgStickyBusiness:Class = ThemeIcon_imgStickyBusiness;
      
      private static const imgStickyBusinessLarge:Class = ThemeIcon_imgStickyBusinessLarge;
      
      private static const imgPolitics:Class = ThemeIcon_imgPolitics;
      
      private static const imgWhiteHouserz:Class = ThemeIcon_imgWhiteHouserz;
      
      private static const imgWhiteboard:Class = ThemeIcon_imgWhiteboard;
      
      private static const imgWhiteboardLarge:Class = ThemeIcon_imgWhiteboardLarge;
      
      private static const imgYourLibrary:Class = ThemeIcon_imgYourLibrary;
      
      private static const imgYourLibraryLarge:Class = ThemeIcon_imgYourLibraryLarge;
      
      private static const imgTeamLibrary:Class = ThemeIcon_imgTeamLibrary;
      
      private static const imgTeamLibraryLarge:Class = ThemeIcon_imgTeamLibraryLarge;
      
      private static const imgSharedLibrary:Class = ThemeIcon_imgSharedLibrary;
      
      private static const imgSharedLibraryLarge:Class = ThemeIcon_imgSharedLibraryLarge;
       
      
      private var _1031744009iconDisplay:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _themeId:String;
      
      protected var _largeIcon:Boolean;
      
      public function ThemeIcon()
      {
         super();
         mx_internal::_document = this;
         this.minWidth = 30;
         this.minHeight = 30;
         this.mxmlContent = [this._ThemeIcon_BitmapImage1_i()];
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      public function get largeIcon() : Boolean
      {
         return this._largeIcon;
      }
      
      public function set largeIcon(param1:Boolean) : void
      {
         if(this._largeIcon != param1)
         {
            this._largeIcon = param1;
            this.updateIconSource();
         }
      }
      
      public function set themeId(param1:String) : void
      {
         if(param1 != this._themeId)
         {
            this._themeId = param1;
            this.updateIconSource();
         }
      }
      
      public function get themeId() : String
      {
         return this._themeId;
      }
      
      protected function updateIconSource() : void
      {
         var _loc1_:Class = null;
         switch(this._themeId)
         {
            case ThumbTray.MOVIE_THEME:
               _loc1_ = !!this._largeIcon?imgInThisVideo:imgInThisVideoLarge;
               break;
            case ThemeConstants.COMMUNITY_THEME_ID:
               _loc1_ = !!this._largeIcon?imgCommunity:imgCommunityLarge;
               break;
            case ThemeConstants.USER_THEME_ID:
               _loc1_ = !!this._largeIcon?imgYourLibrary:imgYourLibraryLarge;
               break;
            case ThemeConstants.SHARED_THEME_ID:
               _loc1_ = !!this._largeIcon?imgSharedLibrary:imgSharedLibraryLarge;
               break;
            case ThemeConstants.TEAM_THEME_ID:
               _loc1_ = !!this._largeIcon?imgTeamLibrary:imgTeamLibraryLarge;
               break;
            case ThumbTray.CROSS_THEME_SEARCH:
               _loc1_ = !!this._largeIcon?imgSearch:imgSearchLarge;
               break;
            case ThemeConstants.COMMUNITY_THEME_ID:
               if(UtilSite.siteId == UtilSite.SKOLETUBE)
               {
                  _loc1_ = !!this._largeIcon?imgSkoletube:imgSkoletubeLarge;
               }
               else
               {
                  _loc1_ = null;
               }
               break;
            case "more":
               _loc1_ = imgMore;
               break;
            case "business":
               _loc1_ = !!this._largeIcon?imgBusinessFriendlyLarge:imgBusinessFriendly;
               break;
            case "sticklybiz":
               _loc1_ = !!this._largeIcon?imgStickyBusinessLarge:imgStickyBusiness;
               break;
            case "bizmodels":
               _loc1_ = !!this._largeIcon?imgBusinessModelLarge:imgBusinessModel;
               break;
            case "commoncraft":
               _loc1_ = !!this._largeIcon?imgCommonCraftLarge:imgCommonCraft;
               break;
            case "infographics":
               _loc1_ = !!this._largeIcon?imgInfographicsLarge:imgInfographics;
               break;
            case "action":
               _loc1_ = imgLilPeepz;
               break;
            case "animal":
               _loc1_ = imgLilPetz;
               break;
            case "anime":
               _loc1_ = imgAnime;
               break;
            case "chibi":
               _loc1_ = imgChibiPeepz;
               break;
            case "christmas":
               _loc1_ = imgHoliday;
               break;
            case "custom":
               _loc1_ = imgComedyWorld;
               break;
            case "monstermsh":
               _loc1_ = imgMonster;
               break;
            case "ninja":
               _loc1_ = imgChibiNinja;
               break;
            case "ninjaanime":
               _loc1_ = imgNinjaAnime;
               break;
            case "space":
               _loc1_ = imgSpacePeepz;
               break;
            case "spacecitizen":
               _loc1_ = imgSpaceCitizens;
               break;
            case "stick":
               _loc1_ = imgStickFigure;
               break;
            case "retro":
               _loc1_ = imgCartoonClassics;
               break;
            case "politic":
               _loc1_ = imgPolitics;
               break;
            case "politics2":
               _loc1_ = imgWhiteHouserz;
               break;
            case "vietnam":
               _loc1_ = imgJungleWar;
               break;
            case "whiteboard":
               _loc1_ = !!this._largeIcon?imgWhiteboardLarge:imgWhiteboard;
         }
         this.iconDisplay.source = _loc1_;
      }
      
      private function _ThemeIcon_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.smooth = true;
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.initialized(this,"iconDisplay");
         this.iconDisplay = _loc1_;
         BindingManager.executeBindings(this,"iconDisplay",this.iconDisplay);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get iconDisplay() : BitmapImage
      {
         return this._1031744009iconDisplay;
      }
      
      public function set iconDisplay(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1031744009iconDisplay;
         if(_loc2_ !== param1)
         {
            this._1031744009iconDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"iconDisplay",_loc2_,param1));
            }
         }
      }
   }
}
