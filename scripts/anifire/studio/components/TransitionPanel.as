package anifire.studio.components
{
	import anifire.assets.transition.AssetTransitionConstants;
	import anifire.interfaces.IIterator;
	import anifire.studio.assets.commands.AddAssetCollectionTransitionCommand;
	import anifire.studio.assets.commands.AddAssetMovementCommand;
	import anifire.studio.assets.commands.AddTransitionCommand;
	import anifire.studio.assets.commands.ChangeSoundModeCommand;
	import anifire.studio.assets.commands.RemoveAssetMovementCommand;
	import anifire.studio.assets.commands.RemoveTransitionCollectionCommand;
	import anifire.studio.assets.commands.RemoveTransitionCommand;
	import anifire.studio.assets.controllers.AssetTransitionController;
	import anifire.studio.assets.models.AssetSelection;
	import anifire.studio.assets.models.AssetTransition;
	import anifire.studio.assets.models.AssetTransitionCollection;
	import anifire.studio.commands.ICommand;
	import anifire.studio.core.AnimeScene;
	import anifire.studio.core.AnimeSound;
	import anifire.studio.core.Asset;
	import anifire.studio.core.BubbleAsset;
	import anifire.studio.core.Console;
	import anifire.studio.core.Widget;
	import anifire.studio.core.sound.SoundEvent;
	import anifire.studio.events.AssetTransitionEvent;
	import anifire.studio.events.BubbleAssetEvent;
	import anifire.studio.events.SceneEvent;
	import anifire.studio.skins.AddAssetTransitionButtonSkin;
	import anifire.studio.skins.RemoveBulkAssetTransitionButtonSkin;
	import anifire.util.UtilDict;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.external.ExternalInterface;
	import flash.utils.getDefinitionByName;
	import mx.binding.Binding;
	import mx.binding.BindingManager;
	import mx.binding.IBindingClient;
	import mx.binding.IWatcherSetupUtil2;
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.controls.Spacer;
	import mx.core.DeferredInstanceFromFunction;
	import mx.core.IFlexModuleFactory;
	import mx.core.mx_internal;
	import mx.events.CollectionEvent;
	import mx.events.CollectionEventKind;
	import mx.events.DragEvent;
	import mx.events.PropertyChangeEvent;
	import mx.graphics.SolidColor;
	import spark.components.Button;
	import spark.components.Group;
	import spark.components.HGroup;
	import spark.components.Label;
	import spark.components.Scroller;
	import spark.components.VGroup;
	import spark.events.IndexChangeEvent;
	import spark.events.RendererExistenceEvent;
	import spark.primitives.BitmapImage;
	import spark.primitives.Rect;
	import spark.primitives.RectangularDropShadow;
	
	use namespace mx_internal;
	
	public class TransitionPanel extends spark.components.NavigatorContent implements IBindingClient
	{
		
		private static var _watcherSetupUtil:IWatcherSetupUtil2;
		 
		
		public var _TransitionPanel_Button1:Button;
		
		public var _TransitionPanel_Button2:Button;
		
		public var _TransitionPanel_Button3:Button;
		
		public var _TransitionPanel_Button6:Button;
		
		public var _TransitionPanel_Button7:Button;
		
		public var _TransitionPanel_Button8:Button;
		
		public var _TransitionPanel_Label1:Label;
		
		public var _TransitionPanel_Label2:Label;
		
		public var _TransitionPanel_Label3:Label;
		
		public var _TransitionPanel_Label4:Label;
		
		public var _TransitionPanel_Label5:Label;
		
		public var _TransitionPanel_ListSeparator1:ListSeparator;
		
		public var _TransitionPanel_ListSeparator2:ListSeparator;
		
		public var _TransitionPanel_ListSeparator3:ListSeparator;
		
		public var _TransitionPanel_ListSeparator4:ListSeparator;
		
		private var _1768372312addTransitionButton:Button;
		
		private var _2090402675emptyContentGroup:Group;
		
		private var _1407502692listAfterNarration:TransitionList;
		
		private var _168074853listBeforeNarration:TransitionList;
		
		private var _1465688147listWholeScene:TransitionList;
		
		private var _238069118listWithNarration:TransitionList;
		
		private var _1300494787messagePanel:VGroup;
		
		private var _2024022411removeTransitionButton:Button;
		
		private var _502431124settingPanel:TransitionSettingPanel;
		
		private var _1987987025transitionPanel:VGroup;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private var _collectionController:AssetTransitionController;
		
		private var _collection:AssetTransitionCollection;
		
		private var _wholeSceneCollection:ArrayCollection;
		
		private var _selectedTransition:AssetTransition;
		
		private var _selectedTransitionCollection:Vector.<AssetTransition>;
		
		private var _652820454_selectedItems:Vector.<Object>;
		
		private var _sceneModel:AnimeScene;
		
		private var _selectedAsset:Asset;
		
		private var _assetSelection:AssetSelection;
		
		private var _1001060430showAllSections:Boolean;
		
		private var _1284373869showWholeSceneSection:Boolean;
		
		private var _872066822displayTransitionSettings:Boolean;
		
		private var _addingTransition:Boolean;
		
		private var _embed_mxml__styles_images_panel_enterexit_splash_png_764143659:Class;
		
		private var _embed_mxml__styles_images_panel_arrow_png_2077458411:Class;
		
		mx_internal var _bindings:Array;
		
		mx_internal var _watchers:Array;
		
		mx_internal var _bindingsByDestination:Object;
		
		mx_internal var _bindingsBeginWithWord:Object;
		
		public function TransitionPanel()
		{
			var target:Object = null;
			var watcherSetupUtilClass:Object = null;
			this._wholeSceneCollection = new ArrayCollection();
			this._selectedTransitionCollection = new Vector.<AssetTransition>();
			this._652820454_selectedItems = new Vector.<Object>();
			this._embed_mxml__styles_images_panel_enterexit_splash_png_764143659 = TransitionPanel__embed_mxml__styles_images_panel_enterexit_splash_png_764143659;
			this._embed_mxml__styles_images_panel_arrow_png_2077458411 = TransitionPanel__embed_mxml__styles_images_panel_arrow_png_2077458411;
			this._bindings = [];
			this._watchers = [];
			this._bindingsByDestination = {};
			this._bindingsBeginWithWord = {};
			super();
			mx_internal::_document = this;
			var bindings:Array = this._TransitionPanel_bindingsSetup();
			var watchers:Array = [];
			target = this;
			if(_watcherSetupUtil == null)
			{
				watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_TransitionPanelWatcherSetupUtil");
				watcherSetupUtilClass["init"](null);
			}
			_watcherSetupUtil.setup(this,function(param1:String):*
			{
				return target[param1];
			},function(param1:String):*
			{
				return TransitionPanel[param1];
			},bindings,watchers);
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.percentWidth = 100;
			this.percentHeight = 100;
			this.mxmlContentFactory = new DeferredInstanceFromFunction(this._TransitionPanel_Array1_c);
			var i:uint = 0;
			while(i < bindings.length)
			{
				Binding(bindings[i]).execute();
				i++;
			}
		}
		
		public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
		{
			TransitionPanel._watcherSetupUtil = param1;
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
		
		[Bindable(event="propertyChange")]
		private function get collection() : AssetTransitionCollection
		{
			return this._collection;
		}
		
		private function set _1741312354collection(param1:AssetTransitionCollection) : void
		{
			if(this._collection != param1)
			{
				if(this._collection)
				{
					this._collection.removeEventListener(CollectionEvent.COLLECTION_CHANGE,this.collection_changeHandler);
				}
				this._collection = param1;
				if(this._collection)
				{
					this._collection.addEventListener(CollectionEvent.COLLECTION_CHANGE,this.collection_changeHandler);
				}
			}
		}
		
		public function get sceneModel() : AnimeScene
		{
			return this._sceneModel;
		}
		
		public function set sceneModel(param1:AnimeScene) : void
		{
			if(this._sceneModel != param1)
			{
				if(this._sceneModel)
				{
					this.unloadAllAssets();
				}
				this._sceneModel = param1;
				if(this._sceneModel)
				{
					createDeferredContent();
					this.loadAllAssets();
				}
			}
		}
		
		protected function unloadAllAssets() : void
		{
			if(this._sceneModel)
			{
				this._sceneModel.removeEventListener(SceneEvent.SPEECH_CHANGE,this.speechChangeHandler);
			}
			this._assetSelection.removeEventListener(Event.CHANGE,this.assetSelection_changeHandler);
			this._assetSelection = null;
			Console.getConsole().linkageController.eventDispatcher.removeEventListener(SoundEvent.UPDATED,this.narration_changeHandler);
			this._collectionController = null;
			this.collection = null;
			this.selectedTransition = null;
			this.selectedAsset = null;
		}
		
		protected function loadAllAssets() : void
		{
			if(this.sceneModel is AnimeScene)
			{
				this._assetSelection = this.sceneModel.selection;
				this._assetSelection.addEventListener(Event.CHANGE,this.assetSelection_changeHandler);
				Console.getConsole().linkageController.eventDispatcher.addEventListener(SoundEvent.UPDATED,this.narration_changeHandler);
				this.collection = AnimeScene(this.sceneModel).assetTransitions;
				this._collectionController = AnimeScene(this.sceneModel).assetTransitionController;
				this.selectedAsset = this.sceneModel.selection.selectedAsset;
				this.updateSectionLayout();
				this.selectDefaultTransition(this._selectedAsset);
				this.updateButtons();
				this._sceneModel.addEventListener(SceneEvent.SPEECH_CHANGE,this.speechChangeHandler);
			}
		}
		
		private function speechChangeHandler(param1:SceneEvent) : void
		{
			this.updateSectionLayout();
		}
		
		private function collection_changeHandler(param1:CollectionEvent) : void
		{
			var _loc2_:AssetTransition = null;
			this.updateSectionLayout();
			if(param1.kind == CollectionEventKind.ADD)
			{
				_loc2_ = param1.items[0] as AssetTransition;
				if(!this._addingTransition || this._selectedAsset)
				{
					this._selectedTransitionCollection.splice(0,this._selectedTransitionCollection.length);
				}
				this._selectedTransitionCollection.push(_loc2_);
				this.updateTransitionSelection();
			}
			else if(param1.kind == CollectionEventKind.REMOVE)
			{
				_loc2_ = param1.items[0] as AssetTransition;
				if(!this._addingTransition)
				{
					this._selectedTransitionCollection.splice(0,this._selectedTransitionCollection.length);
					this.updateTransitionSelection();
					this.selectDefaultTransition(this._selectedAsset);
				}
			}
		}
		
		private function updateSectionLayout() : void
		{
			var _loc1_:AnimeSound = null;
			this.showAllSections = false;
			if(this._collection)
			{
				_loc1_ = (this.sceneModel as AnimeScene).speech;
				if(_loc1_ || this._collection.collectionBeforeNarration.length > 0 || this._collection.collectionAfterNarration.length > 0)
				{
					this.showAllSections = true;
				}
			}
			this.settingPanel.showAllSections = this.showAllSections;
		}
		
		private function updateButtons() : void
		{
			var _loc1_:IIterator = null;
			var _loc2_:AssetTransition = null;
			var _loc3_:int = 0;
			var _loc4_:int = 0;
			var _loc5_:int = 0;
			if(this._selectedTransitionCollection && this._selectedTransitionCollection.length > 1)
			{
				this.addTransitionButton.visible = this.addTransitionButton.includeInLayout = false;
				this.removeTransitionButton.visible = this.removeTransitionButton.includeInLayout = true;
			}
			else if(this._selectedAsset)
			{
				_loc1_ = this._collection.iterator();
				while(_loc1_.hasNext)
				{
					_loc2_ = _loc1_.next as AssetTransition;
					if(_loc2_ && _loc2_.assetId == this._selectedAsset.id)
					{
						if(_loc2_.direction == AssetTransitionConstants.DIRECTION_IN)
						{
							_loc3_++;
						}
						else if(_loc2_.direction == AssetTransitionConstants.DIRECTION_OUT)
						{
							_loc4_++;
						}
						else if(_loc2_.direction == AssetTransitionConstants.DIRECTION_MOVEMENT)
						{
							_loc5_++;
						}
					}
				}
				if(_loc3_ && _loc4_)
				{
					this.addTransitionButton.visible = this.addTransitionButton.includeInLayout = false;
				}
				else if(!_loc3_ && !_loc4_)
				{
					if(_loc5_)
					{
						this.addTransitionButton.label = UtilDict.toDisplay("go","Add Exit");
						this.addTransitionButton.visible = this.addTransitionButton.includeInLayout = true;
					}
					else
					{
						this.addTransitionButton.visible = this.addTransitionButton.includeInLayout = false;
					}
				}
				else
				{
					this.addTransitionButton.label = !!_loc4_?UtilDict.toDisplay("go","Add Enter"):UtilDict.toDisplay("go","Add Exit");
					this.addTransitionButton.visible = this.addTransitionButton.includeInLayout = true;
				}
				this.removeTransitionButton.visible = this.removeTransitionButton.includeInLayout = false;
			}
			else
			{
				this.addTransitionButton.visible = this.addTransitionButton.includeInLayout = false;
				this.removeTransitionButton.visible = this.removeTransitionButton.includeInLayout = false;
			}
		}
		
		private function get scene() : AnimeScene
		{
			return this.sceneModel as AnimeScene;
		}
		
		private function updateAssetSelection() : void
		{
			var _loc1_:AssetTransition = null;
			if(!this._selectedTransitionCollection)
			{
				return;
			}
			if(this._selectedTransitionCollection.length == 1)
			{
				_loc1_ = this._selectedTransitionCollection[0] as AssetTransition;
				this.scene.selectedAsset = this.scene.getAssetById(_loc1_.assetId);
				Console.getConsole().showControl();
			}
		}
		
		private function updateSettingPanel() : void
		{
			var _loc1_:AssetTransition = null;
			if(!this._selectedTransitionCollection)
			{
				return;
			}
			if(this._selectedTransitionCollection.length == 0)
			{
				this.selectedTransition = null;
				this.displayTransitionSettings = false;
			}
			else if(this._selectedTransitionCollection.length == 1)
			{
				_loc1_ = this._selectedTransitionCollection[0] as AssetTransition;
				this.selectedTransition = _loc1_;
				this.settingPanel.selectedTransitionCollection = this._selectedTransitionCollection;
				this.displayTransitionSettings = true;
			}
			else if(this._selectedTransitionCollection.length > 1)
			{
				this.selectedTransition = null;
				this.settingPanel.types = this.getTypesForTransitionCollection(this._selectedTransitionCollection);
				this.settingPanel.selectedTransitionCollection = this._selectedTransitionCollection;
				this.displayTransitionSettings = true;
			}
		}
		
		private function transitionList_changeHandler(param1:IndexChangeEvent) : void
		{
			var _loc2_:Boolean = false;
			var _loc3_:Boolean = false;
			var _loc4_:Boolean = false;
			var _loc5_:Boolean = false;
			var _loc6_:Boolean = false;
			var _loc7_:AssetTransition = null;
			var _loc8_:Vector.<Object> = null;
			if(!(param1.currentTarget as TransitionList).ctrlKey && !(param1.currentTarget as TransitionList).shiftKey)
			{
				_loc6_ = true;
			}
			if(_loc6_)
			{
				if(param1.currentTarget != this.listBeforeNarration)
				{
					this.listBeforeNarration.selectedItems = null;
					_loc2_ = true;
				}
				if(param1.currentTarget != this.listWithNarration)
				{
					this.listWithNarration.selectedItems = null;
					_loc3_ = true;
				}
				if(param1.currentTarget != this.listAfterNarration)
				{
					this.listAfterNarration.selectedItems = null;
					_loc4_ = true;
				}
				if(param1.currentTarget != this.listWholeScene)
				{
					this.listWholeScene.selectedItems = null;
					_loc5_ = true;
				}
			}
			this._selectedTransitionCollection.splice(0,this._selectedTransitionCollection.length);
			if(!_loc2_ && this.listBeforeNarration.selectedItems)
			{
				_loc8_ = this.listBeforeNarration.selectedItems.concat();
				_loc8_.sort(this.compareTransitionListItem);
				for each(_loc7_ in _loc8_)
				{
					this._selectedTransitionCollection.push(_loc7_);
				}
			}
			if(!_loc3_ && this.listWithNarration.selectedItems)
			{
				_loc8_ = this.listWithNarration.selectedItems.concat();
				_loc8_.sort(this.compareTransitionListItem);
				for each(_loc7_ in _loc8_)
				{
					this._selectedTransitionCollection.push(_loc7_);
				}
			}
			if(!_loc4_ && this.listAfterNarration.selectedItems)
			{
				_loc8_ = this.listAfterNarration.selectedItems.concat();
				_loc8_.sort(this.compareTransitionListItem);
				for each(_loc7_ in _loc8_)
				{
					this._selectedTransitionCollection.push(_loc7_);
				}
			}
			if(!_loc5_ && this.listWholeScene.selectedItems)
			{
				_loc8_ = this.listWholeScene.selectedItems.concat();
				_loc8_.sort(this.compareTransitionListItem);
				for each(_loc7_ in _loc8_)
				{
					this._selectedTransitionCollection.push(_loc7_);
				}
			}
			this.updateSettingPanel();
			this.updateButtons();
			this.updateAssetSelection();
		}
		
		private function compareTransitionListItem(param1:AssetTransition, param2:AssetTransition) : int
		{
			var _loc3_:int = 0;
			var _loc4_:int = 0;
			if(this._collection)
			{
				_loc3_ = this._collection.getTransitionIndex(param1);
				_loc4_ = this._collection.getTransitionIndex(param2);
				if(_loc3_ < _loc4_)
				{
					return -1;
				}
				if(_loc3_ > _loc4_)
				{
					return 1;
				}
			}
			return 0;
		}
		
		private function removeTransition(param1:AssetTransition) : void
		{
			var _loc2_:ICommand = null;
			var _loc3_:Asset = null;
			if(param1 && this._collection)
			{
				if(param1.direction == AssetTransitionConstants.DIRECTION_MOVEMENT)
				{
					if(this.scene)
					{
						_loc3_ = this.scene.getAssetById(param1.assetId);
						if(_loc3_)
						{
							_loc2_ = new RemoveAssetMovementCommand(_loc3_);
							_loc2_.execute();
						}
					}
				}
				else
				{
					_loc2_ = new RemoveTransitionCommand(param1);
					_loc2_.execute();
				}
			}
		}
		
		private function selectedTransitionDirection_changeHandler(param1:Event) : void
		{
			this.updateButtons();
		}
		
		private function selectAsset_textFontChangeHandler(param1:Event) : void
		{
			if(this._selectedTransition)
			{
				this.settingPanel.types = this.getTypes(this._selectedTransition);
				this.settingPanel.transition = this._selectedTransition;
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get selectedTransition() : AssetTransition
		{
			return this._selectedTransition;
		}
		
		private function set _1816458832selectedTransition(param1:AssetTransition) : void
		{
			if(this._selectedTransition != param1)
			{
				if(this._selectedTransition)
				{
					this._selectedTransition.removeEventListener(AssetTransitionEvent.DIRECTION_CHANGE,this.selectedTransitionDirection_changeHandler);
				}
				this._selectedTransition = param1;
				if(this._selectedTransition)
				{
					this._selectedTransition.addEventListener(AssetTransitionEvent.DIRECTION_CHANGE,this.selectedTransitionDirection_changeHandler);
				}
				if(param1)
				{
					this.settingPanel.types = this.getTypes(param1);
					this.settingPanel.directions = this._collectionController.getAvailableDirections(param1);
					this.settingPanel.transition = param1;
				}
			}
		}
		
		private function addButton_clickHandler() : void
		{
			var _loc1_:ICommand = null;
			var _loc2_:AssetTransition = null;
			if(this._assetSelection)
			{
				this._addingTransition = true;
				if(this._selectedAsset && this._collectionController)
				{
					_loc2_ = this._collectionController.createTransition(this._selectedAsset);
					if(_loc2_)
					{
						if(_loc2_.direction == AssetTransitionConstants.DIRECTION_MOVEMENT)
						{
							_loc1_ = new AddAssetMovementCommand(this._selectedAsset,_loc2_);
							_loc1_.execute();
						}
						else
						{
							_loc1_ = new AddTransitionCommand(_loc2_);
							_loc1_.execute();
						}
					}
				}
				else if(this._assetSelection.length > 1)
				{
					_loc1_ = new AddAssetCollectionTransitionCommand(this._assetSelection,AssetTransitionConstants.DIRECTION_IN);
					_loc1_.execute();
				}
				this._addingTransition = false;
			}
		}
		
		private function bulkRemoveButton_clickHandler() : void
		{
			var _loc1_:Array = null;
			var _loc2_:AssetTransition = null;
			var _loc3_:ICommand = null;
			if(this._selectedTransitionCollection)
			{
				_loc1_ = new Array();
				for each(_loc2_ in this._selectedTransitionCollection)
				{
					_loc1_.push(_loc2_);
				}
				_loc3_ = new RemoveTransitionCollectionCommand(_loc1_);
				_loc3_.execute();
			}
		}
		
		private function addEnterButton_clickHandler() : void
		{
			var _loc1_:AddAssetCollectionTransitionCommand = null;
			if(this._assetSelection)
			{
				this._addingTransition = true;
				_loc1_ = new AddAssetCollectionTransitionCommand(this._assetSelection,AssetTransitionConstants.DIRECTION_IN);
				_loc1_.execute();
				this._addingTransition = false;
			}
		}
		
		private function addExitButton_clickHandler() : void
		{
			var _loc1_:ICommand = null;
			if(this._assetSelection)
			{
				this._addingTransition = true;
				_loc1_ = new AddAssetCollectionTransitionCommand(this._assetSelection,AssetTransitionConstants.DIRECTION_OUT);
				_loc1_.execute();
				this._addingTransition = false;
			}
		}
		
		private function updateTransitionSelection() : void
		{
			var _loc2_:Object = null;
			var _loc1_:Vector.<Object> = new Vector.<Object>();
			for each(_loc2_ in this._selectedTransitionCollection)
			{
				_loc1_.push(_loc2_);
			}
			this._selectedItems = _loc1_;
			this.updateSettingPanel();
			this.updateButtons();
		}
		
		private function selectDefaultTransition(param1:Asset) : void
		{
			var _loc2_:IIterator = null;
			var _loc3_:AssetTransition = null;
			if(param1 && this._selectedTransitionCollection.length == 1 && this._selectedTransitionCollection[0].assetId == param1.id)
			{
				return;
			}
			this._selectedTransitionCollection.splice(0,this._selectedTransitionCollection.length);
			if(param1 && this._collection)
			{
				_loc2_ = this._collection.iterator();
				while(_loc2_.hasNext)
				{
					_loc3_ = _loc2_.next as AssetTransition;
					if(_loc3_ && _loc3_.assetId == param1.id)
					{
						this._selectedTransitionCollection.push(_loc3_);
						break;
					}
				}
			}
			this.updateTransitionSelection();
		}
		
		private function assetSelection_changeHandler(param1:Event) : void
		{
			if(this._assetSelection)
			{
				this.selectedAsset = this._assetSelection.selectedAsset;
			}
			this.selectDefaultTransition(this._selectedAsset);
			this.updateButtons();
		}
		
		private function set selectedAsset(param1:Asset) : void
		{
			if(this._selectedAsset != param1)
			{
				if(this._selectedAsset is BubbleAsset)
				{
					(this._selectedAsset as BubbleAsset).removeEventListener(BubbleAssetEvent.TEXT_FONT_CHANGE,this.selectAsset_textFontChangeHandler);
				}
				this._selectedAsset = param1;
				if(this._selectedAsset is BubbleAsset)
				{
					(this._selectedAsset as BubbleAsset).addEventListener(BubbleAssetEvent.TEXT_FONT_CHANGE,this.selectAsset_textFontChangeHandler);
				}
			}
		}
		
		private function getTypes(param1:AssetTransition) : Array
		{
			var _loc3_:AnimeScene = null;
			var _loc4_:Asset = null;
			var _loc2_:Array = AssetTransitionConstants.types;
			if(param1)
			{
				_loc3_ = this.sceneModel as AnimeScene;
				_loc4_ = _loc3_.getAssetById(param1.assetId);
				if(_loc4_ is BubbleAsset)
				{
					if((_loc4_ as BubbleAsset).textFont != "Arial")
					{
						_loc2_ = _loc2_.concat(AssetTransitionConstants.textTypes);
					}
				}
				else if(_loc4_ is Widget)
				{
					_loc2_ = _loc2_.concat(AssetTransitionConstants.widgetTypes);
				}
			}
			_loc2_ = _loc2_.concat(AssetTransitionConstants.spriteTypes);
			_loc2_.sortOn(["asset","label"]);
			_loc2_ = _loc2_.filter(this.filterEffectByAvailability);
			return _loc2_;
		}
		
		private function filterEffectByAvailability(param1:Object, param2:int, param3:Array) : Boolean
		{
			if(param1.enable != null)
			{
				if(!param1.enable)
				{
					return false;
				}
			}
			return true;
		}
		
		private function getTypesForTransitionCollection(param1:Vector.<AssetTransition>) : Array
		{
			var _loc3_:AnimeScene = null;
			var _loc4_:Asset = null;
			var _loc5_:Boolean = false;
			var _loc6_:Boolean = false;
			var _loc7_:uint = 0;
			var _loc2_:Array = AssetTransitionConstants.types;
			if(param1)
			{
				_loc3_ = this.sceneModel as AnimeScene;
				_loc5_ = true;
				_loc6_ = true;
				_loc7_ = 0;
				while(_loc7_ < param1.length)
				{
					_loc4_ = _loc3_.getAssetById(param1[_loc7_].assetId);
					if(_loc4_ is BubbleAsset)
					{
						if((_loc4_ as BubbleAsset).textFont == "Arial")
						{
							_loc5_ = false;
						}
					}
					else
					{
						_loc5_ = false;
					}
					if(!(_loc4_ is Widget))
					{
						_loc6_ = false;
					}
					_loc7_++;
				}
			}
			if(_loc5_)
			{
				_loc2_ = _loc2_.concat(AssetTransitionConstants.textTypes);
			}
			if(_loc6_)
			{
				_loc2_ = _loc2_.concat(AssetTransitionConstants.widgetTypes);
			}
			_loc2_ = _loc2_.concat(AssetTransitionConstants.spriteTypes);
			_loc2_.sortOn(["asset","label"]);
			_loc2_ = _loc2_.filter(this.filterEffectByAvailability);
			return _loc2_;
		}
		
		private function narration_changeHandler(param1:SoundEvent) : void
		{
			if(this.sceneModel is AnimeScene && param1.sceneId == AnimeScene(this.sceneModel).id)
			{
				this.updateSectionLayout();
			}
		}
		
		protected function wholeSceneList_dragEnterHandler(param1:DragEvent) : void
		{
			var _loc2_:Vector.<Object> = null;
			var _loc3_:AssetTransition = null;
			if(param1.dragSource.hasFormat("itemsByIndex"))
			{
				_loc2_ = param1.dragSource.dataForFormat("itemsByIndex") as Vector.<Object>;
				_loc3_ = _loc2_[0] as AssetTransition;
				if(_loc3_ && _loc3_.direction != AssetTransitionConstants.DIRECTION_MOVEMENT)
				{
					param1.preventDefault();
				}
			}
		}
		
		protected function renderer_addHandler(param1:RendererExistenceEvent) : void
		{
			param1.renderer.addEventListener("removeTransition",this.renderer_removeTransitionHandler);
			param1.renderer.addEventListener("toggleSound",this.renderer_toggleSoundHandler);
		}
		
		protected function renderer_removeHandler(param1:RendererExistenceEvent) : void
		{
			param1.renderer.removeEventListener("removeTransition",this.renderer_removeTransitionHandler);
			param1.renderer.removeEventListener("toggleSound",this.renderer_toggleSoundHandler);
		}
		
		protected function renderer_toggleSoundHandler(param1:Event) : void
		{
			var _loc2_:TransitionItemRenderer = param1.currentTarget as TransitionItemRenderer;
			this._selectedTransition = _loc2_.data as AssetTransition;
			var _loc3_:int = this._selectedTransition.soundMode == AssetTransitionConstants.SOUND_ON?int(AssetTransitionConstants.SOUND_OFF):int(AssetTransitionConstants.SOUND_ON);
			var _loc4_:ICommand = new ChangeSoundModeCommand(this._selectedTransition,_loc3_);
			_loc4_.execute();
			_loc2_.updateSoundButtonState();
		}
		
		protected function renderer_removeTransitionHandler(param1:Event) : void
		{
			var _loc2_:TransitionItemRenderer = param1.currentTarget as TransitionItemRenderer;
			this._selectedTransitionCollection.splice(0,this._selectedTransitionCollection.length);
			this._selectedTransitionCollection.push(_loc2_.data as AssetTransition);
			this.updateTransitionSelection();
			this.removeTransition(_loc2_.data as AssetTransition);
		}
		
		private function tutorialButton_clickHandler() : void
		{
			if(ExternalInterface.available)
			{
				ExternalInterface.call("videoTutorial.launch","enterexit");
			}
		}
		
		private function _TransitionPanel_Array1_c() : Array
		{
			var _loc1_:Array = [this._TransitionPanel_VGroup1_i(),this._TransitionPanel_Group4_i()];
			return _loc1_;
		}
		
		private function _TransitionPanel_VGroup1_i() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.horizontalAlign = "center";
			_loc1_.gap = 0;
			_loc1_.paddingTop = 10;
			_loc1_.mxmlContent = [this._TransitionPanel_Group1_c(),this._TransitionPanel_Group2_c(),this._TransitionPanel_Group3_c()];
			_loc1_.id = "transitionPanel";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.transitionPanel = _loc1_;
			BindingManager.executeBindings(this,"transitionPanel",this.transitionPanel);
			return _loc1_;
		}
		
		private function _TransitionPanel_Group1_c() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.percentWidth = 100;
			_loc1_.minHeight = 150;
			_loc1_.mxmlContent = [this._TransitionPanel_TransitionSettingPanel1_i(),this._TransitionPanel_VGroup2_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _TransitionPanel_TransitionSettingPanel1_i() : TransitionSettingPanel
		{
			var _loc1_:TransitionSettingPanel = new TransitionSettingPanel();
			_loc1_.percentWidth = 100;
			_loc1_.id = "settingPanel";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.settingPanel = _loc1_;
			BindingManager.executeBindings(this,"settingPanel",this.settingPanel);
			return _loc1_;
		}
		
		private function _TransitionPanel_VGroup2_i() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.percentWidth = 100;
			_loc1_.gap = 10;
			_loc1_.horizontalAlign = "center";
			_loc1_.mxmlContent = [this._TransitionPanel_Label1_i(),this._TransitionPanel_Spacer1_c(),this._TransitionPanel_Button1_i(),this._TransitionPanel_Button2_i(),this._TransitionPanel_Spacer2_c(),this._TransitionPanel_Button3_i(),this._TransitionPanel_Label2_i()];
			_loc1_.id = "messagePanel";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.messagePanel = _loc1_;
			BindingManager.executeBindings(this,"messagePanel",this.messagePanel);
			return _loc1_;
		}
		
		private function _TransitionPanel_Label1_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.id = "_TransitionPanel_Label1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._TransitionPanel_Label1 = _loc1_;
			BindingManager.executeBindings(this,"_TransitionPanel_Label1",this._TransitionPanel_Label1);
			return _loc1_;
		}
		
		private function _TransitionPanel_Spacer1_c() : Spacer
		{
			var _loc1_:Spacer = new Spacer();
			_loc1_.height = 2;
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _TransitionPanel_Button1_i() : Button
		{
			var _loc1_:Button = new Button();
			_loc1_.styleName = "primary";
			_loc1_.buttonMode = true;
			_loc1_.width = 160;
			_loc1_.setStyle("typographicCase","uppercase");
			_loc1_.addEventListener("click",this.___TransitionPanel_Button1_click);
			_loc1_.id = "_TransitionPanel_Button1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._TransitionPanel_Button1 = _loc1_;
			BindingManager.executeBindings(this,"_TransitionPanel_Button1",this._TransitionPanel_Button1);
			return _loc1_;
		}
		
		public function ___TransitionPanel_Button1_click(param1:MouseEvent) : void
		{
			this.addEnterButton_clickHandler();
		}
		
		private function _TransitionPanel_Button2_i() : Button
		{
			var _loc1_:Button = new Button();
			_loc1_.styleName = "primary";
			_loc1_.buttonMode = true;
			_loc1_.width = 160;
			_loc1_.setStyle("typographicCase","uppercase");
			_loc1_.addEventListener("click",this.___TransitionPanel_Button2_click);
			_loc1_.id = "_TransitionPanel_Button2";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._TransitionPanel_Button2 = _loc1_;
			BindingManager.executeBindings(this,"_TransitionPanel_Button2",this._TransitionPanel_Button2);
			return _loc1_;
		}
		
		public function ___TransitionPanel_Button2_click(param1:MouseEvent) : void
		{
			this.addExitButton_clickHandler();
		}
		
		private function _TransitionPanel_Spacer2_c() : Spacer
		{
			var _loc1_:Spacer = new Spacer();
			_loc1_.height = 2;
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _TransitionPanel_Button3_i() : Button
		{
			var _loc1_:Button = new Button();
			_loc1_.styleName = "link";
			_loc1_.buttonMode = true;
			_loc1_.setStyle("typographicCase","uppercase");
			_loc1_.addEventListener("click",this.___TransitionPanel_Button3_click);
			_loc1_.id = "_TransitionPanel_Button3";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._TransitionPanel_Button3 = _loc1_;
			BindingManager.executeBindings(this,"_TransitionPanel_Button3",this._TransitionPanel_Button3);
			return _loc1_;
		}
		
		public function ___TransitionPanel_Button3_click(param1:MouseEvent) : void
		{
			this.tutorialButton_clickHandler();
		}
		
		private function _TransitionPanel_Label2_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.setStyle("color",11184810);
			_loc1_.id = "_TransitionPanel_Label2";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._TransitionPanel_Label2 = _loc1_;
			BindingManager.executeBindings(this,"_TransitionPanel_Label2",this._TransitionPanel_Label2);
			return _loc1_;
		}
		
		private function _TransitionPanel_Group2_c() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.percentWidth = 100;
			_loc1_.mxmlContent = [this._TransitionPanel_Rect1_c(),this._TransitionPanel_HGroup1_c()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _TransitionPanel_Rect1_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.fill = this._TransitionPanel_SolidColor1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _TransitionPanel_SolidColor1_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 3233154;
			return _loc1_;
		}
		
		private function _TransitionPanel_HGroup1_c() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.percentWidth = 100;
			_loc1_.height = 40;
			_loc1_.paddingLeft = 14;
			_loc1_.paddingRight = 14;
			_loc1_.paddingTop = 7;
			_loc1_.paddingBottom = 7;
			_loc1_.verticalAlign = "middle";
			_loc1_.mxmlContent = [this._TransitionPanel_Label3_i(),this._TransitionPanel_Button4_i(),this._TransitionPanel_Button5_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _TransitionPanel_Label3_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.percentWidth = 100;
			_loc1_.setStyle("typographicCase","uppercase");
			_loc1_.setStyle("color",16777215);
			_loc1_.setStyle("fontWeight","bold");
			_loc1_.setStyle("fontSize",12);
			_loc1_.id = "_TransitionPanel_Label3";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._TransitionPanel_Label3 = _loc1_;
			BindingManager.executeBindings(this,"_TransitionPanel_Label3",this._TransitionPanel_Label3);
			return _loc1_;
		}
		
		private function _TransitionPanel_Button4_i() : Button
		{
			var _loc1_:Button = new Button();
			_loc1_.buttonMode = true;
			_loc1_.setStyle("skinClass",AddAssetTransitionButtonSkin);
			_loc1_.addEventListener("click",this.__addTransitionButton_click);
			_loc1_.id = "addTransitionButton";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.addTransitionButton = _loc1_;
			BindingManager.executeBindings(this,"addTransitionButton",this.addTransitionButton);
			return _loc1_;
		}
		
		public function __addTransitionButton_click(param1:MouseEvent) : void
		{
			this.addButton_clickHandler();
		}
		
		private function _TransitionPanel_Button5_i() : Button
		{
			var _loc1_:Button = new Button();
			_loc1_.buttonMode = true;
			_loc1_.setStyle("skinClass",RemoveBulkAssetTransitionButtonSkin);
			_loc1_.addEventListener("click",this.__removeTransitionButton_click);
			_loc1_.id = "removeTransitionButton";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.removeTransitionButton = _loc1_;
			BindingManager.executeBindings(this,"removeTransitionButton",this.removeTransitionButton);
			return _loc1_;
		}
		
		public function __removeTransitionButton_click(param1:MouseEvent) : void
		{
			this.bulkRemoveButton_clickHandler();
		}
		
		private function _TransitionPanel_Group3_c() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.mxmlContent = [this._TransitionPanel_Rect2_c(),this._TransitionPanel_RectangularDropShadow1_c(),this._TransitionPanel_Scroller1_c()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _TransitionPanel_Rect2_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.fill = this._TransitionPanel_SolidColor2_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _TransitionPanel_SolidColor2_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 4551078;
			return _loc1_;
		}
		
		private function _TransitionPanel_RectangularDropShadow1_c() : RectangularDropShadow
		{
			var _loc1_:RectangularDropShadow = new RectangularDropShadow();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.height = 0;
			_loc1_.distance = 0;
			_loc1_.blurX = 0;
			_loc1_.blurY = 6;
			_loc1_.alpha = 0.5;
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _TransitionPanel_Scroller1_c() : Scroller
		{
			var _loc1_:Scroller = new Scroller();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.viewport = this._TransitionPanel_VGroup3_c();
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _TransitionPanel_VGroup3_c() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.percentWidth = 100;
			_loc1_.gap = 0;
			_loc1_.minHeight = 80;
			_loc1_.paddingTop = 10;
			_loc1_.paddingBottom = 10;
			_loc1_.mxmlContent = [this._TransitionPanel_ListSeparator1_i(),this._TransitionPanel_TransitionList1_i(),this._TransitionPanel_ListSeparator2_i(),this._TransitionPanel_TransitionList2_i(),this._TransitionPanel_ListSeparator3_i(),this._TransitionPanel_TransitionList3_i(),this._TransitionPanel_ListSeparator4_i(),this._TransitionPanel_TransitionList4_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _TransitionPanel_ListSeparator1_i() : ListSeparator
		{
			var _loc1_:ListSeparator = new ListSeparator();
			_loc1_.percentWidth = 100;
			_loc1_.id = "_TransitionPanel_ListSeparator1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._TransitionPanel_ListSeparator1 = _loc1_;
			BindingManager.executeBindings(this,"_TransitionPanel_ListSeparator1",this._TransitionPanel_ListSeparator1);
			return _loc1_;
		}
		
		private function _TransitionPanel_TransitionList1_i() : TransitionList
		{
			var _loc1_:TransitionList = new TransitionList();
			_loc1_.percentWidth = 100;
			_loc1_.addEventListener("change",this.__listBeforeNarration_change);
			_loc1_.addEventListener("rendererAdd",this.__listBeforeNarration_rendererAdd);
			_loc1_.addEventListener("rendererRemove",this.__listBeforeNarration_rendererRemove);
			_loc1_.id = "listBeforeNarration";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.listBeforeNarration = _loc1_;
			BindingManager.executeBindings(this,"listBeforeNarration",this.listBeforeNarration);
			return _loc1_;
		}
		
		public function __listBeforeNarration_change(param1:IndexChangeEvent) : void
		{
			this.transitionList_changeHandler(param1);
		}
		
		public function __listBeforeNarration_rendererAdd(param1:RendererExistenceEvent) : void
		{
			this.renderer_addHandler(param1);
		}
		
		public function __listBeforeNarration_rendererRemove(param1:RendererExistenceEvent) : void
		{
			this.renderer_removeHandler(param1);
		}
		
		private function _TransitionPanel_ListSeparator2_i() : ListSeparator
		{
			var _loc1_:ListSeparator = new ListSeparator();
			_loc1_.percentWidth = 100;
			_loc1_.id = "_TransitionPanel_ListSeparator2";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._TransitionPanel_ListSeparator2 = _loc1_;
			BindingManager.executeBindings(this,"_TransitionPanel_ListSeparator2",this._TransitionPanel_ListSeparator2);
			return _loc1_;
		}
		
		private function _TransitionPanel_TransitionList2_i() : TransitionList
		{
			var _loc1_:TransitionList = new TransitionList();
			_loc1_.percentWidth = 100;
			_loc1_.addEventListener("change",this.__listWithNarration_change);
			_loc1_.addEventListener("rendererAdd",this.__listWithNarration_rendererAdd);
			_loc1_.addEventListener("rendererRemove",this.__listWithNarration_rendererRemove);
			_loc1_.id = "listWithNarration";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.listWithNarration = _loc1_;
			BindingManager.executeBindings(this,"listWithNarration",this.listWithNarration);
			return _loc1_;
		}
		
		public function __listWithNarration_change(param1:IndexChangeEvent) : void
		{
			this.transitionList_changeHandler(param1);
		}
		
		public function __listWithNarration_rendererAdd(param1:RendererExistenceEvent) : void
		{
			this.renderer_addHandler(param1);
		}
		
		public function __listWithNarration_rendererRemove(param1:RendererExistenceEvent) : void
		{
			this.renderer_removeHandler(param1);
		}
		
		private function _TransitionPanel_ListSeparator3_i() : ListSeparator
		{
			var _loc1_:ListSeparator = new ListSeparator();
			_loc1_.percentWidth = 100;
			_loc1_.id = "_TransitionPanel_ListSeparator3";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._TransitionPanel_ListSeparator3 = _loc1_;
			BindingManager.executeBindings(this,"_TransitionPanel_ListSeparator3",this._TransitionPanel_ListSeparator3);
			return _loc1_;
		}
		
		private function _TransitionPanel_TransitionList3_i() : TransitionList
		{
			var _loc1_:TransitionList = new TransitionList();
			_loc1_.percentWidth = 100;
			_loc1_.addEventListener("change",this.__listAfterNarration_change);
			_loc1_.addEventListener("rendererAdd",this.__listAfterNarration_rendererAdd);
			_loc1_.addEventListener("rendererRemove",this.__listAfterNarration_rendererRemove);
			_loc1_.id = "listAfterNarration";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.listAfterNarration = _loc1_;
			BindingManager.executeBindings(this,"listAfterNarration",this.listAfterNarration);
			return _loc1_;
		}
		
		public function __listAfterNarration_change(param1:IndexChangeEvent) : void
		{
			this.transitionList_changeHandler(param1);
		}
		
		public function __listAfterNarration_rendererAdd(param1:RendererExistenceEvent) : void
		{
			this.renderer_addHandler(param1);
		}
		
		public function __listAfterNarration_rendererRemove(param1:RendererExistenceEvent) : void
		{
			this.renderer_removeHandler(param1);
		}
		
		private function _TransitionPanel_ListSeparator4_i() : ListSeparator
		{
			var _loc1_:ListSeparator = new ListSeparator();
			_loc1_.percentWidth = 100;
			_loc1_.id = "_TransitionPanel_ListSeparator4";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._TransitionPanel_ListSeparator4 = _loc1_;
			BindingManager.executeBindings(this,"_TransitionPanel_ListSeparator4",this._TransitionPanel_ListSeparator4);
			return _loc1_;
		}
		
		private function _TransitionPanel_TransitionList4_i() : TransitionList
		{
			var _loc1_:TransitionList = new TransitionList();
			_loc1_.percentWidth = 100;
			_loc1_.addEventListener("change",this.__listWholeScene_change);
			_loc1_.addEventListener("dragEnter",this.__listWholeScene_dragEnter);
			_loc1_.addEventListener("rendererAdd",this.__listWholeScene_rendererAdd);
			_loc1_.addEventListener("rendererRemove",this.__listWholeScene_rendererRemove);
			_loc1_.id = "listWholeScene";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.listWholeScene = _loc1_;
			BindingManager.executeBindings(this,"listWholeScene",this.listWholeScene);
			return _loc1_;
		}
		
		public function __listWholeScene_change(param1:IndexChangeEvent) : void
		{
			this.transitionList_changeHandler(param1);
		}
		
		public function __listWholeScene_dragEnter(param1:DragEvent) : void
		{
			this.wholeSceneList_dragEnterHandler(param1);
		}
		
		public function __listWholeScene_rendererAdd(param1:RendererExistenceEvent) : void
		{
			this.renderer_addHandler(param1);
		}
		
		public function __listWholeScene_rendererRemove(param1:RendererExistenceEvent) : void
		{
			this.renderer_removeHandler(param1);
		}
		
		private function _TransitionPanel_Group4_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.mxmlContent = [this._TransitionPanel_Rect3_c(),this._TransitionPanel_BitmapImage1_c(),this._TransitionPanel_VGroup4_c(),this._TransitionPanel_VGroup5_c()];
			_loc1_.id = "emptyContentGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.emptyContentGroup = _loc1_;
			BindingManager.executeBindings(this,"emptyContentGroup",this.emptyContentGroup);
			return _loc1_;
		}
		
		private function _TransitionPanel_Rect3_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.fill = this._TransitionPanel_SolidColor3_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _TransitionPanel_SolidColor3_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 3041687;
			return _loc1_;
		}
		
		private function _TransitionPanel_BitmapImage1_c() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.source = this._embed_mxml__styles_images_panel_enterexit_splash_png_764143659;
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _TransitionPanel_VGroup4_c() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.horizontalAlign = "center";
			_loc1_.paddingTop = 28;
			_loc1_.paddingLeft = 14;
			_loc1_.paddingRight = 14;
			_loc1_.gap = 14;
			_loc1_.mxmlContent = [this._TransitionPanel_Label4_i(),this._TransitionPanel_Label5_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _TransitionPanel_Label4_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.percentWidth = 100;
			_loc1_.setStyle("textAlign","center");
			_loc1_.setStyle("typographicCase","uppercase");
			_loc1_.setStyle("fontWeight","bold");
			_loc1_.setStyle("color",16777215);
			_loc1_.setStyle("fontSize",17);
			_loc1_.id = "_TransitionPanel_Label4";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._TransitionPanel_Label4 = _loc1_;
			BindingManager.executeBindings(this,"_TransitionPanel_Label4",this._TransitionPanel_Label4);
			return _loc1_;
		}
		
		private function _TransitionPanel_Label5_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.percentWidth = 100;
			_loc1_.setStyle("textAlign","center");
			_loc1_.setStyle("color",16777215);
			_loc1_.setStyle("fontSize",13);
			_loc1_.id = "_TransitionPanel_Label5";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._TransitionPanel_Label5 = _loc1_;
			BindingManager.executeBindings(this,"_TransitionPanel_Label5",this._TransitionPanel_Label5);
			return _loc1_;
		}
		
		private function _TransitionPanel_VGroup5_c() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.percentWidth = 100;
			_loc1_.top = 188;
			_loc1_.horizontalAlign = "center";
			_loc1_.gap = 0;
			_loc1_.mxmlContent = [this._TransitionPanel_Button6_i(),this._TransitionPanel_Spacer3_c(),this._TransitionPanel_Button7_i(),this._TransitionPanel_Spacer4_c(),this._TransitionPanel_HGroup2_c(),this._TransitionPanel_Spacer5_c()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _TransitionPanel_Button6_i() : Button
		{
			var _loc1_:Button = new Button();
			_loc1_.styleName = "primary";
			_loc1_.buttonMode = true;
			_loc1_.width = 180;
			_loc1_.height = 32;
			_loc1_.addEventListener("click",this.___TransitionPanel_Button6_click);
			_loc1_.id = "_TransitionPanel_Button6";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._TransitionPanel_Button6 = _loc1_;
			BindingManager.executeBindings(this,"_TransitionPanel_Button6",this._TransitionPanel_Button6);
			return _loc1_;
		}
		
		public function ___TransitionPanel_Button6_click(param1:MouseEvent) : void
		{
			this.addEnterButton_clickHandler();
		}
		
		private function _TransitionPanel_Spacer3_c() : Spacer
		{
			var _loc1_:Spacer = new Spacer();
			_loc1_.height = 6;
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _TransitionPanel_Button7_i() : Button
		{
			var _loc1_:Button = new Button();
			_loc1_.styleName = "primary";
			_loc1_.buttonMode = true;
			_loc1_.width = 180;
			_loc1_.height = 32;
			_loc1_.addEventListener("click",this.___TransitionPanel_Button7_click);
			_loc1_.id = "_TransitionPanel_Button7";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._TransitionPanel_Button7 = _loc1_;
			BindingManager.executeBindings(this,"_TransitionPanel_Button7",this._TransitionPanel_Button7);
			return _loc1_;
		}
		
		public function ___TransitionPanel_Button7_click(param1:MouseEvent) : void
		{
			this.addExitButton_clickHandler();
		}
		
		private function _TransitionPanel_Spacer4_c() : Spacer
		{
			var _loc1_:Spacer = new Spacer();
			_loc1_.height = 15;
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _TransitionPanel_HGroup2_c() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.mxmlContent = [this._TransitionPanel_Button8_i(),this._TransitionPanel_BitmapImage2_c()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _TransitionPanel_Button8_i() : Button
		{
			var _loc1_:Button = new Button();
			_loc1_.styleName = "link";
			_loc1_.buttonMode = true;
			_loc1_.addEventListener("click",this.___TransitionPanel_Button8_click);
			_loc1_.id = "_TransitionPanel_Button8";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._TransitionPanel_Button8 = _loc1_;
			BindingManager.executeBindings(this,"_TransitionPanel_Button8",this._TransitionPanel_Button8);
			return _loc1_;
		}
		
		public function ___TransitionPanel_Button8_click(param1:MouseEvent) : void
		{
			this.tutorialButton_clickHandler();
		}
		
		private function _TransitionPanel_BitmapImage2_c() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.source = this._embed_mxml__styles_images_panel_arrow_png_2077458411;
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _TransitionPanel_Spacer5_c() : Spacer
		{
			var _loc1_:Spacer = new Spacer();
			_loc1_.height = 28;
			_loc1_.minHeight = 2;
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _TransitionPanel_bindingsSetup() : Array
		{
			var result:Array = [];
			result[0] = new Binding(this,function():Boolean
			{
				return displayTransitionSettings;
			},null,"settingPanel.visible");
			result[1] = new Binding(this,function():Boolean
			{
				return !displayTransitionSettings;
			},null,"messagePanel.visible");
			result[2] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Add motions to the selected asset(s)");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_TransitionPanel_Label1.text");
			result[3] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Add enter motion");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_TransitionPanel_Button1.label");
			result[4] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Add exit motion");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_TransitionPanel_Button2.label");
			result[5] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Learn about motions");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_TransitionPanel_Button3.label");
			result[6] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","NOTE: Existing motions (if any) will be overwritten");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_TransitionPanel_Label2.text");
			result[7] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Enter / Exit Motions");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_TransitionPanel_Label3.text");
			result[8] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Add Enter");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"addTransitionButton.label");
			result[9] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Delete Motions");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"removeTransitionButton.label");
			result[10] = new Binding(this,function():Boolean
			{
				return showAllSections;
			},null,"_TransitionPanel_ListSeparator1.visible");
			result[11] = new Binding(this,function():Boolean
			{
				return showAllSections;
			},null,"_TransitionPanel_ListSeparator1.includeInLayout");
			result[12] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","before narration");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_TransitionPanel_ListSeparator1.text");
			result[13] = new Binding(this,function():IList
			{
				return collection.collectionBeforeNarration;
			},null,"listBeforeNarration.dataProvider");
			result[14] = new Binding(this,function():Vector.<Object>
			{
				return _selectedItems;
			},null,"listBeforeNarration.selectedItems");
			result[15] = new Binding(this,function():Boolean
			{
				return showAllSections;
			},null,"listBeforeNarration.visible");
			result[16] = new Binding(this,function():Boolean
			{
				return showAllSections;
			},null,"listBeforeNarration.includeInLayout");
			result[17] = new Binding(this,function():Boolean
			{
				return showAllSections;
			},null,"_TransitionPanel_ListSeparator2.visible");
			result[18] = new Binding(this,function():Boolean
			{
				return showAllSections;
			},null,"_TransitionPanel_ListSeparator2.includeInLayout");
			result[19] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","with narration");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_TransitionPanel_ListSeparator2.text");
			result[20] = new Binding(this,function():IList
			{
				return collection.collectionWithNarration;
			},null,"listWithNarration.dataProvider");
			result[21] = new Binding(this,function():Vector.<Object>
			{
				return _selectedItems;
			},null,"listWithNarration.selectedItems");
			result[22] = new Binding(this,function():Boolean
			{
				return showAllSections;
			},null,"_TransitionPanel_ListSeparator3.visible");
			result[23] = new Binding(this,function():Boolean
			{
				return showAllSections;
			},null,"_TransitionPanel_ListSeparator3.includeInLayout");
			result[24] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","after narration");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_TransitionPanel_ListSeparator3.text");
			result[25] = new Binding(this,function():IList
			{
				return collection.collectionAfterNarration;
			},null,"listAfterNarration.dataProvider");
			result[26] = new Binding(this,function():Vector.<Object>
			{
				return _selectedItems;
			},null,"listAfterNarration.selectedItems");
			result[27] = new Binding(this,function():Boolean
			{
				return showAllSections;
			},null,"listAfterNarration.visible");
			result[28] = new Binding(this,function():Boolean
			{
				return showAllSections;
			},null,"listAfterNarration.includeInLayout");
			result[29] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","whole scene");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_TransitionPanel_ListSeparator4.text");
			result[30] = new Binding(this,function():Boolean
			{
				return collection.collectionWholeScene.length > 0;
			},null,"_TransitionPanel_ListSeparator4.visible");
			result[31] = new Binding(this,function():Boolean
			{
				return collection.collectionWholeScene.length > 0;
			},null,"_TransitionPanel_ListSeparator4.includeInLayout");
			result[32] = new Binding(this,function():IList
			{
				return collection.collectionWholeScene;
			},null,"listWholeScene.dataProvider");
			result[33] = new Binding(this,function():Vector.<Object>
			{
				return _selectedItems;
			},null,"listWholeScene.selectedItems");
			result[34] = new Binding(this,function():Boolean
			{
				return collection.collectionWholeScene.length > 0;
			},null,"listWholeScene.visible");
			result[35] = new Binding(this,function():Boolean
			{
				return collection.collectionWholeScene.length > 0;
			},null,"listWholeScene.includeInLayout");
			result[36] = new Binding(this,function():Boolean
			{
				return collection.totalTransitions == 0;
			},null,"emptyContentGroup.visible");
			result[37] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Enter/Exit Effects");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_TransitionPanel_Label4.text");
			result[38] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Add Enter/Exit to props and characters to make your scene more engaging.");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_TransitionPanel_Label5.text");
			result[39] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Add enter motion");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_TransitionPanel_Button6.label");
			result[40] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Add exit motion");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_TransitionPanel_Button7.label");
			result[41] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Watch Tutorial Video");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_TransitionPanel_Button8.label");
			return result;
		}
		
		[Bindable(event="propertyChange")]
		public function get addTransitionButton() : Button
		{
			return this._1768372312addTransitionButton;
		}
		
		public function set addTransitionButton(param1:Button) : void
		{
			var _loc2_:Object = this._1768372312addTransitionButton;
			if(_loc2_ !== param1)
			{
				this._1768372312addTransitionButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"addTransitionButton",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get emptyContentGroup() : Group
		{
			return this._2090402675emptyContentGroup;
		}
		
		public function set emptyContentGroup(param1:Group) : void
		{
			var _loc2_:Object = this._2090402675emptyContentGroup;
			if(_loc2_ !== param1)
			{
				this._2090402675emptyContentGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"emptyContentGroup",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get listAfterNarration() : TransitionList
		{
			return this._1407502692listAfterNarration;
		}
		
		public function set listAfterNarration(param1:TransitionList) : void
		{
			var _loc2_:Object = this._1407502692listAfterNarration;
			if(_loc2_ !== param1)
			{
				this._1407502692listAfterNarration = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"listAfterNarration",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get listBeforeNarration() : TransitionList
		{
			return this._168074853listBeforeNarration;
		}
		
		public function set listBeforeNarration(param1:TransitionList) : void
		{
			var _loc2_:Object = this._168074853listBeforeNarration;
			if(_loc2_ !== param1)
			{
				this._168074853listBeforeNarration = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"listBeforeNarration",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get listWholeScene() : TransitionList
		{
			return this._1465688147listWholeScene;
		}
		
		public function set listWholeScene(param1:TransitionList) : void
		{
			var _loc2_:Object = this._1465688147listWholeScene;
			if(_loc2_ !== param1)
			{
				this._1465688147listWholeScene = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"listWholeScene",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get listWithNarration() : TransitionList
		{
			return this._238069118listWithNarration;
		}
		
		public function set listWithNarration(param1:TransitionList) : void
		{
			var _loc2_:Object = this._238069118listWithNarration;
			if(_loc2_ !== param1)
			{
				this._238069118listWithNarration = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"listWithNarration",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get messagePanel() : VGroup
		{
			return this._1300494787messagePanel;
		}
		
		public function set messagePanel(param1:VGroup) : void
		{
			var _loc2_:Object = this._1300494787messagePanel;
			if(_loc2_ !== param1)
			{
				this._1300494787messagePanel = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"messagePanel",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get removeTransitionButton() : Button
		{
			return this._2024022411removeTransitionButton;
		}
		
		public function set removeTransitionButton(param1:Button) : void
		{
			var _loc2_:Object = this._2024022411removeTransitionButton;
			if(_loc2_ !== param1)
			{
				this._2024022411removeTransitionButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"removeTransitionButton",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get settingPanel() : TransitionSettingPanel
		{
			return this._502431124settingPanel;
		}
		
		public function set settingPanel(param1:TransitionSettingPanel) : void
		{
			var _loc2_:Object = this._502431124settingPanel;
			if(_loc2_ !== param1)
			{
				this._502431124settingPanel = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"settingPanel",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get transitionPanel() : VGroup
		{
			return this._1987987025transitionPanel;
		}
		
		public function set transitionPanel(param1:VGroup) : void
		{
			var _loc2_:Object = this._1987987025transitionPanel;
			if(_loc2_ !== param1)
			{
				this._1987987025transitionPanel = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"transitionPanel",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get _selectedItems() : Vector.<Object>
		{
			return this._652820454_selectedItems;
		}
		
		private function set _selectedItems(param1:Vector.<Object>) : void
		{
			var _loc2_:Object = this._652820454_selectedItems;
			if(_loc2_ !== param1)
			{
				this._652820454_selectedItems = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_selectedItems",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get showAllSections() : Boolean
		{
			return this._1001060430showAllSections;
		}
		
		private function set showAllSections(param1:Boolean) : void
		{
			var _loc2_:Object = this._1001060430showAllSections;
			if(_loc2_ !== param1)
			{
				this._1001060430showAllSections = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"showAllSections",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get showWholeSceneSection() : Boolean
		{
			return this._1284373869showWholeSceneSection;
		}
		
		private function set showWholeSceneSection(param1:Boolean) : void
		{
			var _loc2_:Object = this._1284373869showWholeSceneSection;
			if(_loc2_ !== param1)
			{
				this._1284373869showWholeSceneSection = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"showWholeSceneSection",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get displayTransitionSettings() : Boolean
		{
			return this._872066822displayTransitionSettings;
		}
		
		private function set displayTransitionSettings(param1:Boolean) : void
		{
			var _loc2_:Object = this._872066822displayTransitionSettings;
			if(_loc2_ !== param1)
			{
				this._872066822displayTransitionSettings = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displayTransitionSettings",_loc2_,param1));
				}
			}
		}
		
		private function set collection(param1:AssetTransitionCollection) : void
		{
			var _loc2_:Object = this.collection;
			if(_loc2_ !== param1)
			{
				this._1741312354collection = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"collection",_loc2_,param1));
				}
			}
		}
		
		private function set selectedTransition(param1:AssetTransition) : void
		{
			var _loc2_:Object = this.selectedTransition;
			if(_loc2_ !== param1)
			{
				this._1816458832selectedTransition = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"selectedTransition",_loc2_,param1));
				}
			}
		}
	}
}
