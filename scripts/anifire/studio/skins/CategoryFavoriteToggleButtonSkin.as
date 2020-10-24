package anifire.studio.skins
{
	import anifire.studio.components.CategoryToolTip;
	import anifire.util.UtilDict;
	import flash.utils.getDefinitionByName;
	import mx.binding.Binding;
	import mx.binding.BindingManager;
	import mx.binding.IBindingClient;
	import mx.binding.IWatcherSetupUtil2;
	import mx.core.IFlexModuleFactory;
	import mx.core.IStateClient2;
	import mx.core.mx_internal;
	import mx.events.PropertyChangeEvent;
	import mx.states.SetProperty;
	import mx.states.State;
	import spark.components.Group;
	import spark.components.PopUpAnchor;
	import spark.primitives.BitmapImage;
	import spark.skins.SparkButtonSkin;
	
	use namespace mx_internal;
	
	public class CategoryFavoriteToggleButtonSkin extends SparkButtonSkin implements IBindingClient, IStateClient2
	{
		
		private static const TOOLTIP_MESSAGE_FAVORITE:String = "Favorite this category.";
		
		private static const TOOLTIP_MESSAGE_UNFAVORITE:String = "Un-favorite this category.";
		
		private static var _watcherSetupUtil:IWatcherSetupUtil2;
		 
		
		private var _1749188648_CategoryFavoriteToggleButtonSkin_BitmapImage1:BitmapImage;
		
		private var _1749188649_CategoryFavoriteToggleButtonSkin_BitmapImage2:BitmapImage;
		
		private var _1749188650_CategoryFavoriteToggleButtonSkin_BitmapImage3:BitmapImage;
		
		private var _1749188651_CategoryFavoriteToggleButtonSkin_BitmapImage4:BitmapImage;
		
		private var _882491466_CategoryFavoriteToggleButtonSkin_Group2:Group;
		
		private var _944505235_CategoryFavoriteToggleButtonSkin_PopUpAnchor1:PopUpAnchor;
		
		private var _1091760483_CategoryFavoriteToggleButtonSkin_SetProperty1:SetProperty;
		
		private var _1091760482_CategoryFavoriteToggleButtonSkin_SetProperty2:SetProperty;
		
		private var _1091760481_CategoryFavoriteToggleButtonSkin_SetProperty3:SetProperty;
		
		private var _1091760480_CategoryFavoriteToggleButtonSkin_SetProperty4:SetProperty;
		
		private var _1284010086arrowToolTip:CategoryToolTip;
		
		private var _737947029iconStar:Group;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private var _embed_mxml__styles_images_tray_icon_star_unfavorite_png_400160521:Class;
		
		private var _embed_mxml__styles_images_tray_icon_star_hover_png_1902728601:Class;
		
		private var _embed_mxml__styles_images_tray_icon_star_init_png_1968081601:Class;
		
		private var _embed_mxml__styles_images_tray_icon_star_favorited_png_622623617:Class;
		
		mx_internal var _bindings:Array;
		
		mx_internal var _watchers:Array;
		
		mx_internal var _bindingsByDestination:Object;
		
		mx_internal var _bindingsBeginWithWord:Object;
		
		public function CategoryFavoriteToggleButtonSkin()
		{
			var bindings:Array = null;
			var target:Object = null;
			var watcherSetupUtilClass:Object = null;
			this._embed_mxml__styles_images_tray_icon_star_unfavorite_png_400160521 = CategoryFavoriteToggleButtonSkin__embed_mxml__styles_images_tray_icon_star_unfavorite_png_400160521;
			this._embed_mxml__styles_images_tray_icon_star_hover_png_1902728601 = CategoryFavoriteToggleButtonSkin__embed_mxml__styles_images_tray_icon_star_hover_png_1902728601;
			this._embed_mxml__styles_images_tray_icon_star_init_png_1968081601 = CategoryFavoriteToggleButtonSkin__embed_mxml__styles_images_tray_icon_star_init_png_1968081601;
			this._embed_mxml__styles_images_tray_icon_star_favorited_png_622623617 = CategoryFavoriteToggleButtonSkin__embed_mxml__styles_images_tray_icon_star_favorited_png_622623617;
			this._bindings = [];
			this._watchers = [];
			this._bindingsByDestination = {};
			this._bindingsBeginWithWord = {};
			super();
			mx_internal::_document = this;
			bindings = this._CategoryFavoriteToggleButtonSkin_bindingsSetup();
			var watchers:Array = [];
			target = this;
			if(_watcherSetupUtil == null)
			{
				watcherSetupUtilClass = getDefinitionByName("_anifire_studio_skins_CategoryFavoriteToggleButtonSkinWatcherSetupUtil");
				watcherSetupUtilClass["init"](null);
			}
			_watcherSetupUtil.setup(this,function(param1:String):*
			{
				return target[param1];
			},function(param1:String):*
			{
				return CategoryFavoriteToggleButtonSkin[param1];
			},bindings,watchers);
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.minWidth = 21;
			this.minHeight = 21;
			this.mxmlContent = [this._CategoryFavoriteToggleButtonSkin_Group1_i(),this._CategoryFavoriteToggleButtonSkin_Group2_i(),this._CategoryFavoriteToggleButtonSkin_PopUpAnchor1_i()];
			this.currentState = "up";
			states = [new State({
				"name":"up",
				"overrides":[]
			}),new State({
				"name":"over",
				"stateGroups":["overStates"],
				"overrides":[new SetProperty().initializeFromObject({
					"target":"_CategoryFavoriteToggleButtonSkin_BitmapImage1",
					"name":"visible",
					"value":false
				}),new SetProperty().initializeFromObject({
					"target":"_CategoryFavoriteToggleButtonSkin_BitmapImage2",
					"name":"visible",
					"value":true
				}),new SetProperty().initializeFromObject({
					"target":"_CategoryFavoriteToggleButtonSkin_PopUpAnchor1",
					"name":"displayPopUp",
					"value":true
				})]
			}),new State({
				"name":"down",
				"stateGroups":["downStates"],
				"overrides":[new SetProperty().initializeFromObject({
					"target":"_CategoryFavoriteToggleButtonSkin_BitmapImage1",
					"name":"visible",
					"value":false
				}),new SetProperty().initializeFromObject({
					"target":"_CategoryFavoriteToggleButtonSkin_BitmapImage2",
					"name":"visible",
					"value":true
				})]
			}),new State({
				"name":"disabled",
				"stateGroups":["disabledStates"],
				"overrides":[new SetProperty().initializeFromObject({
					"name":"alpha",
					"value":0.5
				})]
			}),new State({
				"name":"upAndSelected",
				"stateGroups":["selectedStates","selectedUpStates"],
				"overrides":[new SetProperty().initializeFromObject({
					"target":"iconStar",
					"name":"visible",
					"value":false
				}),new SetProperty().initializeFromObject({
					"target":"_CategoryFavoriteToggleButtonSkin_Group2",
					"name":"visible",
					"value":true
				}),this._CategoryFavoriteToggleButtonSkin_SetProperty4 = SetProperty(new SetProperty().initializeFromObject({
					"isBaseValueDataBound":true,
					"target":"arrowToolTip",
					"name":"label",
					"value":undefined
				}))]
			}),new State({
				"name":"overAndSelected",
				"stateGroups":["selectedStates","overStates"],
				"overrides":[new SetProperty().initializeFromObject({
					"target":"iconStar",
					"name":"visible",
					"value":false
				}),new SetProperty().initializeFromObject({
					"target":"_CategoryFavoriteToggleButtonSkin_Group2",
					"name":"visible",
					"value":true
				}),new SetProperty().initializeFromObject({
					"target":"_CategoryFavoriteToggleButtonSkin_BitmapImage3",
					"name":"visible",
					"value":false
				}),new SetProperty().initializeFromObject({
					"target":"_CategoryFavoriteToggleButtonSkin_BitmapImage4",
					"name":"visible",
					"value":true
				}),new SetProperty().initializeFromObject({
					"target":"_CategoryFavoriteToggleButtonSkin_PopUpAnchor1",
					"name":"displayPopUp",
					"value":true
				}),this._CategoryFavoriteToggleButtonSkin_SetProperty3 = SetProperty(new SetProperty().initializeFromObject({
					"isBaseValueDataBound":true,
					"target":"arrowToolTip",
					"name":"label",
					"value":undefined
				}))]
			}),new State({
				"name":"downAndSelected",
				"stateGroups":["selectedStates","downStates"],
				"overrides":[new SetProperty().initializeFromObject({
					"target":"iconStar",
					"name":"visible",
					"value":false
				}),new SetProperty().initializeFromObject({
					"target":"_CategoryFavoriteToggleButtonSkin_Group2",
					"name":"visible",
					"value":true
				}),new SetProperty().initializeFromObject({
					"target":"_CategoryFavoriteToggleButtonSkin_BitmapImage3",
					"name":"visible",
					"value":false
				}),new SetProperty().initializeFromObject({
					"target":"_CategoryFavoriteToggleButtonSkin_BitmapImage4",
					"name":"visible",
					"value":true
				}),this._CategoryFavoriteToggleButtonSkin_SetProperty1 = SetProperty(new SetProperty().initializeFromObject({
					"isBaseValueDataBound":true,
					"target":"arrowToolTip",
					"name":"label",
					"value":undefined
				}))]
			}),new State({
				"name":"disabledAndSelected",
				"stateGroups":["selectedStates","selectedUpStates","disabledStates"],
				"overrides":[new SetProperty().initializeFromObject({
					"name":"alpha",
					"value":0.5
				}),new SetProperty().initializeFromObject({
					"target":"iconStar",
					"name":"visible",
					"value":false
				}),new SetProperty().initializeFromObject({
					"target":"_CategoryFavoriteToggleButtonSkin_Group2",
					"name":"visible",
					"value":true
				}),this._CategoryFavoriteToggleButtonSkin_SetProperty2 = SetProperty(new SetProperty().initializeFromObject({
					"isBaseValueDataBound":true,
					"target":"arrowToolTip",
					"name":"label",
					"value":undefined
				}))]
			})];
			BindingManager.executeBindings(this,"_CategoryFavoriteToggleButtonSkin_SetProperty4",this._CategoryFavoriteToggleButtonSkin_SetProperty4);
			BindingManager.executeBindings(this,"_CategoryFavoriteToggleButtonSkin_SetProperty3",this._CategoryFavoriteToggleButtonSkin_SetProperty3);
			BindingManager.executeBindings(this,"_CategoryFavoriteToggleButtonSkin_SetProperty1",this._CategoryFavoriteToggleButtonSkin_SetProperty1);
			BindingManager.executeBindings(this,"_CategoryFavoriteToggleButtonSkin_SetProperty2",this._CategoryFavoriteToggleButtonSkin_SetProperty2);
			var i:uint = 0;
			while(i < bindings.length)
			{
				Binding(bindings[i]).execute();
				i++;
			}
		}
		
		public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
		{
			CategoryFavoriteToggleButtonSkin._watcherSetupUtil = param1;
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
		
		private function _CategoryFavoriteToggleButtonSkin_Group1_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.mxmlContent = [this._CategoryFavoriteToggleButtonSkin_BitmapImage1_i(),this._CategoryFavoriteToggleButtonSkin_BitmapImage2_i()];
			_loc1_.id = "iconStar";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.iconStar = _loc1_;
			BindingManager.executeBindings(this,"iconStar",this.iconStar);
			return _loc1_;
		}
		
		private function _CategoryFavoriteToggleButtonSkin_BitmapImage1_i() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.source = this._embed_mxml__styles_images_tray_icon_star_init_png_1968081601;
			_loc1_.initialized(this,"_CategoryFavoriteToggleButtonSkin_BitmapImage1");
			this._CategoryFavoriteToggleButtonSkin_BitmapImage1 = _loc1_;
			BindingManager.executeBindings(this,"_CategoryFavoriteToggleButtonSkin_BitmapImage1",this._CategoryFavoriteToggleButtonSkin_BitmapImage1);
			return _loc1_;
		}
		
		private function _CategoryFavoriteToggleButtonSkin_BitmapImage2_i() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.source = this._embed_mxml__styles_images_tray_icon_star_hover_png_1902728601;
			_loc1_.visible = false;
			_loc1_.initialized(this,"_CategoryFavoriteToggleButtonSkin_BitmapImage2");
			this._CategoryFavoriteToggleButtonSkin_BitmapImage2 = _loc1_;
			BindingManager.executeBindings(this,"_CategoryFavoriteToggleButtonSkin_BitmapImage2",this._CategoryFavoriteToggleButtonSkin_BitmapImage2);
			return _loc1_;
		}
		
		private function _CategoryFavoriteToggleButtonSkin_Group2_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.visible = false;
			_loc1_.mxmlContent = [this._CategoryFavoriteToggleButtonSkin_BitmapImage3_i(),this._CategoryFavoriteToggleButtonSkin_BitmapImage4_i()];
			_loc1_.id = "_CategoryFavoriteToggleButtonSkin_Group2";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._CategoryFavoriteToggleButtonSkin_Group2 = _loc1_;
			BindingManager.executeBindings(this,"_CategoryFavoriteToggleButtonSkin_Group2",this._CategoryFavoriteToggleButtonSkin_Group2);
			return _loc1_;
		}
		
		private function _CategoryFavoriteToggleButtonSkin_BitmapImage3_i() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.source = this._embed_mxml__styles_images_tray_icon_star_favorited_png_622623617;
			_loc1_.initialized(this,"_CategoryFavoriteToggleButtonSkin_BitmapImage3");
			this._CategoryFavoriteToggleButtonSkin_BitmapImage3 = _loc1_;
			BindingManager.executeBindings(this,"_CategoryFavoriteToggleButtonSkin_BitmapImage3",this._CategoryFavoriteToggleButtonSkin_BitmapImage3);
			return _loc1_;
		}
		
		private function _CategoryFavoriteToggleButtonSkin_BitmapImage4_i() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.source = this._embed_mxml__styles_images_tray_icon_star_unfavorite_png_400160521;
			_loc1_.visible = false;
			_loc1_.initialized(this,"_CategoryFavoriteToggleButtonSkin_BitmapImage4");
			this._CategoryFavoriteToggleButtonSkin_BitmapImage4 = _loc1_;
			BindingManager.executeBindings(this,"_CategoryFavoriteToggleButtonSkin_BitmapImage4",this._CategoryFavoriteToggleButtonSkin_BitmapImage4);
			return _loc1_;
		}
		
		private function _CategoryFavoriteToggleButtonSkin_PopUpAnchor1_i() : PopUpAnchor
		{
			var _loc1_:PopUpAnchor = new PopUpAnchor();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.popUpPosition = "right";
			_loc1_.popUpWidthMatchesAnchorWidth = true;
			_loc1_.popUp = this._CategoryFavoriteToggleButtonSkin_Group3_c();
			_loc1_.id = "_CategoryFavoriteToggleButtonSkin_PopUpAnchor1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._CategoryFavoriteToggleButtonSkin_PopUpAnchor1 = _loc1_;
			BindingManager.executeBindings(this,"_CategoryFavoriteToggleButtonSkin_PopUpAnchor1",this._CategoryFavoriteToggleButtonSkin_PopUpAnchor1);
			return _loc1_;
		}
		
		private function _CategoryFavoriteToggleButtonSkin_Group3_c() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.mxmlContent = [this._CategoryFavoriteToggleButtonSkin_CategoryToolTip1_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _CategoryFavoriteToggleButtonSkin_CategoryToolTip1_i() : CategoryToolTip
		{
			var _loc1_:CategoryToolTip = new CategoryToolTip();
			_loc1_.arrowDirection = "left";
			_loc1_.textWidth = 200;
			_loc1_.id = "arrowToolTip";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.arrowToolTip = _loc1_;
			BindingManager.executeBindings(this,"arrowToolTip",this.arrowToolTip);
			return _loc1_;
		}
		
		private function _CategoryFavoriteToggleButtonSkin_bindingsSetup() : Array
		{
			var result:Array = [];
			result[0] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate(TOOLTIP_MESSAGE_FAVORITE);
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"arrowToolTip.label");
			result[1] = new Binding(this,function():*
			{
				return UtilDict.translate(TOOLTIP_MESSAGE_UNFAVORITE);
			},null,"_CategoryFavoriteToggleButtonSkin_SetProperty1.value");
			result[2] = new Binding(this,function():*
			{
				return UtilDict.translate(TOOLTIP_MESSAGE_UNFAVORITE);
			},null,"_CategoryFavoriteToggleButtonSkin_SetProperty2.value");
			result[3] = new Binding(this,function():*
			{
				return UtilDict.translate(TOOLTIP_MESSAGE_UNFAVORITE);
			},null,"_CategoryFavoriteToggleButtonSkin_SetProperty3.value");
			result[4] = new Binding(this,function():*
			{
				return UtilDict.translate(TOOLTIP_MESSAGE_UNFAVORITE);
			},null,"_CategoryFavoriteToggleButtonSkin_SetProperty4.value");
			result[5] = new Binding(this,function():Number
			{
				return iconStar.height / 2 - arrowToolTip.height / 2;
			},null,"arrowToolTip.y");
			return result;
		}
		
		[Bindable(event="propertyChange")]
		public function get _CategoryFavoriteToggleButtonSkin_BitmapImage1() : BitmapImage
		{
			return this._1749188648_CategoryFavoriteToggleButtonSkin_BitmapImage1;
		}
		
		public function set _CategoryFavoriteToggleButtonSkin_BitmapImage1(param1:BitmapImage) : void
		{
			var _loc2_:Object = this._1749188648_CategoryFavoriteToggleButtonSkin_BitmapImage1;
			if(_loc2_ !== param1)
			{
				this._1749188648_CategoryFavoriteToggleButtonSkin_BitmapImage1 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CategoryFavoriteToggleButtonSkin_BitmapImage1",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _CategoryFavoriteToggleButtonSkin_BitmapImage2() : BitmapImage
		{
			return this._1749188649_CategoryFavoriteToggleButtonSkin_BitmapImage2;
		}
		
		public function set _CategoryFavoriteToggleButtonSkin_BitmapImage2(param1:BitmapImage) : void
		{
			var _loc2_:Object = this._1749188649_CategoryFavoriteToggleButtonSkin_BitmapImage2;
			if(_loc2_ !== param1)
			{
				this._1749188649_CategoryFavoriteToggleButtonSkin_BitmapImage2 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CategoryFavoriteToggleButtonSkin_BitmapImage2",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _CategoryFavoriteToggleButtonSkin_BitmapImage3() : BitmapImage
		{
			return this._1749188650_CategoryFavoriteToggleButtonSkin_BitmapImage3;
		}
		
		public function set _CategoryFavoriteToggleButtonSkin_BitmapImage3(param1:BitmapImage) : void
		{
			var _loc2_:Object = this._1749188650_CategoryFavoriteToggleButtonSkin_BitmapImage3;
			if(_loc2_ !== param1)
			{
				this._1749188650_CategoryFavoriteToggleButtonSkin_BitmapImage3 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CategoryFavoriteToggleButtonSkin_BitmapImage3",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _CategoryFavoriteToggleButtonSkin_BitmapImage4() : BitmapImage
		{
			return this._1749188651_CategoryFavoriteToggleButtonSkin_BitmapImage4;
		}
		
		public function set _CategoryFavoriteToggleButtonSkin_BitmapImage4(param1:BitmapImage) : void
		{
			var _loc2_:Object = this._1749188651_CategoryFavoriteToggleButtonSkin_BitmapImage4;
			if(_loc2_ !== param1)
			{
				this._1749188651_CategoryFavoriteToggleButtonSkin_BitmapImage4 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CategoryFavoriteToggleButtonSkin_BitmapImage4",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _CategoryFavoriteToggleButtonSkin_Group2() : Group
		{
			return this._882491466_CategoryFavoriteToggleButtonSkin_Group2;
		}
		
		public function set _CategoryFavoriteToggleButtonSkin_Group2(param1:Group) : void
		{
			var _loc2_:Object = this._882491466_CategoryFavoriteToggleButtonSkin_Group2;
			if(_loc2_ !== param1)
			{
				this._882491466_CategoryFavoriteToggleButtonSkin_Group2 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CategoryFavoriteToggleButtonSkin_Group2",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _CategoryFavoriteToggleButtonSkin_PopUpAnchor1() : PopUpAnchor
		{
			return this._944505235_CategoryFavoriteToggleButtonSkin_PopUpAnchor1;
		}
		
		public function set _CategoryFavoriteToggleButtonSkin_PopUpAnchor1(param1:PopUpAnchor) : void
		{
			var _loc2_:Object = this._944505235_CategoryFavoriteToggleButtonSkin_PopUpAnchor1;
			if(_loc2_ !== param1)
			{
				this._944505235_CategoryFavoriteToggleButtonSkin_PopUpAnchor1 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CategoryFavoriteToggleButtonSkin_PopUpAnchor1",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _CategoryFavoriteToggleButtonSkin_SetProperty1() : SetProperty
		{
			return this._1091760483_CategoryFavoriteToggleButtonSkin_SetProperty1;
		}
		
		public function set _CategoryFavoriteToggleButtonSkin_SetProperty1(param1:SetProperty) : void
		{
			var _loc2_:Object = this._1091760483_CategoryFavoriteToggleButtonSkin_SetProperty1;
			if(_loc2_ !== param1)
			{
				this._1091760483_CategoryFavoriteToggleButtonSkin_SetProperty1 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CategoryFavoriteToggleButtonSkin_SetProperty1",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _CategoryFavoriteToggleButtonSkin_SetProperty2() : SetProperty
		{
			return this._1091760482_CategoryFavoriteToggleButtonSkin_SetProperty2;
		}
		
		public function set _CategoryFavoriteToggleButtonSkin_SetProperty2(param1:SetProperty) : void
		{
			var _loc2_:Object = this._1091760482_CategoryFavoriteToggleButtonSkin_SetProperty2;
			if(_loc2_ !== param1)
			{
				this._1091760482_CategoryFavoriteToggleButtonSkin_SetProperty2 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CategoryFavoriteToggleButtonSkin_SetProperty2",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _CategoryFavoriteToggleButtonSkin_SetProperty3() : SetProperty
		{
			return this._1091760481_CategoryFavoriteToggleButtonSkin_SetProperty3;
		}
		
		public function set _CategoryFavoriteToggleButtonSkin_SetProperty3(param1:SetProperty) : void
		{
			var _loc2_:Object = this._1091760481_CategoryFavoriteToggleButtonSkin_SetProperty3;
			if(_loc2_ !== param1)
			{
				this._1091760481_CategoryFavoriteToggleButtonSkin_SetProperty3 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CategoryFavoriteToggleButtonSkin_SetProperty3",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _CategoryFavoriteToggleButtonSkin_SetProperty4() : SetProperty
		{
			return this._1091760480_CategoryFavoriteToggleButtonSkin_SetProperty4;
		}
		
		public function set _CategoryFavoriteToggleButtonSkin_SetProperty4(param1:SetProperty) : void
		{
			var _loc2_:Object = this._1091760480_CategoryFavoriteToggleButtonSkin_SetProperty4;
			if(_loc2_ !== param1)
			{
				this._1091760480_CategoryFavoriteToggleButtonSkin_SetProperty4 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CategoryFavoriteToggleButtonSkin_SetProperty4",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get arrowToolTip() : CategoryToolTip
		{
			return this._1284010086arrowToolTip;
		}
		
		public function set arrowToolTip(param1:CategoryToolTip) : void
		{
			var _loc2_:Object = this._1284010086arrowToolTip;
			if(_loc2_ !== param1)
			{
				this._1284010086arrowToolTip = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"arrowToolTip",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get iconStar() : Group
		{
			return this._737947029iconStar;
		}
		
		public function set iconStar(param1:Group) : void
		{
			var _loc2_:Object = this._737947029iconStar;
			if(_loc2_ !== param1)
			{
				this._737947029iconStar = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"iconStar",_loc2_,param1));
				}
			}
		}
	}
}
