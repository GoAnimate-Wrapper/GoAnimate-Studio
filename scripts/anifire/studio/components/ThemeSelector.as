package anifire.studio.components
{
   import anifire.constant.ThemeConstants;
   import anifire.studio.events.ThemeChangeEvent;
   import anifire.studio.managers.AccessRightManager;
   import anifire.studio.skins.ThemeSelectorListSkin;
   import anifire.util.UtilDict;
   import anifire.util.UtilHashArray;
   import anifire.util.UtilSite;
   import anifire.util.UtilUser;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.ArrayCollection;
   import mx.collections.IList;
   import mx.core.ClassFactory;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.GradientEntry;
   import mx.graphics.LinearGradient;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import spark.collections.Sort;
   import spark.collections.SortField;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.List;
   import spark.components.VGroup;
   import spark.effects.Fade;
   import spark.events.ListEvent;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   import spark.primitives.RectangularDropShadow;
   
   use namespace mx_internal;
   
   public class ThemeSelector extends Group implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _ThemeSelector_Group4:Group;
      
      public var _ThemeSelector_List3:List;
      
      private var _433014735dropDown:ArrowTipContainer;
      
      private var _1534300475extraDataGroup:List;
      
      private var _1282133823fadeIn:Fade;
      
      private var _949550860menuAnchor:anifire.studio.components.PopUpAnchor;
      
      private var _1758726570menuDataGroup:List;
      
      private var _1548979104menuGroup:VGroup;
      
      private var _1473279851moreThemeGroup:Group;
      
      private var _137111012openButton:ThemeButton;
      
      private var _422458540subMenuAnchor:spark.components.PopUpAnchor;
      
      private var _862884101subMenuDataGroup1:List;
      
      private var _862884100subMenuDataGroup2:List;
      
      private var _862884099subMenuDataGroup3:List;
      
      private var _862884098subMenuDataGroup4:List;
      
      private var _546233856subMenuGroup:HGroup;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _1456074966_currentThemeId:String;
      
      private var _themeList:Object;
      
      private var _initialized:Boolean;
      
      protected var _1258971170_menuItems:ArrayCollection;
      
      protected var _727543184extraItems:ArrayCollection;
      
      protected var _1793100139moreItems:ArrayCollection;
      
      private var _368356591_showMoreItems:Boolean;
      
      protected var _187819760subMenuItems1:ArrayCollection;
      
      protected var _187819759subMenuItems2:ArrayCollection;
      
      protected var _187819758subMenuItems3:ArrayCollection;
      
      protected var _187819757subMenuItems4:ArrayCollection;
      
      protected var _1471720843_themeName:String = "";
      
      protected var _505274129_displayMenu1:Boolean = true;
      
      protected var _505274128_displayMenu2:Boolean = true;
      
      protected var _505274127_displayMenu3:Boolean = true;
      
      protected var _505274126_displayMenu4:Boolean = true;
      
      private var _ordering:Vector.<String>;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ThemeSelector()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._themeList = {};
         this._727543184extraItems = new ArrayCollection();
         this._1793100139moreItems = new ArrayCollection();
         this._187819760subMenuItems1 = new ArrayCollection();
         this._187819759subMenuItems2 = new ArrayCollection();
         this._187819758subMenuItems3 = new ArrayCollection();
         this._187819757subMenuItems4 = new ArrayCollection();
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._ThemeSelector_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_ThemeSelectorWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ThemeSelector[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.buttonMode = true;
         this.mxmlContent = [this._ThemeSelector_ThemeButton1_i(),this._ThemeSelector_PopUpAnchor1_i()];
         this._ThemeSelector_Fade1_i();
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         ThemeSelector._watcherSetupUtil = param1;
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
      
      public function get currentThemeId() : String
      {
         return this._currentThemeId;
      }
      
      public function setThemeById(param1:String, param2:Boolean = false) : void
      {
         var _loc4_:ArrayCollection = null;
         var _loc3_:Object = this._themeList[param1];
         if(_loc3_)
         {
            this._themeName = _loc3_["name"];
            this._currentThemeId = param1;
            if(!this._initialized || param2)
            {
               switch(param1)
               {
                  case ThemeConstants.USER_THEME_ID:
                  case ThemeConstants.COMMUNITY_THEME_ID:
                  case ThumbTray.MOVIE_THEME:
                  case "more":
                     return;
                  default:
                     _loc4_ = this.getDataSourceByThemeId(param1);
                     if(_loc4_)
                     {
                        this._menuItems = _loc4_;
                        this._displayMenu1 = this.subMenuItems1.length > 0 && this._menuItems != this.subMenuItems1;
                        this._displayMenu2 = this.subMenuItems2.length > 0 && this._menuItems != this.subMenuItems2;
                        this._displayMenu3 = this.subMenuItems3.length > 0 && this._menuItems != this.subMenuItems3;
                        this._displayMenu4 = this.subMenuItems4.length > 0 && this._menuItems != this.subMenuItems4;
                     }
                     this._initialized = true;
               }
            }
         }
      }
      
      private function getSortOrder(param1:String) : int
      {
         if(!this._ordering)
         {
            this._ordering = new Vector.<String>();
            this._ordering.push(ThemeConstants.BUSINESS_THEME_ID);
            this._ordering.push(ThemeConstants.WHITEBOARD_THEME_ID);
            this._ordering.push(ThemeConstants.INFOGRAPHICS_THEME_ID);
            this._ordering.push(ThemeConstants.COMMON_CRAFT_THEME_ID);
            this._ordering.push(ThemeConstants.STICKLY_BIZ_THEME_ID);
            this._ordering.push(ThemeConstants.BIZ_MODEL_THEME_ID);
            this._ordering.push(ThemeConstants.COMEDY_WORLD_THEME_ID);
            this._ordering.push(ThemeConstants.POLITIC_2_THEME_ID);
            this._ordering.push(ThemeConstants.ANIME_THEME_ID);
            this._ordering.push(ThemeConstants.NINJAANIME_THEME_ID);
            this._ordering.push(ThemeConstants.SPACE_CITIZEN_THEME_ID);
            this._ordering.push(ThemeConstants.LIL_PEEPZ_THEME_ID);
            this._ordering.push(ThemeConstants.CHIBI_THEME_ID);
            this._ordering.push(ThemeConstants.SPACE_THEME_ID);
            this._ordering.push(ThemeConstants.LIL_PETZ_THEME_ID);
            this._ordering.push(ThemeConstants.NINJA_THEME_ID);
            this._ordering.push(ThemeConstants.VIETNAM_THEME_ID);
            this._ordering.push(ThemeConstants.RETRO_THEME_ID);
            this._ordering.push(ThemeConstants.STICK_THEME_ID);
            this._ordering.push(ThemeConstants.POLITIC_THEME_ID);
            this._ordering.push(ThemeConstants.CHRISTMAS_THEME_ID);
            this._ordering.push(ThemeConstants.MONSTERMSH_THEME_ID);
         }
         var _loc2_:int = this._ordering.indexOf(param1);
         return _loc2_ >= 0?int(_loc2_):99;
      }
      
      protected function createMenuItem(param1:String, param2:String) : Object
      {
         if(param1 == ThemeConstants.COMMON_CRAFT_THEME_ID)
         {
            param2 = param2 + "®";
         }
         var _loc3_:Object = {
            "id":param1,
            "name":param2,
            "sortOrder":this.getSortOrder(param1)
         };
         this._themeList[param1] = _loc3_;
         return _loc3_;
      }
      
      public function buildMenu(param1:UtilHashArray, param2:int = 0) : void
      {
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc8_:Object = null;
         var _loc9_:ArrayCollection = null;
         var _loc3_:Number = param1.length;
         if(UtilUser.hasPlusFeatures())
         {
            this.extraItems.addItem(this.createMenuItem(ThumbTray.MOVIE_THEME,UtilDict.translate("In this Video")));
         }
         this.extraItems.addItem(this.createMenuItem(ThemeConstants.USER_THEME_ID,UtilDict.translate("Your Library")));
         if(AccessRightManager.instance.getAccess(AccessRightManager.ACCESS_RIGHT_TEAM_ADMIN))
         {
            this.extraItems.addItem(this.createMenuItem(ThemeConstants.TEAM_THEME_ID,UtilDict.translate("Team Library")));
         }
         if(AccessRightManager.instance.getAccess(AccessRightManager.ACCESS_RIGHT_TEAM_SHARING))
         {
            this.extraItems.addItem(this.createMenuItem(ThemeConstants.SHARED_THEME_ID,UtilDict.translate("Shared with you")));
         }
         if(UtilSite.siteId == UtilSite.SKOLETUBE)
         {
            _loc6_ = "Skoletubes samling";
            this.extraItems.addItem(this.createMenuItem(ThemeConstants.COMMUNITY_THEME_ID,_loc6_));
         }
         this.extraItems.addItem(this.createMenuItem(ThumbTray.CROSS_THEME_SEARCH,UtilDict.translate("Search all themes")));
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc7_ = param1.getKey(_loc4_);
            _loc8_ = this.createMenuItem(_loc7_,UtilDict.toDisplay("store",param1.getValueByIndex(_loc4_)));
            _loc9_ = this.getDataSourceByThemeId(_loc7_);
            if(_loc9_)
            {
               _loc9_.addItem(_loc8_);
            }
            _loc4_++;
         }
         this.sortSubMenuItems(this.subMenuItems1);
         this.sortSubMenuItems(this.subMenuItems2);
         this.sortSubMenuItems(this.subMenuItems3);
         this.sortSubMenuItems(this.subMenuItems4);
         this._currentThemeId = param1.getKey(param2);
         var _loc5_:ArrayCollection = this.getDataSourceByThemeId(this._currentThemeId);
         if(_loc3_ > _loc5_.length)
         {
            this.moreItems.addItem(this.createMenuItem("more",UtilDict.toDisplay("go","More Assets...")));
         }
         this.setThemeById(this._currentThemeId,true);
         if(UtilSite.isGoAnimate || UtilSite.isWix || UtilSite.isG4S)
         {
            this._showMoreItems = false;
         }
         else if(this.moreItems.length > 0)
         {
            this._showMoreItems = true;
         }
      }
      
      private function sortSubMenuItems(param1:ArrayCollection) : void
      {
         var _loc2_:Sort = new Sort();
         _loc2_.fields = [new SortField("sortOrder",false,true)];
         param1.sort = _loc2_;
         param1.refresh();
      }
      
      private function getDataSourceByThemeId(param1:String) : ArrayCollection
      {
         switch(param1)
         {
            case ThemeConstants.USER_THEME_ID:
            case ThemeConstants.COMMUNITY_THEME_ID:
            case ThumbTray.MOVIE_THEME:
            case ThumbTray.CROSS_THEME_SEARCH:
            case "more":
               return this.extraItems;
            case ThemeConstants.BUSINESS_THEME_ID:
            case ThemeConstants.STICKLY_BIZ_THEME_ID:
            case ThemeConstants.BIZ_MODEL_THEME_ID:
            case ThemeConstants.COMMON_CRAFT_THEME_ID:
            case ThemeConstants.WHITEBOARD_THEME_ID:
            case ThemeConstants.INFOGRAPHICS_THEME_ID:
               return this.subMenuItems2;
            case ThemeConstants.BOTDF_THEME_ID:
            case ThemeConstants.CHIBI_THEME_ID:
            case ThemeConstants.LIL_PEEPZ_THEME_ID:
            case ThemeConstants.LIL_PETZ_THEME_ID:
            case ThemeConstants.NINJA_THEME_ID:
            case ThemeConstants.SPACE_THEME_ID:
            case ThemeConstants.VIETNAM_THEME_ID:
               return this.subMenuItems3;
            case ThemeConstants.CHRISTMAS_THEME_ID:
            case ThemeConstants.MONSTERMSH_THEME_ID:
            case ThemeConstants.POLITIC_THEME_ID:
            case ThemeConstants.RETRO_THEME_ID:
            case ThemeConstants.STICK_THEME_ID:
            case ThemeConstants.STARTREK_THEME_ID:
               return this.subMenuItems4;
            default:
               return this.subMenuItems1;
         }
      }
      
      private function onItemRollOver(param1:ListEvent) : void
      {
         var _loc2_:Object = param1.item;
         if(_loc2_["id"] == "more")
         {
            this.subMenuAnchor.displayPopUp = true;
         }
      }
      
      private function onButtonClick() : void
      {
         this.subMenuAnchor.displayPopUp = false;
         this.menuAnchor.displayPopUp = true;
      }
      
      protected function onItemClick(param1:MouseEvent) : void
      {
         var _loc4_:String = null;
         var _loc5_:ThemeChangeEvent = null;
         var _loc2_:List = param1.currentTarget as List;
         var _loc3_:Object = _loc2_.selectedItem;
         if(_loc3_)
         {
            _loc4_ = _loc3_["id"];
            if(_loc4_ != "more" && _loc4_ != this._currentThemeId)
            {
               this.setThemeById(_loc4_);
               _loc5_ = new ThemeChangeEvent(ThemeChangeEvent.THEME_CHANGE,_loc3_["id"]);
               dispatchEvent(_loc5_);
            }
         }
         _loc2_.selectedIndex = -1;
      }
      
      private function _ThemeSelector_Fade1_i() : Fade
      {
         var _loc1_:Fade = new Fade();
         _loc1_.alphaFrom = 0;
         _loc1_.alphaTo = 1;
         _loc1_.duration = 300;
         this.fadeIn = _loc1_;
         BindingManager.executeBindings(this,"fadeIn",this.fadeIn);
         return _loc1_;
      }
      
      private function _ThemeSelector_ThemeButton1_i() : ThemeButton
      {
         var _loc1_:ThemeButton = new ThemeButton();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.addEventListener("click",this.__openButton_click);
         _loc1_.id = "openButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.openButton = _loc1_;
         BindingManager.executeBindings(this,"openButton",this.openButton);
         return _loc1_;
      }
      
      public function __openButton_click(param1:MouseEvent) : void
      {
         this.onButtonClick();
      }
      
      private function _ThemeSelector_PopUpAnchor1_i() : anifire.studio.components.PopUpAnchor
      {
         var _loc1_:anifire.studio.components.PopUpAnchor = new anifire.studio.components.PopUpAnchor();
         _loc1_.left = 5;
         _loc1_.bottom = 0;
         _loc1_.popUpPosition = "topLeft";
         _loc1_.displayPopUp = false;
         _loc1_.autoClose = true;
         _loc1_.popUp = this._ThemeSelector_ArrowTipContainer1_i();
         _loc1_.id = "menuAnchor";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.menuAnchor = _loc1_;
         BindingManager.executeBindings(this,"menuAnchor",this.menuAnchor);
         return _loc1_;
      }
      
      private function _ThemeSelector_ArrowTipContainer1_i() : ArrowTipContainer
      {
         var _loc1_:ArrowTipContainer = new ArrowTipContainer();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.tipPosition = "below";
         _loc1_.targetWidth = 20;
         _loc1_.offset = 15;
         _loc1_.content = [this._ThemeSelector_VGroup1_i()];
         _loc1_.id = "dropDown";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dropDown = _loc1_;
         BindingManager.executeBindings(this,"dropDown",this.dropDown);
         return _loc1_;
      }
      
      private function _ThemeSelector_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._ThemeSelector_List1_i(),this._ThemeSelector_Group2_c()];
         _loc1_.id = "menuGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.menuGroup = _loc1_;
         BindingManager.executeBindings(this,"menuGroup",this.menuGroup);
         return _loc1_;
      }
      
      private function _ThemeSelector_List1_i() : List
      {
         var _loc1_:List = new List();
         _loc1_.percentWidth = 100;
         _loc1_.itemRenderer = this._ThemeSelector_ClassFactory1_c();
         _loc1_.setStyle("skinClass",ThemeSelectorListSkin);
         _loc1_.addEventListener("click",this.__menuDataGroup_click);
         _loc1_.id = "menuDataGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.menuDataGroup = _loc1_;
         BindingManager.executeBindings(this,"menuDataGroup",this.menuDataGroup);
         return _loc1_;
      }
      
      private function _ThemeSelector_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = ThemeSelectorLargeIconItemRenderer;
         return _loc1_;
      }
      
      public function __menuDataGroup_click(param1:MouseEvent) : void
      {
         this.onItemClick(param1);
      }
      
      private function _ThemeSelector_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._ThemeSelector_Rect1_c(),this._ThemeSelector_Rect2_c(),this._ThemeSelector_VGroup2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ThemeSelector_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = -3;
         _loc1_.bottomLeftRadiusX = 3;
         _loc1_.bottomRightRadiusX = 3;
         _loc1_.stroke = this._ThemeSelector_SolidColorStroke1_c();
         _loc1_.fill = this._ThemeSelector_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ThemeSelector_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 10526623;
         return _loc1_;
      }
      
      private function _ThemeSelector_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 15659768;
         return _loc1_;
      }
      
      private function _ThemeSelector_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.right = 1;
         _loc1_.top = 0;
         _loc1_.height = 5;
         _loc1_.fill = this._ThemeSelector_LinearGradient1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ThemeSelector_LinearGradient1_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._ThemeSelector_GradientEntry1_c(),this._ThemeSelector_GradientEntry2_c()];
         return _loc1_;
      }
      
      private function _ThemeSelector_GradientEntry1_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 14936045;
         return _loc1_;
      }
      
      private function _ThemeSelector_GradientEntry2_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 15659768;
         return _loc1_;
      }
      
      private function _ThemeSelector_VGroup2_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.gap = 0;
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._ThemeSelector_List2_i(),this._ThemeSelector_Group3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ThemeSelector_List2_i() : List
      {
         var _loc1_:List = new List();
         _loc1_.percentWidth = 100;
         _loc1_.minHeight = 0;
         _loc1_.itemRenderer = this._ThemeSelector_ClassFactory2_c();
         _loc1_.setStyle("skinClass",ThemeSelectorListSkin);
         _loc1_.addEventListener("click",this.__extraDataGroup_click);
         _loc1_.addEventListener("itemRollOver",this.__extraDataGroup_itemRollOver);
         _loc1_.id = "extraDataGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.extraDataGroup = _loc1_;
         BindingManager.executeBindings(this,"extraDataGroup",this.extraDataGroup);
         return _loc1_;
      }
      
      private function _ThemeSelector_ClassFactory2_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = ThemeSelectorLargeIconItemRenderer;
         return _loc1_;
      }
      
      public function __extraDataGroup_click(param1:MouseEvent) : void
      {
         this.onItemClick(param1);
      }
      
      public function __extraDataGroup_itemRollOver(param1:ListEvent) : void
      {
         this.onItemRollOver(param1);
      }
      
      private function _ThemeSelector_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._ThemeSelector_Line1_c(),this._ThemeSelector_List3_i(),this._ThemeSelector_PopUpAnchor2_i()];
         _loc1_.id = "moreThemeGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.moreThemeGroup = _loc1_;
         BindingManager.executeBindings(this,"moreThemeGroup",this.moreThemeGroup);
         return _loc1_;
      }
      
      private function _ThemeSelector_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.stroke = this._ThemeSelector_SolidColorStroke2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ThemeSelector_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 12040892;
         return _loc1_;
      }
      
      private function _ThemeSelector_List3_i() : List
      {
         var _loc1_:List = new List();
         _loc1_.percentWidth = 100;
         _loc1_.minHeight = 0;
         _loc1_.setStyle("skinClass",ThemeSelectorListSkin);
         _loc1_.addEventListener("click",this.___ThemeSelector_List3_click);
         _loc1_.addEventListener("itemRollOver",this.___ThemeSelector_List3_itemRollOver);
         _loc1_.id = "_ThemeSelector_List3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ThemeSelector_List3 = _loc1_;
         BindingManager.executeBindings(this,"_ThemeSelector_List3",this._ThemeSelector_List3);
         return _loc1_;
      }
      
      public function ___ThemeSelector_List3_click(param1:MouseEvent) : void
      {
         this.onItemClick(param1);
      }
      
      public function ___ThemeSelector_List3_itemRollOver(param1:ListEvent) : void
      {
         this.onItemRollOver(param1);
      }
      
      private function _ThemeSelector_PopUpAnchor2_i() : spark.components.PopUpAnchor
      {
         var _loc1_:spark.components.PopUpAnchor = new spark.components.PopUpAnchor();
         _loc1_.percentHeight = 100;
         _loc1_.right = 8;
         _loc1_.popUpPosition = "right";
         _loc1_.popUp = this._ThemeSelector_Group4_i();
         _loc1_.id = "subMenuAnchor";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.subMenuAnchor = _loc1_;
         BindingManager.executeBindings(this,"subMenuAnchor",this.subMenuAnchor);
         return _loc1_;
      }
      
      private function _ThemeSelector_Group4_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._ThemeSelector_RectangularDropShadow1_c(),this._ThemeSelector_Rect3_c(),this._ThemeSelector_HGroup1_i()];
         _loc1_.id = "_ThemeSelector_Group4";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ThemeSelector_Group4 = _loc1_;
         BindingManager.executeBindings(this,"_ThemeSelector_Group4",this._ThemeSelector_Group4);
         return _loc1_;
      }
      
      private function _ThemeSelector_RectangularDropShadow1_c() : RectangularDropShadow
      {
         var _loc1_:RectangularDropShadow = new RectangularDropShadow();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.blurX = 20;
         _loc1_.blurY = 20;
         _loc1_.alpha = 0.45;
         _loc1_.distance = 7;
         _loc1_.angle = 90;
         _loc1_.color = 0;
         _loc1_.blRadius = 3;
         _loc1_.brRadius = 3;
         _loc1_.tlRadius = 3;
         _loc1_.trRadius = 3;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ThemeSelector_Rect3_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.radiusX = 3;
         _loc1_.stroke = this._ThemeSelector_SolidColorStroke3_c();
         _loc1_.fill = this._ThemeSelector_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ThemeSelector_SolidColorStroke3_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 10526623;
         return _loc1_;
      }
      
      private function _ThemeSelector_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _ThemeSelector_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = 0;
         _loc1_.top = 3;
         _loc1_.bottom = 3;
         _loc1_.mxmlContent = [this._ThemeSelector_List4_i(),this._ThemeSelector_List5_i(),this._ThemeSelector_List6_i(),this._ThemeSelector_List7_i()];
         _loc1_.id = "subMenuGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.subMenuGroup = _loc1_;
         BindingManager.executeBindings(this,"subMenuGroup",this.subMenuGroup);
         return _loc1_;
      }
      
      private function _ThemeSelector_List4_i() : List
      {
         var _loc1_:List = new List();
         _loc1_.percentHeight = 100;
         _loc1_.setStyle("skinClass",ThemeSelectorListSkin);
         _loc1_.addEventListener("click",this.__subMenuDataGroup1_click);
         _loc1_.id = "subMenuDataGroup1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.subMenuDataGroup1 = _loc1_;
         BindingManager.executeBindings(this,"subMenuDataGroup1",this.subMenuDataGroup1);
         return _loc1_;
      }
      
      public function __subMenuDataGroup1_click(param1:MouseEvent) : void
      {
         this.onItemClick(param1);
      }
      
      private function _ThemeSelector_List5_i() : List
      {
         var _loc1_:List = new List();
         _loc1_.percentHeight = 100;
         _loc1_.setStyle("skinClass",ThemeSelectorListSkin);
         _loc1_.addEventListener("click",this.__subMenuDataGroup2_click);
         _loc1_.id = "subMenuDataGroup2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.subMenuDataGroup2 = _loc1_;
         BindingManager.executeBindings(this,"subMenuDataGroup2",this.subMenuDataGroup2);
         return _loc1_;
      }
      
      public function __subMenuDataGroup2_click(param1:MouseEvent) : void
      {
         this.onItemClick(param1);
      }
      
      private function _ThemeSelector_List6_i() : List
      {
         var _loc1_:List = new List();
         _loc1_.percentHeight = 100;
         _loc1_.setStyle("skinClass",ThemeSelectorListSkin);
         _loc1_.addEventListener("click",this.__subMenuDataGroup3_click);
         _loc1_.id = "subMenuDataGroup3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.subMenuDataGroup3 = _loc1_;
         BindingManager.executeBindings(this,"subMenuDataGroup3",this.subMenuDataGroup3);
         return _loc1_;
      }
      
      public function __subMenuDataGroup3_click(param1:MouseEvent) : void
      {
         this.onItemClick(param1);
      }
      
      private function _ThemeSelector_List7_i() : List
      {
         var _loc1_:List = new List();
         _loc1_.percentHeight = 100;
         _loc1_.setStyle("skinClass",ThemeSelectorListSkin);
         _loc1_.addEventListener("click",this.__subMenuDataGroup4_click);
         _loc1_.id = "subMenuDataGroup4";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.subMenuDataGroup4 = _loc1_;
         BindingManager.executeBindings(this,"subMenuDataGroup4",this.subMenuDataGroup4);
         return _loc1_;
      }
      
      public function __subMenuDataGroup4_click(param1:MouseEvent) : void
      {
         this.onItemClick(param1);
      }
      
      private function _ThemeSelector_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = _currentThemeId;
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"openButton.themeId");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = _themeName;
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"openButton.label");
         result[2] = new Binding(this,null,function(param1:*):void
         {
            dropDown.setStyle("showEffect",param1);
         },"dropDown.showEffect","fadeIn");
         result[3] = new Binding(this,function():IList
         {
            return _menuItems;
         },null,"menuDataGroup.dataProvider");
         result[4] = new Binding(this,function():IList
         {
            return extraItems;
         },null,"extraDataGroup.dataProvider");
         result[5] = new Binding(this,function():Boolean
         {
            return _showMoreItems;
         },null,"moreThemeGroup.visible");
         result[6] = new Binding(this,function():Boolean
         {
            return _showMoreItems;
         },null,"moreThemeGroup.includeInLayout");
         result[7] = new Binding(this,function():IList
         {
            return moreItems;
         },null,"_ThemeSelector_List3.dataProvider");
         result[8] = new Binding(this,null,function(param1:*):void
         {
            _ThemeSelector_Group4.setStyle("showEffect",param1);
         },"_ThemeSelector_Group4.showEffect","fadeIn");
         result[9] = new Binding(this,function():IList
         {
            return subMenuItems1;
         },null,"subMenuDataGroup1.dataProvider");
         result[10] = new Binding(this,function():Boolean
         {
            return _displayMenu1;
         },null,"subMenuDataGroup1.visible");
         result[11] = new Binding(this,function():Boolean
         {
            return _displayMenu1;
         },null,"subMenuDataGroup1.includeInLayout");
         result[12] = new Binding(this,function():IList
         {
            return subMenuItems2;
         },null,"subMenuDataGroup2.dataProvider");
         result[13] = new Binding(this,function():Boolean
         {
            return _displayMenu2;
         },null,"subMenuDataGroup2.visible");
         result[14] = new Binding(this,function():Boolean
         {
            return _displayMenu2;
         },null,"subMenuDataGroup2.includeInLayout");
         result[15] = new Binding(this,function():IList
         {
            return subMenuItems3;
         },null,"subMenuDataGroup3.dataProvider");
         result[16] = new Binding(this,function():Boolean
         {
            return _displayMenu3;
         },null,"subMenuDataGroup3.visible");
         result[17] = new Binding(this,function():Boolean
         {
            return _displayMenu3;
         },null,"subMenuDataGroup3.includeInLayout");
         result[18] = new Binding(this,function():IList
         {
            return subMenuItems4;
         },null,"subMenuDataGroup4.dataProvider");
         result[19] = new Binding(this,function():Boolean
         {
            return _displayMenu4;
         },null,"subMenuDataGroup4.visible");
         result[20] = new Binding(this,function():Boolean
         {
            return _displayMenu4;
         },null,"subMenuDataGroup4.includeInLayout");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get dropDown() : ArrowTipContainer
      {
         return this._433014735dropDown;
      }
      
      public function set dropDown(param1:ArrowTipContainer) : void
      {
         var _loc2_:Object = this._433014735dropDown;
         if(_loc2_ !== param1)
         {
            this._433014735dropDown = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dropDown",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get extraDataGroup() : List
      {
         return this._1534300475extraDataGroup;
      }
      
      public function set extraDataGroup(param1:List) : void
      {
         var _loc2_:Object = this._1534300475extraDataGroup;
         if(_loc2_ !== param1)
         {
            this._1534300475extraDataGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"extraDataGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fadeIn() : Fade
      {
         return this._1282133823fadeIn;
      }
      
      public function set fadeIn(param1:Fade) : void
      {
         var _loc2_:Object = this._1282133823fadeIn;
         if(_loc2_ !== param1)
         {
            this._1282133823fadeIn = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fadeIn",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get menuAnchor() : anifire.studio.components.PopUpAnchor
      {
         return this._949550860menuAnchor;
      }
      
      public function set menuAnchor(param1:anifire.studio.components.PopUpAnchor) : void
      {
         var _loc2_:Object = this._949550860menuAnchor;
         if(_loc2_ !== param1)
         {
            this._949550860menuAnchor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"menuAnchor",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get menuDataGroup() : List
      {
         return this._1758726570menuDataGroup;
      }
      
      public function set menuDataGroup(param1:List) : void
      {
         var _loc2_:Object = this._1758726570menuDataGroup;
         if(_loc2_ !== param1)
         {
            this._1758726570menuDataGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"menuDataGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get menuGroup() : VGroup
      {
         return this._1548979104menuGroup;
      }
      
      public function set menuGroup(param1:VGroup) : void
      {
         var _loc2_:Object = this._1548979104menuGroup;
         if(_loc2_ !== param1)
         {
            this._1548979104menuGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"menuGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get moreThemeGroup() : Group
      {
         return this._1473279851moreThemeGroup;
      }
      
      public function set moreThemeGroup(param1:Group) : void
      {
         var _loc2_:Object = this._1473279851moreThemeGroup;
         if(_loc2_ !== param1)
         {
            this._1473279851moreThemeGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"moreThemeGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get openButton() : ThemeButton
      {
         return this._137111012openButton;
      }
      
      public function set openButton(param1:ThemeButton) : void
      {
         var _loc2_:Object = this._137111012openButton;
         if(_loc2_ !== param1)
         {
            this._137111012openButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"openButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get subMenuAnchor() : spark.components.PopUpAnchor
      {
         return this._422458540subMenuAnchor;
      }
      
      public function set subMenuAnchor(param1:spark.components.PopUpAnchor) : void
      {
         var _loc2_:Object = this._422458540subMenuAnchor;
         if(_loc2_ !== param1)
         {
            this._422458540subMenuAnchor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"subMenuAnchor",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get subMenuDataGroup1() : List
      {
         return this._862884101subMenuDataGroup1;
      }
      
      public function set subMenuDataGroup1(param1:List) : void
      {
         var _loc2_:Object = this._862884101subMenuDataGroup1;
         if(_loc2_ !== param1)
         {
            this._862884101subMenuDataGroup1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"subMenuDataGroup1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get subMenuDataGroup2() : List
      {
         return this._862884100subMenuDataGroup2;
      }
      
      public function set subMenuDataGroup2(param1:List) : void
      {
         var _loc2_:Object = this._862884100subMenuDataGroup2;
         if(_loc2_ !== param1)
         {
            this._862884100subMenuDataGroup2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"subMenuDataGroup2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get subMenuDataGroup3() : List
      {
         return this._862884099subMenuDataGroup3;
      }
      
      public function set subMenuDataGroup3(param1:List) : void
      {
         var _loc2_:Object = this._862884099subMenuDataGroup3;
         if(_loc2_ !== param1)
         {
            this._862884099subMenuDataGroup3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"subMenuDataGroup3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get subMenuDataGroup4() : List
      {
         return this._862884098subMenuDataGroup4;
      }
      
      public function set subMenuDataGroup4(param1:List) : void
      {
         var _loc2_:Object = this._862884098subMenuDataGroup4;
         if(_loc2_ !== param1)
         {
            this._862884098subMenuDataGroup4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"subMenuDataGroup4",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get subMenuGroup() : HGroup
      {
         return this._546233856subMenuGroup;
      }
      
      public function set subMenuGroup(param1:HGroup) : void
      {
         var _loc2_:Object = this._546233856subMenuGroup;
         if(_loc2_ !== param1)
         {
            this._546233856subMenuGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"subMenuGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _currentThemeId() : String
      {
         return this._1456074966_currentThemeId;
      }
      
      private function set _currentThemeId(param1:String) : void
      {
         var _loc2_:Object = this._1456074966_currentThemeId;
         if(_loc2_ !== param1)
         {
            this._1456074966_currentThemeId = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_currentThemeId",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _menuItems() : ArrayCollection
      {
         return this._1258971170_menuItems;
      }
      
      protected function set _menuItems(param1:ArrayCollection) : void
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
      protected function get extraItems() : ArrayCollection
      {
         return this._727543184extraItems;
      }
      
      protected function set extraItems(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._727543184extraItems;
         if(_loc2_ !== param1)
         {
            this._727543184extraItems = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"extraItems",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get moreItems() : ArrayCollection
      {
         return this._1793100139moreItems;
      }
      
      protected function set moreItems(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1793100139moreItems;
         if(_loc2_ !== param1)
         {
            this._1793100139moreItems = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"moreItems",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _showMoreItems() : Boolean
      {
         return this._368356591_showMoreItems;
      }
      
      private function set _showMoreItems(param1:Boolean) : void
      {
         var _loc2_:Object = this._368356591_showMoreItems;
         if(_loc2_ !== param1)
         {
            this._368356591_showMoreItems = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_showMoreItems",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get subMenuItems1() : ArrayCollection
      {
         return this._187819760subMenuItems1;
      }
      
      protected function set subMenuItems1(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._187819760subMenuItems1;
         if(_loc2_ !== param1)
         {
            this._187819760subMenuItems1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"subMenuItems1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get subMenuItems2() : ArrayCollection
      {
         return this._187819759subMenuItems2;
      }
      
      protected function set subMenuItems2(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._187819759subMenuItems2;
         if(_loc2_ !== param1)
         {
            this._187819759subMenuItems2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"subMenuItems2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get subMenuItems3() : ArrayCollection
      {
         return this._187819758subMenuItems3;
      }
      
      protected function set subMenuItems3(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._187819758subMenuItems3;
         if(_loc2_ !== param1)
         {
            this._187819758subMenuItems3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"subMenuItems3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get subMenuItems4() : ArrayCollection
      {
         return this._187819757subMenuItems4;
      }
      
      protected function set subMenuItems4(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._187819757subMenuItems4;
         if(_loc2_ !== param1)
         {
            this._187819757subMenuItems4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"subMenuItems4",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _themeName() : String
      {
         return this._1471720843_themeName;
      }
      
      protected function set _themeName(param1:String) : void
      {
         var _loc2_:Object = this._1471720843_themeName;
         if(_loc2_ !== param1)
         {
            this._1471720843_themeName = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_themeName",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _displayMenu1() : Boolean
      {
         return this._505274129_displayMenu1;
      }
      
      protected function set _displayMenu1(param1:Boolean) : void
      {
         var _loc2_:Object = this._505274129_displayMenu1;
         if(_loc2_ !== param1)
         {
            this._505274129_displayMenu1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_displayMenu1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _displayMenu2() : Boolean
      {
         return this._505274128_displayMenu2;
      }
      
      protected function set _displayMenu2(param1:Boolean) : void
      {
         var _loc2_:Object = this._505274128_displayMenu2;
         if(_loc2_ !== param1)
         {
            this._505274128_displayMenu2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_displayMenu2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _displayMenu3() : Boolean
      {
         return this._505274127_displayMenu3;
      }
      
      protected function set _displayMenu3(param1:Boolean) : void
      {
         var _loc2_:Object = this._505274127_displayMenu3;
         if(_loc2_ !== param1)
         {
            this._505274127_displayMenu3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_displayMenu3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _displayMenu4() : Boolean
      {
         return this._505274126_displayMenu4;
      }
      
      protected function set _displayMenu4(param1:Boolean) : void
      {
         var _loc2_:Object = this._505274126_displayMenu4;
         if(_loc2_ !== param1)
         {
            this._505274126_displayMenu4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_displayMenu4",_loc2_,param1));
            }
         }
      }
   }
}
