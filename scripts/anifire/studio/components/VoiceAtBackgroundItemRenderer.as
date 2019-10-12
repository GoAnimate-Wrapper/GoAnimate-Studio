package anifire.studio.components
{
   import anifire.event.ExtraDataEvent;
   import anifire.studio.commands.ICommand;
   import anifire.studio.commands.RemoveSoundCommand;
   import anifire.studio.commands.RemoveSpeechCommand;
   import anifire.studio.core.AnimeSound;
   import anifire.studio.core.Console;
   import anifire.studio.core.SoundThumb;
   import anifire.studio.events.VoicePanelEvent;
   import anifire.util.Util;
   import anifire.util.UtilDict;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.VGroup;
   import spark.components.supportClasses.ItemRenderer;
   import spark.primitives.Line;
   import spark.primitives.Path;
   import spark.primitives.Rect;
   import spark.primitives.RectangularDropShadow;
   
   use namespace mx_internal;
   
   public class VoiceAtBackgroundItemRenderer extends ItemRenderer implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _VoiceAtBackgroundItemRenderer_PopUpAnchor1:spark.components.PopUpAnchor;
      
      private var _734268260_VoiceAtBackgroundItemRenderer_SolidColor1:SolidColor;
      
      public var _VoiceAtBackgroundItemRenderer_VGroup4:VGroup;
      
      private var _1155352645boxSoundComment:Group;
      
      private var _1781625235buttonGroup:VGroup;
      
      private var _809612678contentGroup:VGroup;
      
      private var _951543133control:PlainDialogDetailControlGroup;
      
      private var _1021776392lbSoundDur:Label;
      
      private var _1610758662lbSoundText:Label;
      
      private var _1605973857lbSoundTitle:Label;
      
      private var _268453613popUpGroup:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _isHovered:Boolean;
      
      private var _currSThumb:SoundThumb;
      
      private var _target:Object;
      
      private var _204380986_durationIconVisible:Boolean = true;
      
      private var _608220994labelData:String;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function VoiceAtBackgroundItemRenderer()
      {
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._VoiceAtBackgroundItemRenderer_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_VoiceAtBackgroundItemRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return VoiceAtBackgroundItemRenderer[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.autoDrawBackground = false;
         this.buttonMode = false;
         this.mxmlContent = [this._VoiceAtBackgroundItemRenderer_Rect1_c(),this._VoiceAtBackgroundItemRenderer_Line1_c(),this._VoiceAtBackgroundItemRenderer_VGroup1_c()];
         this.currentState = "normal";
         this.addEventListener("rollOver",this.___VoiceAtBackgroundItemRenderer_ItemRenderer1_rollOver);
         this.addEventListener("rollOut",this.___VoiceAtBackgroundItemRenderer_ItemRenderer1_rollOut);
         var _VoiceAtBackgroundItemRenderer_PopUpAnchor1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._VoiceAtBackgroundItemRenderer_PopUpAnchor1_i);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "stateGroups":["overAndDownStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_VoiceAtBackgroundItemRenderer_SolidColor1",
               "name":"color",
               "value":16772027
            })]
         }),new State({
            "name":"down",
            "stateGroups":["overAndDownStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_VoiceAtBackgroundItemRenderer_SolidColor1",
               "name":"color",
               "value":16772027
            })]
         }),new State({
            "name":"overComment",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_VoiceAtBackgroundItemRenderer_PopUpAnchor1_factory,
               "destination":"boxSoundComment",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_VoiceAtBackgroundItemRenderer_VGroup4"]
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
         VoiceAtBackgroundItemRenderer._watcherSetupUtil = param1;
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
         }
      }
      
      public function get soundThumb() : SoundThumb
      {
         return this._currSThumb;
      }
      
      override public function set data(param1:Object) : void
      {
         var _loc2_:String = null;
         var _loc3_:AnimeSound = null;
         super.data = param1;
         if(this.data)
         {
            _loc2_ = String(this.data);
            _loc3_ = Console.getConsole().getSoundById(_loc2_);
            if(_loc3_)
            {
               this._currSThumb = _loc3_.soundThumb;
               this.lbSoundTitle.text = _loc3_.soundThumb.name;
               this.control._btnPlay.soundThumb = this._currSThumb;
               this.control._speechVolumeControl.volume = _loc3_.volume;
               this.control.setCurrentState("ttsAndAdded");
               this.lbSoundDur.text = Util.cielNum(_loc3_.soundThumb.duration / 1000,2) + "s";
               if(_loc3_.soundThumb.ttsData)
               {
                  this.lbSoundText.text = !!_loc3_.soundThumb.ttsData.text?UtilDict.toDisplay("go","LINE") + ": " + _loc3_.soundThumb.ttsData.text:"";
                  this.labelData = this.lbSoundText.text;
               }
               this.boxSoundComment.visible = this.boxSoundComment.includeInLayout = !!this.lbSoundText.text?true:false;
            }
         }
         else
         {
            this._currSThumb = null;
            this.control._btnPlay.soundThumb = null;
         }
      }
      
      public function init(param1:Object) : void
      {
         this._target = param1;
      }
      
      protected function refresh(param1:Event) : void
      {
         this.init(this._target);
      }
      
      protected function onRollOver(param1:MouseEvent) : void
      {
      }
      
      protected function onRollOut(param1:MouseEvent) : void
      {
      }
      
      protected function onRemoveLinkClick(param1:MouseEvent) : void
      {
         this.dispatchEvent(new Event("removeLinkage"));
      }
      
      protected function onEditHandler(param1:VoicePanelEvent) : void
      {
         this.dispatchEvent(new Event("editSound"));
      }
      
      protected function onDeleteHandler(param1:VoicePanelEvent) : void
      {
         var _loc4_:ICommand = null;
         var _loc2_:String = String(this.data);
         var _loc3_:AnimeSound = Console.getConsole().getSoundById(_loc2_);
         if(_loc3_.isVoice)
         {
            _loc4_ = new RemoveSpeechCommand(_loc3_);
            _loc4_.execute();
         }
         else
         {
            _loc4_ = new RemoveSoundCommand(_loc3_,_loc3_.soundsController.sounds);
            _loc4_.execute();
         }
         this.dispatchEvent(new Event("removeSound"));
      }
      
      protected function vgroup1_rollOverHandler(param1:MouseEvent) : void
      {
         this.setCurrentState("overComment");
      }
      
      protected function vgroup1_rollOutHandler(param1:MouseEvent) : void
      {
         this.setCurrentState("normal");
      }
      
      protected function volumeUpdateHandler(param1:ExtraDataEvent) : void
      {
         var _loc2_:Number = param1.getData() as Number;
         var _loc3_:String = String(this.data);
         var _loc4_:AnimeSound = Console.getConsole().getSoundById(_loc3_);
         if(_loc4_)
         {
            _loc4_.volume = _loc2_;
         }
      }
      
      private function _VoiceAtBackgroundItemRenderer_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._VoiceAtBackgroundItemRenderer_SolidColor1_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _VoiceAtBackgroundItemRenderer_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         this._VoiceAtBackgroundItemRenderer_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_VoiceAtBackgroundItemRenderer_SolidColor1",this._VoiceAtBackgroundItemRenderer_SolidColor1);
         return _loc1_;
      }
      
      private function _VoiceAtBackgroundItemRenderer_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._VoiceAtBackgroundItemRenderer_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _VoiceAtBackgroundItemRenderer_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 14540253;
         return _loc1_;
      }
      
      private function _VoiceAtBackgroundItemRenderer_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.paddingTop = 6;
         _loc1_.paddingLeft = 5;
         _loc1_.paddingRight = 5;
         _loc1_.paddingBottom = 6;
         _loc1_.gap = 14;
         _loc1_.mxmlContent = [this._VoiceAtBackgroundItemRenderer_HGroup1_c(),this._VoiceAtBackgroundItemRenderer_Group1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _VoiceAtBackgroundItemRenderer_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._VoiceAtBackgroundItemRenderer_VGroup2_i(),this._VoiceAtBackgroundItemRenderer_VGroup3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _VoiceAtBackgroundItemRenderer_VGroup2_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.verticalAlign = "middle";
         _loc1_.gap = 4;
         _loc1_.paddingLeft = 7;
         _loc1_.paddingTop = 10;
         _loc1_.paddingBottom = 8;
         _loc1_.mouseChildren = false;
         _loc1_.mouseEnabledWhereTransparent = true;
         _loc1_.mxmlContent = [this._VoiceAtBackgroundItemRenderer_Label1_i(),this._VoiceAtBackgroundItemRenderer_Label2_i()];
         _loc1_.id = "contentGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.contentGroup = _loc1_;
         BindingManager.executeBindings(this,"contentGroup",this.contentGroup);
         return _loc1_;
      }
      
      private function _VoiceAtBackgroundItemRenderer_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.maxDisplayedLines = 1;
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("fontSize",13);
         _loc1_.setStyle("verticalAlign","bottom");
         _loc1_.setStyle("textAlign","left");
         _loc1_.id = "lbSoundTitle";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.lbSoundTitle = _loc1_;
         BindingManager.executeBindings(this,"lbSoundTitle",this.lbSoundTitle);
         return _loc1_;
      }
      
      private function _VoiceAtBackgroundItemRenderer_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.maxDisplayedLines = 1;
         _loc1_.setStyle("color",8752789);
         _loc1_.setStyle("fontSize",11);
         _loc1_.setStyle("verticalAlign","top");
         _loc1_.id = "lbSoundDur";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.lbSoundDur = _loc1_;
         BindingManager.executeBindings(this,"lbSoundDur",this.lbSoundDur);
         return _loc1_;
      }
      
      private function _VoiceAtBackgroundItemRenderer_VGroup3_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentHeight = 100;
         _loc1_.paddingLeft = 4;
         _loc1_.paddingRight = 4;
         _loc1_.gap = 2;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._VoiceAtBackgroundItemRenderer_PlainDialogDetailControlGroup1_i()];
         _loc1_.id = "buttonGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.buttonGroup = _loc1_;
         BindingManager.executeBindings(this,"buttonGroup",this.buttonGroup);
         return _loc1_;
      }
      
      private function _VoiceAtBackgroundItemRenderer_PlainDialogDetailControlGroup1_i() : PlainDialogDetailControlGroup
      {
         var _loc1_:PlainDialogDetailControlGroup = new PlainDialogDetailControlGroup();
         _loc1_.percentWidth = 100;
         _loc1_.visible = true;
         _loc1_.addEventListener("deleteVoice",this.__control_deleteVoice);
         _loc1_.addEventListener("editVoice",this.__control_editVoice);
         _loc1_.addEventListener("update",this.__control_update);
         _loc1_.id = "control";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.control = _loc1_;
         BindingManager.executeBindings(this,"control",this.control);
         return _loc1_;
      }
      
      public function __control_deleteVoice(param1:VoicePanelEvent) : void
      {
         this.onDeleteHandler(param1);
      }
      
      public function __control_editVoice(param1:VoicePanelEvent) : void
      {
         this.onEditHandler(param1);
      }
      
      public function __control_update(param1:ExtraDataEvent) : void
      {
         this.volumeUpdateHandler(param1);
      }
      
      private function _VoiceAtBackgroundItemRenderer_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._VoiceAtBackgroundItemRenderer_RectangularDropShadow1_c(),this._VoiceAtBackgroundItemRenderer_Rect2_c(),this._VoiceAtBackgroundItemRenderer_VGroup4_i()];
         _loc1_.id = "boxSoundComment";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.boxSoundComment = _loc1_;
         BindingManager.executeBindings(this,"boxSoundComment",this.boxSoundComment);
         return _loc1_;
      }
      
      private function _VoiceAtBackgroundItemRenderer_RectangularDropShadow1_c() : RectangularDropShadow
      {
         var _loc1_:RectangularDropShadow = new RectangularDropShadow();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.color = 15658734;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _VoiceAtBackgroundItemRenderer_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._VoiceAtBackgroundItemRenderer_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _VoiceAtBackgroundItemRenderer_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 15923196;
         return _loc1_;
      }
      
      private function _VoiceAtBackgroundItemRenderer_VGroup4_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.paddingLeft = 14;
         _loc1_.paddingRight = 14;
         _loc1_.paddingTop = 14;
         _loc1_.paddingBottom = 14;
         _loc1_.mxmlContent = [this._VoiceAtBackgroundItemRenderer_Label3_i()];
         _loc1_.addEventListener("rollOver",this.___VoiceAtBackgroundItemRenderer_VGroup4_rollOver);
         _loc1_.addEventListener("rollOut",this.___VoiceAtBackgroundItemRenderer_VGroup4_rollOut);
         _loc1_.id = "_VoiceAtBackgroundItemRenderer_VGroup4";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._VoiceAtBackgroundItemRenderer_VGroup4 = _loc1_;
         BindingManager.executeBindings(this,"_VoiceAtBackgroundItemRenderer_VGroup4",this._VoiceAtBackgroundItemRenderer_VGroup4);
         return _loc1_;
      }
      
      private function _VoiceAtBackgroundItemRenderer_Label3_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 95;
         _loc1_.maxDisplayedLines = 1;
         _loc1_.id = "lbSoundText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.lbSoundText = _loc1_;
         BindingManager.executeBindings(this,"lbSoundText",this.lbSoundText);
         return _loc1_;
      }
      
      public function ___VoiceAtBackgroundItemRenderer_VGroup4_rollOver(param1:MouseEvent) : void
      {
         this.vgroup1_rollOverHandler(param1);
      }
      
      public function ___VoiceAtBackgroundItemRenderer_VGroup4_rollOut(param1:MouseEvent) : void
      {
         this.vgroup1_rollOutHandler(param1);
      }
      
      private function _VoiceAtBackgroundItemRenderer_PopUpAnchor1_i() : spark.components.PopUpAnchor
      {
         var _loc1_:spark.components.PopUpAnchor = new spark.components.PopUpAnchor();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 5;
         _loc1_.popUpPosition = "above";
         _loc1_.displayPopUp = true;
         _loc1_.horizontalCenter = -15;
         _loc1_.verticalCenter = -15;
         _loc1_.popUp = this._VoiceAtBackgroundItemRenderer_Group2_i();
         _loc1_.id = "_VoiceAtBackgroundItemRenderer_PopUpAnchor1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._VoiceAtBackgroundItemRenderer_PopUpAnchor1 = _loc1_;
         BindingManager.executeBindings(this,"_VoiceAtBackgroundItemRenderer_PopUpAnchor1",this._VoiceAtBackgroundItemRenderer_PopUpAnchor1);
         return _loc1_;
      }
      
      private function _VoiceAtBackgroundItemRenderer_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 50;
         _loc1_.mouseEnabled = false;
         _loc1_.mouseChildren = false;
         _loc1_.blendMode = "layer";
         _loc1_.alpha = 0.9;
         _loc1_.mxmlContent = [this._VoiceAtBackgroundItemRenderer_Path1_c(),this._VoiceAtBackgroundItemRenderer_Group3_c()];
         _loc1_.id = "popUpGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.popUpGroup = _loc1_;
         BindingManager.executeBindings(this,"popUpGroup",this.popUpGroup);
         return _loc1_;
      }
      
      private function _VoiceAtBackgroundItemRenderer_Path1_c() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.horizontalCenter = 0;
         _loc1_.data = "M 0 5 l 5 5 l 5 -5 Z";
         _loc1_.bottom = 0;
         _loc1_.fill = this._VoiceAtBackgroundItemRenderer_SolidColor3_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _VoiceAtBackgroundItemRenderer_SolidColor3_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 2829099;
         return _loc1_;
      }
      
      private function _VoiceAtBackgroundItemRenderer_Group3_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.minWidth = 50;
         _loc1_.horizontalCenter = 0;
         _loc1_.bottom = 5;
         _loc1_.mxmlContent = [this._VoiceAtBackgroundItemRenderer_Rect3_c(),this._VoiceAtBackgroundItemRenderer_Label4_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _VoiceAtBackgroundItemRenderer_Rect3_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._VoiceAtBackgroundItemRenderer_SolidColor4_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _VoiceAtBackgroundItemRenderer_SolidColor4_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 2829099;
         return _loc1_;
      }
      
      private function _VoiceAtBackgroundItemRenderer_Label4_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.width = 200;
         _loc1_.setStyle("color",16777215);
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("paddingLeft",10);
         _loc1_.setStyle("paddingRight",10);
         _loc1_.setStyle("paddingTop",5);
         _loc1_.setStyle("paddingBottom",5);
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",labelDisplay);
         return _loc1_;
      }
      
      public function ___VoiceAtBackgroundItemRenderer_ItemRenderer1_rollOver(param1:MouseEvent) : void
      {
         this.onRollOver(param1);
      }
      
      public function ___VoiceAtBackgroundItemRenderer_ItemRenderer1_rollOut(param1:MouseEvent) : void
      {
         this.onRollOut(param1);
      }
      
      private function _VoiceAtBackgroundItemRenderer_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = labelData;
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"labelDisplay.text");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _VoiceAtBackgroundItemRenderer_SolidColor1() : SolidColor
      {
         return this._734268260_VoiceAtBackgroundItemRenderer_SolidColor1;
      }
      
      public function set _VoiceAtBackgroundItemRenderer_SolidColor1(param1:SolidColor) : void
      {
         var _loc2_:Object = this._734268260_VoiceAtBackgroundItemRenderer_SolidColor1;
         if(_loc2_ !== param1)
         {
            this._734268260_VoiceAtBackgroundItemRenderer_SolidColor1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_VoiceAtBackgroundItemRenderer_SolidColor1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get boxSoundComment() : Group
      {
         return this._1155352645boxSoundComment;
      }
      
      public function set boxSoundComment(param1:Group) : void
      {
         var _loc2_:Object = this._1155352645boxSoundComment;
         if(_loc2_ !== param1)
         {
            this._1155352645boxSoundComment = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"boxSoundComment",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get buttonGroup() : VGroup
      {
         return this._1781625235buttonGroup;
      }
      
      public function set buttonGroup(param1:VGroup) : void
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
      public function get control() : PlainDialogDetailControlGroup
      {
         return this._951543133control;
      }
      
      public function set control(param1:PlainDialogDetailControlGroup) : void
      {
         var _loc2_:Object = this._951543133control;
         if(_loc2_ !== param1)
         {
            this._951543133control = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"control",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lbSoundDur() : Label
      {
         return this._1021776392lbSoundDur;
      }
      
      public function set lbSoundDur(param1:Label) : void
      {
         var _loc2_:Object = this._1021776392lbSoundDur;
         if(_loc2_ !== param1)
         {
            this._1021776392lbSoundDur = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbSoundDur",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lbSoundText() : Label
      {
         return this._1610758662lbSoundText;
      }
      
      public function set lbSoundText(param1:Label) : void
      {
         var _loc2_:Object = this._1610758662lbSoundText;
         if(_loc2_ !== param1)
         {
            this._1610758662lbSoundText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbSoundText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lbSoundTitle() : Label
      {
         return this._1605973857lbSoundTitle;
      }
      
      public function set lbSoundTitle(param1:Label) : void
      {
         var _loc2_:Object = this._1605973857lbSoundTitle;
         if(_loc2_ !== param1)
         {
            this._1605973857lbSoundTitle = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbSoundTitle",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get popUpGroup() : Group
      {
         return this._268453613popUpGroup;
      }
      
      public function set popUpGroup(param1:Group) : void
      {
         var _loc2_:Object = this._268453613popUpGroup;
         if(_loc2_ !== param1)
         {
            this._268453613popUpGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"popUpGroup",_loc2_,param1));
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
      
      [Bindable(event="propertyChange")]
      private function get labelData() : String
      {
         return this._608220994labelData;
      }
      
      private function set labelData(param1:String) : void
      {
         var _loc2_:Object = this._608220994labelData;
         if(_loc2_ !== param1)
         {
            this._608220994labelData = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"labelData",_loc2_,param1));
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
