package anifire.studio.components
{
	import anifire.managers.AmplitudeAnalyticsManager;
	import anifire.studio.core.Console;
	import anifire.studio.events.MovieEvent;
	import anifire.studio.interfaces.IAssetView;
	import anifire.studio.managers.TutorialManager;
	import anifire.studio.models.tutorial.TutorialStepModel;
	import anifire.studio.skins.CloseTutorialButtonSkin;
	import anifire.studio.skins.PrimaryButtonSkin;
	import anifire.studio.skins.SkipTutorialButtonSkin;
	import anifire.util.UtilDict;
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.getDefinitionByName;
	import flashx.textLayout.elements.LinkElement;
	import flashx.textLayout.elements.ParagraphElement;
	import flashx.textLayout.elements.SpanElement;
	import flashx.textLayout.elements.TextFlow;
	import flashx.textLayout.events.FlowElementMouseEvent;
	import mx.binding.Binding;
	import mx.binding.BindingManager;
	import mx.binding.IBindingClient;
	import mx.binding.IWatcherSetupUtil2;
	import mx.controls.Spacer;
	import mx.core.DeferredInstanceFromFunction;
	import mx.core.FlexGlobals;
	import mx.core.IFlexModuleFactory;
	import mx.core.IStateClient2;
	import mx.core.UIComponent;
	import mx.core.mx_internal;
	import mx.events.DragEvent;
	import mx.events.EffectEvent;
	import mx.events.FlexEvent;
	import mx.events.PropertyChangeEvent;
	import mx.graphics.SolidColor;
	import mx.graphics.SolidColorStroke;
	import mx.managers.PopUpManager;
	import mx.states.AddItems;
	import mx.states.SetProperty;
	import mx.states.SetStyle;
	import mx.states.State;
	import mx.utils.StringUtil;
	import spark.components.Button;
	import spark.components.Group;
	import spark.components.HGroup;
	import spark.components.Label;
	import spark.components.RichEditableText;
	import spark.components.VGroup;
	import spark.core.SpriteVisualElement;
	import spark.effects.Fade;
	import spark.events.PopUpEvent;
	import spark.primitives.BitmapImage;
	import spark.primitives.Rect;
	import spark.primitives.RectangularDropShadow;
	
	use namespace mx_internal;
	
	public class TutorialLayer extends Group implements IBindingClient, IStateClient2
	{
		
		private static const MASK_LAYER_ALPHA:Number = 0.5;
		
		private static const TIMELINE_RULER_HEIGHT:Number = 39;
		
		private static const THUMBTRAY_WIDTH:Number = 310;
		
		private static const TIP_MAX_WIDTH:Number = 380;
		
		private static var _watcherSetupUtil:IWatcherSetupUtil2;
		 
		
		public var _TutorialLayer_Button2:Button;
		
		private var _1194668513_TutorialLayer_Group5:Group;
		
		public var _TutorialLayer_Label4:Label;
		
		public var _TutorialLayer_Label5:Label;
		
		public var _TutorialLayer_Label6:Label;
		
		public var _TutorialLayer_Label7:Label;
		
		public var _TutorialLayer_Label8:Label;
		
		public var _TutorialLayer_Label9:Label;
		
		private var _1546916134_TutorialLayer_LinkElement1:LinkElement;
		
		public var _TutorialLayer_Object4:Object;
		
		public var _TutorialLayer_RichEditableText1:RichEditableText;
		
		private var _893157967_TutorialLayer_SolidColor2:SolidColor;
		
		public var _TutorialLayer_SpanElement1:SpanElement;
		
		public var _TutorialLayer_SpanElement2:SpanElement;
		
		private var _1874183869_TutorialLayer_VGroup1:VGroup;
		
		private var _93090825arrow:BitmapImage;
		
		private var _434221093chromeGroup:Group;
		
		private var _312699062closeButton:Button;
		
		private var _833446526containerGroup:Group;
		
		private var _809612678contentGroup:VGroup;
		
		private var _906978543dropShadow:RectangularDropShadow;
		
		private var _1282133823fadeIn:Fade;
		
		private var _1091436750fadeOut:Fade;
		
		private var _1881837179finalImage:BitmapImage;
		
		private var _97692013frame:Rect;
		
		private var _2016684671heroImage:BitmapImage;
		
		private var _619135482heroMask:Group;
		
		private var _62936225layerFadeOut:Fade;
		
		private var _69905979maskLayer:SpriteVisualElement;
		
		private var _1766135109messageDisplay:Label;
		
		private var _1749722107nextButton:Button;
		
		private var _2126029094nextButtonFadeIn:Fade;
		
		private var _1779135872proceedButton:Button;
		
		private var _1436548897proceedButtonGroup:HGroup;
		
		private var _83422474quickStartGroup:Group;
		
		private var _575957803sceneEditorProxy:Group;
		
		private var _1281666134stepDisplay:Label;
		
		private var _539191270subContentGroup:HGroup;
		
		private var _3560182tip1:Group;
		
		private var _3560183tip2:Group;
		
		private var _3560184tip3:Group;
		
		private var _1893287094titleDisplay:Label;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		public var manager:TutorialManager;
		
		private var _targetRect:Rectangle;
		
		private var _layoutRect:Rectangle;
		
		private var _targetComponent:DisplayObject;
		
		private var _nextTargetComponent:DisplayObject;
		
		private var _shouldLayoutByComponent:Boolean;
		
		private var _step:TutorialStepModel;
		
		private var _stepText:String;
		
		private var _stageArea:UIComponent;
		
		private var _sceneEditor:SceneEditor;
		
		private var mathMax:Function;
		
		private var mathMin:Function;
		
		private var _defaultOffset:Number = 25;
		
		private var _firstStep:Boolean;
		
		private var _tempComponent:DisplayObject;
		
		private var _sceneProxyMode:Boolean;
		
		private var _699256467_helpText:String;
		
		private var _549739530_showHelpText:Boolean;
		
		private var _1747463403_showSubContent:Boolean;
		
		private var _openQuickStart:Boolean;
		
		private var _1919900262_isHideSkipTutorialButton:Boolean;
		
		private var _embed_mxml__styles_images_tutorial_final_png_698666121:Class;
		
		private var _embed_mxml__styles_images_tutorial_tutorial_arrow_png_2013173889:Class;
		
		private var _embed_mxml__styles_images_tutorial_hero_png_1252293081:Class;
		
		mx_internal var _bindings:Array;
		
		mx_internal var _watchers:Array;
		
		mx_internal var _bindingsByDestination:Object;
		
		mx_internal var _bindingsBeginWithWord:Object;
		
		public function TutorialLayer()
		{
			var bindings:Array = null;
			var target:Object = null;
			var watcherSetupUtilClass:Object = null;
			this.manager = TutorialManager.instance;
			this._embed_mxml__styles_images_tutorial_final_png_698666121 = TutorialLayer__embed_mxml__styles_images_tutorial_final_png_698666121;
			this._embed_mxml__styles_images_tutorial_tutorial_arrow_png_2013173889 = TutorialLayer__embed_mxml__styles_images_tutorial_tutorial_arrow_png_2013173889;
			this._embed_mxml__styles_images_tutorial_hero_png_1252293081 = TutorialLayer__embed_mxml__styles_images_tutorial_hero_png_1252293081;
			this._bindings = [];
			this._watchers = [];
			this._bindingsByDestination = {};
			this._bindingsBeginWithWord = {};
			super();
			mx_internal::_document = this;
			bindings = this._TutorialLayer_bindingsSetup();
			var watchers:Array = [];
			target = this;
			if(_watcherSetupUtil == null)
			{
				watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_TutorialLayerWatcherSetupUtil");
				watcherSetupUtilClass["init"](null);
			}
			_watcherSetupUtil.setup(this,function(param1:String):*
			{
				return target[param1];
			},function(param1:String):*
			{
				return TutorialLayer[param1];
			},bindings,watchers);
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.visible = false;
			this.autoLayout = false;
			this.mouseEnabled = false;
			this.mxmlContent = [this._TutorialLayer_SpriteVisualElement1_i(),this._TutorialLayer_Rect1_i(),this._TutorialLayer_BitmapImage1_i(),this._TutorialLayer_Group2_i()];
			this.currentState = "normal";
			this._TutorialLayer_Fade2_i();
			this._TutorialLayer_Fade3_i();
			this._TutorialLayer_Fade1_i();
			this._TutorialLayer_Fade4_i();
			this.addEventListener("creationComplete",this.___TutorialLayer_Group1_creationComplete);
			var _TutorialLayer_BitmapImage2_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._TutorialLayer_BitmapImage2_i);
			var _TutorialLayer_BitmapImage3_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._TutorialLayer_BitmapImage3_i);
			var _TutorialLayer_Button4_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._TutorialLayer_Button4_i);
			var _TutorialLayer_Group3_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._TutorialLayer_Group3_i);
			var _TutorialLayer_Group5_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._TutorialLayer_Group5_i);
			var _TutorialLayer_Group6_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._TutorialLayer_Group6_i);
			var _TutorialLayer_Group7_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._TutorialLayer_Group7_i);
			var _TutorialLayer_SpanElement2_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._TutorialLayer_SpanElement2_i);
			states = [new State({
				"name":"normal",
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_TutorialLayer_Group3_factory,
					"destination":null,
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["sceneEditorProxy"]
				}),new SetProperty().initializeFromObject({
					"target":"_TutorialLayer_SolidColor2",
					"name":"color",
					"value":0
				}),new SetProperty().initializeFromObject({
					"target":"_TutorialLayer_SolidColor2",
					"name":"alpha",
					"value":0.7
				}),new SetStyle().initializeFromObject({
					"target":"messageDisplay",
					"name":"fontSize",
					"value":16
				}),new SetStyle().initializeFromObject({
					"target":"messageDisplay",
					"name":"color",
					"value":16777215
				})]
			}),new State({
				"name":"first",
				"stateGroups":["firstAndFinalStates"],
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_TutorialLayer_SpanElement2_factory,
					"destination":"_TutorialLayer_LinkElement1",
					"propertyName":"mxmlChildren",
					"position":"after",
					"relativeTo":["_TutorialLayer_Object4"]
				}),new AddItems().initializeFromObject({
					"itemsFactory":_TutorialLayer_Group6_factory,
					"destination":"_TutorialLayer_Group5",
					"propertyName":"mxmlContent",
					"position":"first"
				}),new AddItems().initializeFromObject({
					"itemsFactory":_TutorialLayer_BitmapImage2_factory,
					"destination":"_TutorialLayer_Group5",
					"propertyName":"mxmlContent",
					"position":"first"
				}),new AddItems().initializeFromObject({
					"itemsFactory":_TutorialLayer_Group5_factory,
					"destination":"_TutorialLayer_VGroup1",
					"propertyName":"mxmlContent",
					"position":"first"
				}),new AddItems().initializeFromObject({
					"itemsFactory":_TutorialLayer_Group3_factory,
					"destination":null,
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["sceneEditorProxy"]
				}),new SetProperty().initializeFromObject({
					"target":"_TutorialLayer_VGroup1",
					"name":"horizontalAlign",
					"value":"center"
				}),new SetProperty().initializeFromObject({
					"target":"contentGroup",
					"name":"width",
					"value":510
				}),new SetProperty().initializeFromObject({
					"target":"contentGroup",
					"name":"gap",
					"value":7
				}),new SetProperty().initializeFromObject({
					"target":"contentGroup",
					"name":"paddingLeft",
					"value":31
				}),new SetProperty().initializeFromObject({
					"target":"contentGroup",
					"name":"paddingRight",
					"value":31
				}),new SetStyle().initializeFromObject({
					"target":"titleDisplay",
					"name":"fontWeight",
					"value":"bold"
				}),new SetStyle().initializeFromObject({
					"target":"titleDisplay",
					"name":"color",
					"value":15890741
				}),new SetStyle().initializeFromObject({
					"target":"titleDisplay",
					"name":"textAlign",
					"value":"center"
				}),new SetStyle().initializeFromObject({
					"target":"titleDisplay",
					"name":"typographicCase",
					"value":"uppercase"
				}),new SetStyle().initializeFromObject({
					"target":"messageDisplay",
					"name":"textAlign",
					"value":"center"
				}),new SetProperty().initializeFromObject({
					"target":"proceedButtonGroup",
					"name":"paddingTop",
					"value":14
				}),new SetProperty().initializeFromObject({
					"target":"proceedButtonGroup",
					"name":"paddingBottom",
					"value":12
				})]
			}),new State({
				"name":"final",
				"stateGroups":["firstAndFinalStates"],
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_TutorialLayer_Button4_factory,
					"destination":"chromeGroup",
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["_TutorialLayer_VGroup1"]
				}),new AddItems().initializeFromObject({
					"itemsFactory":_TutorialLayer_BitmapImage3_factory,
					"destination":"_TutorialLayer_Group5",
					"propertyName":"mxmlContent",
					"position":"first"
				}),new AddItems().initializeFromObject({
					"itemsFactory":_TutorialLayer_Group5_factory,
					"destination":"_TutorialLayer_VGroup1",
					"propertyName":"mxmlContent",
					"position":"first"
				}),new AddItems().initializeFromObject({
					"itemsFactory":_TutorialLayer_Group3_factory,
					"destination":null,
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["sceneEditorProxy"]
				}),new SetProperty().initializeFromObject({
					"target":"_TutorialLayer_VGroup1",
					"name":"horizontalAlign",
					"value":"center"
				}),new SetProperty().initializeFromObject({
					"target":"contentGroup",
					"name":"width",
					"value":510
				}),new SetProperty().initializeFromObject({
					"target":"contentGroup",
					"name":"gap",
					"value":7
				}),new SetProperty().initializeFromObject({
					"target":"contentGroup",
					"name":"paddingLeft",
					"value":31
				}),new SetProperty().initializeFromObject({
					"target":"contentGroup",
					"name":"paddingRight",
					"value":31
				}),new SetStyle().initializeFromObject({
					"target":"titleDisplay",
					"name":"fontWeight",
					"value":"bold"
				}),new SetStyle().initializeFromObject({
					"target":"titleDisplay",
					"name":"color",
					"value":15890741
				}),new SetStyle().initializeFromObject({
					"target":"titleDisplay",
					"name":"textAlign",
					"value":"center"
				}),new SetStyle().initializeFromObject({
					"target":"messageDisplay",
					"name":"textAlign",
					"value":"center"
				}),new SetProperty().initializeFromObject({
					"target":"proceedButtonGroup",
					"name":"paddingTop",
					"value":14
				}),new SetProperty().initializeFromObject({
					"target":"proceedButtonGroup",
					"name":"paddingBottom",
					"value":12
				})]
			}),new State({
				"name":"skipped",
				"stateGroups":["skippedStates"],
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_TutorialLayer_Group3_factory,
					"destination":null,
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["sceneEditorProxy"]
				}),new SetProperty().initializeFromObject({
					"target":"maskLayer",
					"name":"visible",
					"value":false
				}),new SetProperty().initializeFromObject({
					"target":"frame",
					"name":"visible",
					"value":false
				}),new SetProperty().initializeFromObject({
					"target":"arrow",
					"name":"visible",
					"value":false
				}),new SetProperty().initializeFromObject({
					"target":"sceneEditorProxy",
					"name":"visible",
					"value":false
				}),new SetStyle().initializeFromObject({
					"target":"titleDisplay",
					"name":"fontSize",
					"value":14
				})]
			}),new State({
				"name":"skippedWithQuickStart",
				"stateGroups":["skippedStates"],
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_TutorialLayer_Group7_factory,
					"destination":null,
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["sceneEditorProxy"]
				}),new SetProperty().initializeFromObject({
					"target":"maskLayer",
					"name":"visible",
					"value":false
				}),new SetProperty().initializeFromObject({
					"target":"frame",
					"name":"visible",
					"value":false
				}),new SetProperty().initializeFromObject({
					"target":"arrow",
					"name":"visible",
					"value":false
				}),new SetProperty().initializeFromObject({
					"target":"sceneEditorProxy",
					"name":"visible",
					"value":false
				}),new SetStyle().initializeFromObject({
					"target":"titleDisplay",
					"name":"fontSize",
					"value":14
				})]
			})];
			var i:uint = 0;
			while(i < bindings.length)
			{
				Binding(bindings[i]).execute();
				i++;
			}
		}
		
		public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
		{
			TutorialLayer._watcherSetupUtil = param1;
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
		
		protected function init() : void
		{
			this.mathMax = Math.max;
			this.mathMin = Math.min;
			this._stepText = UtilDict.translate("Step {0}");
			this.nextButton.label = UtilDict.translate("Next");
			this._sceneEditor = Console.getConsole().sceneEditor;
			this._stageArea = Console.getConsole().mainStage._stageArea;
			this.updateMaskLayer();
			this.updateSceneEditorProxy();
		}
		
		public function hideSkipTutorialButton() : void
		{
			this._isHideSkipTutorialButton = true;
		}
		
		public function get targetComponent() : DisplayObject
		{
			return this._targetComponent;
		}
		
		public function set targetComponent(param1:DisplayObject) : void
		{
			if(this._targetComponent != param1)
			{
				if(this._targetComponent)
				{
					this._targetComponent.removeEventListener(FlexEvent.UPDATE_COMPLETE,this.onComponentUpdate);
					this._targetComponent.removeEventListener(Event.RESIZE,this.onComponentUpdate);
					this._targetComponent.removeEventListener(Event.RENDER,this.onComponentUpdate);
				}
				this._targetComponent = param1;
				if(this._targetComponent)
				{
					this.frame.visible = true;
					this.arrow.visible = this._step && this._step.arrowVisible;
					this._targetComponent.addEventListener(Event.RESIZE,this.onComponentUpdate);
					this._targetComponent.addEventListener(FlexEvent.UPDATE_COMPLETE,this.onComponentUpdate);
					this._targetComponent.addEventListener(Event.RENDER,this.onComponentUpdate);
					this.updateTargetComponentFrame();
				}
				else
				{
					this.frame.visible = false;
					this.arrow.visible = false;
					this.updateMaskLayer();
				}
			}
		}
		
		private function updateMaskLayer(param1:Rectangle = null) : void
		{
			this.maskLayer.graphics.clear();
			this.maskLayer.graphics.lineStyle(0,0,0);
			this.maskLayer.graphics.beginFill(0,MASK_LAYER_ALPHA);
			this.maskLayer.graphics.drawRect(0,0,this.maskLayer.width,this.maskLayer.height);
			if(param1)
			{
				this.maskLayer.graphics.drawRect(param1.x,param1.y,param1.width,param1.height);
			}
			this.maskLayer.graphics.endFill();
		}
		
		private function getTargetRect(param1:DisplayObject) : Rectangle
		{
			var _loc2_:Rectangle = null;
			var _loc4_:Point = null;
			var _loc3_:UIComponent = param1 as UIComponent;
			if(_loc3_ && !(param1 is IAssetView))
			{
				_loc4_ = globalToLocal(_loc3_.localToGlobal(new Point(0,0)));
				_loc2_ = new Rectangle(_loc4_.x,_loc4_.y,_loc3_.getLayoutBoundsWidth(),_loc3_.getLayoutBoundsHeight());
			}
			else
			{
				_loc2_ = param1.getRect(this);
				if(param1 is IAssetView)
				{
					_loc2_.inflate(10,10);
					_loc2_ = _loc2_.intersection(this.sceneEditorProxy.getRect(this));
				}
			}
			return _loc2_;
		}
		
		private function updateTargetComponentFrame() : void
		{
			var _loc1_:Array = null;
			var _loc2_:int = 0;
			var _loc3_:int = 0;
			var _loc4_:DisplayObject = null;
			var _loc5_:Rectangle = null;
			this._targetRect = this.getTargetRect(this._targetComponent);
			this._layoutRect = this._targetRect;
			if(this._step.highlightComponents)
			{
				_loc1_ = this._step.highlightComponents;
				_loc2_ = _loc1_.length;
				_loc3_ = 0;
				while(_loc3_ < _loc2_)
				{
					_loc4_ = this.manager.getComponent(_loc1_[_loc3_]);
					_loc5_ = this.getTargetRect(_loc4_);
					this._layoutRect = this._layoutRect.union(_loc5_);
					_loc3_++;
				}
			}
			this.frame.width = this._targetRect.width;
			this.frame.height = this._targetRect.height;
			this.frame.x = this._targetRect.x;
			this.frame.y = this._targetRect.y;
			this.arrow.x = this._targetRect.x + this._targetRect.width - 20;
			this.arrow.y = this._targetRect.y - 20;
			this.updateMaskLayer(this._targetRect);
			if(this._shouldLayoutByComponent)
			{
				this.updateLayoutByTargetComponent();
			}
		}
		
		private function onComponentUpdate(param1:Event) : void
		{
			this.updateTargetComponentFrame();
		}
		
		public function displayStep(param1:TutorialStepModel, param2:DisplayObject) : void
		{
			var _loc3_:Boolean = this._step && !this._step.isPreparation && !this._sceneProxyMode;
			if(stage)
			{
				stage.focus = null;
			}
			this._step = param1;
			this._nextTargetComponent = param2;
			this.sceneEditorProxy.mouseEnabled = false;
			if(_loc3_)
			{
				this.chromeGroup.mouseEnabled = false;
				this.chromeGroup.mouseChildren = false;
				this.fadeOut.play();
			}
			else if(!this.fadeOut.isPlaying)
			{
				this.displayStepImpl();
			}
		}
		
		private function displayStepImpl() : void
		{
			var _loc1_:Function = null;
			var _loc2_:String = null;
			if(!this._step.isPreparation)
			{
				_loc1_ = UtilDict.toDisplay;
				if(this._step.title)
				{
					this.titleDisplay.text = _loc1_(UtilDict.BUNDLE_NAME_TUTORIAL,this._step.title);
					this.titleDisplay.visible = true;
					this.titleDisplay.includeInLayout = true;
				}
				else
				{
					this.titleDisplay.visible = false;
					this.titleDisplay.includeInLayout = false;
				}
				this.messageDisplay.text = _loc1_(UtilDict.BUNDLE_NAME_TUTORIAL,this._step.message);
				this.targetComponent = this._nextTargetComponent;
				this.sceneEditorProxy.mouseEnabled = this._step.allowDragForwarding;
				if(this._step.proceedButtonText != null)
				{
					this.proceedButtonGroup.visible = true;
					this.proceedButtonGroup.includeInLayout = true;
					this.proceedButton.label = _loc1_(UtilDict.BUNDLE_NAME_GO,this._step.proceedButtonText);
				}
				else
				{
					this.proceedButtonGroup.visible = false;
					this.proceedButtonGroup.includeInLayout = false;
				}
				if(this._step.helpText)
				{
					this._showHelpText = true;
					this._helpText = _loc1_(UtilDict.BUNDLE_NAME_TUTORIAL,this._step.helpText);
				}
				else
				{
					this._showHelpText = false;
				}
				if(this._step.nextButtonVisible || this._step.waitForNext)
				{
					this.nextButton.visible = !this._step.waitForNext;
					this.nextButton.enabled = true;
				}
				else
				{
					this.nextButton.visible = false;
				}
				this._showSubContent = this._step.userStepIndex > 0;
				_loc2_ = "normal";
				if(this._step.userStepIndex == TutorialStepModel.STEP_INDEX_FIRST)
				{
					_loc2_ = "first";
				}
				else if(this._step.userStepIndex == TutorialStepModel.STEP_INDEX_LAST)
				{
					_loc2_ = "final";
				}
				else if(this._step.userStepIndex == TutorialStepModel.STEP_INDEX_SKIPPED)
				{
					if(!this._openQuickStart)
					{
						_loc2_ = "skipped";
					}
				}
				else if(this._step.userStepIndex > 0)
				{
					this.stepDisplay.text = StringUtil.substitute(this._stepText,this.padZeros(this._step.userStepIndex));
				}
				currentState = _loc2_;
				if(this._firstStep)
				{
					this._firstStep = false;
					this.chromeGroup.visible = true;
				}
				else
				{
					this.fadeIn.play();
				}
			}
			invalidateDisplayList();
		}
		
		private function padZeros(param1:int, param2:int = 2) : String
		{
			var _loc3_:String = param1.toString();
			var _loc4_:int = param2 - _loc3_.length;
			if(_loc4_ > 0)
			{
				_loc3_ = StringUtil.repeat("0",_loc4_) + _loc3_;
			}
			return _loc3_;
		}
		
		public function allowNext() : void
		{
			this.nextButton.enabled = true;
			this.nextButton.visible = true;
			if(this._step.readyMessage)
			{
				this.messageDisplay.text = UtilDict.toDisplay(UtilDict.BUNDLE_NAME_TUTORIAL,this._step.readyMessage);
			}
		}
		
		public function disableNext() : void
		{
			this.nextButton.enabled = false;
			if(this._step.readyMessage)
			{
				this.messageDisplay.text = UtilDict.toDisplay(UtilDict.BUNDLE_NAME_TUTORIAL,this._step.message);
			}
		}
		
		public function startTutorial() : void
		{
			visible = true;
			alpha = 1;
			mouseChildren = true;
			this._firstStep = true;
			this._step = null;
		}
		
		public function finishTutorial() : void
		{
			this.maskLayer.graphics.clear();
			this._step = null;
			this.targetComponent = null;
			mouseChildren = false;
			this.layerFadeOut.play();
		}
		
		public function get sceneProxyMode() : Boolean
		{
			return this._sceneProxyMode;
		}
		
		public function set sceneProxyMode(param1:Boolean) : void
		{
			if(this._sceneProxyMode != param1)
			{
				this._sceneProxyMode = param1;
				if(this._sceneProxyMode)
				{
					this.chromeGroup.visible = false;
					this._tempComponent = this._targetComponent;
					this.targetComponent = this.sceneEditorProxy;
				}
				else
				{
					this.chromeGroup.visible = true;
					this.targetComponent = this._tempComponent;
					this._tempComponent = null;
					invalidateDisplayList();
				}
			}
		}
		
		private function updateSceneEditorProxy() : void
		{
			var _loc1_:Rectangle = null;
			if(this._stageArea)
			{
				_loc1_ = this._stageArea.getRect(this);
				this.sceneEditorProxy.x = _loc1_.x;
				this.sceneEditorProxy.y = _loc1_.y;
				this.sceneEditorProxy.width = _loc1_.width;
				this.sceneEditorProxy.height = _loc1_.height;
			}
		}
		
		private function layoutInfoGroup() : void
		{
			if(this._step)
			{
				switch(this._step.infoPosition)
				{
					case TutorialStepModel.INFO_PLACEMENT_STAGE_CENTER:
						this.updateLayoutByContainer(Console.getConsole().mainStage);
						break;
					case TutorialStepModel.INFO_PLACEMENT_STUDIO_CENTER:
						this.updateLayoutByContainer(FlexGlobals.topLevelApplication as DisplayObject);
						break;
					default:
						this._shouldLayoutByComponent = true;
						this.updateLayoutByTargetComponent();
				}
			}
		}
		
		private function updateLayoutByContainer(param1:DisplayObject) : void
		{
			this._shouldLayoutByComponent = false;
			this.containerGroup.x = param1.x + (param1.width - this.chromeGroup.getLayoutBoundsWidth()) * 0.5;
			this.containerGroup.y = param1.y + (param1.height - this.chromeGroup.getLayoutBoundsHeight()) * 0.5;
		}
		
		private function updateLayoutByTargetComponent() : void
		{
			var _loc1_:Rectangle = null;
			var _loc2_:int = 0;
			var _loc3_:Boolean = false;
			var _loc4_:String = null;
			var _loc5_:Number = NaN;
			var _loc6_:Number = NaN;
			var _loc7_:Number = NaN;
			var _loc8_:Number = NaN;
			if(this._targetComponent && this._layoutRect && !this._sceneProxyMode && !this.fadeOut.isPlaying)
			{
				_loc1_ = this._layoutRect;
				_loc2_ = 0;
				_loc4_ = this._step.infoPosition;
				_loc5_ = this.maskLayer.getLayoutBoundsWidth();
				_loc6_ = this.maskLayer.getLayoutBoundsHeight();
				_loc7_ = this.chromeGroup.getLayoutBoundsWidth();
				_loc8_ = this.chromeGroup.getLayoutBoundsHeight();
				do
				{
					_loc3_ = true;
					switch(_loc4_)
					{
						case TutorialStepModel.INFO_PLACEMENT_COMP_LEFT:
							this.containerGroup.x = _loc1_.left - this._step.offsetX - this._defaultOffset - _loc7_;
							this.containerGroup.y = _loc1_.top + this._step.offsetY;
							if(this.containerGroup.x < 0)
							{
								_loc4_ = TutorialStepModel.INFO_PLACEMENT_COMP_RIGHT;
								_loc3_ = false;
								_loc2_++;
							}
							this.containerGroup.y = this.mathMin(this.containerGroup.y,_loc6_ - _loc8_);
							break;
						case TutorialStepModel.INFO_PLACEMENT_COMP_RIGHT:
							this.containerGroup.x = _loc1_.right + this._step.offsetX + this._defaultOffset;
							this.containerGroup.y = _loc1_.top + this._step.offsetY;
							if(this.containerGroup.x + _loc7_ > _loc5_)
							{
								_loc4_ = TutorialStepModel.INFO_PLACEMENT_COMP_LEFT;
								_loc3_ = false;
								_loc2_++;
							}
							this.containerGroup.y = this.mathMin(this.containerGroup.y,_loc6_ - _loc8_);
							break;
						case TutorialStepModel.INFO_PLACEMENT_COMP_RIGHT_STUDIO_TOP:
							this.containerGroup.x = _loc1_.right + this._step.offsetX + this._defaultOffset;
							this.containerGroup.y = 0;
							if(this.containerGroup.x + _loc7_ > _loc5_)
							{
								_loc4_ = TutorialStepModel.INFO_PLACEMENT_COMP_LEFT;
								_loc3_ = false;
								_loc2_++;
							}
							break;
						case TutorialStepModel.INFO_PLACEMENT_COMP_BOTTOM:
							this.containerGroup.x = _loc1_.x + (_loc1_.width - _loc7_) * 0.5 + this._step.offsetX;
							this.containerGroup.y = _loc1_.bottom + this._step.offsetY + this._defaultOffset;
							if(this.containerGroup.y + _loc8_ > _loc6_)
							{
								_loc4_ = TutorialStepModel.INFO_PLACEMENT_COMP_TOP;
								_loc3_ = false;
								_loc2_++;
							}
							this.containerGroup.x = this.mathMax(0,this.mathMin(this.containerGroup.x,_loc5_ - _loc7_));
							break;
						case TutorialStepModel.INFO_PLACEMENT_COMP_TOP:
							this.containerGroup.x = _loc1_.x + (_loc1_.width - _loc7_) * 0.5 + this._step.offsetX;
							this.containerGroup.y = _loc1_.top - this._step.offsetY - this._defaultOffset;
							if(this.containerGroup.y < 0)
							{
								_loc4_ = TutorialStepModel.INFO_PLACEMENT_COMP_BOTTOM;
								_loc3_ = false;
								_loc2_++;
							}
							this.containerGroup.x = this.mathMax(0,this.mathMin(this.containerGroup.x,_loc5_ - _loc7_));
					}
				}
				while(!_loc3_ && _loc2_ == 1);
				
			}
		}
		
		override protected function updateDisplayList(param1:Number, param2:Number) : void
		{
			super.updateDisplayList(param1,param2);
			this.maskLayer.width = param1;
			this.maskLayer.height = param2;
			this.updateMaskLayer();
			if(this._targetComponent is UIComponent)
			{
				(this._targetComponent as UIComponent).invalidateDisplayList();
			}
			this.updateSceneEditorProxy();
			callLater(this.layoutInfoGroup);
		}
		
		protected function onDragEnter(param1:DragEvent) : void
		{
			if(this._step.allowDragForwarding)
			{
				this._sceneEditor.tutorialLayerDragEnter(param1,this.sceneEditorProxy);
			}
		}
		
		protected function onDragDrop(param1:DragEvent) : void
		{
			if(this._step.allowDragForwarding)
			{
				this._sceneEditor.tutorialLayerDragDrop(param1,this.sceneEditorProxy);
			}
		}
		
		protected function onChromeGroupDragDrop(param1:DragEvent) : void
		{
			param1.localX = this.sceneEditorProxy.getLayoutBoundsWidth() * 0.5;
			param1.localY = this.sceneEditorProxy.getLayoutBoundsHeight() * 0.5;
			this.onDragDrop(param1);
		}
		
		protected function onDragExit(param1:DragEvent) : void
		{
			if(this._step.allowDragForwarding)
			{
				this._sceneEditor.tutorialLayerDragExit(param1,this.sceneEditorProxy);
			}
		}
		
		protected function clickNextButton() : void
		{
			if(currentState == "final")
			{
				Console.getConsole().preview();
			}
			else
			{
				this.manager.notifyTutorialAction(TutorialStepModel.EXPECT_TUTORIAL_NEXT);
			}
		}
		
		protected function closeButton_clickHandler(param1:MouseEvent) : void
		{
			this.skipTutorial();
		}
		
		private function skipTutorial() : void
		{
			var _loc1_:ConfirmPopUp = null;
			if(currentState == "final")
			{
				this.manager.proceed();
			}
			else
			{
				_loc1_ = new ConfirmPopUp();
				_loc1_.createDefaultPopUp();
				_loc1_.title = UtilDict.translate("Skip tutorial?");
				_loc1_.message = UtilDict.translate("You can restart the tutorial using the menu in the top right.");
				_loc1_.confirmText = UtilDict.translate("Skip");
				_loc1_.addEventListener(PopUpEvent.CLOSE,this.onSkipPopUpClose);
				_loc1_.open(this,true);
			}
		}
		
		protected function onSkipPopUpClose(param1:PopUpEvent) : void
		{
			if(param1.commit)
			{
				this._openQuickStart = this.manager.currentTutorial.quickStartIndex >= this.manager.currentTutorial.nextStepIndex && this.manager.currentTutorial.tutorialId == TutorialManager.STARTER_TUTORIAL_ID;
				this.manager.finishTutorial(true);
				if(this._openQuickStart)
				{
					currentState = "skippedWithQuickStart";
					this.updateQuickStartPosition();
					this.addEventListenerForQuickStart();
				}
				else
				{
					this.finishTutorial();
				}
			}
		}
		
		protected function onInfoFadeOutComplete(param1:EffectEvent) : void
		{
			this.displayStepImpl();
		}
		
		protected function onInfoFadeInComplete(param1:EffectEvent) : void
		{
			this.chromeGroup.mouseEnabled = true;
			this.chromeGroup.mouseChildren = true;
		}
		
		protected function onLayerFadeOutComplete(param1:EffectEvent) : void
		{
			visible = false;
			this.targetComponent = null;
			PopUpManager.removePopUp(this);
			this.manager.handleTutorialLayerRemoval();
		}
		
		protected function skipLinkElement_clickHandler(param1:FlowElementMouseEvent) : void
		{
			param1.stopImmediatePropagation();
			param1.preventDefault();
			this.skipTutorial();
		}
		
		protected function updateQuickStartPosition() : void
		{
			this.tip2.y = Console.getConsole().timeline.y + TIMELINE_RULER_HEIGHT;
			this.tip3.x = THUMBTRAY_WIDTH + Console.getConsole().mainStage.width * 0.5 - TIP_MAX_WIDTH * 0.5;
		}
		
		protected function addEventListenerForQuickStart() : void
		{
			Console.getConsole().movie.addEventListener(MovieEvent.SCENE_ADDED,this.sceneAdded_EventHandler);
			Console.getConsole().thumbTray.navigatorGroup.addEventListener(MouseEvent.MOUSE_DOWN,this.thumbTray_mouseDownHandler);
			Console.getConsole().sceneEditor.addEventListener(Event.CHANGE,this.sceneEditor_ChangeHandler);
		}
		
		protected function removeEventListenerForQuickStart() : void
		{
			Console.getConsole().movie.removeEventListener(MovieEvent.SCENE_ADDED,this.sceneAdded_EventHandler);
			Console.getConsole().thumbTray.navigatorGroup.removeEventListener(MouseEvent.MOUSE_DOWN,this.thumbTray_mouseDownHandler);
			Console.getConsole().sceneEditor.removeEventListener(Event.CHANGE,this.sceneEditor_ChangeHandler);
		}
		
		protected function sceneEditor_ChangeHandler(param1:Event) : void
		{
			this.tipClose_eventHandler("tip3",false);
		}
		
		protected function sceneAdded_EventHandler(param1:Event) : void
		{
			this.tipClose_eventHandler("tip2",false);
		}
		
		protected function thumbTray_mouseDownHandler(param1:Event) : void
		{
			this.tipClose_eventHandler("tip1",false);
		}
		
		protected function tipClose_eventHandler(param1:String, param2:Boolean = true) : void
		{
			this[param1].visible = false;
			var _loc3_:String = "";
			switch(param1)
			{
				case "tip1":
					_loc3_ = AmplitudeAnalyticsManager.EVENT_PROPERTIES_TOOLTIP_USE_TEMPLATE;
					break;
				case "tip2":
					_loc3_ = AmplitudeAnalyticsManager.EVENT_PROPERTIES_TOOLTIP_ADD_SCENE;
					break;
				case "tip3":
					_loc3_ = AmplitudeAnalyticsManager.EVENT_PROPERTIES_TOOLTIP_CUSTOMIZATION;
			}
			var _loc4_:Object = {
				"name":_loc3_,
				"trigger":(!!param2?AmplitudeAnalyticsManager.EVENT_PROPERTIES_TRIGGER_MANUAL:AmplitudeAnalyticsManager.EVENT_PROPERTIES_TRIGGER_AUTO)
			};
			AmplitudeAnalyticsManager.instance.log(AmplitudeAnalyticsManager.EVENT_NAME_CLOSE_TUTORIAL_TOOLTIP,_loc4_);
			if(!this.tip1.visible && !this.tip2.visible && !this.tip3.visible)
			{
				this.maskLayer.graphics.clear();
				this._step = null;
				this.targetComponent = null;
				mouseChildren = false;
				visible = false;
				this.targetComponent = null;
				this.removeEventListenerForQuickStart();
				PopUpManager.removePopUp(this);
			}
		}
		
		private function _TutorialLayer_Fade2_i() : Fade
		{
			var _loc1_:Fade = new Fade();
			_loc1_.alphaFrom = 0;
			_loc1_.alphaTo = 1;
			_loc1_.duration = 500;
			_loc1_.addEventListener("effectEnd",this.__fadeIn_effectEnd);
			this.fadeIn = _loc1_;
			BindingManager.executeBindings(this,"fadeIn",this.fadeIn);
			return _loc1_;
		}
		
		public function __fadeIn_effectEnd(param1:EffectEvent) : void
		{
			this.onInfoFadeInComplete(param1);
		}
		
		private function _TutorialLayer_Fade3_i() : Fade
		{
			var _loc1_:Fade = new Fade();
			_loc1_.alphaFrom = 1;
			_loc1_.alphaTo = 0;
			_loc1_.duration = 500;
			_loc1_.addEventListener("effectEnd",this.__fadeOut_effectEnd);
			this.fadeOut = _loc1_;
			BindingManager.executeBindings(this,"fadeOut",this.fadeOut);
			return _loc1_;
		}
		
		public function __fadeOut_effectEnd(param1:EffectEvent) : void
		{
			this.onInfoFadeOutComplete(param1);
		}
		
		private function _TutorialLayer_Fade1_i() : Fade
		{
			var _loc1_:Fade = new Fade();
			_loc1_.alphaFrom = 1;
			_loc1_.alphaTo = 0;
			_loc1_.duration = 500;
			_loc1_.addEventListener("effectEnd",this.__layerFadeOut_effectEnd);
			this.layerFadeOut = _loc1_;
			BindingManager.executeBindings(this,"layerFadeOut",this.layerFadeOut);
			return _loc1_;
		}
		
		public function __layerFadeOut_effectEnd(param1:EffectEvent) : void
		{
			this.onLayerFadeOutComplete(param1);
		}
		
		private function _TutorialLayer_Fade4_i() : Fade
		{
			var _loc1_:Fade = new Fade();
			_loc1_.alphaFrom = 0;
			_loc1_.alphaTo = 1;
			_loc1_.duration = 500;
			this.nextButtonFadeIn = _loc1_;
			BindingManager.executeBindings(this,"nextButtonFadeIn",this.nextButtonFadeIn);
			return _loc1_;
		}
		
		private function _TutorialLayer_SpriteVisualElement1_i() : SpriteVisualElement
		{
			var _loc1_:SpriteVisualElement = new SpriteVisualElement();
			_loc1_.initialized(this,"maskLayer");
			this.maskLayer = _loc1_;
			BindingManager.executeBindings(this,"maskLayer",this.maskLayer);
			return _loc1_;
		}
		
		private function _TutorialLayer_Rect1_i() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.stroke = this._TutorialLayer_SolidColorStroke1_c();
			_loc1_.initialized(this,"frame");
			this.frame = _loc1_;
			BindingManager.executeBindings(this,"frame",this.frame);
			return _loc1_;
		}
		
		private function _TutorialLayer_SolidColorStroke1_c() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.weight = 5;
			_loc1_.color = 15890741;
			return _loc1_;
		}
		
		private function _TutorialLayer_BitmapImage1_i() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.visible = false;
			_loc1_.width = 130;
			_loc1_.height = 66;
			_loc1_.source = this._embed_mxml__styles_images_tutorial_tutorial_arrow_png_2013173889;
			_loc1_.initialized(this,"arrow");
			this.arrow = _loc1_;
			BindingManager.executeBindings(this,"arrow",this.arrow);
			return _loc1_;
		}
		
		private function _TutorialLayer_Group2_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.mouseEnabled = false;
			_loc1_.mouseEnabledWhereTransparent = true;
			_loc1_.mxmlContent = [this._TutorialLayer_Rect2_c()];
			_loc1_.addEventListener("dragDrop",this.__sceneEditorProxy_dragDrop);
			_loc1_.addEventListener("dragEnter",this.__sceneEditorProxy_dragEnter);
			_loc1_.addEventListener("dragExit",this.__sceneEditorProxy_dragExit);
			_loc1_.id = "sceneEditorProxy";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.sceneEditorProxy = _loc1_;
			BindingManager.executeBindings(this,"sceneEditorProxy",this.sceneEditorProxy);
			return _loc1_;
		}
		
		private function _TutorialLayer_Rect2_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.fill = this._TutorialLayer_SolidColor1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _TutorialLayer_SolidColor1_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.alpha = 0;
			_loc1_.color = 65280;
			return _loc1_;
		}
		
		public function __sceneEditorProxy_dragDrop(param1:DragEvent) : void
		{
			this.onDragDrop(param1);
		}
		
		public function __sceneEditorProxy_dragEnter(param1:DragEvent) : void
		{
			this.onDragEnter(param1);
		}
		
		public function __sceneEditorProxy_dragExit(param1:DragEvent) : void
		{
			this.onDragExit(param1);
		}
		
		private function _TutorialLayer_Group3_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.mxmlContent = [this._TutorialLayer_Group4_i()];
			_loc1_.id = "containerGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.containerGroup = _loc1_;
			BindingManager.executeBindings(this,"containerGroup",this.containerGroup);
			return _loc1_;
		}
		
		private function _TutorialLayer_Group4_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.visible = false;
			_loc1_.mxmlContent = [this._TutorialLayer_RectangularDropShadow1_i(),this._TutorialLayer_Rect3_c(),this._TutorialLayer_VGroup1_i()];
			_loc1_.addEventListener("dragDrop",this.__chromeGroup_dragDrop);
			_loc1_.addEventListener("dragEnter",this.__chromeGroup_dragEnter);
			_loc1_.addEventListener("dragExit",this.__chromeGroup_dragExit);
			_loc1_.id = "chromeGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.chromeGroup = _loc1_;
			BindingManager.executeBindings(this,"chromeGroup",this.chromeGroup);
			return _loc1_;
		}
		
		private function _TutorialLayer_RectangularDropShadow1_i() : RectangularDropShadow
		{
			var _loc1_:RectangularDropShadow = new RectangularDropShadow();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.alpha = 0.32;
			_loc1_.angle = 90;
			_loc1_.blRadius = 3;
			_loc1_.blurX = 20;
			_loc1_.blurY = 20;
			_loc1_.brRadius = 3;
			_loc1_.color = 0;
			_loc1_.distance = 11;
			_loc1_.tlRadius = 3;
			_loc1_.trRadius = 3;
			_loc1_.id = "dropShadow";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.dropShadow = _loc1_;
			BindingManager.executeBindings(this,"dropShadow",this.dropShadow);
			return _loc1_;
		}
		
		private function _TutorialLayer_Rect3_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.radiusX = 3;
			_loc1_.fill = this._TutorialLayer_SolidColor2_i();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _TutorialLayer_SolidColor2_i() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 16777215;
			this._TutorialLayer_SolidColor2 = _loc1_;
			BindingManager.executeBindings(this,"_TutorialLayer_SolidColor2",this._TutorialLayer_SolidColor2);
			return _loc1_;
		}
		
		private function _TutorialLayer_VGroup1_i() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.gap = 0;
			_loc1_.mxmlContent = [this._TutorialLayer_VGroup2_i(),this._TutorialLayer_HGroup2_i()];
			_loc1_.id = "_TutorialLayer_VGroup1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._TutorialLayer_VGroup1 = _loc1_;
			BindingManager.executeBindings(this,"_TutorialLayer_VGroup1",this._TutorialLayer_VGroup1);
			return _loc1_;
		}
		
		private function _TutorialLayer_Group5_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.mxmlContent = [];
			_loc1_.id = "_TutorialLayer_Group5";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._TutorialLayer_Group5 = _loc1_;
			BindingManager.executeBindings(this,"_TutorialLayer_Group5",this._TutorialLayer_Group5);
			return _loc1_;
		}
		
		private function _TutorialLayer_BitmapImage2_i() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.source = this._embed_mxml__styles_images_tutorial_hero_png_1252293081;
			_loc1_.initialized(this,"heroImage");
			this.heroImage = _loc1_;
			BindingManager.executeBindings(this,"heroImage",this.heroImage);
			return _loc1_;
		}
		
		private function _TutorialLayer_Group6_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.mxmlContent = [this._TutorialLayer_Rect4_c()];
			_loc1_.id = "heroMask";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.heroMask = _loc1_;
			BindingManager.executeBindings(this,"heroMask",this.heroMask);
			return _loc1_;
		}
		
		private function _TutorialLayer_Rect4_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.topLeftRadiusX = 3;
			_loc1_.topRightRadiusX = 3;
			_loc1_.fill = this._TutorialLayer_SolidColor3_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _TutorialLayer_SolidColor3_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			return _loc1_;
		}
		
		private function _TutorialLayer_BitmapImage3_i() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.top = 35;
			_loc1_.source = this._embed_mxml__styles_images_tutorial_final_png_698666121;
			_loc1_.initialized(this,"finalImage");
			this.finalImage = _loc1_;
			BindingManager.executeBindings(this,"finalImage",this.finalImage);
			return _loc1_;
		}
		
		private function _TutorialLayer_VGroup2_i() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.minWidth = 300;
			_loc1_.maxWidth = 380;
			_loc1_.gap = 10;
			_loc1_.horizontalAlign = "center";
			_loc1_.paddingLeft = 20;
			_loc1_.paddingRight = 20;
			_loc1_.paddingTop = 20;
			_loc1_.paddingBottom = 20;
			_loc1_.mxmlContent = [this._TutorialLayer_Label1_i(),this._TutorialLayer_Label2_i(),this._TutorialLayer_HGroup1_i(),this._TutorialLayer_RichEditableText1_i()];
			_loc1_.id = "contentGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.contentGroup = _loc1_;
			BindingManager.executeBindings(this,"contentGroup",this.contentGroup);
			return _loc1_;
		}
		
		private function _TutorialLayer_Label1_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.percentWidth = 100;
			_loc1_.setStyle("fontSize",21);
			_loc1_.setStyle("color",16777215);
			_loc1_.id = "titleDisplay";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.titleDisplay = _loc1_;
			BindingManager.executeBindings(this,"titleDisplay",this.titleDisplay);
			return _loc1_;
		}
		
		private function _TutorialLayer_Label2_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.percentWidth = 100;
			_loc1_.setStyle("fontSize",14);
			_loc1_.id = "messageDisplay";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.messageDisplay = _loc1_;
			BindingManager.executeBindings(this,"messageDisplay",this.messageDisplay);
			return _loc1_;
		}
		
		private function _TutorialLayer_HGroup1_i() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.percentWidth = 100;
			_loc1_.horizontalAlign = "center";
			_loc1_.paddingTop = 10;
			_loc1_.mxmlContent = [this._TutorialLayer_Button1_i()];
			_loc1_.id = "proceedButtonGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.proceedButtonGroup = _loc1_;
			BindingManager.executeBindings(this,"proceedButtonGroup",this.proceedButtonGroup);
			return _loc1_;
		}
		
		private function _TutorialLayer_Button1_i() : Button
		{
			var _loc1_:Button = new Button();
			_loc1_.buttonMode = true;
			_loc1_.styleName = "primary";
			_loc1_.addEventListener("click",this.__proceedButton_click);
			_loc1_.id = "proceedButton";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.proceedButton = _loc1_;
			BindingManager.executeBindings(this,"proceedButton",this.proceedButton);
			return _loc1_;
		}
		
		public function __proceedButton_click(param1:MouseEvent) : void
		{
			this.clickNextButton();
		}
		
		private function _TutorialLayer_RichEditableText1_i() : RichEditableText
		{
			var _loc1_:RichEditableText = new RichEditableText();
			_loc1_.editable = false;
			_loc1_.focusEnabled = false;
			_loc1_.selectable = false;
			_loc1_.textFlow = this._TutorialLayer_TextFlow1_c();
			_loc1_.setStyle("textAlign","center");
			_loc1_.setStyle("color",9937845);
			_loc1_.setStyle("fontSize",13);
			_loc1_.id = "_TutorialLayer_RichEditableText1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._TutorialLayer_RichEditableText1 = _loc1_;
			BindingManager.executeBindings(this,"_TutorialLayer_RichEditableText1",this._TutorialLayer_RichEditableText1);
			return _loc1_;
		}
		
		private function _TutorialLayer_TextFlow1_c() : TextFlow
		{
			var _loc1_:TextFlow = new TextFlow();
			_loc1_.mxmlChildren = ["\n										  ",this._TutorialLayer_ParagraphElement1_c(),"\n									 "];
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _TutorialLayer_ParagraphElement1_c() : ParagraphElement
		{
			var _loc1_:ParagraphElement = new ParagraphElement();
			_loc1_.mxmlChildren = ["\n												",this._TutorialLayer_SpanElement1_i(),"\n												\n												",this._TutorialLayer_LinkElement1_i(),"\n										  "];
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _TutorialLayer_SpanElement1_i() : SpanElement
		{
			var _loc1_:SpanElement = new SpanElement();
			_loc1_.initialized(this,"_TutorialLayer_SpanElement1");
			this._TutorialLayer_SpanElement1 = _loc1_;
			BindingManager.executeBindings(this,"_TutorialLayer_SpanElement1",this._TutorialLayer_SpanElement1);
			return _loc1_;
		}
		
		private function _TutorialLayer_LinkElement1_i() : LinkElement
		{
			var _loc1_:LinkElement = new LinkElement();
			_loc1_.mxmlChildren = [this._TutorialLayer_Object4_i(),"\n												"];
			_loc1_.addEventListener("click",this.___TutorialLayer_LinkElement1_click);
			_loc1_.initialized(this,"_TutorialLayer_LinkElement1");
			this._TutorialLayer_LinkElement1 = _loc1_;
			BindingManager.executeBindings(this,"_TutorialLayer_LinkElement1",this._TutorialLayer_LinkElement1);
			return _loc1_;
		}
		
		private function _TutorialLayer_Object4_i() : Object
		{
			var _loc1_:Object = "\n													 ";
			this._TutorialLayer_Object4 = _loc1_;
			BindingManager.executeBindings(this,"_TutorialLayer_Object4",this._TutorialLayer_Object4);
			return _loc1_;
		}
		
		private function _TutorialLayer_SpanElement2_i() : SpanElement
		{
			var _loc1_:SpanElement = new SpanElement();
			_loc1_.color = 4439205;
			_loc1_.textDecoration = "none";
			_loc1_.fontWeight = "bold";
			_loc1_.mxmlChildren = ["Skip for now."];
			_loc1_.initialized(this,"_TutorialLayer_SpanElement2");
			this._TutorialLayer_SpanElement2 = _loc1_;
			BindingManager.executeBindings(this,"_TutorialLayer_SpanElement2",this._TutorialLayer_SpanElement2);
			return _loc1_;
		}
		
		public function ___TutorialLayer_LinkElement1_click(param1:FlowElementMouseEvent) : void
		{
			this.skipLinkElement_clickHandler(param1);
		}
		
		private function _TutorialLayer_HGroup2_i() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.percentWidth = 100;
			_loc1_.verticalAlign = "middle";
			_loc1_.gap = 10;
			_loc1_.paddingLeft = 20;
			_loc1_.paddingRight = 20;
			_loc1_.paddingTop = 0;
			_loc1_.paddingBottom = 12;
			_loc1_.mxmlContent = [this._TutorialLayer_Label3_i(),this._TutorialLayer_Button2_i(),this._TutorialLayer_Spacer1_c(),this._TutorialLayer_Button3_i()];
			_loc1_.id = "subContentGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.subContentGroup = _loc1_;
			BindingManager.executeBindings(this,"subContentGroup",this.subContentGroup);
			return _loc1_;
		}
		
		private function _TutorialLayer_Label3_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.visible = false;
			_loc1_.includeInLayout = false;
			_loc1_.setStyle("color",16777215);
			_loc1_.id = "stepDisplay";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.stepDisplay = _loc1_;
			BindingManager.executeBindings(this,"stepDisplay",this.stepDisplay);
			return _loc1_;
		}
		
		private function _TutorialLayer_Button2_i() : Button
		{
			var _loc1_:Button = new Button();
			_loc1_.buttonMode = true;
			_loc1_.setStyle("skinClass",SkipTutorialButtonSkin);
			_loc1_.addEventListener("click",this.___TutorialLayer_Button2_click);
			_loc1_.id = "_TutorialLayer_Button2";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._TutorialLayer_Button2 = _loc1_;
			BindingManager.executeBindings(this,"_TutorialLayer_Button2",this._TutorialLayer_Button2);
			return _loc1_;
		}
		
		public function ___TutorialLayer_Button2_click(param1:MouseEvent) : void
		{
			this.closeButton_clickHandler(param1);
		}
		
		private function _TutorialLayer_Spacer1_c() : Spacer
		{
			var _loc1_:Spacer = new Spacer();
			_loc1_.percentWidth = 100;
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _TutorialLayer_Button3_i() : Button
		{
			var _loc1_:Button = new Button();
			_loc1_.buttonMode = true;
			_loc1_.setStyle("skinClass",PrimaryButtonSkin);
			_loc1_.addEventListener("click",this.__nextButton_click);
			_loc1_.id = "nextButton";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.nextButton = _loc1_;
			BindingManager.executeBindings(this,"nextButton",this.nextButton);
			return _loc1_;
		}
		
		public function __nextButton_click(param1:MouseEvent) : void
		{
			this.clickNextButton();
		}
		
		private function _TutorialLayer_Button4_i() : Button
		{
			var _loc1_:Button = new Button();
			_loc1_.right = 10;
			_loc1_.top = 10;
			_loc1_.buttonMode = true;
			_loc1_.setStyle("skinClass",CloseTutorialButtonSkin);
			_loc1_.addEventListener("click",this.__closeButton_click);
			_loc1_.id = "closeButton";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.closeButton = _loc1_;
			BindingManager.executeBindings(this,"closeButton",this.closeButton);
			return _loc1_;
		}
		
		public function __closeButton_click(param1:MouseEvent) : void
		{
			this.closeButton_clickHandler(param1);
		}
		
		public function __chromeGroup_dragDrop(param1:DragEvent) : void
		{
			this.onChromeGroupDragDrop(param1);
		}
		
		public function __chromeGroup_dragEnter(param1:DragEvent) : void
		{
			this.onDragEnter(param1);
		}
		
		public function __chromeGroup_dragExit(param1:DragEvent) : void
		{
			this.onDragExit(param1);
		}
		
		private function _TutorialLayer_Group7_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.mxmlContent = [this._TutorialLayer_Group8_i(),this._TutorialLayer_Group9_i(),this._TutorialLayer_Group10_i()];
			_loc1_.id = "quickStartGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.quickStartGroup = _loc1_;
			BindingManager.executeBindings(this,"quickStartGroup",this.quickStartGroup);
			return _loc1_;
		}
		
		private function _TutorialLayer_Group8_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.x = 200;
			_loc1_.y = 200;
			_loc1_.mxmlContent = [this._TutorialLayer_RectangularDropShadow2_c(),this._TutorialLayer_Rect5_c(),this._TutorialLayer_VGroup3_c(),this._TutorialLayer_Button5_c()];
			_loc1_.id = "tip1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.tip1 = _loc1_;
			BindingManager.executeBindings(this,"tip1",this.tip1);
			return _loc1_;
		}
		
		private function _TutorialLayer_RectangularDropShadow2_c() : RectangularDropShadow
		{
			var _loc1_:RectangularDropShadow = new RectangularDropShadow();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.alpha = 0.32;
			_loc1_.angle = 90;
			_loc1_.blRadius = 3;
			_loc1_.blurX = 20;
			_loc1_.blurY = 20;
			_loc1_.brRadius = 3;
			_loc1_.color = 0;
			_loc1_.distance = 11;
			_loc1_.tlRadius = 3;
			_loc1_.trRadius = 3;
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _TutorialLayer_Rect5_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.radiusX = 3;
			_loc1_.fill = this._TutorialLayer_SolidColor4_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _TutorialLayer_SolidColor4_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 0;
			_loc1_.alpha = 0.7;
			return _loc1_;
		}
		
		private function _TutorialLayer_VGroup3_c() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.gap = 0;
			_loc1_.mxmlContent = [this._TutorialLayer_VGroup4_c()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _TutorialLayer_VGroup4_c() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.minWidth = 300;
			_loc1_.maxWidth = 380;
			_loc1_.gap = 10;
			_loc1_.horizontalAlign = "center";
			_loc1_.paddingLeft = 20;
			_loc1_.paddingRight = 20;
			_loc1_.paddingTop = 20;
			_loc1_.paddingBottom = 20;
			_loc1_.mxmlContent = [this._TutorialLayer_Label4_i(),this._TutorialLayer_Label5_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _TutorialLayer_Label4_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.percentWidth = 100;
			_loc1_.setStyle("fontSize",21);
			_loc1_.setStyle("color",16777215);
			_loc1_.id = "_TutorialLayer_Label4";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._TutorialLayer_Label4 = _loc1_;
			BindingManager.executeBindings(this,"_TutorialLayer_Label4",this._TutorialLayer_Label4);
			return _loc1_;
		}
		
		private function _TutorialLayer_Label5_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.percentWidth = 100;
			_loc1_.setStyle("fontSize",16);
			_loc1_.setStyle("color",16777215);
			_loc1_.id = "_TutorialLayer_Label5";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._TutorialLayer_Label5 = _loc1_;
			BindingManager.executeBindings(this,"_TutorialLayer_Label5",this._TutorialLayer_Label5);
			return _loc1_;
		}
		
		private function _TutorialLayer_Button5_c() : Button
		{
			var _loc1_:Button = new Button();
			_loc1_.right = 10;
			_loc1_.top = 10;
			_loc1_.buttonMode = true;
			_loc1_.setStyle("skinClass",CloseTutorialButtonSkin);
			_loc1_.addEventListener("click",this.___TutorialLayer_Button5_click);
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		public function ___TutorialLayer_Button5_click(param1:MouseEvent) : void
		{
			this.tipClose_eventHandler("tip1");
		}
		
		private function _TutorialLayer_Group9_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.x = 500;
			_loc1_.y = 80;
			_loc1_.mxmlContent = [this._TutorialLayer_RectangularDropShadow3_c(),this._TutorialLayer_Rect6_c(),this._TutorialLayer_VGroup5_c(),this._TutorialLayer_Button6_c()];
			_loc1_.id = "tip3";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.tip3 = _loc1_;
			BindingManager.executeBindings(this,"tip3",this.tip3);
			return _loc1_;
		}
		
		private function _TutorialLayer_RectangularDropShadow3_c() : RectangularDropShadow
		{
			var _loc1_:RectangularDropShadow = new RectangularDropShadow();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.alpha = 0.32;
			_loc1_.angle = 90;
			_loc1_.blRadius = 3;
			_loc1_.blurX = 20;
			_loc1_.blurY = 20;
			_loc1_.brRadius = 3;
			_loc1_.color = 0;
			_loc1_.distance = 11;
			_loc1_.tlRadius = 3;
			_loc1_.trRadius = 3;
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _TutorialLayer_Rect6_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.radiusX = 3;
			_loc1_.fill = this._TutorialLayer_SolidColor5_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _TutorialLayer_SolidColor5_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 0;
			_loc1_.alpha = 0.7;
			return _loc1_;
		}
		
		private function _TutorialLayer_VGroup5_c() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.gap = 0;
			_loc1_.mxmlContent = [this._TutorialLayer_VGroup6_c()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _TutorialLayer_VGroup6_c() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.minWidth = 300;
			_loc1_.maxWidth = 380;
			_loc1_.gap = 10;
			_loc1_.horizontalAlign = "center";
			_loc1_.paddingLeft = 20;
			_loc1_.paddingRight = 20;
			_loc1_.paddingTop = 20;
			_loc1_.paddingBottom = 20;
			_loc1_.mxmlContent = [this._TutorialLayer_Label6_i(),this._TutorialLayer_Label7_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _TutorialLayer_Label6_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.percentWidth = 100;
			_loc1_.setStyle("fontSize",21);
			_loc1_.setStyle("color",16777215);
			_loc1_.id = "_TutorialLayer_Label6";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._TutorialLayer_Label6 = _loc1_;
			BindingManager.executeBindings(this,"_TutorialLayer_Label6",this._TutorialLayer_Label6);
			return _loc1_;
		}
		
		private function _TutorialLayer_Label7_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.percentWidth = 100;
			_loc1_.setStyle("fontSize",16);
			_loc1_.setStyle("color",16777215);
			_loc1_.id = "_TutorialLayer_Label7";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._TutorialLayer_Label7 = _loc1_;
			BindingManager.executeBindings(this,"_TutorialLayer_Label7",this._TutorialLayer_Label7);
			return _loc1_;
		}
		
		private function _TutorialLayer_Button6_c() : Button
		{
			var _loc1_:Button = new Button();
			_loc1_.right = 10;
			_loc1_.top = 10;
			_loc1_.buttonMode = true;
			_loc1_.setStyle("skinClass",CloseTutorialButtonSkin);
			_loc1_.addEventListener("click",this.___TutorialLayer_Button6_click);
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		public function ___TutorialLayer_Button6_click(param1:MouseEvent) : void
		{
			this.tipClose_eventHandler("tip3");
		}
		
		private function _TutorialLayer_Group10_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.x = 340;
			_loc1_.y = 400;
			_loc1_.mxmlContent = [this._TutorialLayer_RectangularDropShadow4_c(),this._TutorialLayer_Rect7_c(),this._TutorialLayer_VGroup7_c(),this._TutorialLayer_Button7_c()];
			_loc1_.id = "tip2";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.tip2 = _loc1_;
			BindingManager.executeBindings(this,"tip2",this.tip2);
			return _loc1_;
		}
		
		private function _TutorialLayer_RectangularDropShadow4_c() : RectangularDropShadow
		{
			var _loc1_:RectangularDropShadow = new RectangularDropShadow();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.alpha = 0.32;
			_loc1_.angle = 90;
			_loc1_.blRadius = 3;
			_loc1_.blurX = 20;
			_loc1_.blurY = 20;
			_loc1_.brRadius = 3;
			_loc1_.color = 0;
			_loc1_.distance = 11;
			_loc1_.tlRadius = 3;
			_loc1_.trRadius = 3;
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _TutorialLayer_Rect7_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.radiusX = 3;
			_loc1_.fill = this._TutorialLayer_SolidColor6_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _TutorialLayer_SolidColor6_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 0;
			_loc1_.alpha = 0.7;
			return _loc1_;
		}
		
		private function _TutorialLayer_VGroup7_c() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.gap = 0;
			_loc1_.mxmlContent = [this._TutorialLayer_VGroup8_c()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _TutorialLayer_VGroup8_c() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.minWidth = 300;
			_loc1_.maxWidth = 380;
			_loc1_.gap = 10;
			_loc1_.horizontalAlign = "center";
			_loc1_.paddingLeft = 20;
			_loc1_.paddingRight = 20;
			_loc1_.paddingTop = 20;
			_loc1_.paddingBottom = 20;
			_loc1_.mxmlContent = [this._TutorialLayer_Label8_i(),this._TutorialLayer_Label9_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _TutorialLayer_Label8_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.percentWidth = 100;
			_loc1_.setStyle("fontSize",21);
			_loc1_.setStyle("color",16777215);
			_loc1_.id = "_TutorialLayer_Label8";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._TutorialLayer_Label8 = _loc1_;
			BindingManager.executeBindings(this,"_TutorialLayer_Label8",this._TutorialLayer_Label8);
			return _loc1_;
		}
		
		private function _TutorialLayer_Label9_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.percentWidth = 100;
			_loc1_.setStyle("fontSize",16);
			_loc1_.setStyle("color",16777215);
			_loc1_.id = "_TutorialLayer_Label9";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._TutorialLayer_Label9 = _loc1_;
			BindingManager.executeBindings(this,"_TutorialLayer_Label9",this._TutorialLayer_Label9);
			return _loc1_;
		}
		
		private function _TutorialLayer_Button7_c() : Button
		{
			var _loc1_:Button = new Button();
			_loc1_.right = 10;
			_loc1_.top = 10;
			_loc1_.buttonMode = true;
			_loc1_.setStyle("skinClass",CloseTutorialButtonSkin);
			_loc1_.addEventListener("click",this.___TutorialLayer_Button7_click);
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		public function ___TutorialLayer_Button7_click(param1:MouseEvent) : void
		{
			this.tipClose_eventHandler("tip2");
		}
		
		public function ___TutorialLayer_Group1_creationComplete(param1:FlexEvent) : void
		{
			this.init();
		}
		
		private function _TutorialLayer_bindingsSetup() : Array
		{
			var result:Array = [];
			result[0] = new Binding(this,function():Object
			{
				return this;
			},null,"layerFadeOut.target");
			result[1] = new Binding(this,null,null,"fadeIn.target","chromeGroup");
			result[2] = new Binding(this,null,null,"fadeOut.target","chromeGroup");
			result[3] = new Binding(this,null,null,"nextButtonFadeIn.target","chromeGroup");
			result[4] = new Binding(this,null,null,"heroImage.mask","heroMask");
			result[5] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Next");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"proceedButton.label");
			result[6] = new Binding(this,function():Boolean
			{
				return _showHelpText;
			},null,"_TutorialLayer_RichEditableText1.visible");
			result[7] = new Binding(this,function():Boolean
			{
				return _showHelpText;
			},null,"_TutorialLayer_RichEditableText1.includeInLayout");
			result[8] = new Binding(this,function():String
			{
				var _loc1_:* = _helpText;
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_TutorialLayer_SpanElement1.text");
			result[9] = new Binding(this,function():Boolean
			{
				return _showSubContent;
			},null,"subContentGroup.visible");
			result[10] = new Binding(this,function():Boolean
			{
				return _showSubContent;
			},null,"subContentGroup.includeInLayout");
			result[11] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Skip the tutorial");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_TutorialLayer_Button2.label");
			result[12] = new Binding(this,function():Boolean
			{
				return !_isHideSkipTutorialButton;
			},null,"_TutorialLayer_Button2.visible");
			result[13] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Next");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"nextButton.label");
			result[14] = new Binding(this,null,function(param1:*):void
			{
				nextButton.setStyle("showEffect",param1);
			},"nextButton.showEffect","nextButtonFadeIn");
			result[15] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Using templates");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_TutorialLayer_Label4.text");
			result[16] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Inside each category you’ll find many templates — choose one that fits your message");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_TutorialLayer_Label5.text");
			result[17] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Customization");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_TutorialLayer_Label6.text");
			result[18] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Everything can be customized — props, text, characters, and more!");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_TutorialLayer_Label7.text");
			result[19] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Adding scenes");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_TutorialLayer_Label8.text");
			result[20] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Scenes are like slides in a presentation");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_TutorialLayer_Label9.text");
			return result;
		}
		
		[Bindable(event="propertyChange")]
		public function get _TutorialLayer_Group5() : Group
		{
			return this._1194668513_TutorialLayer_Group5;
		}
		
		public function set _TutorialLayer_Group5(param1:Group) : void
		{
			var _loc2_:Object = this._1194668513_TutorialLayer_Group5;
			if(_loc2_ !== param1)
			{
				this._1194668513_TutorialLayer_Group5 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_TutorialLayer_Group5",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _TutorialLayer_LinkElement1() : LinkElement
		{
			return this._1546916134_TutorialLayer_LinkElement1;
		}
		
		public function set _TutorialLayer_LinkElement1(param1:LinkElement) : void
		{
			var _loc2_:Object = this._1546916134_TutorialLayer_LinkElement1;
			if(_loc2_ !== param1)
			{
				this._1546916134_TutorialLayer_LinkElement1 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_TutorialLayer_LinkElement1",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _TutorialLayer_SolidColor2() : SolidColor
		{
			return this._893157967_TutorialLayer_SolidColor2;
		}
		
		public function set _TutorialLayer_SolidColor2(param1:SolidColor) : void
		{
			var _loc2_:Object = this._893157967_TutorialLayer_SolidColor2;
			if(_loc2_ !== param1)
			{
				this._893157967_TutorialLayer_SolidColor2 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_TutorialLayer_SolidColor2",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _TutorialLayer_VGroup1() : VGroup
		{
			return this._1874183869_TutorialLayer_VGroup1;
		}
		
		public function set _TutorialLayer_VGroup1(param1:VGroup) : void
		{
			var _loc2_:Object = this._1874183869_TutorialLayer_VGroup1;
			if(_loc2_ !== param1)
			{
				this._1874183869_TutorialLayer_VGroup1 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_TutorialLayer_VGroup1",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get arrow() : BitmapImage
		{
			return this._93090825arrow;
		}
		
		public function set arrow(param1:BitmapImage) : void
		{
			var _loc2_:Object = this._93090825arrow;
			if(_loc2_ !== param1)
			{
				this._93090825arrow = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"arrow",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get chromeGroup() : Group
		{
			return this._434221093chromeGroup;
		}
		
		public function set chromeGroup(param1:Group) : void
		{
			var _loc2_:Object = this._434221093chromeGroup;
			if(_loc2_ !== param1)
			{
				this._434221093chromeGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"chromeGroup",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get closeButton() : Button
		{
			return this._312699062closeButton;
		}
		
		public function set closeButton(param1:Button) : void
		{
			var _loc2_:Object = this._312699062closeButton;
			if(_loc2_ !== param1)
			{
				this._312699062closeButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"closeButton",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get containerGroup() : Group
		{
			return this._833446526containerGroup;
		}
		
		public function set containerGroup(param1:Group) : void
		{
			var _loc2_:Object = this._833446526containerGroup;
			if(_loc2_ !== param1)
			{
				this._833446526containerGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"containerGroup",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get contentGroup() : VGroup
		{
			return this._809612678contentGroup;
		}
		
		public function set contentGroup(param1:VGroup) : void
		{
			var _loc2_:Object = this._809612678contentGroup;
			if(_loc2_ !== param1)
			{
				this._809612678contentGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"contentGroup",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get dropShadow() : RectangularDropShadow
		{
			return this._906978543dropShadow;
		}
		
		public function set dropShadow(param1:RectangularDropShadow) : void
		{
			var _loc2_:Object = this._906978543dropShadow;
			if(_loc2_ !== param1)
			{
				this._906978543dropShadow = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dropShadow",_loc2_,param1));
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
		public function get fadeOut() : Fade
		{
			return this._1091436750fadeOut;
		}
		
		public function set fadeOut(param1:Fade) : void
		{
			var _loc2_:Object = this._1091436750fadeOut;
			if(_loc2_ !== param1)
			{
				this._1091436750fadeOut = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fadeOut",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get finalImage() : BitmapImage
		{
			return this._1881837179finalImage;
		}
		
		public function set finalImage(param1:BitmapImage) : void
		{
			var _loc2_:Object = this._1881837179finalImage;
			if(_loc2_ !== param1)
			{
				this._1881837179finalImage = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"finalImage",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get frame() : Rect
		{
			return this._97692013frame;
		}
		
		public function set frame(param1:Rect) : void
		{
			var _loc2_:Object = this._97692013frame;
			if(_loc2_ !== param1)
			{
				this._97692013frame = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"frame",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get heroImage() : BitmapImage
		{
			return this._2016684671heroImage;
		}
		
		public function set heroImage(param1:BitmapImage) : void
		{
			var _loc2_:Object = this._2016684671heroImage;
			if(_loc2_ !== param1)
			{
				this._2016684671heroImage = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"heroImage",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get heroMask() : Group
		{
			return this._619135482heroMask;
		}
		
		public function set heroMask(param1:Group) : void
		{
			var _loc2_:Object = this._619135482heroMask;
			if(_loc2_ !== param1)
			{
				this._619135482heroMask = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"heroMask",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get layerFadeOut() : Fade
		{
			return this._62936225layerFadeOut;
		}
		
		public function set layerFadeOut(param1:Fade) : void
		{
			var _loc2_:Object = this._62936225layerFadeOut;
			if(_loc2_ !== param1)
			{
				this._62936225layerFadeOut = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"layerFadeOut",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get maskLayer() : SpriteVisualElement
		{
			return this._69905979maskLayer;
		}
		
		public function set maskLayer(param1:SpriteVisualElement) : void
		{
			var _loc2_:Object = this._69905979maskLayer;
			if(_loc2_ !== param1)
			{
				this._69905979maskLayer = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"maskLayer",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get messageDisplay() : Label
		{
			return this._1766135109messageDisplay;
		}
		
		public function set messageDisplay(param1:Label) : void
		{
			var _loc2_:Object = this._1766135109messageDisplay;
			if(_loc2_ !== param1)
			{
				this._1766135109messageDisplay = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"messageDisplay",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get nextButton() : Button
		{
			return this._1749722107nextButton;
		}
		
		public function set nextButton(param1:Button) : void
		{
			var _loc2_:Object = this._1749722107nextButton;
			if(_loc2_ !== param1)
			{
				this._1749722107nextButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"nextButton",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get nextButtonFadeIn() : Fade
		{
			return this._2126029094nextButtonFadeIn;
		}
		
		public function set nextButtonFadeIn(param1:Fade) : void
		{
			var _loc2_:Object = this._2126029094nextButtonFadeIn;
			if(_loc2_ !== param1)
			{
				this._2126029094nextButtonFadeIn = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"nextButtonFadeIn",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get proceedButton() : Button
		{
			return this._1779135872proceedButton;
		}
		
		public function set proceedButton(param1:Button) : void
		{
			var _loc2_:Object = this._1779135872proceedButton;
			if(_loc2_ !== param1)
			{
				this._1779135872proceedButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"proceedButton",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get proceedButtonGroup() : HGroup
		{
			return this._1436548897proceedButtonGroup;
		}
		
		public function set proceedButtonGroup(param1:HGroup) : void
		{
			var _loc2_:Object = this._1436548897proceedButtonGroup;
			if(_loc2_ !== param1)
			{
				this._1436548897proceedButtonGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"proceedButtonGroup",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get quickStartGroup() : Group
		{
			return this._83422474quickStartGroup;
		}
		
		public function set quickStartGroup(param1:Group) : void
		{
			var _loc2_:Object = this._83422474quickStartGroup;
			if(_loc2_ !== param1)
			{
				this._83422474quickStartGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"quickStartGroup",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get sceneEditorProxy() : Group
		{
			return this._575957803sceneEditorProxy;
		}
		
		public function set sceneEditorProxy(param1:Group) : void
		{
			var _loc2_:Object = this._575957803sceneEditorProxy;
			if(_loc2_ !== param1)
			{
				this._575957803sceneEditorProxy = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sceneEditorProxy",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get stepDisplay() : Label
		{
			return this._1281666134stepDisplay;
		}
		
		public function set stepDisplay(param1:Label) : void
		{
			var _loc2_:Object = this._1281666134stepDisplay;
			if(_loc2_ !== param1)
			{
				this._1281666134stepDisplay = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"stepDisplay",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get subContentGroup() : HGroup
		{
			return this._539191270subContentGroup;
		}
		
		public function set subContentGroup(param1:HGroup) : void
		{
			var _loc2_:Object = this._539191270subContentGroup;
			if(_loc2_ !== param1)
			{
				this._539191270subContentGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"subContentGroup",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get tip1() : Group
		{
			return this._3560182tip1;
		}
		
		public function set tip1(param1:Group) : void
		{
			var _loc2_:Object = this._3560182tip1;
			if(_loc2_ !== param1)
			{
				this._3560182tip1 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tip1",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get tip2() : Group
		{
			return this._3560183tip2;
		}
		
		public function set tip2(param1:Group) : void
		{
			var _loc2_:Object = this._3560183tip2;
			if(_loc2_ !== param1)
			{
				this._3560183tip2 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tip2",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get tip3() : Group
		{
			return this._3560184tip3;
		}
		
		public function set tip3(param1:Group) : void
		{
			var _loc2_:Object = this._3560184tip3;
			if(_loc2_ !== param1)
			{
				this._3560184tip3 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tip3",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get titleDisplay() : Label
		{
			return this._1893287094titleDisplay;
		}
		
		public function set titleDisplay(param1:Label) : void
		{
			var _loc2_:Object = this._1893287094titleDisplay;
			if(_loc2_ !== param1)
			{
				this._1893287094titleDisplay = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"titleDisplay",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get _helpText() : String
		{
			return this._699256467_helpText;
		}
		
		private function set _helpText(param1:String) : void
		{
			var _loc2_:Object = this._699256467_helpText;
			if(_loc2_ !== param1)
			{
				this._699256467_helpText = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_helpText",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get _showHelpText() : Boolean
		{
			return this._549739530_showHelpText;
		}
		
		private function set _showHelpText(param1:Boolean) : void
		{
			var _loc2_:Object = this._549739530_showHelpText;
			if(_loc2_ !== param1)
			{
				this._549739530_showHelpText = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_showHelpText",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get _showSubContent() : Boolean
		{
			return this._1747463403_showSubContent;
		}
		
		private function set _showSubContent(param1:Boolean) : void
		{
			var _loc2_:Object = this._1747463403_showSubContent;
			if(_loc2_ !== param1)
			{
				this._1747463403_showSubContent = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_showSubContent",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get _isHideSkipTutorialButton() : Boolean
		{
			return this._1919900262_isHideSkipTutorialButton;
		}
		
		private function set _isHideSkipTutorialButton(param1:Boolean) : void
		{
			var _loc2_:Object = this._1919900262_isHideSkipTutorialButton;
			if(_loc2_ !== param1)
			{
				this._1919900262_isHideSkipTutorialButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_isHideSkipTutorialButton",_loc2_,param1));
				}
			}
		}
	}
}
