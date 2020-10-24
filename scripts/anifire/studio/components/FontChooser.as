package anifire.studio.components
{
	import anifire.bubble.Bubble;
	import anifire.constant.ThemeConstants;
	import anifire.event.ColorPaletteEvent;
	import anifire.managers.FontVariantManager;
	import anifire.managers.NativeCursorManager;
	import anifire.models.FontModel;
	import anifire.studio.assets.controllers.TextCollectionController;
	import anifire.studio.commands.ChangeBubblePaddingCommand;
	import anifire.studio.commands.ICommand;
	import anifire.studio.core.BubbleAsset;
	import anifire.studio.core.BubbleThumb;
	import anifire.studio.events.AssetCollectionEvent;
	import anifire.studio.events.BubbleAssetEvent;
	import anifire.studio.events.MenuItemEvent;
	import anifire.studio.interfaces.IBubble;
	import anifire.studio.interfaces.IBubbleText;
	import anifire.studio.managers.ImporterManager;
	import anifire.studio.managers.StudioFontManager;
	import anifire.studio.models.MenuItemModel;
	import anifire.studio.skins.FontAlignToggleButtonBarSkin;
	import anifire.studio.skins.FontWeightToggleButtonSkin;
	import anifire.studio.skins.IconNumericStepperSkin;
	import anifire.studio.skins.InternationalLanguagePopUpSkin;
	import anifire.util.FontManager;
	import anifire.util.UtilDict;
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.getDefinitionByName;
	import flashx.textLayout.elements.LinkElement;
	import flashx.textLayout.elements.ParagraphElement;
	import flashx.textLayout.elements.SpanElement;
	import flashx.textLayout.elements.TextFlow;
	import mx.binding.Binding;
	import mx.binding.BindingManager;
	import mx.binding.IBindingClient;
	import mx.binding.IWatcherSetupUtil2;
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.core.DeferredInstanceFromFunction;
	import mx.core.FlexGlobals;
	import mx.core.IFlexModuleFactory;
	import mx.core.mx_internal;
	import mx.events.FlexEvent;
	import mx.events.PropertyChangeEvent;
	import spark.components.ButtonBar;
	import spark.components.Form;
	import spark.components.FormItem;
	import spark.components.HGroup;
	import spark.components.Label;
	import spark.components.RichEditableText;
	import spark.components.ToggleButton;
	import spark.components.VGroup;
	import spark.events.IndexChangeEvent;
	import spark.events.PopUpEvent;
	import spark.layouts.VerticalLayout;
	
	use namespace mx_internal;
	
	public class FontChooser extends spark.components.NavigatorContent implements IBindingClient
	{
		
		private static const imageHoriPad:Class = FontChooser_imageHoriPad;
		
		private static const imageVertPad:Class = FontChooser_imageVertPad;
		
		private static var _watcherSetupUtil:IWatcherSetupUtil2;
		 
		
		public var _FontChooser_FormItem1:FormItem;
		
		public var _FontChooser_FormItem2:FormItem;
		
		public var _FontChooser_FormItem3:FormItem;
		
		public var _FontChooser_FormItem4:FormItem;
		
		public var _FontChooser_FormItem5:FormItem;
		
		public var _FontChooser_FormItem6:FormItem;
		
		public var _FontChooser_Label1:Label;
		
		public var _FontChooser_Label2:Label;
		
		public var _FontChooser_Label3:Label;
		
		public var _FontChooser_RichEditableText1:RichEditableText;
		
		private var _152623906alignmentButtonBar:ButtonBar;
		
		private var _1987098563backgroundColorPicker:ColorPaletteDropDown;
		
		private var _195170613boldToggleButton:ToggleButton;
		
		private var _1923333726fontDropDownList:FontDropDownList;
		
		private var _1318622849fontSizeDropDownList:spark.components.DropDownList;
		
		private var _1100078594horizontalPadStepper:IconNumericStepper;
		
		private var _1240784284textColorPicker:ColorPaletteDropDown;
		
		private var _1061436116verticalPadStepper:IconNumericStepper;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private const FONT_ALIGN_SOURCE:ArrayCollection = new ArrayCollection(["left","center","right"]);
		
		private var _90883374_font:String = "Entrails BB";
		
		private var _91265248_size:Number = 12;
		
		private var _1482294778_align:String = "center";
		
		private var _90764132_bold:Boolean;
		
		private var _28150691_isUserFont:Boolean;
		
		private var _1313951673_enableBold:Boolean = true;
		
		private var _1529689935_italic:Boolean;
		
		private var _1478577702_embed:Boolean = true;
		
		private var _1330229675_bubble:Bubble;
		
		private var _2946224_url:String = "";
		
		private var _575958673_autoTextResize:Boolean = true;
		
		private var _click:Boolean;
		
		private var _fontManager:FontManager;
		
		private var _bubbleAsset:BubbleAsset;
		
		private var _controller:TextCollectionController;
		
		private var _1426526267_displayRotationWarning:Boolean;
		
		private var _1098575535_displayInternationalWarning:Boolean;
		
		private var _543449889_displayLanguageWarning:Boolean;
		
		private var _1188181375_displayUserFontWarning:Boolean;
		
		private var _autoFontSizeMenuItem:MenuItemModel;
		
		private var _2139877194_fontSizeSource:ArrayCollection;
		
		private var _autoFontSizePrefix:String;
		
		private var _220922062_horizontalPadding:int;
		
		private var _1377398404_verticalPadding:int;
		
		private var _command:ICommand;
		
		mx_internal var _bindings:Array;
		
		mx_internal var _watchers:Array;
		
		mx_internal var _bindingsByDestination:Object;
		
		mx_internal var _bindingsBeginWithWord:Object;
		
		public function FontChooser()
		{
			var target:Object = null;
			var watcherSetupUtilClass:Object = null;
			this._bindings = [];
			this._watchers = [];
			this._bindingsByDestination = {};
			this._bindingsBeginWithWord = {};
			super();
			mx_internal::_document = this;
			var bindings:Array = this._FontChooser_bindingsSetup();
			var watchers:Array = [];
			target = this;
			if(_watcherSetupUtil == null)
			{
				watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_FontChooserWatcherSetupUtil");
				watcherSetupUtilClass["init"](null);
			}
			_watcherSetupUtil.setup(this,function(param1:String):*
			{
				return target[param1];
			},function(param1:String):*
			{
				return FontChooser[param1];
			},bindings,watchers);
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.percentWidth = 100;
			this.percentHeight = 100;
			this.focusEnabled = false;
			this.mxmlContentFactory = new DeferredInstanceFromFunction(this._FontChooser_Array1_c);
			this.addEventListener("contentCreationComplete",this.___FontChooser_NavigatorContent1_contentCreationComplete);
			var i:uint = 0;
			while(i < bindings.length)
			{
				Binding(bindings[i]).execute();
				i++;
			}
		}
		
		public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
		{
			FontChooser._watcherSetupUtil = param1;
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
		
		public function set target(param1:Object) : void
		{
			if(this._controller != param1)
			{
				if(this._controller)
				{
					this.bubbleAsset = null;
					this._controller.removeEventListener(AssetCollectionEvent.COLLECTION_CHANGED,this.onTargetCollectionChanged);
				}
				this._controller = param1 as TextCollectionController;
				if(this._controller)
				{
					createDeferredContent();
					this.bubbleAsset = this._controller.singleBubbleAsset;
					this.updateTextProperties(this._controller);
					this.updateAutoSizeLabel();
					this.updateBubbleProperties(this._controller);
					this._controller.addEventListener(AssetCollectionEvent.COLLECTION_CHANGED,this.onTargetCollectionChanged);
				}
				else
				{
					this.bubbleAsset = null;
				}
			}
		}
		
		private function get bubbleAsset() : BubbleAsset
		{
			return this._bubbleAsset;
		}
		
		private function set bubbleAsset(param1:BubbleAsset) : void
		{
			var _loc2_:int = 0;
			if(this._bubbleAsset != param1)
			{
				if(this._bubbleAsset)
				{
					this._bubbleAsset.removeEventListener(BubbleAssetEvent.TEXT_SIZE_CHANGE,this.onBubbleTextSizeChange);
					this._bubbleAsset.removeEventListener(BubbleAssetEvent.TEXT_FONT_CHANGE,this.onBubbleFontChange);
					this._bubbleAsset.removeEventListener(BubbleAssetEvent.BG_COLOR_CHANGE,this.onBubbleBodyChange);
				}
				this._bubbleAsset = param1;
				if(this._bubbleAsset)
				{
					_loc2_ = BubbleThumb(this._bubbleAsset.thumb).colorStyle;
					this.textColorPicker.allowTransparent = this._bubbleAsset.isBlankBubble;
					this.backgroundColorPicker.allowTransparent = this._bubbleAsset.isBlankBubble;
					if(this._bubbleAsset.scaleX != 1)
					{
						this.fontSizeDropDownList.selectedIndex = -1;
					}
					this.horizontalPadStepper.enabled = this.verticalPadStepper.enabled = this.bubbleAsset.bubble.paddingEnabled;
					this._bubbleAsset.addEventListener(BubbleAssetEvent.TEXT_SIZE_CHANGE,this.onBubbleTextSizeChange);
					this._bubbleAsset.addEventListener(BubbleAssetEvent.TEXT_FONT_CHANGE,this.onBubbleFontChange);
					this._bubbleAsset.addEventListener(BubbleAssetEvent.BG_COLOR_CHANGE,this.onBubbleBodyChange);
				}
			}
		}
		
		public function get click() : Boolean
		{
			return this._click;
		}
		
		public function set url(param1:String) : void
		{
			this._url = param1;
			if(this._bubble != null)
			{
				this._bubble.textURL = param1;
			}
		}
		
		private function updateTextProperties(param1:IBubbleText) : void
		{
			this._fontManager = FontManager.instance;
			if(param1)
			{
				this._font = param1.textFont;
				this._size = param1.textSize;
				this._align = param1.textAlign;
				this._isUserFont = this._fontManager.isUserFont(param1.textFont);
				this._enableBold = !this._isUserFont && this._fontManager.supportBold(this._font);
				this._bold = param1.textBold && this._enableBold;
				this._italic = param1.textItalic;
				this._embed = param1.textEmbed;
				this._autoTextResize = param1.autoTextResize;
				this._horizontalPadding = param1.horizontalPadding;
				this._verticalPadding = param1.verticalPadding;
				this.textColorPicker.selectedColor = param1.textColor;
				this.textColorPicker.selectedAlpha = param1.textAlpha;
				this.setupFontList();
				this.setupFontSizeList();
				this.setupAlignList();
			}
		}
		
		private function updateBubbleProperties(param1:IBubble) : void
		{
			if(param1)
			{
				this.backgroundColorPicker.selectedColor = param1.bgColor;
				this.backgroundColorPicker.selectedAlpha = param1.bgAlpha * 100;
			}
		}
		
		private function setupFontList() : void
		{
			if(this._font)
			{
				this.fontDropDownList.selectFont(this._font);
			}
			else
			{
				this.fontDropDownList.selectedIndex = -1;
			}
			this.updateWarningMessage();
		}
		
		private function updateWarningMessage() : void
		{
			var _loc1_:Boolean = false;
			if(FontManager.getFontManager().isUserFont(this._font))
			{
				this._displayUserFontWarning = true;
				this._displayRotationWarning = false;
				this._displayInternationalWarning = false;
				this._displayLanguageWarning = false;
			}
			else
			{
				_loc1_ = FontVariantManager.instance.isVariantOfFont(this._font,FontManager.FONT_NAME_NOTO);
				this._displayUserFontWarning = false;
				this._displayRotationWarning = this._bubbleAsset && !this._embed && !_loc1_;
				this._displayInternationalWarning = this._bubbleAsset && this._embed && !_loc1_;
				this._displayLanguageWarning = _loc1_;
			}
		}
		
		private function setupFontSizeList() : void
		{
			var _loc1_:int = 0;
			var _loc2_:MenuItemModel = null;
			if(this._autoTextResize)
			{
				this.fontSizeDropDownList.selectedIndex = 0;
				this.updateAutoSizeLabel();
			}
			else
			{
				this._autoFontSizeMenuItem.label = this._autoFontSizePrefix;
				_loc1_ = 1;
				while(_loc1_ < this._fontSizeSource.length)
				{
					_loc2_ = this._fontSizeSource[_loc1_] as MenuItemModel;
					if(_loc2_.value == this._size)
					{
						this.fontSizeDropDownList.selectedItem = _loc2_;
						break;
					}
					_loc1_++;
				}
			}
			if(this._bubbleAsset && this._bubbleAsset.scaleX != 1)
			{
				this.fontSizeDropDownList.selectedIndex = -1;
			}
		}
		
		private function setupAlignList() : void
		{
			this.alignmentButtonBar.selectedItem = this._align;
		}
		
		private function fontDropDownList_changeHandler(param1:IndexChangeEvent) : void
		{
			var _loc2_:FontModel = this.fontDropDownList.selectedItem as FontModel;
			if(!_loc2_)
			{
				return;
			}
			this.changeFont(_loc2_);
		}
		
		private function changeFont(param1:FontModel) : void
		{
			var _loc3_:String = null;
			var _loc2_:String = param1.value;
			if(_loc2_ == FontManager.FONT_NAME_NOTO)
			{
				_loc3_ = this.bubbleAsset.text;
				_loc2_ = FontVariantManager.instance.lookupFontLanguageVariant(_loc2_,_loc3_);
			}
			this._fontManager = FontManager.instance;
			if(param1.source == FontManager.FONT_TYPE_SYSTEM)
			{
				this._controller.textFont = _loc2_;
				this._controller.textEmbed = false;
			}
			else if(this._fontManager.isFontLoaded(_loc2_))
			{
				if(this._controller.checkFontSupport(_loc2_))
				{
					this._controller.textFont = _loc2_;
					this._controller.textEmbed = true;
				}
				else
				{
					this.showFontSupportErrorPopUp();
				}
			}
			else
			{
				NativeCursorManager.instance.setBusyCursor();
				this._fontManager.loadFont(_loc2_,this.fontManager_loadFontCompleteHandler);
			}
			StudioFontManager.instance.addRecentFont(_loc2_,param1.source == FontManager.FONT_TYPE_USER?ThemeConstants.UGC_THEME_ID:null);
		}
		
		private function fontSupportErrorPopUpHandler(param1:PopUpEvent) : void
		{
			if(param1.commit)
			{
				if(this._controller)
				{
					this._controller.textFont = FontManager.FONT_NAME_NOTO;
					this._controller.textEmbed = true;
				}
			}
			this.setupFontList();
		}
		
		private function fontManager_loadFontCompleteHandler(param1:Event = null, param2:String = "") : void
		{
			if(this._controller && param2 != "")
			{
				if(this._controller.checkFontSupport(param2))
				{
					this._controller.textFont = param2;
					this._controller.textEmbed = true;
				}
				else
				{
					this.showFontSupportErrorPopUp();
				}
			}
			NativeCursorManager.instance.removeBusyCursor();
		}
		
		private function showFontSupportErrorPopUp() : void
		{
			var _loc1_:ConfirmPopUp = new ConfirmPopUp();
			_loc1_.setStyle("skinClass",InternationalLanguagePopUpSkin);
			_loc1_.showCloseButton = false;
			_loc1_.iconType = ConfirmPopUp.CONFIRM_POPUP_ERROR;
			_loc1_.title = UtilDict.translate("About Foreign Languages");
			_loc1_.confirmText = UtilDict.translate("Use \"Noto\" font");
			_loc1_.cancelText = UtilDict.translate("Cancel");
			_loc1_.addEventListener(PopUpEvent.CLOSE,this.fontSupportErrorPopUpHandler);
			_loc1_.open(FlexGlobals.topLevelApplication as DisplayObjectContainer,true);
		}
		
		private function alignmentButtonBar_changeHandler(param1:IndexChangeEvent) : void
		{
			this._align = this.alignmentButtonBar.selectedItem;
			this._controller.textAlign = this._align;
		}
		
		private function boldToggleButton_clickHandler() : void
		{
			this._bold = this.boldToggleButton.selected;
			this._controller.textBold = this._bold;
		}
		
		private function fontSizeDropDownList_changeHandler(param1:IndexChangeEvent) : void
		{
			var _loc2_:MenuItemModel = this.fontSizeDropDownList.selectedItem as MenuItemModel;
			if(_loc2_)
			{
				if(_loc2_ == this._autoFontSizeMenuItem)
				{
					this._controller.autoTextResize = true;
				}
				else
				{
					this._controller.autoTextResize = false;
					this._controller.textSize = _loc2_.value;
				}
			}
			this.updateAutoSizeLabel();
		}
		
		private function updateAutoSizeLabel() : void
		{
			if(this.fontSizeDropDownList.selectedIndex == 0 && this._controller.textSize > 0)
			{
				this._autoFontSizeMenuItem.label = this._autoFontSizePrefix + " (" + String(this._controller.textSize) + "px)";
			}
			else
			{
				this._autoFontSizeMenuItem.label = this._autoFontSizePrefix;
			}
		}
		
		protected function init() : void
		{
			this._autoFontSizePrefix = UtilDict.toDisplay(UtilDict.BUNDLE_NAME_GO,"Auto");
			this._fontSizeSource = new ArrayCollection();
			this._autoFontSizeMenuItem = new MenuItemModel(this._autoFontSizePrefix,-1);
			this._fontSizeSource.addItem(this._autoFontSizeMenuItem);
			this._fontSizeSource.addItem(new MenuItemModel("10 px",10));
			this._fontSizeSource.addItem(new MenuItemModel("12 px",12));
			this._fontSizeSource.addItem(new MenuItemModel("14 px",14));
			this._fontSizeSource.addItem(new MenuItemModel("18 px",18));
			this._fontSizeSource.addItem(new MenuItemModel("24 px",24));
			this._fontSizeSource.addItem(new MenuItemModel("32 px",32));
			this._fontSizeSource.addItem(new MenuItemModel("48 px",48));
			this._fontSizeSource.addItem(new MenuItemModel("72 px",72));
		}
		
		private function onTargetCollectionChanged(param1:AssetCollectionEvent) : void
		{
			this.bubbleAsset = this._controller.singleBubbleAsset;
			this.updateTextProperties(this._controller);
			this.updateBubbleProperties(this._controller);
		}
		
		private function onBubbleTextSizeChange(param1:BubbleAssetEvent) : void
		{
			this.updateTextProperties(this._controller);
			this.updateBubbleProperties(this._controller);
		}
		
		private function onBubbleFontChange(param1:BubbleAssetEvent) : void
		{
			this.fontDropDownList.addRecentFontById(param1.asset.textFont);
		}
		
		private function onBubbleBodyChange(param1:BubbleAssetEvent) : void
		{
			this.updateBubbleProperties(this._controller);
		}
		
		public function getDefaultFont() : String
		{
			return this.fontDropDownList.getDefaultFont();
		}
		
		protected function fontDropDownList_itemClickHandler(param1:MenuItemEvent) : void
		{
			var _loc2_:FontModel = null;
			var _loc3_:MenuItemModel = null;
			if(param1.item.value is FontModel)
			{
				_loc2_ = param1.item.value as FontModel;
				if(!_loc2_)
				{
					return;
				}
				this.changeFont(_loc2_);
			}
			else if(param1.item is MenuItemModel)
			{
				_loc3_ = param1.item as MenuItemModel;
				if(_loc3_.menuType == MenuItemModel.MENU_TYPE_UPLOAD)
				{
					ImporterManager.instance.showImporter();
				}
			}
		}
		
		protected function textColorPicker_colorChangeHandler(param1:ColorPaletteEvent) : void
		{
			this._controller.startChange(TextCollectionController.ATTRIBUTE_NAME_TEXT_COLOR);
			this._controller.textColor = this.textColorPicker.selectedColor;
			this._controller.commitChange();
		}
		
		protected function textColorPicker_colorPreviewHandler(param1:ColorPaletteEvent) : void
		{
			this._controller.startChange(TextCollectionController.ATTRIBUTE_NAME_TEXT_COLOR);
			this._controller.textColor = param1.colorCode as uint;
		}
		
		protected function textColorPicker_alphaChangeHandler(param1:ColorPaletteEvent) : void
		{
			this._controller.startChange(TextCollectionController.ATTRIBUTE_NAME_TEXT_ALPHA);
			this._controller.textAlpha = param1.alpha;
			this._controller.commitChange();
		}
		
		protected function textColorPicker_alphaPreviewHandler(param1:ColorPaletteEvent) : void
		{
			this._controller.startChange(TextCollectionController.ATTRIBUTE_NAME_TEXT_ALPHA);
			this._controller.textAlpha = param1.alpha;
		}
		
		protected function backgroundColorPicker_colorChangeHandler(param1:ColorPaletteEvent) : void
		{
			this._controller.startChange(TextCollectionController.ATTRIBUTE_NAME_BG_COLOR);
			this._controller.bgColor = this.backgroundColorPicker.selectedColor;
			this._controller.commitChange();
		}
		
		protected function backgroundColorPicker_colorPreviewHandler(param1:ColorPaletteEvent) : void
		{
			this._controller.startChange(TextCollectionController.ATTRIBUTE_NAME_BG_COLOR);
			this._controller.bgColor = param1.colorCode as uint;
		}
		
		protected function backgroundColorPicker_alphaChangeHandler(param1:ColorPaletteEvent) : void
		{
			this._controller.startChange(TextCollectionController.ATTRIBUTE_NAME_BG_ALPHA);
			this._controller.bgAlpha = param1.alpha / 100;
			this._controller.commitChange();
		}
		
		protected function backgroundColorPicker_alphaPreviewHandler(param1:ColorPaletteEvent) : void
		{
			this._controller.startChange(TextCollectionController.ATTRIBUTE_NAME_BG_ALPHA);
			this._controller.bgAlpha = param1.alpha / 100;
		}
		
		protected function paddingStepper_changeHandler(param1:Event) : void
		{
			if(!this._command)
			{
				this._command = new ChangeBubblePaddingCommand(this._bubbleAsset);
				ChangeBubblePaddingCommand(this._command).executeNow(this.horizontalPadStepper.value,this.verticalPadStepper.value);
				this._command = null;
			}
		}
		
		private function paddingStepper_buttonPressHandler(param1:Event) : void
		{
			this._command = new ChangeBubblePaddingCommand(this._bubbleAsset);
		}
		
		private function paddingStepper_buttonReleaseHandler(param1:Event) : void
		{
			if(this._command)
			{
				ChangeBubblePaddingCommand(this._command).executeNow(this.horizontalPadStepper.value,this.verticalPadStepper.value);
			}
			this._command = null;
		}
		
		private function _FontChooser_Array1_c() : Array
		{
			var _loc1_:Array = [this._FontChooser_VGroup1_c()];
			return _loc1_;
		}
		
		private function _FontChooser_VGroup1_c() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.percentWidth = 100;
			_loc1_.gap = 10;
			_loc1_.paddingLeft = 14;
			_loc1_.paddingRight = 14;
			_loc1_.paddingTop = 4;
			_loc1_.paddingBottom = 14;
			_loc1_.mxmlContent = [this._FontChooser_Form1_c()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _FontChooser_Form1_c() : Form
		{
			var _loc1_:Form = new Form();
			_loc1_.percentWidth = 100;
			_loc1_.styleName = "compact";
			_loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._FontChooser_Array3_c);
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _FontChooser_Array3_c() : Array
		{
			var _loc1_:Array = [this._FontChooser_FormItem1_i(),this._FontChooser_FormItem2_i(),this._FontChooser_FormItem3_i(),this._FontChooser_FormItem4_i(),this._FontChooser_FormItem5_i(),this._FontChooser_FormItem6_i()];
			return _loc1_;
		}
		
		private function _FontChooser_FormItem1_i() : FormItem
		{
			var _loc1_:FormItem = new FormItem();
			_loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._FontChooser_Array4_c);
			_loc1_.id = "_FontChooser_FormItem1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._FontChooser_FormItem1 = _loc1_;
			BindingManager.executeBindings(this,"_FontChooser_FormItem1",this._FontChooser_FormItem1);
			return _loc1_;
		}
		
		private function _FontChooser_Array4_c() : Array
		{
			var _loc1_:Array = [this._FontChooser_FontDropDownList1_i(),this._FontChooser_Label1_i(),this._FontChooser_Label2_i(),this._FontChooser_RichEditableText1_i(),this._FontChooser_Label3_i()];
			return _loc1_;
		}
		
		private function _FontChooser_FontDropDownList1_i() : FontDropDownList
		{
			var _loc1_:FontDropDownList = new FontDropDownList();
			_loc1_.percentWidth = 100;
			_loc1_.height = 30;
			_loc1_.focusEnabled = false;
			_loc1_.addEventListener("change",this.__fontDropDownList_change);
			_loc1_.addEventListener("itemClick",this.__fontDropDownList_itemClick);
			_loc1_.id = "fontDropDownList";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.fontDropDownList = _loc1_;
			BindingManager.executeBindings(this,"fontDropDownList",this.fontDropDownList);
			return _loc1_;
		}
		
		public function __fontDropDownList_change(param1:IndexChangeEvent) : void
		{
			this.fontDropDownList_changeHandler(param1);
		}
		
		public function __fontDropDownList_itemClick(param1:MenuItemEvent) : void
		{
			this.fontDropDownList_itemClickHandler(param1);
		}
		
		private function _FontChooser_Label1_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.percentWidth = 100;
			_loc1_.setStyle("fontSize",10);
			_loc1_.id = "_FontChooser_Label1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._FontChooser_Label1 = _loc1_;
			BindingManager.executeBindings(this,"_FontChooser_Label1",this._FontChooser_Label1);
			return _loc1_;
		}
		
		private function _FontChooser_Label2_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.percentWidth = 100;
			_loc1_.setStyle("fontSize",10);
			_loc1_.id = "_FontChooser_Label2";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._FontChooser_Label2 = _loc1_;
			BindingManager.executeBindings(this,"_FontChooser_Label2",this._FontChooser_Label2);
			return _loc1_;
		}
		
		private function _FontChooser_RichEditableText1_i() : RichEditableText
		{
			var _loc1_:RichEditableText = new RichEditableText();
			_loc1_.percentWidth = 100;
			_loc1_.editable = false;
			_loc1_.focusEnabled = false;
			_loc1_.textFlow = this._FontChooser_TextFlow1_c();
			_loc1_.setStyle("fontSize",10);
			_loc1_.id = "_FontChooser_RichEditableText1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._FontChooser_RichEditableText1 = _loc1_;
			BindingManager.executeBindings(this,"_FontChooser_RichEditableText1",this._FontChooser_RichEditableText1);
			return _loc1_;
		}
		
		private function _FontChooser_TextFlow1_c() : TextFlow
		{
			var _loc1_:TextFlow = new TextFlow();
			_loc1_.mxmlChildren = ["\n									 ",this._FontChooser_ParagraphElement1_c(),"\n								"];
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _FontChooser_ParagraphElement1_c() : ParagraphElement
		{
			var _loc1_:ParagraphElement = new ParagraphElement();
			_loc1_.mxmlChildren = ["* When inputting foreign characters, there may be some delay in displaying the characters. Learn more about support for ",this._FontChooser_LinkElement1_c(),"."];
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _FontChooser_LinkElement1_c() : LinkElement
		{
			var _loc1_:LinkElement = new LinkElement();
			_loc1_.href = "https://support.goanimate.com/hc/en-us/articles/205081320";
			_loc1_.target = "_blank";
			_loc1_.mxmlChildren = [this._FontChooser_SpanElement1_c()];
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _FontChooser_SpanElement1_c() : SpanElement
		{
			var _loc1_:SpanElement = new SpanElement();
			_loc1_.color = 4439205;
			_loc1_.textDecoration = "none";
			_loc1_.fontWeight = "bold";
			_loc1_.mxmlChildren = ["foreign languages"];
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _FontChooser_Label3_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.percentWidth = 100;
			_loc1_.setStyle("fontSize",10);
			_loc1_.id = "_FontChooser_Label3";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._FontChooser_Label3 = _loc1_;
			BindingManager.executeBindings(this,"_FontChooser_Label3",this._FontChooser_Label3);
			return _loc1_;
		}
		
		private function _FontChooser_FormItem2_i() : FormItem
		{
			var _loc1_:FormItem = new FormItem();
			_loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._FontChooser_Array9_c);
			_loc1_.id = "_FontChooser_FormItem2";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._FontChooser_FormItem2 = _loc1_;
			BindingManager.executeBindings(this,"_FontChooser_FormItem2",this._FontChooser_FormItem2);
			return _loc1_;
		}
		
		private function _FontChooser_Array9_c() : Array
		{
			var _loc1_:Array = [this._FontChooser_DropDownList1_i()];
			return _loc1_;
		}
		
		private function _FontChooser_DropDownList1_i() : spark.components.DropDownList
		{
			var _loc1_:spark.components.DropDownList = new spark.components.DropDownList();
			_loc1_.buttonMode = true;
			_loc1_.width = 120;
			_loc1_.layout = this._FontChooser_VerticalLayout1_c();
			_loc1_.addEventListener("change",this.__fontSizeDropDownList_change);
			_loc1_.id = "fontSizeDropDownList";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.fontSizeDropDownList = _loc1_;
			BindingManager.executeBindings(this,"fontSizeDropDownList",this.fontSizeDropDownList);
			return _loc1_;
		}
		
		private function _FontChooser_VerticalLayout1_c() : VerticalLayout
		{
			var _loc1_:VerticalLayout = new VerticalLayout();
			_loc1_.requestedMaxRowCount = -1;
			_loc1_.horizontalAlign = "contentJustify";
			_loc1_.gap = 0;
			return _loc1_;
		}
		
		public function __fontSizeDropDownList_change(param1:IndexChangeEvent) : void
		{
			this.fontSizeDropDownList_changeHandler(param1);
		}
		
		private function _FontChooser_FormItem3_i() : FormItem
		{
			var _loc1_:FormItem = new FormItem();
			_loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._FontChooser_Array10_c);
			_loc1_.id = "_FontChooser_FormItem3";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._FontChooser_FormItem3 = _loc1_;
			BindingManager.executeBindings(this,"_FontChooser_FormItem3",this._FontChooser_FormItem3);
			return _loc1_;
		}
		
		private function _FontChooser_Array10_c() : Array
		{
			var _loc1_:Array = [this._FontChooser_HGroup1_c()];
			return _loc1_;
		}
		
		private function _FontChooser_HGroup1_c() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.percentWidth = 100;
			_loc1_.verticalAlign = "middle";
			_loc1_.mxmlContent = [this._FontChooser_ToggleButton1_i(),this._FontChooser_ButtonBar1_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _FontChooser_ToggleButton1_i() : ToggleButton
		{
			var _loc1_:ToggleButton = new ToggleButton();
			_loc1_.focusEnabled = false;
			_loc1_.buttonMode = true;
			_loc1_.setStyle("skinClass",FontWeightToggleButtonSkin);
			_loc1_.addEventListener("click",this.__boldToggleButton_click);
			_loc1_.id = "boldToggleButton";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.boldToggleButton = _loc1_;
			BindingManager.executeBindings(this,"boldToggleButton",this.boldToggleButton);
			return _loc1_;
		}
		
		public function __boldToggleButton_click(param1:MouseEvent) : void
		{
			this.boldToggleButton_clickHandler();
		}
		
		private function _FontChooser_ButtonBar1_i() : ButtonBar
		{
			var _loc1_:ButtonBar = new ButtonBar();
			_loc1_.buttonMode = true;
			_loc1_.requireSelection = true;
			_loc1_.setStyle("skinClass",FontAlignToggleButtonBarSkin);
			_loc1_.addEventListener("change",this.__alignmentButtonBar_change);
			_loc1_.id = "alignmentButtonBar";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.alignmentButtonBar = _loc1_;
			BindingManager.executeBindings(this,"alignmentButtonBar",this.alignmentButtonBar);
			return _loc1_;
		}
		
		public function __alignmentButtonBar_change(param1:IndexChangeEvent) : void
		{
			this.alignmentButtonBar_changeHandler(param1);
		}
		
		private function _FontChooser_FormItem4_i() : FormItem
		{
			var _loc1_:FormItem = new FormItem();
			_loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._FontChooser_Array12_c);
			_loc1_.id = "_FontChooser_FormItem4";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._FontChooser_FormItem4 = _loc1_;
			BindingManager.executeBindings(this,"_FontChooser_FormItem4",this._FontChooser_FormItem4);
			return _loc1_;
		}
		
		private function _FontChooser_Array12_c() : Array
		{
			var _loc1_:Array = [this._FontChooser_ColorPaletteDropDown1_i()];
			return _loc1_;
		}
		
		private function _FontChooser_ColorPaletteDropDown1_i() : ColorPaletteDropDown
		{
			var _loc1_:ColorPaletteDropDown = new ColorPaletteDropDown();
			_loc1_.addEventListener("alphaChange",this.__textColorPicker_alphaChange);
			_loc1_.addEventListener("alphaPreview",this.__textColorPicker_alphaPreview);
			_loc1_.addEventListener("colorChange",this.__textColorPicker_colorChange);
			_loc1_.addEventListener("colorPreview",this.__textColorPicker_colorPreview);
			_loc1_.id = "textColorPicker";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.textColorPicker = _loc1_;
			BindingManager.executeBindings(this,"textColorPicker",this.textColorPicker);
			return _loc1_;
		}
		
		public function __textColorPicker_alphaChange(param1:ColorPaletteEvent) : void
		{
			this.textColorPicker_alphaChangeHandler(param1);
		}
		
		public function __textColorPicker_alphaPreview(param1:ColorPaletteEvent) : void
		{
			this.textColorPicker_alphaPreviewHandler(param1);
		}
		
		public function __textColorPicker_colorChange(param1:ColorPaletteEvent) : void
		{
			this.textColorPicker_colorChangeHandler(param1);
		}
		
		public function __textColorPicker_colorPreview(param1:ColorPaletteEvent) : void
		{
			this.textColorPicker_colorPreviewHandler(param1);
		}
		
		private function _FontChooser_FormItem5_i() : FormItem
		{
			var _loc1_:FormItem = new FormItem();
			_loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._FontChooser_Array13_c);
			_loc1_.id = "_FontChooser_FormItem5";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._FontChooser_FormItem5 = _loc1_;
			BindingManager.executeBindings(this,"_FontChooser_FormItem5",this._FontChooser_FormItem5);
			return _loc1_;
		}
		
		private function _FontChooser_Array13_c() : Array
		{
			var _loc1_:Array = [this._FontChooser_ColorPaletteDropDown2_i()];
			return _loc1_;
		}
		
		private function _FontChooser_ColorPaletteDropDown2_i() : ColorPaletteDropDown
		{
			var _loc1_:ColorPaletteDropDown = new ColorPaletteDropDown();
			_loc1_.addEventListener("colorPreview",this.__backgroundColorPicker_colorPreview);
			_loc1_.addEventListener("alphaChange",this.__backgroundColorPicker_alphaChange);
			_loc1_.addEventListener("colorChange",this.__backgroundColorPicker_colorChange);
			_loc1_.addEventListener("alphaPreview",this.__backgroundColorPicker_alphaPreview);
			_loc1_.id = "backgroundColorPicker";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.backgroundColorPicker = _loc1_;
			BindingManager.executeBindings(this,"backgroundColorPicker",this.backgroundColorPicker);
			return _loc1_;
		}
		
		public function __backgroundColorPicker_colorPreview(param1:ColorPaletteEvent) : void
		{
			this.backgroundColorPicker_colorPreviewHandler(param1);
		}
		
		public function __backgroundColorPicker_alphaChange(param1:ColorPaletteEvent) : void
		{
			this.backgroundColorPicker_alphaChangeHandler(param1);
		}
		
		public function __backgroundColorPicker_colorChange(param1:ColorPaletteEvent) : void
		{
			this.backgroundColorPicker_colorChangeHandler(param1);
		}
		
		public function __backgroundColorPicker_alphaPreview(param1:ColorPaletteEvent) : void
		{
			this.backgroundColorPicker_alphaPreviewHandler(param1);
		}
		
		private function _FontChooser_FormItem6_i() : FormItem
		{
			var _loc1_:FormItem = new FormItem();
			_loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._FontChooser_Array14_c);
			_loc1_.id = "_FontChooser_FormItem6";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._FontChooser_FormItem6 = _loc1_;
			BindingManager.executeBindings(this,"_FontChooser_FormItem6",this._FontChooser_FormItem6);
			return _loc1_;
		}
		
		private function _FontChooser_Array14_c() : Array
		{
			var _loc1_:Array = [this._FontChooser_HGroup2_c()];
			return _loc1_;
		}
		
		private function _FontChooser_HGroup2_c() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.percentWidth = 100;
			_loc1_.mxmlContent = [this._FontChooser_IconNumericStepper1_i(),this._FontChooser_IconNumericStepper2_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _FontChooser_IconNumericStepper1_i() : IconNumericStepper
		{
			var _loc1_:IconNumericStepper = new IconNumericStepper();
			_loc1_.maximum = 300;
			_loc1_.minimum = 0;
			_loc1_.stepSize = 1;
			_loc1_.usePixelFormat = true;
			_loc1_.setStyle("skinClass",IconNumericStepperSkin);
			_loc1_.addEventListener("incrementButtonPress",this.__horizontalPadStepper_incrementButtonPress);
			_loc1_.addEventListener("incrementButtonRelease",this.__horizontalPadStepper_incrementButtonRelease);
			_loc1_.addEventListener("decrementButtonPress",this.__horizontalPadStepper_decrementButtonPress);
			_loc1_.addEventListener("decrementButtonRelease",this.__horizontalPadStepper_decrementButtonRelease);
			_loc1_.addEventListener("change",this.__horizontalPadStepper_change);
			_loc1_.id = "horizontalPadStepper";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.horizontalPadStepper = _loc1_;
			BindingManager.executeBindings(this,"horizontalPadStepper",this.horizontalPadStepper);
			return _loc1_;
		}
		
		public function __horizontalPadStepper_incrementButtonPress(param1:Event) : void
		{
			this.paddingStepper_buttonPressHandler(param1);
		}
		
		public function __horizontalPadStepper_incrementButtonRelease(param1:Event) : void
		{
			this.paddingStepper_buttonReleaseHandler(param1);
		}
		
		public function __horizontalPadStepper_decrementButtonPress(param1:Event) : void
		{
			this.paddingStepper_buttonPressHandler(param1);
		}
		
		public function __horizontalPadStepper_decrementButtonRelease(param1:Event) : void
		{
			this.paddingStepper_buttonReleaseHandler(param1);
		}
		
		public function __horizontalPadStepper_change(param1:Event) : void
		{
			this.paddingStepper_changeHandler(param1);
		}
		
		private function _FontChooser_IconNumericStepper2_i() : IconNumericStepper
		{
			var _loc1_:IconNumericStepper = new IconNumericStepper();
			_loc1_.maximum = 300;
			_loc1_.minimum = 0;
			_loc1_.stepSize = 1;
			_loc1_.usePixelFormat = true;
			_loc1_.setStyle("skinClass",IconNumericStepperSkin);
			_loc1_.addEventListener("incrementButtonPress",this.__verticalPadStepper_incrementButtonPress);
			_loc1_.addEventListener("incrementButtonRelease",this.__verticalPadStepper_incrementButtonRelease);
			_loc1_.addEventListener("decrementButtonPress",this.__verticalPadStepper_decrementButtonPress);
			_loc1_.addEventListener("decrementButtonRelease",this.__verticalPadStepper_decrementButtonRelease);
			_loc1_.addEventListener("change",this.__verticalPadStepper_change);
			_loc1_.id = "verticalPadStepper";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.verticalPadStepper = _loc1_;
			BindingManager.executeBindings(this,"verticalPadStepper",this.verticalPadStepper);
			return _loc1_;
		}
		
		public function __verticalPadStepper_incrementButtonPress(param1:Event) : void
		{
			this.paddingStepper_buttonPressHandler(param1);
		}
		
		public function __verticalPadStepper_incrementButtonRelease(param1:Event) : void
		{
			this.paddingStepper_buttonReleaseHandler(param1);
		}
		
		public function __verticalPadStepper_decrementButtonPress(param1:Event) : void
		{
			this.paddingStepper_buttonPressHandler(param1);
		}
		
		public function __verticalPadStepper_decrementButtonRelease(param1:Event) : void
		{
			this.paddingStepper_buttonReleaseHandler(param1);
		}
		
		public function __verticalPadStepper_change(param1:Event) : void
		{
			this.paddingStepper_changeHandler(param1);
		}
		
		public function ___FontChooser_NavigatorContent1_contentCreationComplete(param1:FlexEvent) : void
		{
			this.init();
		}
		
		private function _FontChooser_bindingsSetup() : Array
		{
			var result:Array = [];
			result[0] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay(UtilDict.BUNDLE_NAME_GO,"Font Family");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_FontChooser_FormItem1.label");
			result[1] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("* This font does not support rotation, and advanced effects.");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_FontChooser_Label1.text");
			result[2] = new Binding(this,function():Boolean
			{
				return _displayRotationWarning;
			},null,"_FontChooser_Label1.visible");
			result[3] = new Binding(this,function():Boolean
			{
				return _displayRotationWarning;
			},null,"_FontChooser_Label1.includeInLayout");
			result[4] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("* This font does not support international language");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_FontChooser_Label2.text");
			result[5] = new Binding(this,function():Boolean
			{
				return _displayInternationalWarning;
			},null,"_FontChooser_Label2.visible");
			result[6] = new Binding(this,function():Boolean
			{
				return _displayInternationalWarning;
			},null,"_FontChooser_Label2.includeInLayout");
			result[7] = new Binding(this,function():Boolean
			{
				return _displayLanguageWarning;
			},null,"_FontChooser_RichEditableText1.visible");
			result[8] = new Binding(this,function():Boolean
			{
				return _displayLanguageWarning;
			},null,"_FontChooser_RichEditableText1.includeInLayout");
			result[9] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("* Bold cannot be toggled for uploaded fonts");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_FontChooser_Label3.text");
			result[10] = new Binding(this,function():Boolean
			{
				return _displayUserFontWarning;
			},null,"_FontChooser_Label3.visible");
			result[11] = new Binding(this,function():Boolean
			{
				return _displayUserFontWarning;
			},null,"_FontChooser_Label3.includeInLayout");
			result[12] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay(UtilDict.BUNDLE_NAME_GO,"Font Size");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_FontChooser_FormItem2.label");
			result[13] = new Binding(this,function():IList
			{
				return _fontSizeSource;
			},null,"fontSizeDropDownList.dataProvider");
			result[14] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay(UtilDict.BUNDLE_NAME_GO,"(Multiple values)");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"fontSizeDropDownList.prompt");
			result[15] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay(UtilDict.BUNDLE_NAME_GO,"Font Style");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_FontChooser_FormItem3.label");
			result[16] = new Binding(this,function():Boolean
			{
				return _bold;
			},null,"boldToggleButton.selected");
			result[17] = new Binding(this,function():Boolean
			{
				return _enableBold;
			},null,"boldToggleButton.enabled");
			result[18] = new Binding(this,function():IList
			{
				return FONT_ALIGN_SOURCE;
			},null,"alignmentButtonBar.dataProvider");
			result[19] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Text Color");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_FontChooser_FormItem4.label");
			result[20] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Background");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_FontChooser_FormItem5.label");
			result[21] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Padding");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_FontChooser_FormItem6.label");
			result[22] = new Binding(this,function():Number
			{
				return _horizontalPadding;
			},null,"horizontalPadStepper.value");
			result[23] = new Binding(this,function():Class
			{
				return imageHoriPad;
			},null,"horizontalPadStepper.icon");
			result[24] = new Binding(this,function():Number
			{
				return _verticalPadding;
			},null,"verticalPadStepper.value");
			result[25] = new Binding(this,function():Class
			{
				return imageVertPad;
			},null,"verticalPadStepper.icon");
			return result;
		}
		
		[Bindable(event="propertyChange")]
		public function get alignmentButtonBar() : ButtonBar
		{
			return this._152623906alignmentButtonBar;
		}
		
		public function set alignmentButtonBar(param1:ButtonBar) : void
		{
			var _loc2_:Object = this._152623906alignmentButtonBar;
			if(_loc2_ !== param1)
			{
				this._152623906alignmentButtonBar = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"alignmentButtonBar",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get backgroundColorPicker() : ColorPaletteDropDown
		{
			return this._1987098563backgroundColorPicker;
		}
		
		public function set backgroundColorPicker(param1:ColorPaletteDropDown) : void
		{
			var _loc2_:Object = this._1987098563backgroundColorPicker;
			if(_loc2_ !== param1)
			{
				this._1987098563backgroundColorPicker = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"backgroundColorPicker",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get boldToggleButton() : ToggleButton
		{
			return this._195170613boldToggleButton;
		}
		
		public function set boldToggleButton(param1:ToggleButton) : void
		{
			var _loc2_:Object = this._195170613boldToggleButton;
			if(_loc2_ !== param1)
			{
				this._195170613boldToggleButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"boldToggleButton",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get fontDropDownList() : FontDropDownList
		{
			return this._1923333726fontDropDownList;
		}
		
		public function set fontDropDownList(param1:FontDropDownList) : void
		{
			var _loc2_:Object = this._1923333726fontDropDownList;
			if(_loc2_ !== param1)
			{
				this._1923333726fontDropDownList = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fontDropDownList",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get fontSizeDropDownList() : spark.components.DropDownList
		{
			return this._1318622849fontSizeDropDownList;
		}
		
		public function set fontSizeDropDownList(param1:spark.components.DropDownList) : void
		{
			var _loc2_:Object = this._1318622849fontSizeDropDownList;
			if(_loc2_ !== param1)
			{
				this._1318622849fontSizeDropDownList = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fontSizeDropDownList",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get horizontalPadStepper() : IconNumericStepper
		{
			return this._1100078594horizontalPadStepper;
		}
		
		public function set horizontalPadStepper(param1:IconNumericStepper) : void
		{
			var _loc2_:Object = this._1100078594horizontalPadStepper;
			if(_loc2_ !== param1)
			{
				this._1100078594horizontalPadStepper = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"horizontalPadStepper",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get textColorPicker() : ColorPaletteDropDown
		{
			return this._1240784284textColorPicker;
		}
		
		public function set textColorPicker(param1:ColorPaletteDropDown) : void
		{
			var _loc2_:Object = this._1240784284textColorPicker;
			if(_loc2_ !== param1)
			{
				this._1240784284textColorPicker = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textColorPicker",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get verticalPadStepper() : IconNumericStepper
		{
			return this._1061436116verticalPadStepper;
		}
		
		public function set verticalPadStepper(param1:IconNumericStepper) : void
		{
			var _loc2_:Object = this._1061436116verticalPadStepper;
			if(_loc2_ !== param1)
			{
				this._1061436116verticalPadStepper = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"verticalPadStepper",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get _font() : String
		{
			return this._90883374_font;
		}
		
		private function set _font(param1:String) : void
		{
			var _loc2_:Object = this._90883374_font;
			if(_loc2_ !== param1)
			{
				this._90883374_font = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_font",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get _size() : Number
		{
			return this._91265248_size;
		}
		
		private function set _size(param1:Number) : void
		{
			var _loc2_:Object = this._91265248_size;
			if(_loc2_ !== param1)
			{
				this._91265248_size = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_size",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get _align() : String
		{
			return this._1482294778_align;
		}
		
		private function set _align(param1:String) : void
		{
			var _loc2_:Object = this._1482294778_align;
			if(_loc2_ !== param1)
			{
				this._1482294778_align = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_align",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get _bold() : Boolean
		{
			return this._90764132_bold;
		}
		
		private function set _bold(param1:Boolean) : void
		{
			var _loc2_:Object = this._90764132_bold;
			if(_loc2_ !== param1)
			{
				this._90764132_bold = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_bold",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get _isUserFont() : Boolean
		{
			return this._28150691_isUserFont;
		}
		
		private function set _isUserFont(param1:Boolean) : void
		{
			var _loc2_:Object = this._28150691_isUserFont;
			if(_loc2_ !== param1)
			{
				this._28150691_isUserFont = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_isUserFont",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get _enableBold() : Boolean
		{
			return this._1313951673_enableBold;
		}
		
		private function set _enableBold(param1:Boolean) : void
		{
			var _loc2_:Object = this._1313951673_enableBold;
			if(_loc2_ !== param1)
			{
				this._1313951673_enableBold = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_enableBold",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get _italic() : Boolean
		{
			return this._1529689935_italic;
		}
		
		private function set _italic(param1:Boolean) : void
		{
			var _loc2_:Object = this._1529689935_italic;
			if(_loc2_ !== param1)
			{
				this._1529689935_italic = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_italic",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get _embed() : Boolean
		{
			return this._1478577702_embed;
		}
		
		private function set _embed(param1:Boolean) : void
		{
			var _loc2_:Object = this._1478577702_embed;
			if(_loc2_ !== param1)
			{
				this._1478577702_embed = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_embed",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get _bubble() : Bubble
		{
			return this._1330229675_bubble;
		}
		
		private function set _bubble(param1:Bubble) : void
		{
			var _loc2_:Object = this._1330229675_bubble;
			if(_loc2_ !== param1)
			{
				this._1330229675_bubble = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_bubble",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get _url() : String
		{
			return this._2946224_url;
		}
		
		private function set _url(param1:String) : void
		{
			var _loc2_:Object = this._2946224_url;
			if(_loc2_ !== param1)
			{
				this._2946224_url = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_url",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get _autoTextResize() : Boolean
		{
			return this._575958673_autoTextResize;
		}
		
		private function set _autoTextResize(param1:Boolean) : void
		{
			var _loc2_:Object = this._575958673_autoTextResize;
			if(_loc2_ !== param1)
			{
				this._575958673_autoTextResize = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_autoTextResize",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get _displayRotationWarning() : Boolean
		{
			return this._1426526267_displayRotationWarning;
		}
		
		private function set _displayRotationWarning(param1:Boolean) : void
		{
			var _loc2_:Object = this._1426526267_displayRotationWarning;
			if(_loc2_ !== param1)
			{
				this._1426526267_displayRotationWarning = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_displayRotationWarning",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get _displayInternationalWarning() : Boolean
		{
			return this._1098575535_displayInternationalWarning;
		}
		
		private function set _displayInternationalWarning(param1:Boolean) : void
		{
			var _loc2_:Object = this._1098575535_displayInternationalWarning;
			if(_loc2_ !== param1)
			{
				this._1098575535_displayInternationalWarning = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_displayInternationalWarning",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get _displayLanguageWarning() : Boolean
		{
			return this._543449889_displayLanguageWarning;
		}
		
		private function set _displayLanguageWarning(param1:Boolean) : void
		{
			var _loc2_:Object = this._543449889_displayLanguageWarning;
			if(_loc2_ !== param1)
			{
				this._543449889_displayLanguageWarning = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_displayLanguageWarning",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get _displayUserFontWarning() : Boolean
		{
			return this._1188181375_displayUserFontWarning;
		}
		
		private function set _displayUserFontWarning(param1:Boolean) : void
		{
			var _loc2_:Object = this._1188181375_displayUserFontWarning;
			if(_loc2_ !== param1)
			{
				this._1188181375_displayUserFontWarning = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_displayUserFontWarning",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get _fontSizeSource() : ArrayCollection
		{
			return this._2139877194_fontSizeSource;
		}
		
		private function set _fontSizeSource(param1:ArrayCollection) : void
		{
			var _loc2_:Object = this._2139877194_fontSizeSource;
			if(_loc2_ !== param1)
			{
				this._2139877194_fontSizeSource = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_fontSizeSource",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get _horizontalPadding() : int
		{
			return this._220922062_horizontalPadding;
		}
		
		private function set _horizontalPadding(param1:int) : void
		{
			var _loc2_:Object = this._220922062_horizontalPadding;
			if(_loc2_ !== param1)
			{
				this._220922062_horizontalPadding = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_horizontalPadding",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get _verticalPadding() : int
		{
			return this._1377398404_verticalPadding;
		}
		
		private function set _verticalPadding(param1:int) : void
		{
			var _loc2_:Object = this._1377398404_verticalPadding;
			if(_loc2_ !== param1)
			{
				this._1377398404_verticalPadding = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_verticalPadding",_loc2_,param1));
				}
			}
		}
	}
}
