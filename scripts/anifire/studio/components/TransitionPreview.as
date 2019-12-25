package anifire.studio.components
{
	import anifire.assets.transition.AssetTransitionConstants;
	import anifire.util.UtilEffect;
	import anifire.util.UtilPlain;
	import caurina.transitions.Tweener;
	import com.jumpeye.flashEff2.core.interfaces.IFlashEffSymbolText;
	import com.jumpeye.flashEff2.symbol.brightSquares.FESBrightSquares;
	import fl.transitions.Transition;
	import fl.transitions.TransitionManager;
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import mx.binding.BindingManager;
	import mx.controls.SWFLoader;
	import mx.core.DeferredInstanceFromFunction;
	import mx.core.IFlexModuleFactory;
	import mx.core.IStateClient2;
	import mx.core.UIComponent;
	import mx.events.FlexEvent;
	import mx.events.PropertyChangeEvent;
	import mx.graphics.SolidColor;
	import mx.states.AddItems;
	import mx.states.SetProperty;
	import mx.states.State;
	import spark.components.Group;
	import spark.core.SpriteVisualElement;
	import spark.primitives.BitmapImage;
	import spark.primitives.Path;
	import spark.primitives.Rect;
	
	public class TransitionPreview extends Group implements IStateClient2
	{
		 
		
		public var _TransitionPreview_BitmapImage1:BitmapImage;
		
		public var _TransitionPreview_Rect2:Rect;
		
		private var _434221093chromeGroup:Group;
		
		private var _809612678contentGroup:Group;
		
		private var _669378032effectContainer:SpriteVisualElement;
		
		private var _1639030638effectGroup:Group;
		
		private var _155539587previewAppear:SWFLoader;
		
		private var _1291754417previewBlur:SWFLoader;
		
		private var _1561584551previewCleanBrush:SWFLoader;
		
		private var _1612356464previewCleanHand:SWFLoader;
		
		private var _1366394982previewHandSlide:SWFLoader;
		
		private var _1998817292previewInfoBlinds:SWFLoader;
		
		private var _144882231previewInfoIris:SWFLoader;
		
		private var _187203548previewInfoSplit:SWFLoader;
		
		private var _424073045previewIrisCircle:SWFLoader;
		
		private var _41656395previewPan:SWFLoader;
		
		private var _272942880previewPopDot:SWFLoader;
		
		private var _128294087previewPopRing:SWFLoader;
		
		private var _1330793697previewPopSingleRing:SWFLoader;
		
		private var _128254117previewPopStar:SWFLoader;
		
		private var _1373993271previewSlide:SWFLoader;
		
		private var _426247611previewWhiteboard:SWFLoader;
		
		private var _467481644previewWidget:SWFLoader;
		
		private var _1380882114previewWipeHand:SWFLoader;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private var GoAPreview:Class;
		
		protected var _transitionId:String;
		
		private var _assetEffectId:String;
		
		public const sourceImage:Class = TransitionPreview_sourceImage;
		
		public const sourceImage2:Class = TransitionPreview_sourceImage2;
		
		private var _embed_mxml__styles_images_transitions_prev_wipe_hand_swf_683842999:Class;
		
		private var _embed_mxml__styles_images_transitions_prev_info_iris_swf_534419899:Class;
		
		private var _embed_mxml__styles_images_enterexit_slide_thumb_swf_1995933577:Class;
		
		private var _embed_mxml__styles_images_enterexit_pop_dots_thumb_swf_1148945719:Class;
		
		private var _embed_mxml__styles_images_transitions_transition_b_png_1534884681:Class;
		
		private var _embed_mxml__styles_images_enterexit_widget_thumb_swf_1028359191:Class;
		
		private var _embed_mxml__styles_images_enterexit_pop_rings_thumb_swf_388910985:Class;
		
		private var _embed_mxml__styles_images_transitions_prev_info_blinds_swf_478042391:Class;
		
		private var _embed_mxml__styles_images_transitions_prev_info_split_swf_426421481:Class;
		
		private var _embed_mxml__styles_images_enterexit_appear_thumb_swf_1028360243:Class;
		
		private var _embed_mxml__styles_images_enterexit_pop_star_thumb_swf_1004829385:Class;
		
		private var _embed_mxml__styles_images_transitions_prev_clean_hand_swf_988394537:Class;
		
		private var _embed_mxml__styles_images_enterexit_hand_slide_thumb_swf_198744491:Class;
		
		private var _embed_mxml__styles_images_enterexit_whiteboard_thumb_swf_196274611:Class;
		
		private var _embed_mxml__styles_images_enterexit_pop_single_ring_thumb_swf_966257961:Class;
		
		private var _embed_mxml__styles_images_transitions_prev_clean_brush_swf_310205883:Class;
		
		private var _embed_mxml__styles_images_enterexit_iriscircle_thumb_swf_1530441175:Class;
		
		private var _embed_mxml__styles_images_enterexit_blur_thumb_swf_772751785:Class;
		
		private var _embed_mxml__styles_images_transitions_prev_pan_swf_1458081707:Class;
		
		public function TransitionPreview()
		{
			this.GoAPreview = TransitionPreview_GoAPreview;
			this._embed_mxml__styles_images_transitions_prev_wipe_hand_swf_683842999 = TransitionPreview__embed_mxml__styles_images_transitions_prev_wipe_hand_swf_683842999;
			this._embed_mxml__styles_images_transitions_prev_info_iris_swf_534419899 = TransitionPreview__embed_mxml__styles_images_transitions_prev_info_iris_swf_534419899;
			this._embed_mxml__styles_images_enterexit_slide_thumb_swf_1995933577 = TransitionPreview__embed_mxml__styles_images_enterexit_slide_thumb_swf_1995933577;
			this._embed_mxml__styles_images_enterexit_pop_dots_thumb_swf_1148945719 = TransitionPreview__embed_mxml__styles_images_enterexit_pop_dots_thumb_swf_1148945719;
			this._embed_mxml__styles_images_transitions_transition_b_png_1534884681 = TransitionPreview__embed_mxml__styles_images_transitions_transition_b_png_1534884681;
			this._embed_mxml__styles_images_enterexit_widget_thumb_swf_1028359191 = TransitionPreview__embed_mxml__styles_images_enterexit_widget_thumb_swf_1028359191;
			this._embed_mxml__styles_images_enterexit_pop_rings_thumb_swf_388910985 = TransitionPreview__embed_mxml__styles_images_enterexit_pop_rings_thumb_swf_388910985;
			this._embed_mxml__styles_images_transitions_prev_info_blinds_swf_478042391 = TransitionPreview__embed_mxml__styles_images_transitions_prev_info_blinds_swf_478042391;
			this._embed_mxml__styles_images_transitions_prev_info_split_swf_426421481 = TransitionPreview__embed_mxml__styles_images_transitions_prev_info_split_swf_426421481;
			this._embed_mxml__styles_images_enterexit_appear_thumb_swf_1028360243 = TransitionPreview__embed_mxml__styles_images_enterexit_appear_thumb_swf_1028360243;
			this._embed_mxml__styles_images_enterexit_pop_star_thumb_swf_1004829385 = TransitionPreview__embed_mxml__styles_images_enterexit_pop_star_thumb_swf_1004829385;
			this._embed_mxml__styles_images_transitions_prev_clean_hand_swf_988394537 = TransitionPreview__embed_mxml__styles_images_transitions_prev_clean_hand_swf_988394537;
			this._embed_mxml__styles_images_enterexit_hand_slide_thumb_swf_198744491 = TransitionPreview__embed_mxml__styles_images_enterexit_hand_slide_thumb_swf_198744491;
			this._embed_mxml__styles_images_enterexit_whiteboard_thumb_swf_196274611 = TransitionPreview__embed_mxml__styles_images_enterexit_whiteboard_thumb_swf_196274611;
			this._embed_mxml__styles_images_enterexit_pop_single_ring_thumb_swf_966257961 = TransitionPreview__embed_mxml__styles_images_enterexit_pop_single_ring_thumb_swf_966257961;
			this._embed_mxml__styles_images_transitions_prev_clean_brush_swf_310205883 = TransitionPreview__embed_mxml__styles_images_transitions_prev_clean_brush_swf_310205883;
			this._embed_mxml__styles_images_enterexit_iriscircle_thumb_swf_1530441175 = TransitionPreview__embed_mxml__styles_images_enterexit_iriscircle_thumb_swf_1530441175;
			this._embed_mxml__styles_images_enterexit_blur_thumb_swf_772751785 = TransitionPreview__embed_mxml__styles_images_enterexit_blur_thumb_swf_772751785;
			this._embed_mxml__styles_images_transitions_prev_pan_swf_1458081707 = TransitionPreview__embed_mxml__styles_images_transitions_prev_pan_swf_1458081707;
			super();
			mx_internal::_document = this;
			this.mxmlContent = [this._TransitionPreview_Rect1_c(),this._TransitionPreview_Path1_c(),this._TransitionPreview_Group2_i()];
			this.currentState = "assetNormal";
			var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._TransitionPreview_BitmapImage1_i);
			var _loc2_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._TransitionPreview_Group4_i);
			states = [new State({
				"name":"assetNormal",
				"stateGroups":["normal"],
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_loc2_,
					"destination":"contentGroup",
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["_TransitionPreview_Rect2"]
				})]
			}),new State({
				"name":"sceneNormal",
				"stateGroups":["normal"],
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_loc1_,
					"destination":"effectGroup",
					"propertyName":"mxmlContent",
					"position":"first"
				}),new AddItems().initializeFromObject({
					"itemsFactory":_loc2_,
					"destination":"contentGroup",
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["_TransitionPreview_Rect2"]
				})]
			}),new State({
				"name":"animationWipeHand",
				"overrides":[new SetProperty().initializeFromObject({
					"target":"previewWipeHand",
					"name":"visible",
					"value":true
				})]
			}),new State({
				"name":"animationCleanHand",
				"overrides":[new SetProperty().initializeFromObject({
					"target":"previewCleanHand",
					"name":"visible",
					"value":true
				})]
			}),new State({
				"name":"animationCleanBrush",
				"overrides":[new SetProperty().initializeFromObject({
					"target":"previewCleanBrush",
					"name":"visible",
					"value":true
				})]
			}),new State({
				"name":"pan",
				"overrides":[new SetProperty().initializeFromObject({
					"target":"previewPan",
					"name":"visible",
					"value":true
				})]
			}),new State({
				"name":"animationInfoBlinds",
				"overrides":[new SetProperty().initializeFromObject({
					"target":"previewInfoBlinds",
					"name":"visible",
					"value":true
				})]
			}),new State({
				"name":"animationInfoIris",
				"overrides":[new SetProperty().initializeFromObject({
					"target":"previewInfoIris",
					"name":"visible",
					"value":true
				})]
			}),new State({
				"name":"animationInfoSplit",
				"overrides":[new SetProperty().initializeFromObject({
					"target":"previewInfoSplit",
					"name":"visible",
					"value":true
				})]
			}),new State({
				"name":"animationAssetPopDot",
				"overrides":[new SetProperty().initializeFromObject({
					"target":"previewPopDot",
					"name":"visible",
					"value":true
				})]
			}),new State({
				"name":"animationAssetPopRing",
				"overrides":[new SetProperty().initializeFromObject({
					"target":"previewPopRing",
					"name":"visible",
					"value":true
				})]
			}),new State({
				"name":"animationAssetPopSingleRing",
				"overrides":[new SetProperty().initializeFromObject({
					"target":"previewPopSingleRing",
					"name":"visible",
					"value":true
				})]
			}),new State({
				"name":"animationAssetPopStar",
				"overrides":[new SetProperty().initializeFromObject({
					"target":"previewPopStar",
					"name":"visible",
					"value":true
				})]
			}),new State({
				"name":"animationAssetWhiteboard",
				"overrides":[new SetProperty().initializeFromObject({
					"target":"previewWhiteboard",
					"name":"visible",
					"value":true
				})]
			}),new State({
				"name":"animationAssetHandSlide",
				"overrides":[new SetProperty().initializeFromObject({
					"target":"previewHandSlide",
					"name":"visible",
					"value":true
				})]
			}),new State({
				"name":"animationAssetAppear",
				"overrides":[new SetProperty().initializeFromObject({
					"target":"previewAppear",
					"name":"visible",
					"value":true
				})]
			}),new State({
				"name":"animationAssetBlur",
				"overrides":[new SetProperty().initializeFromObject({
					"target":"previewBlur",
					"name":"visible",
					"value":true
				})]
			}),new State({
				"name":"animationAssetIrisCircle",
				"overrides":[new SetProperty().initializeFromObject({
					"target":"previewIrisCircle",
					"name":"visible",
					"value":true
				})]
			}),new State({
				"name":"animationAssetSlide",
				"overrides":[new SetProperty().initializeFromObject({
					"target":"previewSlide",
					"name":"visible",
					"value":true
				})]
			}),new State({
				"name":"animationAssetWidget",
				"overrides":[new SetProperty().initializeFromObject({
					"target":"previewWidget",
					"name":"visible",
					"value":true
				})]
			})];
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
		
		public function get assetEffectId() : String
		{
			return this._assetEffectId;
		}
		
		public function set assetEffectId(param1:String) : void
		{
			var _loc2_:MovieClip = null;
			var _loc3_:Bitmap = null;
			var _loc4_:UIComponent = null;
			var _loc5_:IFlashEffSymbolText = null;
			var _loc6_:FlashEff2Flex = null;
			var _loc7_:FlashEff2Flex = null;
			var _loc8_:IFlashEffSymbolText = null;
			var _loc9_:TextField = null;
			var _loc10_:TextFormat = null;
			if(this._transitionId == param1)
			{
				return;
			}
			this._assetEffectId = param1;
			if(!this._assetEffectId)
			{
				return;
			}
			if(AssetTransitionConstants.isTransitionAnimated(this._assetEffectId))
			{
				switch(this._assetEffectId)
				{
					case "SpritePopDots":
						currentState = "animationAssetPopDot";
						break;
					case "SpritePopRings":
						currentState = "animationAssetPopRing";
						break;
					case "SpritePopSingleRing":
						currentState = "animationAssetPopSingleRing";
						break;
					case "SpritePopStar":
						currentState = "animationAssetPopStar";
						break;
					case "HandDrawn":
						currentState = "animationAssetWhiteboard";
						break;
					case "HandSlide":
						currentState = "animationAssetHandSlide";
						break;
					case "Appear":
						currentState = "animationAssetAppear";
						break;
					case "Blur":
						currentState = "animationAssetBlur";
						break;
					case "IrisCircle":
						currentState = "animationAssetIrisCircle";
						break;
					case "Slide":
						currentState = "animationAssetSlide";
						break;
					case "WidgetAnimation":
						currentState = "animationAssetWidget";
				}
			}
			else
			{
				currentState = "assetNormal";
				UtilPlain.removeAllSon(this.effectContainer);
				_loc2_ = new MovieClip();
				_loc3_ = new this.sourceImage2();
				_loc2_.addChild(_loc3_);
				_loc4_ = new UIComponent();
				this.effectContainer.addChild(_loc4_);
				if(this._assetEffectId == "Fly")
				{
					_loc4_.addChild(_loc2_);
					Tweener.addTween(_loc2_,{
						"x":-_loc2_.width,
						"time":2.5
					});
				}
				else if(this._assetEffectId == "FadeDark")
				{
					_loc4_.addChild(_loc2_);
					Tweener.addTween(_loc2_,{
						"_color":3355443,
						"time":1.25
					});
					Tweener.addTween(_loc2_,{
						"alpha":0,
						"time":1.25,
						"delay":1.25
					});
				}
				else if(this._assetEffectId.indexOf("FES") == 0)
				{
					_loc4_.addChild(_loc2_);
					_loc5_ = AssetTransitionConstants.flashEffPlusParamById(this._assetEffectId,1);
					_loc6_ = new FlashEff2Flex();
					if(_loc5_ is FESBrightSquares)
					{
						FESBrightSquares(_loc5_).squareWidth = 5;
						FESBrightSquares(_loc5_).squareHeight = 5;
					}
					_loc5_.tweenDuration = 2.5;
					_loc6_.showTransition = _loc5_;
					_loc6_.showDelay = 0;
					_loc6_.target = MovieClip(_loc2_);
					_loc4_.addChild(_loc6_);
				}
				else if(this._assetEffectId.indexOf("FET") == 0)
				{
					_loc7_ = new FlashEff2Flex();
					_loc8_ = AssetTransitionConstants.flashEffPlusParamById(this._assetEffectId,0);
					_loc8_.tweenDuration = 1.5;
					_loc7_.showTransition = _loc8_;
					_loc7_.showDelay = 0;
					_loc9_ = new TextField();
					_loc9_.text = "Enter Motion";
					_loc10_ = new TextFormat("GoAPreview",10,16777215);
					_loc9_.setTextFormat(_loc10_);
					_loc9_.embedFonts = true;
					_loc9_.y = 8;
					_loc9_.x = 1;
					_loc4_.addChild(_loc9_);
					_loc7_.target = TextField(_loc9_);
					_loc4_.addChild(_loc7_);
				}
				else
				{
					_loc4_.addChild(_loc2_);
					TransitionManager.start(MovieClip(_loc2_),{
						"type":UtilEffect.getTransitionByName(this._assetEffectId),
						"direction":Transition.IN,
						"startPoint":5,
						"duration":2.5
					});
				}
			}
		}
		
		public function get transitionId() : String
		{
			return this._transitionId;
		}
		
		public function set transitionId(param1:String) : void
		{
			var _loc2_:MovieClip = null;
			var _loc3_:Bitmap = null;
			var _loc4_:UIComponent = null;
			var _loc5_:IFlashEffSymbolText = null;
			var _loc6_:FlashEff2Flex = null;
			if(this._transitionId == param1)
			{
				return;
			}
			this._transitionId = param1;
			if(!this._transitionId)
			{
				return;
			}
			if(AssetTransitionConstants.isTransitionAnimated(this._transitionId))
			{
				switch(this._transitionId)
				{
					case "WipeHand":
						currentState = "animationWipeHand";
						break;
					case "CleanHand":
						currentState = "animationCleanHand";
						break;
					case "CleanBrush":
						currentState = "animationCleanBrush";
						break;
					case "InfoBlinds":
						currentState = "animationInfoBlinds";
						break;
					case "InfoIris":
						currentState = "animationInfoIris";
						break;
					case "InfoSplit":
						currentState = "animationInfoSplit";
				}
			}
			else if(this._transitionId == "Pan")
			{
				currentState = "pan";
			}
			else
			{
				currentState = "sceneNormal";
				UtilPlain.removeAllSon(this.effectContainer);
				_loc2_ = new MovieClip();
				_loc3_ = new this.sourceImage();
				_loc2_.addChild(_loc3_);
				_loc4_ = new UIComponent();
				_loc4_.addChild(_loc2_);
				this.effectContainer.addChild(_loc4_);
				if(this._transitionId == "Fly")
				{
					Tweener.addTween(_loc2_,{
						"x":-_loc2_.width,
						"time":2.5
					});
				}
				else if(this._transitionId == "FadeDark")
				{
					Tweener.addTween(_loc2_,{
						"_color":3355443,
						"time":1.25
					});
					Tweener.addTween(_loc2_,{
						"alpha":0,
						"time":1.25,
						"delay":1.25
					});
				}
				else if(this._transitionId.indexOf("FES") == 0)
				{
					_loc5_ = AssetTransitionConstants.flashEffPlusParamById(this.transitionId,1);
					_loc6_ = new FlashEff2Flex();
					if(_loc5_ is FESBrightSquares)
					{
						FESBrightSquares(_loc5_).squareWidth = 5;
						FESBrightSquares(_loc5_).squareHeight = 5;
					}
					_loc5_.tweenDuration = 2.5;
					_loc6_.hideTransition = _loc5_;
					_loc6_.hideDelay = 0;
					_loc6_.target = MovieClip(_loc2_);
					_loc4_.addChild(_loc6_);
				}
				else
				{
					TransitionManager.start(MovieClip(_loc2_),{
						"type":UtilEffect.getTransitionByName(this.transitionId),
						"direction":Transition.OUT,
						"startPoint":5,
						"duration":2.5
					});
				}
			}
		}
		
		protected function previewShowHandler(param1:FlexEvent) : void
		{
			var _loc2_:SWFLoader = param1.currentTarget as SWFLoader;
			UtilPlain.gotoAndStopFamilyAt1(_loc2_.content);
			UtilPlain.playFamily(_loc2_.content);
		}
		
		private function _TransitionPreview_Rect1_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 8;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.radiusX = 3;
			_loc1_.fill = this._TransitionPreview_SolidColor1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _TransitionPreview_SolidColor1_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 2382211;
			return _loc1_;
		}
		
		private function _TransitionPreview_Path1_c() : Path
		{
			var _loc1_:Path = new Path();
			_loc1_.verticalCenter = 0;
			_loc1_.left = 0;
			_loc1_.data = "M 8 0 l -8 8 l 8 8 z";
			_loc1_.fill = this._TransitionPreview_SolidColor2_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _TransitionPreview_SolidColor2_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 2382211;
			return _loc1_;
		}
		
		private function _TransitionPreview_Group2_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.left = 8;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.mxmlContent = [this._TransitionPreview_Group3_i()];
			_loc1_.id = "chromeGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.chromeGroup = _loc1_;
			BindingManager.executeBindings(this,"chromeGroup",this.chromeGroup);
			return _loc1_;
		}
		
		private function _TransitionPreview_Group3_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.left = 4;
			_loc1_.right = 4;
			_loc1_.top = 4;
			_loc1_.bottom = 4;
			_loc1_.width = 55;
			_loc1_.height = 37;
			_loc1_.clipAndEnableScrolling = true;
			_loc1_.mxmlContent = [this._TransitionPreview_Rect2_i(),this._TransitionPreview_SWFLoader1_i(),this._TransitionPreview_SWFLoader2_i(),this._TransitionPreview_SWFLoader3_i(),this._TransitionPreview_SWFLoader4_i(),this._TransitionPreview_SWFLoader5_i(),this._TransitionPreview_SWFLoader6_i(),this._TransitionPreview_SWFLoader7_i(),this._TransitionPreview_SWFLoader8_i(),this._TransitionPreview_SWFLoader9_i(),this._TransitionPreview_SWFLoader10_i(),this._TransitionPreview_SWFLoader11_i(),this._TransitionPreview_SWFLoader12_i(),this._TransitionPreview_SWFLoader13_i(),this._TransitionPreview_SWFLoader14_i(),this._TransitionPreview_SWFLoader15_i(),this._TransitionPreview_SWFLoader16_i(),this._TransitionPreview_SWFLoader17_i(),this._TransitionPreview_SWFLoader18_i()];
			_loc1_.id = "contentGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.contentGroup = _loc1_;
			BindingManager.executeBindings(this,"contentGroup",this.contentGroup);
			return _loc1_;
		}
		
		private function _TransitionPreview_Rect2_i() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.fill = this._TransitionPreview_SolidColor3_c();
			_loc1_.initialized(this,"_TransitionPreview_Rect2");
			this._TransitionPreview_Rect2 = _loc1_;
			BindingManager.executeBindings(this,"_TransitionPreview_Rect2",this._TransitionPreview_Rect2);
			return _loc1_;
		}
		
		private function _TransitionPreview_SolidColor3_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 3569063;
			return _loc1_;
		}
		
		private function _TransitionPreview_Group4_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.mxmlContent = [this._TransitionPreview_SpriteVisualElement1_i()];
			_loc1_.id = "effectGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.effectGroup = _loc1_;
			BindingManager.executeBindings(this,"effectGroup",this.effectGroup);
			return _loc1_;
		}
		
		private function _TransitionPreview_BitmapImage1_i() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.source = this._embed_mxml__styles_images_transitions_transition_b_png_1534884681;
			_loc1_.initialized(this,"_TransitionPreview_BitmapImage1");
			this._TransitionPreview_BitmapImage1 = _loc1_;
			BindingManager.executeBindings(this,"_TransitionPreview_BitmapImage1",this._TransitionPreview_BitmapImage1);
			return _loc1_;
		}
		
		private function _TransitionPreview_SpriteVisualElement1_i() : SpriteVisualElement
		{
			var _loc1_:SpriteVisualElement = new SpriteVisualElement();
			_loc1_.scaleX = -1;
			_loc1_.initialized(this,"effectContainer");
			this.effectContainer = _loc1_;
			BindingManager.executeBindings(this,"effectContainer",this.effectContainer);
			return _loc1_;
		}
		
		private function _TransitionPreview_SWFLoader1_i() : SWFLoader
		{
			var _loc1_:SWFLoader = new SWFLoader();
			_loc1_.visible = false;
			_loc1_.source = this._embed_mxml__styles_images_transitions_prev_clean_hand_swf_988394537;
			_loc1_.addEventListener("show",this.__previewCleanHand_show);
			_loc1_.id = "previewCleanHand";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.previewCleanHand = _loc1_;
			BindingManager.executeBindings(this,"previewCleanHand",this.previewCleanHand);
			return _loc1_;
		}
		
		public function __previewCleanHand_show(param1:FlexEvent) : void
		{
			this.previewShowHandler(param1);
		}
		
		private function _TransitionPreview_SWFLoader2_i() : SWFLoader
		{
			var _loc1_:SWFLoader = new SWFLoader();
			_loc1_.visible = false;
			_loc1_.source = this._embed_mxml__styles_images_transitions_prev_clean_brush_swf_310205883;
			_loc1_.addEventListener("show",this.__previewCleanBrush_show);
			_loc1_.id = "previewCleanBrush";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.previewCleanBrush = _loc1_;
			BindingManager.executeBindings(this,"previewCleanBrush",this.previewCleanBrush);
			return _loc1_;
		}
		
		public function __previewCleanBrush_show(param1:FlexEvent) : void
		{
			this.previewShowHandler(param1);
		}
		
		private function _TransitionPreview_SWFLoader3_i() : SWFLoader
		{
			var _loc1_:SWFLoader = new SWFLoader();
			_loc1_.visible = false;
			_loc1_.source = this._embed_mxml__styles_images_transitions_prev_wipe_hand_swf_683842999;
			_loc1_.addEventListener("show",this.__previewWipeHand_show);
			_loc1_.id = "previewWipeHand";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.previewWipeHand = _loc1_;
			BindingManager.executeBindings(this,"previewWipeHand",this.previewWipeHand);
			return _loc1_;
		}
		
		public function __previewWipeHand_show(param1:FlexEvent) : void
		{
			this.previewShowHandler(param1);
		}
		
		private function _TransitionPreview_SWFLoader4_i() : SWFLoader
		{
			var _loc1_:SWFLoader = new SWFLoader();
			_loc1_.visible = false;
			_loc1_.source = this._embed_mxml__styles_images_transitions_prev_pan_swf_1458081707;
			_loc1_.addEventListener("show",this.__previewPan_show);
			_loc1_.id = "previewPan";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.previewPan = _loc1_;
			BindingManager.executeBindings(this,"previewPan",this.previewPan);
			return _loc1_;
		}
		
		public function __previewPan_show(param1:FlexEvent) : void
		{
			this.previewShowHandler(param1);
		}
		
		private function _TransitionPreview_SWFLoader5_i() : SWFLoader
		{
			var _loc1_:SWFLoader = new SWFLoader();
			_loc1_.visible = false;
			_loc1_.source = this._embed_mxml__styles_images_transitions_prev_info_blinds_swf_478042391;
			_loc1_.addEventListener("show",this.__previewInfoBlinds_show);
			_loc1_.id = "previewInfoBlinds";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.previewInfoBlinds = _loc1_;
			BindingManager.executeBindings(this,"previewInfoBlinds",this.previewInfoBlinds);
			return _loc1_;
		}
		
		public function __previewInfoBlinds_show(param1:FlexEvent) : void
		{
			this.previewShowHandler(param1);
		}
		
		private function _TransitionPreview_SWFLoader6_i() : SWFLoader
		{
			var _loc1_:SWFLoader = new SWFLoader();
			_loc1_.visible = false;
			_loc1_.source = this._embed_mxml__styles_images_transitions_prev_info_iris_swf_534419899;
			_loc1_.addEventListener("show",this.__previewInfoIris_show);
			_loc1_.id = "previewInfoIris";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.previewInfoIris = _loc1_;
			BindingManager.executeBindings(this,"previewInfoIris",this.previewInfoIris);
			return _loc1_;
		}
		
		public function __previewInfoIris_show(param1:FlexEvent) : void
		{
			this.previewShowHandler(param1);
		}
		
		private function _TransitionPreview_SWFLoader7_i() : SWFLoader
		{
			var _loc1_:SWFLoader = new SWFLoader();
			_loc1_.visible = false;
			_loc1_.source = this._embed_mxml__styles_images_transitions_prev_info_split_swf_426421481;
			_loc1_.addEventListener("show",this.__previewInfoSplit_show);
			_loc1_.id = "previewInfoSplit";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.previewInfoSplit = _loc1_;
			BindingManager.executeBindings(this,"previewInfoSplit",this.previewInfoSplit);
			return _loc1_;
		}
		
		public function __previewInfoSplit_show(param1:FlexEvent) : void
		{
			this.previewShowHandler(param1);
		}
		
		private function _TransitionPreview_SWFLoader8_i() : SWFLoader
		{
			var _loc1_:SWFLoader = new SWFLoader();
			_loc1_.visible = false;
			_loc1_.source = this._embed_mxml__styles_images_enterexit_appear_thumb_swf_1028360243;
			_loc1_.addEventListener("show",this.__previewAppear_show);
			_loc1_.id = "previewAppear";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.previewAppear = _loc1_;
			BindingManager.executeBindings(this,"previewAppear",this.previewAppear);
			return _loc1_;
		}
		
		public function __previewAppear_show(param1:FlexEvent) : void
		{
			this.previewShowHandler(param1);
		}
		
		private function _TransitionPreview_SWFLoader9_i() : SWFLoader
		{
			var _loc1_:SWFLoader = new SWFLoader();
			_loc1_.visible = false;
			_loc1_.source = this._embed_mxml__styles_images_enterexit_iriscircle_thumb_swf_1530441175;
			_loc1_.addEventListener("show",this.__previewIrisCircle_show);
			_loc1_.id = "previewIrisCircle";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.previewIrisCircle = _loc1_;
			BindingManager.executeBindings(this,"previewIrisCircle",this.previewIrisCircle);
			return _loc1_;
		}
		
		public function __previewIrisCircle_show(param1:FlexEvent) : void
		{
			this.previewShowHandler(param1);
		}
		
		private function _TransitionPreview_SWFLoader10_i() : SWFLoader
		{
			var _loc1_:SWFLoader = new SWFLoader();
			_loc1_.visible = false;
			_loc1_.source = this._embed_mxml__styles_images_enterexit_pop_dots_thumb_swf_1148945719;
			_loc1_.addEventListener("show",this.__previewPopDot_show);
			_loc1_.id = "previewPopDot";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.previewPopDot = _loc1_;
			BindingManager.executeBindings(this,"previewPopDot",this.previewPopDot);
			return _loc1_;
		}
		
		public function __previewPopDot_show(param1:FlexEvent) : void
		{
			this.previewShowHandler(param1);
		}
		
		private function _TransitionPreview_SWFLoader11_i() : SWFLoader
		{
			var _loc1_:SWFLoader = new SWFLoader();
			_loc1_.visible = false;
			_loc1_.source = this._embed_mxml__styles_images_enterexit_pop_rings_thumb_swf_388910985;
			_loc1_.addEventListener("show",this.__previewPopRing_show);
			_loc1_.id = "previewPopRing";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.previewPopRing = _loc1_;
			BindingManager.executeBindings(this,"previewPopRing",this.previewPopRing);
			return _loc1_;
		}
		
		public function __previewPopRing_show(param1:FlexEvent) : void
		{
			this.previewShowHandler(param1);
		}
		
		private function _TransitionPreview_SWFLoader12_i() : SWFLoader
		{
			var _loc1_:SWFLoader = new SWFLoader();
			_loc1_.visible = false;
			_loc1_.source = this._embed_mxml__styles_images_enterexit_pop_single_ring_thumb_swf_966257961;
			_loc1_.addEventListener("show",this.__previewPopSingleRing_show);
			_loc1_.id = "previewPopSingleRing";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.previewPopSingleRing = _loc1_;
			BindingManager.executeBindings(this,"previewPopSingleRing",this.previewPopSingleRing);
			return _loc1_;
		}
		
		public function __previewPopSingleRing_show(param1:FlexEvent) : void
		{
			this.previewShowHandler(param1);
		}
		
		private function _TransitionPreview_SWFLoader13_i() : SWFLoader
		{
			var _loc1_:SWFLoader = new SWFLoader();
			_loc1_.visible = false;
			_loc1_.source = this._embed_mxml__styles_images_enterexit_pop_star_thumb_swf_1004829385;
			_loc1_.addEventListener("show",this.__previewPopStar_show);
			_loc1_.id = "previewPopStar";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.previewPopStar = _loc1_;
			BindingManager.executeBindings(this,"previewPopStar",this.previewPopStar);
			return _loc1_;
		}
		
		public function __previewPopStar_show(param1:FlexEvent) : void
		{
			this.previewShowHandler(param1);
		}
		
		private function _TransitionPreview_SWFLoader14_i() : SWFLoader
		{
			var _loc1_:SWFLoader = new SWFLoader();
			_loc1_.visible = false;
			_loc1_.source = this._embed_mxml__styles_images_enterexit_whiteboard_thumb_swf_196274611;
			_loc1_.addEventListener("show",this.__previewWhiteboard_show);
			_loc1_.id = "previewWhiteboard";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.previewWhiteboard = _loc1_;
			BindingManager.executeBindings(this,"previewWhiteboard",this.previewWhiteboard);
			return _loc1_;
		}
		
		public function __previewWhiteboard_show(param1:FlexEvent) : void
		{
			this.previewShowHandler(param1);
		}
		
		private function _TransitionPreview_SWFLoader15_i() : SWFLoader
		{
			var _loc1_:SWFLoader = new SWFLoader();
			_loc1_.visible = false;
			_loc1_.source = this._embed_mxml__styles_images_enterexit_blur_thumb_swf_772751785;
			_loc1_.addEventListener("show",this.__previewBlur_show);
			_loc1_.id = "previewBlur";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.previewBlur = _loc1_;
			BindingManager.executeBindings(this,"previewBlur",this.previewBlur);
			return _loc1_;
		}
		
		public function __previewBlur_show(param1:FlexEvent) : void
		{
			this.previewShowHandler(param1);
		}
		
		private function _TransitionPreview_SWFLoader16_i() : SWFLoader
		{
			var _loc1_:SWFLoader = new SWFLoader();
			_loc1_.visible = false;
			_loc1_.source = this._embed_mxml__styles_images_enterexit_hand_slide_thumb_swf_198744491;
			_loc1_.addEventListener("show",this.__previewHandSlide_show);
			_loc1_.id = "previewHandSlide";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.previewHandSlide = _loc1_;
			BindingManager.executeBindings(this,"previewHandSlide",this.previewHandSlide);
			return _loc1_;
		}
		
		public function __previewHandSlide_show(param1:FlexEvent) : void
		{
			this.previewShowHandler(param1);
		}
		
		private function _TransitionPreview_SWFLoader17_i() : SWFLoader
		{
			var _loc1_:SWFLoader = new SWFLoader();
			_loc1_.visible = false;
			_loc1_.source = this._embed_mxml__styles_images_enterexit_slide_thumb_swf_1995933577;
			_loc1_.addEventListener("show",this.__previewSlide_show);
			_loc1_.id = "previewSlide";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.previewSlide = _loc1_;
			BindingManager.executeBindings(this,"previewSlide",this.previewSlide);
			return _loc1_;
		}
		
		public function __previewSlide_show(param1:FlexEvent) : void
		{
			this.previewShowHandler(param1);
		}
		
		private function _TransitionPreview_SWFLoader18_i() : SWFLoader
		{
			var _loc1_:SWFLoader = new SWFLoader();
			_loc1_.visible = false;
			_loc1_.source = this._embed_mxml__styles_images_enterexit_widget_thumb_swf_1028359191;
			_loc1_.addEventListener("show",this.__previewWidget_show);
			_loc1_.id = "previewWidget";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.previewWidget = _loc1_;
			BindingManager.executeBindings(this,"previewWidget",this.previewWidget);
			return _loc1_;
		}
		
		public function __previewWidget_show(param1:FlexEvent) : void
		{
			this.previewShowHandler(param1);
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
		public function get contentGroup() : Group
		{
			return this._809612678contentGroup;
		}
		
		public function set contentGroup(param1:Group) : void
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
		public function get effectContainer() : SpriteVisualElement
		{
			return this._669378032effectContainer;
		}
		
		public function set effectContainer(param1:SpriteVisualElement) : void
		{
			var _loc2_:Object = this._669378032effectContainer;
			if(_loc2_ !== param1)
			{
				this._669378032effectContainer = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"effectContainer",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get effectGroup() : Group
		{
			return this._1639030638effectGroup;
		}
		
		public function set effectGroup(param1:Group) : void
		{
			var _loc2_:Object = this._1639030638effectGroup;
			if(_loc2_ !== param1)
			{
				this._1639030638effectGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"effectGroup",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get previewAppear() : SWFLoader
		{
			return this._155539587previewAppear;
		}
		
		public function set previewAppear(param1:SWFLoader) : void
		{
			var _loc2_:Object = this._155539587previewAppear;
			if(_loc2_ !== param1)
			{
				this._155539587previewAppear = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"previewAppear",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get previewBlur() : SWFLoader
		{
			return this._1291754417previewBlur;
		}
		
		public function set previewBlur(param1:SWFLoader) : void
		{
			var _loc2_:Object = this._1291754417previewBlur;
			if(_loc2_ !== param1)
			{
				this._1291754417previewBlur = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"previewBlur",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get previewCleanBrush() : SWFLoader
		{
			return this._1561584551previewCleanBrush;
		}
		
		public function set previewCleanBrush(param1:SWFLoader) : void
		{
			var _loc2_:Object = this._1561584551previewCleanBrush;
			if(_loc2_ !== param1)
			{
				this._1561584551previewCleanBrush = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"previewCleanBrush",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get previewCleanHand() : SWFLoader
		{
			return this._1612356464previewCleanHand;
		}
		
		public function set previewCleanHand(param1:SWFLoader) : void
		{
			var _loc2_:Object = this._1612356464previewCleanHand;
			if(_loc2_ !== param1)
			{
				this._1612356464previewCleanHand = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"previewCleanHand",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get previewHandSlide() : SWFLoader
		{
			return this._1366394982previewHandSlide;
		}
		
		public function set previewHandSlide(param1:SWFLoader) : void
		{
			var _loc2_:Object = this._1366394982previewHandSlide;
			if(_loc2_ !== param1)
			{
				this._1366394982previewHandSlide = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"previewHandSlide",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get previewInfoBlinds() : SWFLoader
		{
			return this._1998817292previewInfoBlinds;
		}
		
		public function set previewInfoBlinds(param1:SWFLoader) : void
		{
			var _loc2_:Object = this._1998817292previewInfoBlinds;
			if(_loc2_ !== param1)
			{
				this._1998817292previewInfoBlinds = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"previewInfoBlinds",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get previewInfoIris() : SWFLoader
		{
			return this._144882231previewInfoIris;
		}
		
		public function set previewInfoIris(param1:SWFLoader) : void
		{
			var _loc2_:Object = this._144882231previewInfoIris;
			if(_loc2_ !== param1)
			{
				this._144882231previewInfoIris = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"previewInfoIris",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get previewInfoSplit() : SWFLoader
		{
			return this._187203548previewInfoSplit;
		}
		
		public function set previewInfoSplit(param1:SWFLoader) : void
		{
			var _loc2_:Object = this._187203548previewInfoSplit;
			if(_loc2_ !== param1)
			{
				this._187203548previewInfoSplit = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"previewInfoSplit",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get previewIrisCircle() : SWFLoader
		{
			return this._424073045previewIrisCircle;
		}
		
		public function set previewIrisCircle(param1:SWFLoader) : void
		{
			var _loc2_:Object = this._424073045previewIrisCircle;
			if(_loc2_ !== param1)
			{
				this._424073045previewIrisCircle = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"previewIrisCircle",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get previewPan() : SWFLoader
		{
			return this._41656395previewPan;
		}
		
		public function set previewPan(param1:SWFLoader) : void
		{
			var _loc2_:Object = this._41656395previewPan;
			if(_loc2_ !== param1)
			{
				this._41656395previewPan = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"previewPan",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get previewPopDot() : SWFLoader
		{
			return this._272942880previewPopDot;
		}
		
		public function set previewPopDot(param1:SWFLoader) : void
		{
			var _loc2_:Object = this._272942880previewPopDot;
			if(_loc2_ !== param1)
			{
				this._272942880previewPopDot = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"previewPopDot",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get previewPopRing() : SWFLoader
		{
			return this._128294087previewPopRing;
		}
		
		public function set previewPopRing(param1:SWFLoader) : void
		{
			var _loc2_:Object = this._128294087previewPopRing;
			if(_loc2_ !== param1)
			{
				this._128294087previewPopRing = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"previewPopRing",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get previewPopSingleRing() : SWFLoader
		{
			return this._1330793697previewPopSingleRing;
		}
		
		public function set previewPopSingleRing(param1:SWFLoader) : void
		{
			var _loc2_:Object = this._1330793697previewPopSingleRing;
			if(_loc2_ !== param1)
			{
				this._1330793697previewPopSingleRing = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"previewPopSingleRing",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get previewPopStar() : SWFLoader
		{
			return this._128254117previewPopStar;
		}
		
		public function set previewPopStar(param1:SWFLoader) : void
		{
			var _loc2_:Object = this._128254117previewPopStar;
			if(_loc2_ !== param1)
			{
				this._128254117previewPopStar = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"previewPopStar",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get previewSlide() : SWFLoader
		{
			return this._1373993271previewSlide;
		}
		
		public function set previewSlide(param1:SWFLoader) : void
		{
			var _loc2_:Object = this._1373993271previewSlide;
			if(_loc2_ !== param1)
			{
				this._1373993271previewSlide = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"previewSlide",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get previewWhiteboard() : SWFLoader
		{
			return this._426247611previewWhiteboard;
		}
		
		public function set previewWhiteboard(param1:SWFLoader) : void
		{
			var _loc2_:Object = this._426247611previewWhiteboard;
			if(_loc2_ !== param1)
			{
				this._426247611previewWhiteboard = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"previewWhiteboard",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get previewWidget() : SWFLoader
		{
			return this._467481644previewWidget;
		}
		
		public function set previewWidget(param1:SWFLoader) : void
		{
			var _loc2_:Object = this._467481644previewWidget;
			if(_loc2_ !== param1)
			{
				this._467481644previewWidget = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"previewWidget",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get previewWipeHand() : SWFLoader
		{
			return this._1380882114previewWipeHand;
		}
		
		public function set previewWipeHand(param1:SWFLoader) : void
		{
			var _loc2_:Object = this._1380882114previewWipeHand;
			if(_loc2_ !== param1)
			{
				this._1380882114previewWipeHand = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"previewWipeHand",_loc2_,param1));
				}
			}
		}
	}
}
