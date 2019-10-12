package anifire.studio.components
{
   import anifire.assets.transition.AssetTransitionConstants;
   import anifire.interfaces.IIterator;
   import anifire.studio.assets.models.AssetTransition;
   import anifire.studio.core.Console;
   import anifire.studio.events.AssetTransitionEvent;
   import anifire.studio.interfaces.IAssetView;
   import anifire.studio.skins.RemoveAssetTransitionButtonSkin;
   import anifire.studio.skins.SoundToggleButtonSkin;
   import anifire.util.UtilDict;
   import anifire.util.UtilUnitConvert;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.utils.StringUtil;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.ToggleButton;
   import spark.components.VGroup;
   import spark.components.supportClasses.ItemRenderer;
   import spark.effects.Fade;
   import spark.primitives.BitmapImage;
   import spark.primitives.Ellipse;
   import spark.primitives.Path;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class TransitionItemRenderer extends ItemRenderer implements IBindingClient, IStateClient2
   {
      
      private static const COLOR_ENTER:uint = 8103216;
      
      private static const COLOR_MOVEMENT:uint = 3233154;
      
      private static const COLOR_EXIT:uint = 11493980;
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _TransitionItemRenderer_Group3:Group;
      
      public var _TransitionItemRenderer_Label5:Label;
      
      public var _TransitionItemRenderer_Label6:Label;
      
      public var _TransitionItemRenderer_Label7:Label;
      
      private var _977194244_TransitionItemRenderer_SolidColor1:SolidColor;
      
      public var _TransitionItemRenderer_SolidColor2:SolidColor;
      
      private var _1781625235buttonGroup:HGroup;
      
      private var _1664987343delayLabel:Label;
      
      private var _489039960descriptionLabel:Label;
      
      private var _122527168durationLabel:Label;
      
      private var _1020166578fadeInEffect:Fade;
      
      private var _1339123498removeButton:Button;
      
      private var _1439864097soundButton:ToggleButton;
      
      private var _111594124textContent:VGroup;
      
      private var _1330532588thumbnail:AssetThumbnail;
      
      private var _1825076728thumbnailMask:Group;
      
      private var _501248986typeLabel:Label;
      
      private var _1592938139warningPopUpAnchor:spark.components.PopUpAnchor;
      
      private var _306557879warningPopUpAnchorForHandDrawn:spark.components.PopUpAnchor;
      
      private var _1496383842warningPopUpAnchorForTextEffect:spark.components.PopUpAnchor;
      
      private var _481045639warningSign:Group;
      
      private var _614815691warningSignForHandDrawn:Group;
      
      private var _1832525874warningSignForTextEffect:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _transition:AssetTransition;
      
      private var _isHovered:Boolean;
      
      private var _492028862_colorType:uint = 8103216;
      
      private var _204380986_durationIconVisible:Boolean = true;
      
      private var _embed_mxml__styles_images_panel_enterexit_alert_png_1584402313:Class;
      
      private var _embed_mxml__styles_images_panel_enterexit_duration_png_2078562633:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function TransitionItemRenderer()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__styles_images_panel_enterexit_alert_png_1584402313 = TransitionItemRenderer__embed_mxml__styles_images_panel_enterexit_alert_png_1584402313;
         this._embed_mxml__styles_images_panel_enterexit_duration_png_2078562633 = TransitionItemRenderer__embed_mxml__styles_images_panel_enterexit_duration_png_2078562633;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._TransitionItemRenderer_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_TransitionItemRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return TransitionItemRenderer[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.height = 46;
         this.autoDrawBackground = false;
         this.buttonMode = true;
         this.mxmlContent = [this._TransitionItemRenderer_Rect1_c(),this._TransitionItemRenderer_HGroup1_c(),this._TransitionItemRenderer_Group4_i(),this._TransitionItemRenderer_Group7_i(),this._TransitionItemRenderer_Group10_i(),this._TransitionItemRenderer_HGroup4_i()];
         this.currentState = "normal";
         this._TransitionItemRenderer_Fade1_i();
         this.addEventListener("rollOver",this.___TransitionItemRenderer_ItemRenderer1_rollOver);
         this.addEventListener("rollOut",this.___TransitionItemRenderer_ItemRenderer1_rollOut);
         this.addEventListener("click",this.___TransitionItemRenderer_ItemRenderer1_click);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "stateGroups":["overAndSelectedStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_TransitionItemRenderer_SolidColor1",
               "name":"color",
               "value":16772027
            })]
         }),new State({
            "name":"selected",
            "stateGroups":["borderStates","overAndSelectedStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_TransitionItemRenderer_SolidColor1",
               "name":"color",
               "value":16772027
            })]
         }),new State({
            "name":"dragging",
            "stateGroups":["borderStates"],
            "overrides":[]
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
         TransitionItemRenderer._watcherSetupUtil = param1;
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
      protected function get isHovered() : Boolean
      {
         return this._isHovered;
      }
      
      protected function set _521256529isHovered(param1:Boolean) : void
      {
         if(this._isHovered != param1)
         {
            this._isHovered = param1;
            this.removeButton.visible = param1;
            this.updateSoundButtonState();
         }
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         if(this._transition)
         {
            this._transition.removeEventListener(Event.CHANGE,this.transition_changeHandler);
            this._transition.removeEventListener(AssetTransitionEvent.CONFLICT_CHANGE,this.transition_changeHandler);
            this._transition.removeEventListener(AssetTransitionEvent.CONFLICT_WITH_OTHER_HAND_DRAWN_CHANGE,this.transition_changeHandler);
            this._transition.removeEventListener(AssetTransitionEvent.CONFLICT_WITH_FONT_FAMILY_CHANGE,this.transition_changeHandler);
            if(this._transition.setting)
            {
               this._transition.setting.removeEventListener(Event.CHANGE,this.transition_changeHandler);
            }
         }
         this._transition = param1 as AssetTransition;
         if(this._transition)
         {
            this.updateThumbnailTarget();
            this.refreshUI();
            this._transition.addEventListener(Event.CHANGE,this.transition_changeHandler);
            this._transition.addEventListener(AssetTransitionEvent.CONFLICT_CHANGE,this.transition_changeHandler);
            this._transition.addEventListener(AssetTransitionEvent.CONFLICT_WITH_OTHER_HAND_DRAWN_CHANGE,this.transition_changeHandler);
            this._transition.addEventListener(AssetTransitionEvent.CONFLICT_WITH_FONT_FAMILY_CHANGE,this.transition_changeHandler);
            if(this._transition.setting)
            {
               this._transition.setting.addEventListener(Event.CHANGE,this.transition_changeHandler);
            }
         }
      }
      
      private function transition_changeHandler(param1:Event) : void
      {
         this.refreshUI();
      }
      
      private function updateThumbnailTarget() : void
      {
         var _loc4_:IAssetView = null;
         this.thumbnail.visible = false;
         var _loc1_:SceneEditor = Console.getConsole().mainStage.sceneEditor;
         var _loc2_:ScenePreview = _loc1_.view;
         var _loc3_:IIterator = _loc2_.iterator();
         while(_loc3_.hasNext)
         {
            _loc4_ = _loc3_.next as IAssetView;
            if(_loc4_ && _loc4_.asset.id == this._transition.assetId)
            {
               this.thumbnail.target = _loc4_;
               this.thumbnail.visible = true;
               break;
            }
         }
      }
      
      private function refreshUI() : void
      {
         if(this._transition && this.typeLabel)
         {
            this.typeLabel.text = AssetTransitionConstants.getDirectionLabel(this._transition.direction) + " > ";
            if(this._transition.direction == AssetTransitionConstants.DIRECTION_MOVEMENT && this._transition.characterActionName)
            {
               this.typeLabel.text = this.typeLabel.text + this._transition.characterActionName;
            }
            else
            {
               this.typeLabel.text = this.typeLabel.text + AssetTransitionConstants.getTypeLabel(this._transition.type);
            }
            this.descriptionLabel.text = AssetTransitionConstants.getTimingLabel(this._transition.timing);
            if(this._transition.delay > 0)
            {
               this.delayLabel.text = StringUtil.substitute(UtilDict.translate("+{0}s delay"),UtilUnitConvert.frameToDuration(this._transition.delay).toString());
               this.delayLabel.includeInLayout = true;
            }
            else
            {
               this.delayLabel.text = "";
               this.delayLabel.includeInLayout = false;
            }
            this.durationLabel.text = UtilUnitConvert.frameToDuration(this._transition.duration).toString() + "s";
            if(this._transition.section == AssetTransitionConstants.TIMING_WHOLE_SCENE)
            {
               this.descriptionLabel.text = "lasts for whole scene";
               this.durationLabel.text = "";
               this.delayLabel.text = "";
               this.delayLabel.includeInLayout = false;
               this._durationIconVisible = false;
            }
            else
            {
               this._durationIconVisible = true;
            }
            if(this._transition.direction == AssetTransitionConstants.DIRECTION_IN)
            {
               this._colorType = COLOR_ENTER;
            }
            else if(this._transition.direction == AssetTransitionConstants.DIRECTION_OUT)
            {
               this._colorType = COLOR_EXIT;
            }
            else
            {
               this._colorType = COLOR_MOVEMENT;
            }
            this.warningSign.visible = this._transition.conflict;
            this.warningSignForHandDrawn.visible = this._transition.conflictWithOtherHandDrawn;
            this.warningSignForTextEffect.visible = this._transition.conflictWithFontFamily;
            this.thumbnail.invalidateDisplayList();
            this.updateSoundButtonState();
            this.fadeInEffect.stop();
            this.fadeInEffect.play([this.textContent]);
         }
      }
      
      public function updateSoundButtonState() : void
      {
         if(this._transition)
         {
            if(this._transition.section == AssetTransitionConstants.TIMING_WHOLE_SCENE)
            {
               this.soundButton.visible = false;
            }
            else
            {
               this.soundButton.selected = this._transition.soundMode == AssetTransitionConstants.SOUND_ON;
               this.soundButton.visible = this.soundButton.selected || this.isHovered;
            }
         }
      }
      
      protected function onRemoveButtonClick(param1:MouseEvent) : void
      {
         dispatchEvent(new Event("removeTransition"));
      }
      
      protected function onSoundToggle() : void
      {
         dispatchEvent(new Event("toggleSound"));
      }
      
      protected function rollOverHandler(param1:MouseEvent) : void
      {
         this.isHovered = true;
      }
      
      protected function rollOutHandler(param1:MouseEvent) : void
      {
         this.isHovered = false;
      }
      
      protected function clickHandler(param1:MouseEvent) : void
      {
         this.fadeInEffect.stop();
         this.fadeInEffect.play([this.textContent]);
      }
      
      private function _TransitionItemRenderer_Fade1_i() : Fade
      {
         var _loc1_:Fade = new Fade();
         _loc1_.duration = 500;
         _loc1_.alphaFrom = 0.25;
         _loc1_.alphaTo = 1;
         this.fadeInEffect = _loc1_;
         BindingManager.executeBindings(this,"fadeInEffect",this.fadeInEffect);
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 10;
         _loc1_.right = 10;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._TransitionItemRenderer_SolidColor1_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         this._TransitionItemRenderer_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_TransitionItemRenderer_SolidColor1",this._TransitionItemRenderer_SolidColor1);
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.left = 10;
         _loc1_.right = 10;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.gap = 0;
         _loc1_.verticalAlign = "middle";
         _loc1_.paddingLeft = 0;
         _loc1_.paddingRight = 0;
         _loc1_.paddingTop = 0;
         _loc1_.paddingBottom = 0;
         _loc1_.mxmlContent = [this._TransitionItemRenderer_Rect2_c(),this._TransitionItemRenderer_HGroup2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.width = 10;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._TransitionItemRenderer_SolidColor2_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_SolidColor2_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         this._TransitionItemRenderer_SolidColor2 = _loc1_;
         BindingManager.executeBindings(this,"_TransitionItemRenderer_SolidColor2",this._TransitionItemRenderer_SolidColor2);
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = 5;
         _loc1_.verticalAlign = "middle";
         _loc1_.height = 10;
         _loc1_.paddingLeft = 5;
         _loc1_.paddingRight = 5;
         _loc1_.paddingTop = 0;
         _loc1_.paddingBottom = 0;
         _loc1_.mxmlContent = [this._TransitionItemRenderer_Group1_c(),this._TransitionItemRenderer_VGroup1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 33;
         _loc1_.height = 33;
         _loc1_.mxmlContent = [this._TransitionItemRenderer_Ellipse1_c(),this._TransitionItemRenderer_Group2_i(),this._TransitionItemRenderer_AssetThumbnail1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_Ellipse1_c() : Ellipse
      {
         var _loc1_:Ellipse = new Ellipse();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._TransitionItemRenderer_SolidColor3_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_SolidColor3_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 4018562;
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.mxmlContent = [this._TransitionItemRenderer_Ellipse2_c()];
         _loc1_.id = "thumbnailMask";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.thumbnailMask = _loc1_;
         BindingManager.executeBindings(this,"thumbnailMask",this.thumbnailMask);
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_Ellipse2_c() : Ellipse
      {
         var _loc1_:Ellipse = new Ellipse();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._TransitionItemRenderer_SolidColor4_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_SolidColor4_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 4018562;
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_AssetThumbnail1_i() : AssetThumbnail
      {
         var _loc1_:AssetThumbnail = new AssetThumbnail();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.id = "thumbnail";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.thumbnail = _loc1_;
         BindingManager.executeBindings(this,"thumbnail",this.thumbnail);
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.verticalAlign = "middle";
         _loc1_.mouseEnabled = false;
         _loc1_.mouseChildren = false;
         _loc1_.mxmlContent = [this._TransitionItemRenderer_Label1_i(),this._TransitionItemRenderer_HGroup3_c()];
         _loc1_.id = "textContent";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.textContent = _loc1_;
         BindingManager.executeBindings(this,"textContent",this.textContent);
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.width = 180;
         _loc1_.maxDisplayedLines = 1;
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("fontSize",13);
         _loc1_.id = "typeLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.typeLabel = _loc1_;
         BindingManager.executeBindings(this,"typeLabel",this.typeLabel);
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_HGroup3_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.verticalAlign = "middle";
         _loc1_.gap = 2;
         _loc1_.mxmlContent = [this._TransitionItemRenderer_Label2_i(),this._TransitionItemRenderer_Label3_i(),this._TransitionItemRenderer_Group3_i(),this._TransitionItemRenderer_Label4_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("fontSize",12);
         _loc1_.id = "descriptionLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.descriptionLabel = _loc1_;
         BindingManager.executeBindings(this,"descriptionLabel",this.descriptionLabel);
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_Label3_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("fontSize",12);
         _loc1_.id = "delayLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.delayLabel = _loc1_;
         BindingManager.executeBindings(this,"delayLabel",this.delayLabel);
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 18;
         _loc1_.height = 12;
         _loc1_.mxmlContent = [this._TransitionItemRenderer_BitmapImage1_c()];
         _loc1_.id = "_TransitionItemRenderer_Group3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._TransitionItemRenderer_Group3 = _loc1_;
         BindingManager.executeBindings(this,"_TransitionItemRenderer_Group3",this._TransitionItemRenderer_Group3);
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_BitmapImage1_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.bottom = 1;
         _loc1_.right = 1;
         _loc1_.source = this._embed_mxml__styles_images_panel_enterexit_duration_png_2078562633;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_Label4_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("fontSize",12);
         _loc1_.id = "durationLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.durationLabel = _loc1_;
         BindingManager.executeBindings(this,"durationLabel",this.durationLabel);
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_Group4_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.visible = false;
         _loc1_.right = 2;
         _loc1_.bottom = 0;
         _loc1_.mxmlContent = [this._TransitionItemRenderer_BitmapImage2_c(),this._TransitionItemRenderer_PopUpAnchor1_i()];
         _loc1_.addEventListener("rollOver",this.__warningSignForHandDrawn_rollOver);
         _loc1_.addEventListener("rollOut",this.__warningSignForHandDrawn_rollOut);
         _loc1_.id = "warningSignForHandDrawn";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.warningSignForHandDrawn = _loc1_;
         BindingManager.executeBindings(this,"warningSignForHandDrawn",this.warningSignForHandDrawn);
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_BitmapImage2_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__styles_images_panel_enterexit_alert_png_1584402313;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_PopUpAnchor1_i() : spark.components.PopUpAnchor
      {
         var _loc1_:spark.components.PopUpAnchor = new spark.components.PopUpAnchor();
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.popUpPosition = "right";
         _loc1_.popUpHeightMatchesAnchorHeight = true;
         _loc1_.popUp = this._TransitionItemRenderer_Group5_c();
         _loc1_.id = "warningPopUpAnchorForHandDrawn";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.warningPopUpAnchorForHandDrawn = _loc1_;
         BindingManager.executeBindings(this,"warningPopUpAnchorForHandDrawn",this.warningPopUpAnchorForHandDrawn);
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_Group5_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mouseEnabled = false;
         _loc1_.mouseChildren = false;
         _loc1_.mxmlContent = [this._TransitionItemRenderer_Path1_c(),this._TransitionItemRenderer_Group6_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_Path1_c() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.verticalCenter = 0;
         _loc1_.left = 30;
         _loc1_.data = "M 0 8 l 8 -8 l 0 16 Z";
         _loc1_.fill = this._TransitionItemRenderer_SolidColor5_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_SolidColor5_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16372857;
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_Group6_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.verticalCenter = 0;
         _loc1_.left = 38;
         _loc1_.mxmlContent = [this._TransitionItemRenderer_Rect3_c(),this._TransitionItemRenderer_Label5_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_Rect3_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._TransitionItemRenderer_SolidColor6_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_SolidColor6_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16372857;
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_Label5_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.maxWidth = 300;
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("paddingLeft",7);
         _loc1_.setStyle("paddingRight",7);
         _loc1_.setStyle("paddingTop",7);
         _loc1_.setStyle("paddingBottom",7);
         _loc1_.id = "_TransitionItemRenderer_Label5";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._TransitionItemRenderer_Label5 = _loc1_;
         BindingManager.executeBindings(this,"_TransitionItemRenderer_Label5",this._TransitionItemRenderer_Label5);
         return _loc1_;
      }
      
      public function __warningSignForHandDrawn_rollOver(param1:MouseEvent) : void
      {
         this.warningPopUpAnchorForHandDrawn.displayPopUp = true;
      }
      
      public function __warningSignForHandDrawn_rollOut(param1:MouseEvent) : void
      {
         this.warningPopUpAnchorForHandDrawn.displayPopUp = false;
      }
      
      private function _TransitionItemRenderer_Group7_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.visible = false;
         _loc1_.right = 2;
         _loc1_.bottom = 0;
         _loc1_.mxmlContent = [this._TransitionItemRenderer_BitmapImage3_c(),this._TransitionItemRenderer_PopUpAnchor2_i()];
         _loc1_.addEventListener("rollOver",this.__warningSign_rollOver);
         _loc1_.addEventListener("rollOut",this.__warningSign_rollOut);
         _loc1_.id = "warningSign";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.warningSign = _loc1_;
         BindingManager.executeBindings(this,"warningSign",this.warningSign);
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_BitmapImage3_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__styles_images_panel_enterexit_alert_png_1584402313;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_PopUpAnchor2_i() : spark.components.PopUpAnchor
      {
         var _loc1_:spark.components.PopUpAnchor = new spark.components.PopUpAnchor();
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.popUpPosition = "right";
         _loc1_.popUpHeightMatchesAnchorHeight = true;
         _loc1_.popUp = this._TransitionItemRenderer_Group8_c();
         _loc1_.id = "warningPopUpAnchor";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.warningPopUpAnchor = _loc1_;
         BindingManager.executeBindings(this,"warningPopUpAnchor",this.warningPopUpAnchor);
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_Group8_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mouseEnabled = false;
         _loc1_.mouseChildren = false;
         _loc1_.mxmlContent = [this._TransitionItemRenderer_Path2_c(),this._TransitionItemRenderer_Group9_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_Path2_c() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.verticalCenter = 0;
         _loc1_.left = 30;
         _loc1_.data = "M 0 8 l 8 -8 l 0 16 Z";
         _loc1_.fill = this._TransitionItemRenderer_SolidColor7_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_SolidColor7_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16372857;
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_Group9_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.verticalCenter = 0;
         _loc1_.left = 38;
         _loc1_.mxmlContent = [this._TransitionItemRenderer_Rect4_c(),this._TransitionItemRenderer_Label6_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_Rect4_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._TransitionItemRenderer_SolidColor8_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_SolidColor8_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16372857;
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_Label6_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.maxWidth = 300;
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("paddingLeft",7);
         _loc1_.setStyle("paddingRight",7);
         _loc1_.setStyle("paddingTop",7);
         _loc1_.setStyle("paddingBottom",7);
         _loc1_.id = "_TransitionItemRenderer_Label6";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._TransitionItemRenderer_Label6 = _loc1_;
         BindingManager.executeBindings(this,"_TransitionItemRenderer_Label6",this._TransitionItemRenderer_Label6);
         return _loc1_;
      }
      
      public function __warningSign_rollOver(param1:MouseEvent) : void
      {
         this.warningPopUpAnchor.displayPopUp = true;
      }
      
      public function __warningSign_rollOut(param1:MouseEvent) : void
      {
         this.warningPopUpAnchor.displayPopUp = false;
      }
      
      private function _TransitionItemRenderer_Group10_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.visible = false;
         _loc1_.right = 2;
         _loc1_.bottom = 0;
         _loc1_.mxmlContent = [this._TransitionItemRenderer_BitmapImage4_c(),this._TransitionItemRenderer_PopUpAnchor3_i()];
         _loc1_.addEventListener("rollOver",this.__warningSignForTextEffect_rollOver);
         _loc1_.addEventListener("rollOut",this.__warningSignForTextEffect_rollOut);
         _loc1_.id = "warningSignForTextEffect";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.warningSignForTextEffect = _loc1_;
         BindingManager.executeBindings(this,"warningSignForTextEffect",this.warningSignForTextEffect);
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_BitmapImage4_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__styles_images_panel_enterexit_alert_png_1584402313;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_PopUpAnchor3_i() : spark.components.PopUpAnchor
      {
         var _loc1_:spark.components.PopUpAnchor = new spark.components.PopUpAnchor();
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.popUpPosition = "right";
         _loc1_.popUpHeightMatchesAnchorHeight = true;
         _loc1_.popUp = this._TransitionItemRenderer_Group11_c();
         _loc1_.id = "warningPopUpAnchorForTextEffect";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.warningPopUpAnchorForTextEffect = _loc1_;
         BindingManager.executeBindings(this,"warningPopUpAnchorForTextEffect",this.warningPopUpAnchorForTextEffect);
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_Group11_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mouseEnabled = false;
         _loc1_.mouseChildren = false;
         _loc1_.mxmlContent = [this._TransitionItemRenderer_Path3_c(),this._TransitionItemRenderer_Group12_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_Path3_c() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.verticalCenter = 0;
         _loc1_.left = 30;
         _loc1_.data = "M 0 8 l 8 -8 l 0 16 Z";
         _loc1_.fill = this._TransitionItemRenderer_SolidColor9_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_SolidColor9_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16372857;
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_Group12_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.verticalCenter = 0;
         _loc1_.left = 38;
         _loc1_.mxmlContent = [this._TransitionItemRenderer_Rect5_c(),this._TransitionItemRenderer_Label7_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_Rect5_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._TransitionItemRenderer_SolidColor10_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_SolidColor10_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16372857;
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_Label7_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.maxWidth = 300;
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("paddingLeft",7);
         _loc1_.setStyle("paddingRight",7);
         _loc1_.setStyle("paddingTop",7);
         _loc1_.setStyle("paddingBottom",7);
         _loc1_.id = "_TransitionItemRenderer_Label7";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._TransitionItemRenderer_Label7 = _loc1_;
         BindingManager.executeBindings(this,"_TransitionItemRenderer_Label7",this._TransitionItemRenderer_Label7);
         return _loc1_;
      }
      
      public function __warningSignForTextEffect_rollOver(param1:MouseEvent) : void
      {
         this.warningPopUpAnchorForTextEffect.displayPopUp = true;
      }
      
      public function __warningSignForTextEffect_rollOut(param1:MouseEvent) : void
      {
         this.warningPopUpAnchorForTextEffect.displayPopUp = false;
      }
      
      private function _TransitionItemRenderer_HGroup4_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.top = 6;
         _loc1_.right = 18;
         _loc1_.gap = 7;
         _loc1_.mxmlContent = [this._TransitionItemRenderer_ToggleButton1_i(),this._TransitionItemRenderer_Button1_i()];
         _loc1_.id = "buttonGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.buttonGroup = _loc1_;
         BindingManager.executeBindings(this,"buttonGroup",this.buttonGroup);
         return _loc1_;
      }
      
      private function _TransitionItemRenderer_ToggleButton1_i() : ToggleButton
      {
         var _loc1_:ToggleButton = new ToggleButton();
         _loc1_.setStyle("skinClass",SoundToggleButtonSkin);
         _loc1_.addEventListener("change",this.__soundButton_change);
         _loc1_.id = "soundButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.soundButton = _loc1_;
         BindingManager.executeBindings(this,"soundButton",this.soundButton);
         return _loc1_;
      }
      
      public function __soundButton_change(param1:Event) : void
      {
         this.onSoundToggle();
      }
      
      private function _TransitionItemRenderer_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.visible = false;
         _loc1_.setStyle("skinClass",RemoveAssetTransitionButtonSkin);
         _loc1_.addEventListener("mouseDown",this.__removeButton_mouseDown);
         _loc1_.id = "removeButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.removeButton = _loc1_;
         BindingManager.executeBindings(this,"removeButton",this.removeButton);
         return _loc1_;
      }
      
      public function __removeButton_mouseDown(param1:MouseEvent) : void
      {
         this.onRemoveButtonClick(param1);
      }
      
      public function ___TransitionItemRenderer_ItemRenderer1_rollOver(param1:MouseEvent) : void
      {
         this.rollOverHandler(param1);
      }
      
      public function ___TransitionItemRenderer_ItemRenderer1_rollOut(param1:MouseEvent) : void
      {
         this.rollOutHandler(param1);
      }
      
      public function ___TransitionItemRenderer_ItemRenderer1_click(param1:MouseEvent) : void
      {
         this.clickHandler(param1);
      }
      
      private function _TransitionItemRenderer_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():uint
         {
            return _colorType;
         },null,"_TransitionItemRenderer_SolidColor2.color");
         result[1] = new Binding(this,null,null,"thumbnail.mask","thumbnailMask");
         result[2] = new Binding(this,function():uint
         {
            return _colorType;
         },function(param1:uint):void
         {
            typeLabel.setStyle("color",param1);
         },"typeLabel.color");
         result[3] = new Binding(this,function():Boolean
         {
            return _durationIconVisible;
         },null,"_TransitionItemRenderer_Group3.visible");
         result[4] = new Binding(this,function():Boolean
         {
            return _durationIconVisible;
         },null,"_TransitionItemRenderer_Group3.includeInLayout");
         result[5] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","This motion will not play as it overlaps with another whiteboard motion. Please adjust the timing of these motions to make sure whiteboard motions only occur one after the other.");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_TransitionItemRenderer_Label5.text");
         result[6] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","This motion will not play, as it overlaps with another one, happens after an exit motion or happens before an enter motion for the same asset.");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_TransitionItemRenderer_Label6.text");
         result[7] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","This motion will not play. The text element\'s font (Arial) does not work with the selected motion style. Please select a different motion style or font family.");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_TransitionItemRenderer_Label7.text");
         result[8] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Toggle sound");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"soundButton.toolTip");
         result[9] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Delete");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"removeButton.toolTip");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _TransitionItemRenderer_SolidColor1() : SolidColor
      {
         return this._977194244_TransitionItemRenderer_SolidColor1;
      }
      
      public function set _TransitionItemRenderer_SolidColor1(param1:SolidColor) : void
      {
         var _loc2_:Object = this._977194244_TransitionItemRenderer_SolidColor1;
         if(_loc2_ !== param1)
         {
            this._977194244_TransitionItemRenderer_SolidColor1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_TransitionItemRenderer_SolidColor1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get buttonGroup() : HGroup
      {
         return this._1781625235buttonGroup;
      }
      
      public function set buttonGroup(param1:HGroup) : void
      {
         var _loc2_:Object = this._1781625235buttonGroup;
         if(_loc2_ !== param1)
         {
            this._1781625235buttonGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buttonGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get delayLabel() : Label
      {
         return this._1664987343delayLabel;
      }
      
      public function set delayLabel(param1:Label) : void
      {
         var _loc2_:Object = this._1664987343delayLabel;
         if(_loc2_ !== param1)
         {
            this._1664987343delayLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"delayLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get descriptionLabel() : Label
      {
         return this._489039960descriptionLabel;
      }
      
      public function set descriptionLabel(param1:Label) : void
      {
         var _loc2_:Object = this._489039960descriptionLabel;
         if(_loc2_ !== param1)
         {
            this._489039960descriptionLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"descriptionLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get durationLabel() : Label
      {
         return this._122527168durationLabel;
      }
      
      public function set durationLabel(param1:Label) : void
      {
         var _loc2_:Object = this._122527168durationLabel;
         if(_loc2_ !== param1)
         {
            this._122527168durationLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"durationLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fadeInEffect() : Fade
      {
         return this._1020166578fadeInEffect;
      }
      
      public function set fadeInEffect(param1:Fade) : void
      {
         var _loc2_:Object = this._1020166578fadeInEffect;
         if(_loc2_ !== param1)
         {
            this._1020166578fadeInEffect = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fadeInEffect",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get removeButton() : Button
      {
         return this._1339123498removeButton;
      }
      
      public function set removeButton(param1:Button) : void
      {
         var _loc2_:Object = this._1339123498removeButton;
         if(_loc2_ !== param1)
         {
            this._1339123498removeButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"removeButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get soundButton() : ToggleButton
      {
         return this._1439864097soundButton;
      }
      
      public function set soundButton(param1:ToggleButton) : void
      {
         var _loc2_:Object = this._1439864097soundButton;
         if(_loc2_ !== param1)
         {
            this._1439864097soundButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"soundButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get textContent() : VGroup
      {
         return this._111594124textContent;
      }
      
      public function set textContent(param1:VGroup) : void
      {
         var _loc2_:Object = this._111594124textContent;
         if(_loc2_ !== param1)
         {
            this._111594124textContent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textContent",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get thumbnail() : AssetThumbnail
      {
         return this._1330532588thumbnail;
      }
      
      public function set thumbnail(param1:AssetThumbnail) : void
      {
         var _loc2_:Object = this._1330532588thumbnail;
         if(_loc2_ !== param1)
         {
            this._1330532588thumbnail = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"thumbnail",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get thumbnailMask() : Group
      {
         return this._1825076728thumbnailMask;
      }
      
      public function set thumbnailMask(param1:Group) : void
      {
         var _loc2_:Object = this._1825076728thumbnailMask;
         if(_loc2_ !== param1)
         {
            this._1825076728thumbnailMask = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"thumbnailMask",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get typeLabel() : Label
      {
         return this._501248986typeLabel;
      }
      
      public function set typeLabel(param1:Label) : void
      {
         var _loc2_:Object = this._501248986typeLabel;
         if(_loc2_ !== param1)
         {
            this._501248986typeLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"typeLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get warningPopUpAnchor() : spark.components.PopUpAnchor
      {
         return this._1592938139warningPopUpAnchor;
      }
      
      public function set warningPopUpAnchor(param1:spark.components.PopUpAnchor) : void
      {
         var _loc2_:Object = this._1592938139warningPopUpAnchor;
         if(_loc2_ !== param1)
         {
            this._1592938139warningPopUpAnchor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"warningPopUpAnchor",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get warningPopUpAnchorForHandDrawn() : spark.components.PopUpAnchor
      {
         return this._306557879warningPopUpAnchorForHandDrawn;
      }
      
      public function set warningPopUpAnchorForHandDrawn(param1:spark.components.PopUpAnchor) : void
      {
         var _loc2_:Object = this._306557879warningPopUpAnchorForHandDrawn;
         if(_loc2_ !== param1)
         {
            this._306557879warningPopUpAnchorForHandDrawn = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"warningPopUpAnchorForHandDrawn",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get warningPopUpAnchorForTextEffect() : spark.components.PopUpAnchor
      {
         return this._1496383842warningPopUpAnchorForTextEffect;
      }
      
      public function set warningPopUpAnchorForTextEffect(param1:spark.components.PopUpAnchor) : void
      {
         var _loc2_:Object = this._1496383842warningPopUpAnchorForTextEffect;
         if(_loc2_ !== param1)
         {
            this._1496383842warningPopUpAnchorForTextEffect = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"warningPopUpAnchorForTextEffect",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get warningSign() : Group
      {
         return this._481045639warningSign;
      }
      
      public function set warningSign(param1:Group) : void
      {
         var _loc2_:Object = this._481045639warningSign;
         if(_loc2_ !== param1)
         {
            this._481045639warningSign = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"warningSign",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get warningSignForHandDrawn() : Group
      {
         return this._614815691warningSignForHandDrawn;
      }
      
      public function set warningSignForHandDrawn(param1:Group) : void
      {
         var _loc2_:Object = this._614815691warningSignForHandDrawn;
         if(_loc2_ !== param1)
         {
            this._614815691warningSignForHandDrawn = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"warningSignForHandDrawn",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get warningSignForTextEffect() : Group
      {
         return this._1832525874warningSignForTextEffect;
      }
      
      public function set warningSignForTextEffect(param1:Group) : void
      {
         var _loc2_:Object = this._1832525874warningSignForTextEffect;
         if(_loc2_ !== param1)
         {
            this._1832525874warningSignForTextEffect = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"warningSignForTextEffect",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _colorType() : uint
      {
         return this._492028862_colorType;
      }
      
      private function set _colorType(param1:uint) : void
      {
         var _loc2_:Object = this._492028862_colorType;
         if(_loc2_ !== param1)
         {
            this._492028862_colorType = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_colorType",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _durationIconVisible() : Boolean
      {
         return this._204380986_durationIconVisible;
      }
      
      private function set _durationIconVisible(param1:Boolean) : void
      {
         var _loc2_:Object = this._204380986_durationIconVisible;
         if(_loc2_ !== param1)
         {
            this._204380986_durationIconVisible = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_durationIconVisible",_loc2_,param1));
            }
         }
      }
      
      protected function set isHovered(param1:Boolean) : void
      {
         var _loc2_:Object = this.isHovered;
         if(_loc2_ !== param1)
         {
            this._521256529isHovered = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"isHovered",_loc2_,param1));
            }
         }
      }
   }
}
