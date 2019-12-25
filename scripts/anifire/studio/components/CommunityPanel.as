package anifire.studio.components
{
	import anifire.constant.AnimeConstants;
	import anifire.event.CoreEvent;
	import anifire.studio.events.InfiniteScrollEvent;
	import anifire.studio.managers.CommunityStuffManager;
	import anifire.studio.skins.PropertyTabBarSkin;
	import anifire.studio.skins.SearchTextInputSkin;
	import anifire.studio.skins.StarterListSkin;
	import anifire.util.UtilDict;
	import anifire.util.UtilSite;
	import flash.display.DisplayObjectContainer;
	import flash.utils.getDefinitionByName;
	import mx.binding.Binding;
	import mx.binding.BindingManager;
	import mx.binding.IBindingClient;
	import mx.binding.IWatcherSetupUtil2;
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.containers.ViewStack;
	import mx.core.ClassFactory;
	import mx.core.DeferredInstanceFromFunction;
	import mx.core.FlexGlobals;
	import mx.core.IFlexModuleFactory;
	import mx.core.UIComponentDescriptor;
	import mx.core.mx_internal;
	import mx.events.FlexEvent;
	import mx.events.PropertyChangeEvent;
	import mx.graphics.SolidColor;
	import mx.graphics.SolidColorStroke;
	import spark.components.Group;
	import spark.components.TabBar;
	import spark.components.VGroup;
	import spark.events.IndexChangeEvent;
	import spark.layouts.TileLayout;
	import spark.layouts.VerticalLayout;
	import spark.primitives.Line;
	import spark.primitives.Rect;
	
	use namespace mx_internal;
	
	public class CommunityPanel extends spark.components.NavigatorContent implements IBindingClient
	{
		
		private static var _watcherSetupUtil:IWatcherSetupUtil2;
		 
		
		private var _1298714998backgroundPanel:spark.components.NavigatorContent;
		
		private var _342683739characterPanel:spark.components.NavigatorContent;
		
		private var _240275900commnuityPropList:DecoratedList;
		
		private var _1435738933communityBackgroundList:DecoratedList;
		
		private var _265878018communityCharacterList:DecoratedList;
		
		private var _742515615propPanel:spark.components.NavigatorContent;
		
		private var _1778179843searchBox:VGroup;
		
		private var _559723774searchInput:FocusTextInput;
		
		private var _553648836searchPanel:CommunitySearchPanel;
		
		private var _881418178tabBar:TabBar;
		
		private var _261440066tabNavigator:ViewStack;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private var _835260333manager:CommunityStuffManager;
		
		private var panelInitialized:Boolean;
		
		private var backgroundReady:Boolean;
		
		private var propReady:Boolean;
		
		private var characterReady:Boolean;
		
		private var loadingType:String;
		
		private var searchType:String;
		
		private var _911433631displaySearchBox:Boolean;
		
		private var _336650556loading:Boolean;
		
		protected var _876192357_characterSource:ArrayCollection;
		
		protected var _1419899208_backgroundSource:ArrayCollection;
		
		protected var _355797251_propSource:ArrayCollection;
		
		mx_internal var _bindings:Array;
		
		mx_internal var _watchers:Array;
		
		mx_internal var _bindingsByDestination:Object;
		
		mx_internal var _bindingsBeginWithWord:Object;
		
		public function CommunityPanel()
		{
			var target:Object = null;
			var watcherSetupUtilClass:Object = null;
			this._bindings = [];
			this._watchers = [];
			this._bindingsByDestination = {};
			this._bindingsBeginWithWord = {};
			super();
			mx_internal::_document = this;
			var bindings:Array = this._CommunityPanel_bindingsSetup();
			var watchers:Array = [];
			target = this;
			if(_watcherSetupUtil == null)
			{
				watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_CommunityPanelWatcherSetupUtil");
				watcherSetupUtilClass["init"](null);
			}
			_watcherSetupUtil.setup(this,function(param1:String):*
			{
				return target[param1];
			},function(param1:String):*
			{
				return CommunityPanel[param1];
			},bindings,watchers);
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.layout = this._CommunityPanel_VerticalLayout1_c();
			this.mxmlContentFactory = new DeferredInstanceFromFunction(this._CommunityPanel_Array1_c);
			this.addEventListener("contentCreationComplete",this.___CommunityPanel_NavigatorContent1_contentCreationComplete);
			var i:uint = 0;
			while(i < bindings.length)
			{
				Binding(bindings[i]).execute();
				i++;
			}
		}
		
		public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
		{
			CommunityPanel._watcherSetupUtil = param1;
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
		
		private function init() : void
		{
			this.manager = CommunityStuffManager.instance;
			this.manager.addEventListener(CoreEvent.LOAD_COMMUNITY_ASSET_COMPLETE,this.onLoadAssetComplete);
			this._characterSource = new ArrayCollection();
			this._backgroundSource = new ArrayCollection();
			this._propSource = new ArrayCollection();
			this.searchType = AnimeConstants.ASSET_TYPE_PROP;
			this.displaySearchBox = true;
		}
		
		public function showPanel() : void
		{
			var _loc1_:ComplexityPopUp = null;
			if(!this.panelInitialized)
			{
				_loc1_ = new ComplexityPopUp();
				_loc1_.createDefaultPopUp();
				if(UtilSite.siteId == UtilSite.SKOLETUBE)
				{
					_loc1_.title = "Skoletubes ressourcesamling";
					_loc1_.message = "I skoletubes ressourcesamling har vi lagt nogle billeder og karakterer ud som du frit kan bruge i alle dine Goanimateproduktioner. Samlingen knytter sig til centrale fagområder og undervisningsforløb – fx. Vikinger, klima osv. Samlingen vil løbende blive udvidet. Denne samling vedligeholdes af Skoletubeteamet og samarbejdspartnere og er kun tilgængelig for Skoletubes brugere.";
				}
				else
				{
					_loc1_.title = "Community Library Warning";
					_loc1_.message = "Items inside Community Library are submitted by users and they have not been reviewed by Vyond. VideoMaker stability and video playback performance may get adversely affected by items you select to use here.\n\nIf your video or our VideoMaker do not behave as normal, community items could be the cause.  Make a copy of your video and try removing them.";
				}
				_loc1_.confirmText = UtilDict.toDisplay("go","Continue");
				_loc1_.open(FlexGlobals.topLevelApplication as DisplayObjectContainer,true);
				this.loadAsset(AnimeConstants.ASSET_TYPE_PROP);
				this.panelInitialized = true;
			}
		}
		
		private function onBackgroundInfiniteScroll(param1:InfiniteScrollEvent) : void
		{
			if(!this.loading && this.manager.hasMoreCommunityBg)
			{
				this.loadAsset(AnimeConstants.ASSET_TYPE_BG);
			}
		}
		
		private function onPropInfiniteScroll(param1:InfiniteScrollEvent) : void
		{
			if(!this.loading && this.manager.hasMoreCommunityProp)
			{
				this.loadAsset(AnimeConstants.ASSET_TYPE_PROP);
			}
		}
		
		private function onCharacterInfiniteScroll(param1:InfiniteScrollEvent) : void
		{
			if(!this.loading && this.manager.hasMoreCommunityChar)
			{
				this.loadAsset(AnimeConstants.ASSET_TYPE_CHAR);
			}
		}
		
		private function loadAsset(param1:String) : void
		{
			this.loading = true;
			this.loadingType = param1;
			this.manager.loadStuff(param1);
		}
		
		private function onLoadAssetComplete(param1:CoreEvent) : void
		{
			this.loading = false;
			switch(this.loadingType)
			{
				case AnimeConstants.ASSET_TYPE_BG:
					this.backgroundReady = true;
					break;
				case AnimeConstants.ASSET_TYPE_PROP:
					this.propReady = true;
					break;
				case AnimeConstants.ASSET_TYPE_CHAR:
					this.characterReady = true;
			}
		}
		
		private function onTabChange(param1:IndexChangeEvent) : void
		{
			if(this.tabNavigator.selectedChild == this.backgroundPanel)
			{
				this.displaySearchBox = true;
				this.searchType = AnimeConstants.ASSET_TYPE_BG;
				if(!this.backgroundReady)
				{
					this.loadAsset(AnimeConstants.ASSET_TYPE_BG);
				}
			}
			else if(this.tabNavigator.selectedChild == this.propPanel)
			{
				this.displaySearchBox = true;
				this.searchType = AnimeConstants.ASSET_TYPE_PROP;
				if(!this.propReady)
				{
					this.loadAsset(AnimeConstants.ASSET_TYPE_PROP);
				}
			}
			else if(this.tabNavigator.selectedChild == this.characterPanel)
			{
				this.displaySearchBox = false;
				if(!this.characterReady)
				{
					this.loadAsset(AnimeConstants.ASSET_TYPE_CHAR);
				}
			}
			else
			{
				this.displaySearchBox = false;
			}
		}
		
		private function onSearchInputEnter(param1:FlexEvent) : void
		{
			this.displaySearchBox = false;
			var _loc2_:String = this.searchInput.text;
			this.tabNavigator.selectedChild = this.searchPanel;
			this.searchPanel.searchByType(_loc2_,this.searchType);
		}
		
		private function _CommunityPanel_VerticalLayout1_c() : VerticalLayout
		{
			var _loc1_:VerticalLayout = new VerticalLayout();
			_loc1_.gap = 0;
			return _loc1_;
		}
		
		private function _CommunityPanel_Array1_c() : Array
		{
			var _loc1_:Array = [this._CommunityPanel_TabBar1_i(),this._CommunityPanel_Group1_c()];
			return _loc1_;
		}
		
		private function _CommunityPanel_TabBar1_i() : TabBar
		{
			var _loc1_:TabBar = new TabBar();
			_loc1_.percentWidth = 100;
			_loc1_.focusEnabled = false;
			_loc1_.setStyle("fontSize",12);
			_loc1_.setStyle("skinClass",PropertyTabBarSkin);
			_loc1_.addEventListener("change",this.__tabBar_change);
			_loc1_.id = "tabBar";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.tabBar = _loc1_;
			BindingManager.executeBindings(this,"tabBar",this.tabBar);
			return _loc1_;
		}
		
		public function __tabBar_change(param1:IndexChangeEvent) : void
		{
			this.onTabChange(param1);
		}
		
		private function _CommunityPanel_Group1_c() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.mxmlContent = [this._CommunityPanel_Rect1_c(),this._CommunityPanel_VGroup1_c(),this._CommunityPanel_Line1_c()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _CommunityPanel_Rect1_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.fill = this._CommunityPanel_SolidColor1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _CommunityPanel_SolidColor1_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 14936045;
			return _loc1_;
		}
		
		private function _CommunityPanel_VGroup1_c() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.gap = 0;
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.mxmlContent = [this._CommunityPanel_VGroup2_i(),this._CommunityPanel_ViewStack1_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _CommunityPanel_VGroup2_i() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.percentWidth = 100;
			_loc1_.paddingTop = 7;
			_loc1_.paddingBottom = 7;
			_loc1_.paddingLeft = 7;
			_loc1_.paddingRight = 7;
			_loc1_.mxmlContent = [this._CommunityPanel_FocusTextInput1_i()];
			_loc1_.id = "searchBox";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.searchBox = _loc1_;
			BindingManager.executeBindings(this,"searchBox",this.searchBox);
			return _loc1_;
		}
		
		private function _CommunityPanel_FocusTextInput1_i() : FocusTextInput
		{
			var _loc1_:FocusTextInput = new FocusTextInput();
			_loc1_.percentWidth = 100;
			_loc1_.isSearching = false;
			_loc1_.setStyle("skinClass",SearchTextInputSkin);
			_loc1_.addEventListener("enter",this.__searchInput_enter);
			_loc1_.id = "searchInput";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.searchInput = _loc1_;
			BindingManager.executeBindings(this,"searchInput",this.searchInput);
			return _loc1_;
		}
		
		public function __searchInput_enter(param1:FlexEvent) : void
		{
			this.onSearchInputEnter(param1);
		}
		
		private function _CommunityPanel_ViewStack1_i() : ViewStack
		{
			var temp:ViewStack = new ViewStack();
			temp.percentWidth = 100;
			temp.percentHeight = 100;
			temp.id = "tabNavigator";
			if(!temp.document)
			{
				temp.document = this;
			}
			temp.mx_internal::_documentDescriptor = new UIComponentDescriptor({
				"type":ViewStack,
				"id":"tabNavigator",
				"propertiesFactory":function():Object
				{
					return {"childDescriptors":[new UIComponentDescriptor({
						"type":NavigatorContent,
						"id":"propPanel",
						"propertiesFactory":function():Object
						{
							return {
								"percentWidth":100,
								"percentHeight":100,
								"mxmlContentFactory":new DeferredInstanceFromFunction(_CommunityPanel_Array5_c)
							};
						}
					}),new UIComponentDescriptor({
						"type":NavigatorContent,
						"id":"backgroundPanel",
						"propertiesFactory":function():Object
						{
							return {
								"percentWidth":100,
								"percentHeight":100,
								"mxmlContentFactory":new DeferredInstanceFromFunction(_CommunityPanel_Array6_c)
							};
						}
					}),new UIComponentDescriptor({
						"type":NavigatorContent,
						"id":"characterPanel",
						"propertiesFactory":function():Object
						{
							return {
								"percentWidth":100,
								"percentHeight":100,
								"mxmlContentFactory":new DeferredInstanceFromFunction(_CommunityPanel_Array7_c)
							};
						}
					}),new UIComponentDescriptor({
						"type":CommunitySearchPanel,
						"id":"searchPanel",
						"propertiesFactory":function():Object
						{
							return {
								"percentWidth":100,
								"percentHeight":100
							};
						}
					})]};
				}
			});
			temp.mx_internal::_documentDescriptor.document = this;
			this.tabNavigator = temp;
			BindingManager.executeBindings(this,"tabNavigator",this.tabNavigator);
			return temp;
		}
		
		private function _CommunityPanel_Array5_c() : Array
		{
			var _loc1_:Array = [this._CommunityPanel_DecoratedList1_i()];
			return _loc1_;
		}
		
		private function _CommunityPanel_DecoratedList1_i() : DecoratedList
		{
			var _loc1_:DecoratedList = new DecoratedList();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.itemRenderer = this._CommunityPanel_ClassFactory1_c();
			_loc1_.layout = this._CommunityPanel_TileLayout1_c();
			_loc1_.addEventListener("infiniteScroll",this.__commnuityPropList_infiniteScroll);
			_loc1_.id = "commnuityPropList";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.commnuityPropList = _loc1_;
			BindingManager.executeBindings(this,"commnuityPropList",this.commnuityPropList);
			return _loc1_;
		}
		
		private function _CommunityPanel_ClassFactory1_c() : ClassFactory
		{
			var _loc1_:ClassFactory = new ClassFactory();
			_loc1_.generator = PropThumbRenderer;
			return _loc1_;
		}
		
		private function _CommunityPanel_TileLayout1_c() : TileLayout
		{
			var _loc1_:TileLayout = new TileLayout();
			_loc1_.horizontalGap = 6;
			_loc1_.verticalGap = 6;
			_loc1_.columnAlign = "justifyUsingGap";
			_loc1_.requestedColumnCount = 4;
			_loc1_.useVirtualLayout = true;
			return _loc1_;
		}
		
		public function __commnuityPropList_infiniteScroll(param1:InfiniteScrollEvent) : void
		{
			this.onPropInfiniteScroll(param1);
		}
		
		private function _CommunityPanel_Array6_c() : Array
		{
			var _loc1_:Array = [this._CommunityPanel_DecoratedList2_i()];
			return _loc1_;
		}
		
		private function _CommunityPanel_DecoratedList2_i() : DecoratedList
		{
			var _loc1_:DecoratedList = new DecoratedList();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.itemRenderer = this._CommunityPanel_ClassFactory2_c();
			_loc1_.setStyle("skinClass",StarterListSkin);
			_loc1_.addEventListener("infiniteScroll",this.__communityBackgroundList_infiniteScroll);
			_loc1_.id = "communityBackgroundList";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.communityBackgroundList = _loc1_;
			BindingManager.executeBindings(this,"communityBackgroundList",this.communityBackgroundList);
			return _loc1_;
		}
		
		private function _CommunityPanel_ClassFactory2_c() : ClassFactory
		{
			var _loc1_:ClassFactory = new ClassFactory();
			_loc1_.generator = BackgroundThumbRenderer;
			return _loc1_;
		}
		
		public function __communityBackgroundList_infiniteScroll(param1:InfiniteScrollEvent) : void
		{
			this.onBackgroundInfiniteScroll(param1);
		}
		
		private function _CommunityPanel_Array7_c() : Array
		{
			var _loc1_:Array = [this._CommunityPanel_DecoratedList3_i()];
			return _loc1_;
		}
		
		private function _CommunityPanel_DecoratedList3_i() : DecoratedList
		{
			var _loc1_:DecoratedList = new DecoratedList();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.itemRenderer = this._CommunityPanel_ClassFactory3_c();
			_loc1_.layout = this._CommunityPanel_TileLayout2_c();
			_loc1_.addEventListener("infiniteScroll",this.__communityCharacterList_infiniteScroll);
			_loc1_.id = "communityCharacterList";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.communityCharacterList = _loc1_;
			BindingManager.executeBindings(this,"communityCharacterList",this.communityCharacterList);
			return _loc1_;
		}
		
		private function _CommunityPanel_ClassFactory3_c() : ClassFactory
		{
			var _loc1_:ClassFactory = new ClassFactory();
			_loc1_.generator = CharacterThumbRenderer;
			return _loc1_;
		}
		
		private function _CommunityPanel_TileLayout2_c() : TileLayout
		{
			var _loc1_:TileLayout = new TileLayout();
			_loc1_.horizontalGap = 8;
			_loc1_.verticalGap = 8;
			_loc1_.columnAlign = "justifyUsingGap";
			_loc1_.requestedColumnCount = 4;
			_loc1_.useVirtualLayout = true;
			return _loc1_;
		}
		
		public function __communityCharacterList_infiniteScroll(param1:InfiniteScrollEvent) : void
		{
			this.onCharacterInfiniteScroll(param1);
		}
		
		private function _CommunityPanel_Line1_c() : Line
		{
			var _loc1_:Line = new Line();
			_loc1_.top = 0;
			_loc1_.percentWidth = 100;
			_loc1_.stroke = this._CommunityPanel_SolidColorStroke1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _CommunityPanel_SolidColorStroke1_c() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.color = 11711154;
			return _loc1_;
		}
		
		public function ___CommunityPanel_NavigatorContent1_contentCreationComplete(param1:FlexEvent) : void
		{
			this.init();
		}
		
		private function _CommunityPanel_bindingsSetup() : Array
		{
			var result:Array = [];
			result[0] = new Binding(this,null,null,"tabBar.dataProvider","tabNavigator");
			result[1] = new Binding(this,function():Boolean
			{
				return displaySearchBox;
			},null,"searchBox.visible");
			result[2] = new Binding(this,function():Boolean
			{
				return displaySearchBox;
			},null,"searchBox.includeInLayout");
			result[3] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Search...");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"searchInput.prompt");
			result[4] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Prop");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"propPanel.label");
			result[5] = new Binding(this,function():IList
			{
				return manager.propSource;
			},null,"commnuityPropList.dataProvider");
			result[6] = new Binding(this,function():Boolean
			{
				return loading;
			},null,"commnuityPropList.loading");
			result[7] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Background");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"backgroundPanel.label");
			result[8] = new Binding(this,function():IList
			{
				return manager.backgroundSource;
			},null,"communityBackgroundList.dataProvider");
			result[9] = new Binding(this,function():Boolean
			{
				return loading;
			},null,"communityBackgroundList.loading");
			result[10] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Character");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"characterPanel.label");
			result[11] = new Binding(this,function():IList
			{
				return manager.characterSource;
			},null,"communityCharacterList.dataProvider");
			result[12] = new Binding(this,function():Boolean
			{
				return loading;
			},null,"communityCharacterList.loading");
			result[13] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Search");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"searchPanel.label");
			return result;
		}
		
		[Bindable(event="propertyChange")]
		public function get backgroundPanel() : spark.components.NavigatorContent
		{
			return this._1298714998backgroundPanel;
		}
		
		public function set backgroundPanel(param1:spark.components.NavigatorContent) : void
		{
			var _loc2_:Object = this._1298714998backgroundPanel;
			if(_loc2_ !== param1)
			{
				this._1298714998backgroundPanel = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"backgroundPanel",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get characterPanel() : spark.components.NavigatorContent
		{
			return this._342683739characterPanel;
		}
		
		public function set characterPanel(param1:spark.components.NavigatorContent) : void
		{
			var _loc2_:Object = this._342683739characterPanel;
			if(_loc2_ !== param1)
			{
				this._342683739characterPanel = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"characterPanel",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get commnuityPropList() : DecoratedList
		{
			return this._240275900commnuityPropList;
		}
		
		public function set commnuityPropList(param1:DecoratedList) : void
		{
			var _loc2_:Object = this._240275900commnuityPropList;
			if(_loc2_ !== param1)
			{
				this._240275900commnuityPropList = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"commnuityPropList",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get communityBackgroundList() : DecoratedList
		{
			return this._1435738933communityBackgroundList;
		}
		
		public function set communityBackgroundList(param1:DecoratedList) : void
		{
			var _loc2_:Object = this._1435738933communityBackgroundList;
			if(_loc2_ !== param1)
			{
				this._1435738933communityBackgroundList = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"communityBackgroundList",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get communityCharacterList() : DecoratedList
		{
			return this._265878018communityCharacterList;
		}
		
		public function set communityCharacterList(param1:DecoratedList) : void
		{
			var _loc2_:Object = this._265878018communityCharacterList;
			if(_loc2_ !== param1)
			{
				this._265878018communityCharacterList = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"communityCharacterList",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get propPanel() : spark.components.NavigatorContent
		{
			return this._742515615propPanel;
		}
		
		public function set propPanel(param1:spark.components.NavigatorContent) : void
		{
			var _loc2_:Object = this._742515615propPanel;
			if(_loc2_ !== param1)
			{
				this._742515615propPanel = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"propPanel",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get searchBox() : VGroup
		{
			return this._1778179843searchBox;
		}
		
		public function set searchBox(param1:VGroup) : void
		{
			var _loc2_:Object = this._1778179843searchBox;
			if(_loc2_ !== param1)
			{
				this._1778179843searchBox = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"searchBox",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get searchInput() : FocusTextInput
		{
			return this._559723774searchInput;
		}
		
		public function set searchInput(param1:FocusTextInput) : void
		{
			var _loc2_:Object = this._559723774searchInput;
			if(_loc2_ !== param1)
			{
				this._559723774searchInput = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"searchInput",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get searchPanel() : CommunitySearchPanel
		{
			return this._553648836searchPanel;
		}
		
		public function set searchPanel(param1:CommunitySearchPanel) : void
		{
			var _loc2_:Object = this._553648836searchPanel;
			if(_loc2_ !== param1)
			{
				this._553648836searchPanel = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"searchPanel",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get tabBar() : TabBar
		{
			return this._881418178tabBar;
		}
		
		public function set tabBar(param1:TabBar) : void
		{
			var _loc2_:Object = this._881418178tabBar;
			if(_loc2_ !== param1)
			{
				this._881418178tabBar = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tabBar",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get tabNavigator() : ViewStack
		{
			return this._261440066tabNavigator;
		}
		
		public function set tabNavigator(param1:ViewStack) : void
		{
			var _loc2_:Object = this._261440066tabNavigator;
			if(_loc2_ !== param1)
			{
				this._261440066tabNavigator = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tabNavigator",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get manager() : CommunityStuffManager
		{
			return this._835260333manager;
		}
		
		private function set manager(param1:CommunityStuffManager) : void
		{
			var _loc2_:Object = this._835260333manager;
			if(_loc2_ !== param1)
			{
				this._835260333manager = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"manager",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get displaySearchBox() : Boolean
		{
			return this._911433631displaySearchBox;
		}
		
		private function set displaySearchBox(param1:Boolean) : void
		{
			var _loc2_:Object = this._911433631displaySearchBox;
			if(_loc2_ !== param1)
			{
				this._911433631displaySearchBox = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displaySearchBox",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get loading() : Boolean
		{
			return this._336650556loading;
		}
		
		private function set loading(param1:Boolean) : void
		{
			var _loc2_:Object = this._336650556loading;
			if(_loc2_ !== param1)
			{
				this._336650556loading = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"loading",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		protected function get _characterSource() : ArrayCollection
		{
			return this._876192357_characterSource;
		}
		
		protected function set _characterSource(param1:ArrayCollection) : void
		{
			var _loc2_:Object = this._876192357_characterSource;
			if(_loc2_ !== param1)
			{
				this._876192357_characterSource = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_characterSource",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		protected function get _backgroundSource() : ArrayCollection
		{
			return this._1419899208_backgroundSource;
		}
		
		protected function set _backgroundSource(param1:ArrayCollection) : void
		{
			var _loc2_:Object = this._1419899208_backgroundSource;
			if(_loc2_ !== param1)
			{
				this._1419899208_backgroundSource = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_backgroundSource",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		protected function get _propSource() : ArrayCollection
		{
			return this._355797251_propSource;
		}
		
		protected function set _propSource(param1:ArrayCollection) : void
		{
			var _loc2_:Object = this._355797251_propSource;
			if(_loc2_ !== param1)
			{
				this._355797251_propSource = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_propSource",_loc2_,param1));
				}
			}
		}
	}
}
