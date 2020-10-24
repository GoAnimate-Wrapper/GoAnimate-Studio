package anifire.studio.components
{
	import anifire.studio.core.EffectThumb;
	import anifire.studio.core.Theme;
	import anifire.studio.events.SceneOptionEvent;
	import anifire.studio.managers.ThemeManager;
	import anifire.studio.models.ThumbModel;
	import anifire.studio.skins.LinkArrowBlackButtonSkin;
	import anifire.studio.skins.PlainListSkin;
	import anifire.util.UtilDict;
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
	import spark.components.Group;
	import spark.components.VGroup;
	import spark.components.supportClasses.ItemRenderer;
	import spark.events.IndexChangeEvent;
	import spark.events.ListEvent;
	
	use namespace mx_internal;
	
	public class SceneEffectSelectionPanel extends Group implements IBindingClient
	{
		
		public static const COMMON_THEME:String = "GoAnimateGoodies";
		
		private static var _watcherSetupUtil:IWatcherSetupUtil2;
		 
		
		public var _SceneEffectSelectionPanel_LinkArrowButton1:LinkArrowButton;
		
		private var _1715580367effectList:EffectSelectionList;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		protected var _844158218_themeEffectSource:ArrayCollection;
		
		mx_internal var _bindings:Array;
		
		mx_internal var _watchers:Array;
		
		mx_internal var _bindingsByDestination:Object;
		
		mx_internal var _bindingsBeginWithWord:Object;
		
		public function SceneEffectSelectionPanel()
		{
			var target:Object = null;
			var watcherSetupUtilClass:Object = null;
			this._844158218_themeEffectSource = new ArrayCollection();
			this._bindings = [];
			this._watchers = [];
			this._bindingsByDestination = {};
			this._bindingsBeginWithWord = {};
			super();
			mx_internal::_document = this;
			var bindings:Array = this._SceneEffectSelectionPanel_bindingsSetup();
			var watchers:Array = [];
			target = this;
			if(_watcherSetupUtil == null)
			{
				watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_SceneEffectSelectionPanelWatcherSetupUtil");
				watcherSetupUtilClass["init"](null);
			}
			_watcherSetupUtil.setup(this,function(param1:String):*
			{
				return target[param1];
			},function(param1:String):*
			{
				return SceneEffectSelectionPanel[param1];
			},bindings,watchers);
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.width = 310;
			this.percentHeight = 100;
			this.mxmlContent = [this._SceneEffectSelectionPanel_VGroup1_c()];
			var i:uint = 0;
			while(i < bindings.length)
			{
				Binding(bindings[i]).execute();
				i++;
			}
		}
		
		public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
		{
			SceneEffectSelectionPanel._watcherSetupUtil = param1;
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
		
		public function init() : void
		{
			if(this._themeEffectSource.length == 0)
			{
				this.loadEffectThumbs(ThemeManager.instance.currentTheme);
				this.loadEffectThumbs(ThemeManager.instance.commonTheme);
			}
		}
		
		public function loadEffectThumbs(param1:Theme) : void
		{
			var _loc2_:int = 0;
			var _loc3_:EffectThumb = null;
			if(param1)
			{
				_loc2_ = 0;
				while(_loc2_ < param1.effectThumbs.length)
				{
					_loc3_ = EffectThumb(param1.effectThumbs.getValueByIndex(_loc2_));
					if(_loc3_.enable)
					{
						this.addEffectThumbToTheme(_loc3_);
					}
					_loc2_++;
				}
			}
		}
		
		private function addEffectThumbToTheme(param1:EffectThumb) : void
		{
			if(param1.invisibleFX)
			{
				return;
			}
			var _loc2_:ThumbModel = new ThumbModel(param1);
			this._themeEffectSource.addItem(_loc2_);
		}
		
		private function clearAllEffectThumbs() : void
		{
			this._themeEffectSource.removeAll();
		}
		
		private function onEffectChange() : void
		{
			var _loc1_:ThumbModel = this.effectList.selectedItem as ThumbModel;
			var _loc2_:SceneOptionEvent = new SceneOptionEvent(SceneOptionEvent.EFFECT_ADD);
			_loc2_.thumb = _loc1_.thumb;
			dispatchEvent(_loc2_);
			this.effectList.selectedIndex = -1;
		}
		
		private function onBackRelease() : void
		{
			var _loc1_:SceneOptionEvent = new SceneOptionEvent(SceneOptionEvent.BACK);
			dispatchEvent(_loc1_);
		}
		
		private function onMouseOverEffect(param1:ListEvent) : void
		{
			this.showEffectPreview(param1.itemRenderer as ItemRenderer);
		}
		
		private function hideEffectPreview() : void
		{
		}
		
		private function showEffectPreview(param1:ItemRenderer) : void
		{
		}
		
		private function _SceneEffectSelectionPanel_VGroup1_c() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.gap = 0;
			_loc1_.mxmlContent = [this._SceneEffectSelectionPanel_Group2_c(),this._SceneEffectSelectionPanel_EffectSelectionList1_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _SceneEffectSelectionPanel_Group2_c() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.percentWidth = 100;
			_loc1_.height = 30;
			_loc1_.mxmlContent = [this._SceneEffectSelectionPanel_LinkArrowButton1_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _SceneEffectSelectionPanel_LinkArrowButton1_i() : LinkArrowButton
		{
			var _loc1_:LinkArrowButton = new LinkArrowButton();
			_loc1_.top = 0;
			_loc1_.left = 14;
			_loc1_.verticalCenter = 0;
			_loc1_.setStyle("arrowPosition","left");
			_loc1_.setStyle("arrowDirection","left");
			_loc1_.setStyle("skinClass",LinkArrowBlackButtonSkin);
			_loc1_.addEventListener("click",this.___SceneEffectSelectionPanel_LinkArrowButton1_click);
			_loc1_.id = "_SceneEffectSelectionPanel_LinkArrowButton1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._SceneEffectSelectionPanel_LinkArrowButton1 = _loc1_;
			BindingManager.executeBindings(this,"_SceneEffectSelectionPanel_LinkArrowButton1",this._SceneEffectSelectionPanel_LinkArrowButton1);
			return _loc1_;
		}
		
		public function ___SceneEffectSelectionPanel_LinkArrowButton1_click(param1:MouseEvent) : void
		{
			this.onBackRelease();
		}
		
		private function _SceneEffectSelectionPanel_EffectSelectionList1_i() : EffectSelectionList
		{
			var _loc1_:EffectSelectionList = new EffectSelectionList();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.selectedIndex = -1;
			_loc1_.requireSelection = false;
			_loc1_.itemRenderer = this._SceneEffectSelectionPanel_ClassFactory1_c();
			_loc1_.setStyle("skinClass",PlainListSkin);
			_loc1_.addEventListener("change",this.__effectList_change);
			_loc1_.addEventListener("itemRollOver",this.__effectList_itemRollOver);
			_loc1_.addEventListener("itemRollOut",this.__effectList_itemRollOut);
			_loc1_.id = "effectList";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.effectList = _loc1_;
			BindingManager.executeBindings(this,"effectList",this.effectList);
			return _loc1_;
		}
		
		private function _SceneEffectSelectionPanel_ClassFactory1_c() : ClassFactory
		{
			var _loc1_:ClassFactory = new ClassFactory();
			_loc1_.generator = SceneEffectItemRenderer;
			return _loc1_;
		}
		
		public function __effectList_change(param1:IndexChangeEvent) : void
		{
			this.onEffectChange();
		}
		
		public function __effectList_itemRollOver(param1:ListEvent) : void
		{
			this.onMouseOverEffect(param1);
		}
		
		public function __effectList_itemRollOut(param1:ListEvent) : void
		{
			this.hideEffectPreview();
		}
		
		private function _SceneEffectSelectionPanel_bindingsSetup() : Array
		{
			var result:Array = [];
			result[0] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Back");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_SceneEffectSelectionPanel_LinkArrowButton1.label");
			result[1] = new Binding(this,function():IList
			{
				return _themeEffectSource;
			},null,"effectList.dataProvider");
			return result;
		}
		
		[Bindable(event="propertyChange")]
		public function get effectList() : EffectSelectionList
		{
			return this._1715580367effectList;
		}
		
		public function set effectList(param1:EffectSelectionList) : void
		{
			var _loc2_:Object = this._1715580367effectList;
			if(_loc2_ !== param1)
			{
				this._1715580367effectList = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"effectList",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		protected function get _themeEffectSource() : ArrayCollection
		{
			return this._844158218_themeEffectSource;
		}
		
		protected function set _themeEffectSource(param1:ArrayCollection) : void
		{
			var _loc2_:Object = this._844158218_themeEffectSource;
			if(_loc2_ !== param1)
			{
				this._844158218_themeEffectSource = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_themeEffectSource",_loc2_,param1));
				}
			}
		}
	}
}
