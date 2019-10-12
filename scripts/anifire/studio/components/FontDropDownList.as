package anifire.studio.components
{
   import anifire.event.FontEvent;
   import anifire.managers.FontVariantManager;
   import anifire.models.FontModel;
   import anifire.studio.events.MenuItemEvent;
   import anifire.studio.managers.AccessRightManager;
   import anifire.studio.managers.SharedAssetManager;
   import anifire.studio.managers.StudioFontManager;
   import anifire.studio.managers.UserAssetManager;
   import anifire.studio.models.MenuItemModel;
   import anifire.studio.skins.FontDropDownListSkin;
   import anifire.util.FontManager;
   import anifire.util.UtilDict;
   import anifire.util.UtilSite;
   import flash.events.MouseEvent;
   import mx.collections.ArrayCollection;
   import mx.collections.IList;
   import mx.core.ClassFactory;
   import mx.core.IFlexModuleFactory;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import spark.collections.Sort;
   import spark.collections.SortField;
   
   public class FontDropDownList extends spark.components.DropDownList
   {
      
      private static const MENU_ITEM_LABEL_STOCK_FONT:String = "More fonts";
      
      private static const MENU_ITEM_LABEL_USER_FONT:String = "Your fonts";
      
      private static const alegreyaSansSc:Class = FontDropDownList_alegreyaSansSc;
      
      private static const barrio:Class = FontDropDownList_barrio;
      
      private static const brawler:Class = FontDropDownList_brawler;
      
      private static const bungeeInline:Class = FontDropDownList_bungeeInline;
      
      private static const bungeeShade:Class = FontDropDownList_bungeeShade;
      
      private static const coming_soon:Class = FontDropDownList_coming_soon;
      
      private static const glegoo:Class = FontDropDownList_glegoo;
      
      private static const gochiHand:Class = FontDropDownList_gochiHand;
      
      private static const imFellEnglishSc:Class = FontDropDownList_imFellEnglishSc;
      
      private static const josefin:Class = FontDropDownList_josefin;
      
      private static const kaushan:Class = FontDropDownList_kaushan;
      
      private static const lilita_one:Class = FontDropDownList_lilita_one;
      
      private static const telex:Class = FontDropDownList_telex;
      
      private static const oswald:Class = FontDropDownList_oswald;
      
      private static const poiretone:Class = FontDropDownList_poiretone;
      
      private static const raleway:Class = FontDropDownList_raleway;
      
      private static const bangers:Class = FontDropDownList_bangers;
      
      private static const blackoutMignight:Class = FontDropDownList_blackoutMignight;
      
      private static const blackoutSunrise:Class = FontDropDownList_blackoutSunrise;
      
      private static const junction:Class = FontDropDownList_junction;
      
      private static const lato:Class = FontDropDownList_lato;
      
      private static const lobster:Class = FontDropDownList_lobster;
      
      private static const leagueGothic:Class = FontDropDownList_leagueGothic;
      
      private static const leagueSpartan:Class = FontDropDownList_leagueSpartan;
      
      private static const montserrat:Class = FontDropDownList_montserrat;
      
      private static const mouseMemoirs:Class = FontDropDownList_mouseMemoirs;
      
      private static const ostrichSansMedium:Class = FontDropDownList_ostrichSansMedium;
      
      private static const patrickHand:Class = FontDropDownList_patrickHand;
      
      private static const permanentMarker:Class = FontDropDownList_permanentMarker;
      
      private static const prociono:Class = FontDropDownList_prociono;
      
      private static const satisfy:Class = FontDropDownList_satisfy;
      
      private static const sriracha:Class = FontDropDownList_sriracha;
      
      private static const teko:Class = FontDropDownList_teko;
      
      private static const vidaloka:Class = FontDropDownList_vidaloka;
      
      private static const FontImageBerkshire:Class = FontDropDownList_FontImageBerkshire;
      
      private static const FontImageCaveat:Class = FontDropDownList_FontImageCaveat;
      
      private static const FontImageWalter:Class = FontDropDownList_FontImageWalter;
      
      private static const FontImageNoto:Class = FontDropDownList_FontImageNoto;
      
      private static const imageImport:Class = FontDropDownList_imageImport;
       
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      [SkinPart(required="true")]
      public var menuItemList:MenuItemList;
      
      private var _menuItemListDataProvider:IList;
      
      private var _1258971170_menuItems:ArrayCollection;
      
      private var _1731127853_stockFonts:ArrayCollection;
      
      private var _2126327416_userFontMenuItems:ArrayCollection;
      
      private var _1626957482_recentFonts:ArrayCollection;
      
      private var _defaultFont:FontModel;
      
      private var _fontLookup:Object;
      
      private var _cffFontLookup:Object;
      
      private var _userFontMenuItemLookup:Object;
      
      private var _proposedFont:String;
      
      protected var _cffMode:Boolean;
      
      public function FontDropDownList()
      {
         this._fontLookup = {};
         this._cffFontLookup = {};
         this._userFontMenuItemLookup = {};
         super();
         this.itemRenderer = this._FontDropDownList_ClassFactory1_c();
         this.buttonMode = true;
         this.addEventListener("creationComplete",this.___FontDropDownList_DropDownList1_creationComplete);
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         var factory:IFlexModuleFactory = param1;
         super.moduleFactory = factory;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
         if(!this.styleDeclaration)
         {
            this.styleDeclaration = new CSSStyleDeclaration(null,styleManager);
         }
         this.styleDeclaration.defaultFactory = function():void
         {
            this.skinClass = FontDropDownListSkin;
         };
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      public function get cffMode() : Boolean
      {
         return this._cffMode;
      }
      
      public function set cffMode(param1:Boolean) : void
      {
         if(this._cffMode != param1)
         {
            this._cffMode = param1;
            this.init();
         }
      }
      
      private function initStockFonts() : void
      {
         this._stockFonts = new ArrayCollection();
         this.addStockFont(new FontModel(FontManager.FONT_NAME_NOTO,FontManager.FONT_NAME_NOTO,"",FontManager.FONT_TYPE_GOOGLE,FontImageNoto,true,true,FontModel.DEFAULT_FONT_SORT_ORDER_NOTO));
         this.addStockFont(new FontModel(FontManager.FONT_NAME_ARIAL,FontManager.FONT_NAME_ARIAL,"",FontManager.FONT_TYPE_SYSTEM,null,false,true,FontModel.DEFAULT_FONT_SORT_ORDER_ARIAL));
         this.addStockFont(new FontModel("Accidental Presidency","Accidental Presidency","",FontManager.FONT_TYPE_GO,null,false));
         this.addStockFont(new FontModel("BodoniXT","BodoniXT","",FontManager.FONT_TYPE_GO,null,false));
         this.addStockFont(new FontModel("Brawler","Brawler","",FontManager.FONT_TYPE_GOOGLE,brawler));
         this.addStockFont(new FontModel("Budmo Jiggler","Budmo Jiggler","",FontManager.FONT_TYPE_GO,null,false));
         this.addStockFont(new FontModel("Budmo Jigglish","Budmo Jigglish","",FontManager.FONT_TYPE_GO,null,false));
         this.addStockFont(new FontModel("Casual","Blambot Casual","",FontManager.FONT_TYPE_GO,null,false));
         this.addStockFont(new FontModel("Claire Hand","Claire Hand","",FontManager.FONT_TYPE_GO,null,false));
         this.addStockFont(new FontModel("Comic Book","Comic Book","",FontManager.FONT_TYPE_GO,null,false));
         this.addStockFont(new FontModel("Coming Soon","Coming Soon","",FontManager.FONT_TYPE_GOOGLE,coming_soon));
         this.addStockFont(new FontModel("Existence Light","Existence Light","",FontManager.FONT_TYPE_GO,null,false));
         this.addStockFont(new FontModel("Glegoo","Glegoo","",FontManager.FONT_TYPE_GOOGLE,glegoo));
         if(!this._cffMode)
         {
            this.addStockFont(new FontModel("HeartlandRegular","HeartlandRegular","",FontManager.FONT_TYPE_GO,null,false));
         }
         this.addStockFont(new FontModel("Honey Script","Honey Script","",FontManager.FONT_TYPE_GO,null,false));
         this.addStockFont(new FontModel("I hate Comic Sans","I hate Comic Sans","",FontManager.FONT_TYPE_GO,null,false));
         this.addStockFont(new FontModel("Impact Label","Impact Label","",FontManager.FONT_TYPE_GO,null,false));
         this.addStockFont(new FontModel("Lilita One","Lilita One","",FontManager.FONT_TYPE_GOOGLE,lilita_one));
         if(!this._cffMode)
         {
            this.addStockFont(new FontModel("loco tv","loco tv","",FontManager.FONT_TYPE_GO,null,false));
         }
         this.addStockFont(new FontModel("Mail Ray Stuff","Mail Ray Stuff","",FontManager.FONT_TYPE_GO,null,false));
         this.addStockFont(new FontModel("Shanghai","Shanghai","",FontManager.FONT_TYPE_GO,null,false));
         this.addStockFont(new FontModel("Telex Regular","Telex Regular","",FontManager.FONT_TYPE_GOOGLE,telex));
         this.addStockFont(new FontModel("Tokyo","Tokyo Robot Intl BB","",FontManager.FONT_TYPE_GO,null,false));
         this.addStockFont(new FontModel("Wood Stamp","Wood Stamp","",FontManager.FONT_TYPE_GO,null,false));
         this.addStockFont(new FontModel("Poiret One","Poiret One","Poiret One",FontManager.FONT_TYPE_GO,poiretone));
         this.addStockFont(new FontModel("Raleway","Raleway","",FontManager.FONT_TYPE_GOOGLE,raleway));
         this.addStockFont(new FontModel("Oswald","Oswald","Oswald",FontManager.FONT_TYPE_GO,oswald));
         this.addStockFont(new FontModel("Bangers","Bangers","Bangers",FontManager.FONT_TYPE_GO,bangers));
         this.addStockFont(new FontModel("Creepster","Creepster","Creepster",FontManager.FONT_TYPE_GO,null,false));
         this.addStockFont(new FontModel("Blackout Midnight","BlackoutMidnight","BlackoutMidnight",FontManager.FONT_TYPE_GO,blackoutMignight));
         this.addStockFont(new FontModel("Blackout Sunrise","BlackoutSunrise","BlackoutSunrise",FontManager.FONT_TYPE_GO,blackoutSunrise));
         this.addStockFont(new FontModel("Junction","Junction","Junction",FontManager.FONT_TYPE_GO,junction));
         this.addStockFont(new FontModel("League Gothic","LeagueGothic","LeagueGothic",FontManager.FONT_TYPE_GO,leagueGothic));
         this.addStockFont(new FontModel("League Spartan","LeagueSpartan","LeagueSpartan",FontManager.FONT_TYPE_GO,leagueSpartan));
         this.addStockFont(new FontModel("Ostrich Sans Medium","OstrichSansMedium","OstrichSansMedium",FontManager.FONT_TYPE_GO,ostrichSansMedium));
         this.addStockFont(new FontModel("Lato","Lato","Lato",FontManager.FONT_TYPE_GO,lato));
         this.addStockFont(new FontModel("Prociono","Prociono","Prociono",FontManager.FONT_TYPE_GO,prociono));
         this.addStockFont(new FontModel("Alegreya Sans SC","Alegreya Sans SC","Alegreya Sans SC",FontManager.FONT_TYPE_GO,alegreyaSansSc));
         this.addStockFont(new FontModel("Barrio","Barrio","Barrio",FontManager.FONT_TYPE_GO,barrio));
         this.addStockFont(new FontModel("Bungee Inline","Bungee Inline","Bungee Inline",FontManager.FONT_TYPE_GO,bungeeInline));
         this.addStockFont(new FontModel("Bungee Shade","Bungee Shade","Bungee Shade",FontManager.FONT_TYPE_GO,bungeeShade));
         this.addStockFont(new FontModel("Gochi Hand","Gochi Hand","Gochi Hand",FontManager.FONT_TYPE_GO,gochiHand));
         this.addStockFont(new FontModel("IM Fell English SC","IM Fell English SC","IM Fell English SC",FontManager.FONT_TYPE_GO,imFellEnglishSc));
         this.addStockFont(new FontModel("Josefin","Josefin","Josefin",FontManager.FONT_TYPE_GO,josefin));
         this.addStockFont(new FontModel("Kaushan","Kaushan","Kaushan",FontManager.FONT_TYPE_GO,kaushan));
         this.addStockFont(new FontModel("Lobster","Lobster","Lobster",FontManager.FONT_TYPE_GO,lobster));
         this.addStockFont(new FontModel("Montserrat","Montserrat","Montserrat",FontManager.FONT_TYPE_GO,montserrat));
         this.addStockFont(new FontModel("Mouse Memoirs","Mouse Memoirs","Mouse Memoirs",FontManager.FONT_TYPE_GO,mouseMemoirs));
         this.addStockFont(new FontModel("Patrick Hand","Patrick Hand","Patrick Hand",FontManager.FONT_TYPE_GO,patrickHand));
         this.addStockFont(new FontModel("Permanent Marker","Permanent Marker","Permanent Marker",FontManager.FONT_TYPE_GO,permanentMarker));
         this.addStockFont(new FontModel("Satisfy","Satisfy","Satisfy",FontManager.FONT_TYPE_GO,satisfy));
         this.addStockFont(new FontModel("Sriracha","Sriracha","Sriracha",FontManager.FONT_TYPE_GO,sriracha));
         this.addStockFont(new FontModel("Teko","Teko","Teko",FontManager.FONT_TYPE_GO,teko));
         this.addStockFont(new FontModel("Vidaloka","Vidaloka","Vidaloka",FontManager.FONT_TYPE_GO,vidaloka));
         this.addStockFont(new FontModel("Berkshire Swash",FontManager.FONT_NAME_BERKSHIRE,"",FontManager.FONT_TYPE_GOOGLE,FontImageBerkshire));
         this.addStockFont(new FontModel("Caveat Brush",FontManager.FONT_NAME_CAVEAT,"",FontManager.FONT_TYPE_GOOGLE,FontImageCaveat));
         this.addStockFont(new FontModel("Walter Turncoat",FontManager.FONT_NAME_WALTER,"",FontManager.FONT_TYPE_GOOGLE,FontImageWalter));
         var _loc1_:Sort = new Sort();
         _loc1_.fields = [new SortField("isDefaultFont",false,true),new SortField("defaultFontSortOrder",false,true),new SortField("label")];
         this._stockFonts.sort = _loc1_;
         this._stockFonts.refresh();
      }
      
      protected function init() : void
      {
         this.initStockFonts();
         if(UtilSite.isGoAnimate)
         {
            this._recentFonts = new ArrayCollection();
            this.dataProvider = this._recentFonts;
            this.initMenu();
            StudioFontManager.instance.addEventListener(FontEvent.FONT_FAMILY_USED,this.studioFontManager_fontFamilyUsedHandler);
            UserAssetManager.instance.addEventListener(FontEvent.USER_FONT_ADDED,this.assetManager_userFontAddedHandler);
            UserAssetManager.instance.addEventListener(FontEvent.USER_FONT_REMOVED,this.userAssetManager_userFontRemovedHandler);
            SharedAssetManager.userSharedInstance.addEventListener(FontEvent.USER_FONT_ADDED,this.assetManager_userFontAddedHandler);
            FontManager.instance.addEventListener(FontEvent.USER_FONT_LIST_LOADED,this.console_userFontListLoadedHandler);
         }
         else
         {
            this.dataProvider = this._stockFonts;
         }
         this.selectedItem = this._fontLookup[this._proposedFont];
      }
      
      private function console_userFontListLoadedHandler(param1:FontEvent) : void
      {
         this.initUserFontMenu();
      }
      
      private function initUserFontMenu() : void
      {
         var _loc3_:FontModel = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc1_:FontManager = FontManager.getFontManager();
         var _loc2_:Array = _loc1_.customQueue;
         if(_loc2_ && _loc2_.length > 0)
         {
            _loc6_ = _loc2_.length;
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               _loc4_ = _loc2_[_loc7_];
               _loc3_ = _loc1_.getFontModelByFontId(_loc4_);
               _loc3_.imageUrl = _loc3_.listImageURI;
               this.addUserFont(_loc3_);
               _loc7_++;
            }
         }
      }
      
      private function initStockFontMenu() : void
      {
         var _loc1_:MenuItemModel = null;
         var _loc2_:FontModel = null;
         var _loc3_:ArrayCollection = null;
         var _loc4_:int = 0;
         if(this._stockFonts && this._stockFonts.length > 0)
         {
            _loc1_ = new MenuItemModel("",null,MenuItemModel.MENU_TYPE_SEPARATOR);
            this._menuItems.addItem(_loc1_);
            _loc3_ = new ArrayCollection();
            _loc4_ = 0;
            while(_loc4_ < this._stockFonts.length)
            {
               _loc2_ = this._stockFonts.getItemAt(_loc4_) as FontModel;
               if(_loc2_)
               {
                  _loc1_ = new MenuItemModel(_loc2_.label,_loc2_,MenuItemModel.MENU_TYPE_NORMAL);
                  _loc3_.addItem(_loc1_);
               }
               _loc4_++;
            }
            _loc1_ = new MenuItemModel(UtilDict.toDisplay(UtilDict.BUNDLE_NAME_GO,MENU_ITEM_LABEL_STOCK_FONT),null,MenuItemModel.MENU_TYPE_NORMAL,_loc3_);
            this._menuItems.addItem(_loc1_);
         }
      }
      
      private function initRecentFontMenu() : void
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc1_:ArrayCollection = StudioFontManager.instance.recentFonts;
         if(_loc1_ && _loc1_.length > 0)
         {
            _loc3_ = _loc1_.length;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc2_ = _loc1_.getItemAt(_loc4_) as String;
               this.addRecentFontById(_loc2_);
               _loc4_++;
            }
         }
      }
      
      private function initBanner() : void
      {
         var _loc1_:MenuItemModel = null;
         _loc1_ = new MenuItemModel("",null,MenuItemModel.MENU_TYPE_SEPARATOR);
         this._menuItems.addItem(_loc1_);
         if(!AccessRightManager.instance.getAccess(AccessRightManager.ACCESS_RIGHT_CUSTOM_FONT))
         {
            _loc1_ = new MenuItemModel(UtilDict.translate("Import fonts"),null,MenuItemModel.MENU_TYPE_BANNER);
            this._menuItems.addItem(_loc1_);
         }
         else
         {
            _loc1_ = new MenuItemModel(UtilDict.translate("Import font"),null,MenuItemModel.MENU_TYPE_UPLOAD,null,imageImport);
            this._menuItems.addItem(_loc1_);
         }
      }
      
      private function studioFontManager_fontFamilyUsedHandler(param1:FontEvent) : void
      {
         this.addRecentFontById(param1.fontId);
      }
      
      private function assetManager_userFontAddedHandler(param1:FontEvent) : void
      {
         var _loc3_:FontModel = null;
         var _loc2_:FontManager = FontManager.getFontManager();
         var _loc4_:String = param1.fontId;
         _loc3_ = _loc2_.getFontModelByFontId(_loc4_);
         if(_loc3_)
         {
            _loc3_.imageUrl = _loc3_.listImageURI;
            this.addUserFont(_loc3_);
         }
      }
      
      private function userAssetManager_userFontRemovedHandler(param1:FontEvent) : void
      {
         this.removeUserFontById(param1.fontId);
      }
      
      private function initMenu() : void
      {
         this._menuItems = new ArrayCollection();
         this._userFontMenuItems = null;
         this._userFontMenuItemLookup = {};
         this.initUserFontMenu();
         this.initStockFontMenu();
         this.initBanner();
         this.menuItemListDataProvider = this._menuItems;
         this.initRecentFontMenu();
      }
      
      public function addUserFont(param1:FontModel) : void
      {
         var _loc2_:MenuItemModel = null;
         if(!param1)
         {
            return;
         }
         if(!this._userFontMenuItems)
         {
            this._userFontMenuItems = new ArrayCollection();
            _loc2_ = new MenuItemModel("",null,MenuItemModel.MENU_TYPE_SEPARATOR);
            this._menuItems.addItemAt(_loc2_,0);
            _loc2_ = new MenuItemModel(UtilDict.toDisplay(UtilDict.BUNDLE_NAME_GO,MENU_ITEM_LABEL_USER_FONT),null,MenuItemModel.MENU_TYPE_NORMAL,this._userFontMenuItems);
            this._menuItems.addItemAt(_loc2_,1);
         }
         _loc2_ = this._userFontMenuItemLookup[param1.value] as MenuItemModel;
         if(!_loc2_)
         {
            _loc2_ = new MenuItemModel(param1.label,param1,MenuItemModel.MENU_TYPE_NORMAL);
            this._userFontMenuItems.addItem(_loc2_);
            this._userFontMenuItemLookup[param1.value] = _loc2_;
            this._fontLookup[param1.value] = param1;
            this._cffFontLookup[param1.cffValue] = param1;
         }
      }
      
      private function removeUserFontById(param1:String) : void
      {
         var _loc2_:FontModel = this._fontLookup[param1];
         if(_loc2_)
         {
            this.removeUserFont(_loc2_);
         }
      }
      
      public function removeUserFont(param1:FontModel) : void
      {
         var _loc3_:int = 0;
         if(!param1 || !this._userFontMenuItems)
         {
            return;
         }
         var _loc2_:MenuItemModel = this._userFontMenuItemLookup[param1.value] as MenuItemModel;
         if(_loc2_)
         {
            _loc3_ = this._userFontMenuItems.getItemIndex(_loc2_);
            if(_loc3_ >= 0)
            {
               this._userFontMenuItems.removeItemAt(_loc3_);
               if(this._userFontMenuItems.length == 0)
               {
                  this._menuItems.removeItemAt(1);
                  this._menuItems.removeItemAt(0);
                  this._userFontMenuItems = null;
                  this._userFontMenuItemLookup = {};
               }
            }
         }
      }
      
      public function addRecentFontById(param1:String) : void
      {
         if(FontVariantManager.instance.isVariantOfFont(param1,FontManager.FONT_NAME_NOTO))
         {
            param1 = FontManager.FONT_NAME_NOTO;
         }
         var _loc2_:FontModel = this._fontLookup[param1];
         if(_loc2_)
         {
            this.addRecentFont(_loc2_);
         }
      }
      
      private function addRecentFont(param1:FontModel) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc2_:int = this._recentFonts.getItemIndex(param1);
         if(_loc2_ >= 0)
         {
            this._recentFonts.removeItemAt(_loc2_);
         }
         this._recentFonts.addItemAt(param1,0);
         this.selectedItem = param1;
      }
      
      protected function addStockFont(param1:FontModel) : void
      {
         if(param1 && param1.enabled)
         {
            this._fontLookup[param1.value] = param1;
            this._cffFontLookup[param1.cffValue] = param1;
            this._stockFonts.addItem(param1);
         }
      }
      
      public function selectFont(param1:String) : void
      {
         this._proposedFont = param1;
         if(FontVariantManager.instance.isVariantOfFont(param1,FontManager.FONT_NAME_NOTO))
         {
            param1 = FontManager.FONT_NAME_NOTO;
         }
         var _loc2_:FontModel = this._fontLookup[param1];
         selectedItem = _loc2_;
      }
      
      public function selectCffFont(param1:String) : void
      {
         this._proposedFont = param1;
         var _loc2_:FontModel = this._cffFontLookup[param1];
         if(_loc2_)
         {
            this._proposedFont = _loc2_.value;
         }
         selectedItem = _loc2_;
      }
      
      public function getDefaultFont() : String
      {
         return this._defaultFont.value;
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this.menuItemList)
         {
            this.menuItemList.dataProvider = this._menuItemListDataProvider;
            this.menuItemList.addEventListener(MenuItemEvent.ITEM_CLICK,this.menu_itemClickHandler);
         }
         else if(param2 == dataGroup)
         {
            dataGroup.addEventListener(MouseEvent.ROLL_OVER,this.dataGroup_rollOverHandler);
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         super.partRemoved(param1,param2);
         if(param2 == this.menuItemList)
         {
            this.menuItemList.dataProvider = null;
            this.menuItemList.removeEventListener(MenuItemEvent.ITEM_CLICK,this.menu_itemClickHandler);
         }
         else if(param2 == dataGroup)
         {
            dataGroup.removeEventListener(MouseEvent.ROLL_OVER,this.dataGroup_rollOverHandler);
         }
      }
      
      protected function menu_itemClickHandler(param1:MenuItemEvent) : void
      {
         this.closeDropDown(false);
         var _loc2_:MenuItemEvent = new MenuItemEvent(MenuItemEvent.ITEM_CLICK,param1.item);
         _loc2_.isPropagated = true;
         _loc2_.mouseEvent = param1.mouseEvent;
         dispatchEvent(_loc2_);
      }
      
      protected function dataGroup_rollOverHandler(param1:MouseEvent) : void
      {
         if(this.menuItemList)
         {
            this.menuItemList.closeActiveItem();
         }
      }
      
      public function set menuItemListDataProvider(param1:IList) : void
      {
         this._menuItemListDataProvider = param1;
         if(this.menuItemList)
         {
            this.menuItemList.dataProvider = param1;
         }
      }
      
      private function _FontDropDownList_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = FontDropDownListItemRenderer;
         return _loc1_;
      }
      
      public function ___FontDropDownList_DropDownList1_creationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      [Bindable(event="propertyChange")]
      private function get _menuItems() : ArrayCollection
      {
         return this._1258971170_menuItems;
      }
      
      private function set _menuItems(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1258971170_menuItems;
         if(_loc2_ !== param1)
         {
            this._1258971170_menuItems = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_menuItems",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _stockFonts() : ArrayCollection
      {
         return this._1731127853_stockFonts;
      }
      
      private function set _stockFonts(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1731127853_stockFonts;
         if(_loc2_ !== param1)
         {
            this._1731127853_stockFonts = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_stockFonts",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _userFontMenuItems() : ArrayCollection
      {
         return this._2126327416_userFontMenuItems;
      }
      
      private function set _userFontMenuItems(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._2126327416_userFontMenuItems;
         if(_loc2_ !== param1)
         {
            this._2126327416_userFontMenuItems = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_userFontMenuItems",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _recentFonts() : ArrayCollection
      {
         return this._1626957482_recentFonts;
      }
      
      private function set _recentFonts(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1626957482_recentFonts;
         if(_loc2_ !== param1)
         {
            this._1626957482_recentFonts = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_recentFonts",_loc2_,param1));
            }
         }
      }
   }
}
