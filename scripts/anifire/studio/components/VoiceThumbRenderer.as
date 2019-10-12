package anifire.studio.components
{
   import anifire.constant.ResponseConstants;
   import anifire.constant.ServerConstants;
   import anifire.event.CoreEvent;
   import anifire.managers.AppConfigManager;
   import anifire.studio.core.Console;
   import anifire.studio.core.SoundThumb;
   import anifire.studio.core.sound.ISoundable;
   import anifire.studio.core.sound.SoundEvent;
   import anifire.studio.managers.SoundPlaybackManager;
   import anifire.studio.managers.UserAssetManager;
   import anifire.studio.models.ThumbModel;
   import anifire.util.ApiRequest;
   import anifire.util.UtilDict;
   import anifire.util.UtilSite;
   import anifire.util.UtilString;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLStream;
   import flash.net.URLVariables;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.utils.StringUtil;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.events.PopUpEvent;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class VoiceThumbRenderer extends ThumbRendererBase implements IBindingClient, IStateClient2
   {
      
      public static const EVENT_PLAY_BUT_CLICK:String = "play_but_click";
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _1411460949_VoiceThumbRenderer_Group1:Group;
      
      private var _775506802durationDisplay:Label;
      
      private var _1097557894playButton:IconButton;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _1934183932_dataSource:SoundThumb;
      
      protected var _2096654142_labelText:String;
      
      protected var _256018112_durationText:String;
      
      protected var _1864660719_playing:Boolean = false;
      
      protected var _sound:ISoundable;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function VoiceThumbRenderer()
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
         bindings = this._VoiceThumbRenderer_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_VoiceThumbRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return VoiceThumbRenderer[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.autoDrawBackground = false;
         this.buttonMode = true;
         this.percentWidth = 100;
         this.mxmlContent = [this._VoiceThumbRenderer_Group1_i(),this._VoiceThumbRenderer_Line1_c(),this._VoiceThumbRenderer_HGroup1_c(),this._VoiceThumbRenderer_IconButton1_i()];
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "stateGroups":["hoveredAndSelected"],
            "overrides":[new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"playButton",
               "name":"visible",
               "value":true
            })]
         }),new State({
            "name":"selected",
            "stateGroups":["hoveredAndSelected"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_VoiceThumbRenderer_Group1",
               "name":"visible",
               "value":true
            }),new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"playButton",
               "name":"visible",
               "value":true
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
         VoiceThumbRenderer._watcherSetupUtil = param1;
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
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         if(this._dataSource)
         {
            if(!dragging)
            {
               this._dataSource.removeEventListener(CoreEvent.LOAD_THUMB_COMPLETE,this.onSoundThumbLoaded);
            }
         }
         var _loc2_:ThumbModel = data as ThumbModel;
         if(_loc2_)
         {
            this._dataSource = _loc2_.thumb as SoundThumb;
            if(this._dataSource)
            {
               this.sound#1 = this._dataSource.sound#1;
               this.updateLabel();
               if(!dragging)
               {
                  this._dataSource.addEventListener(CoreEvent.LOAD_THUMB_COMPLETE,this.onSoundThumbLoaded);
               }
            }
         }
      }
      
      public function get sound#1() : ISoundable
      {
         return this._sound;
      }
      
      public function set sound#1(param1:ISoundable) : void
      {
         if(this._sound != param1)
         {
            if(this._sound)
            {
               this._sound.removeEventListener(SoundEvent.STOPPED,this.onSoundStopped);
               this._sound.removeEventListener(SoundEvent.PLAYED,this.onSoundPlayed);
            }
            this._sound = param1;
            if(this._sound)
            {
               this._playing = this._sound.isPlaying;
               this._sound.addEventListener(SoundEvent.STOPPED,this.onSoundStopped);
               this._sound.addEventListener(SoundEvent.PLAYED,this.onSoundPlayed);
            }
            else
            {
               this._playing = false;
            }
         }
      }
      
      private function onSoundThumbLoaded(param1:Event) : void
      {
         this.sound#1 = this._dataSource.sound#1;
      }
      
      private function onSoundPlayed(param1:Event) : void
      {
         this._playing = true;
      }
      
      private function onSoundStopped(param1:Event) : void
      {
         this._playing = false;
         this.dispatchEvent(new CoreEvent(CoreEvent.PLAY_SOUND_COMPLETE,this));
      }
      
      protected function updateLabel() : void
      {
         this._labelText = this._dataSource.name;
         this._durationText = UtilString.secToTimeString(this._dataSource.duration * 0.001,false);
      }
      
      protected function playButtonHandler(param1:MouseEvent) : void
      {
         if(this._playing)
         {
            SoundPlaybackManager.stop();
         }
         else
         {
            SoundPlaybackManager.playSoundThumb(this._dataSource);
         }
         param1.stopImmediatePropagation();
      }
      
      protected function infoButtonHandler(param1:MouseEvent) : void
      {
         this.showInfoDialog();
         param1.stopImmediatePropagation();
      }
      
      protected function deleteButtonHandler(param1:MouseEvent) : void
      {
         this.showDeleteDialog();
         param1.stopImmediatePropagation();
      }
      
      protected function showInfoDialog() : void
      {
         var _loc1_:EditAssetPopUp = new EditAssetPopUp();
         _loc1_.showPublishOptions = this.allowPublish();
         _loc1_.thumb = this._dataSource;
         _loc1_.nameLabel = UtilDict.toDisplay("go","assetinfo_name");
         _loc1_.tagsLabel = UtilDict.toDisplay("go","assetinfo_tags");
         _loc1_.optionPrivateLabel = UtilDict.toDisplay("go","assetinfo_private");
         _loc1_.optionPublicLabel = UtilDict.toDisplay("go","assetinfo_public");
         _loc1_.confirmText = UtilDict.toDisplay("go","assetinfo_update");
         _loc1_.cancelText = UtilDict.toDisplay("go","assetinfo_cancel");
         _loc1_.addEventListener(PopUpEvent.CLOSE,this.confirmEdit);
         _loc1_.open(parentApplication as UIComponent,true);
      }
      
      protected function confirmEdit(param1:PopUpEvent) : void
      {
         var _loc2_:Object = null;
         if(param1.commit)
         {
            _loc2_ = param1.data;
            if(_loc2_)
            {
               this._dataSource.name = _loc2_["name"];
               this._dataSource.tags = _loc2_["tags"];
               this._dataSource.isPublished = _loc2_["published"];
               this._dataSource.sharingOptions = _loc2_["share"];
               UserAssetManager.instance.updateAsset(this._dataSource.id,this._dataSource.encAssetId,this._dataSource.name,this._dataSource.tags,this._dataSource.isPublished,this._dataSource.sharingOptions);
               this.updateLabel();
            }
         }
      }
      
      protected function showDeleteDialog() : void
      {
         var _loc1_:ConfirmPopUp = new ConfirmPopUp();
         if(Console.getConsole().thumbTray.isInTeamTheme())
         {
            _loc1_.title = UtilDict.translate(StringUtil.substitute(LABEL_DELETE_ASSET,LABEL_TYPE_SOUND));
            _loc1_.message = UtilDict.translate(StringUtil.substitute(LABEL_DELETE_ASSET_MESSAGE,LABEL_TYPE_SOUND));
         }
         else
         {
            _loc1_.title = UtilDict.toDisplay("go","goalert_delsound");
            _loc1_.message = UtilDict.toDisplay("go","goalert_delsoundtext");
         }
         _loc1_.confirmText = UtilDict.toDisplay("go","goalert_delete");
         _loc1_.cancelText = UtilDict.toDisplay("go","goalert_cancel");
         _loc1_.addEventListener(PopUpEvent.CLOSE,this.confirmDelete);
         _loc1_.open(parentApplication as UIComponent,true);
      }
      
      protected function confirmDelete(param1:PopUpEvent) : void
      {
         if(param1.commit)
         {
            this.deleteThumbnail();
         }
      }
      
      protected function deleteThumbnail() : void
      {
         var _loc1_:Object = null;
         var _loc2_:ApiRequest = null;
         var _loc3_:URLVariables = null;
         var _loc4_:URLRequest = null;
         var _loc5_:URLStream = null;
         SoundPlaybackManager.stop();
         if(UtilSite.isGoAnimate)
         {
            _loc1_ = {};
            _loc1_[ResponseConstants.ID] = this._dataSource.encAssetId;
            _loc2_ = new ApiRequest();
            _loc2_.post(ServerConstants.ACTION_DELETE_ASSET_V2,_loc1_);
         }
         else
         {
            _loc3_ = AppConfigManager.instance.createURLVariables();
            _loc3_["assetId"] = this._dataSource.id;
            _loc3_["id"] = this._dataSource.encAssetId;
            _loc4_ = new URLRequest(ServerConstants.ACTION_DELETE_ASSET);
            _loc4_.method = URLRequestMethod.POST;
            _loc4_.data = _loc3_;
            _loc5_ = new URLStream();
            _loc5_.load(_loc4_);
         }
         UserAssetManager.instance.removeSoundByAssetId(this._dataSource.id);
      }
      
      override protected function allowPublish() : Boolean
      {
         return false;
      }
      
      override protected function shouldStartDrag(param1:MouseEvent) : Boolean
      {
         return false;
      }
      
      private function _VoiceThumbRenderer_Group1_i() : Group
      {
         var _loc1_:Group = null;
         _loc1_ = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.visible = false;
         _loc1_.mxmlContent = [this._VoiceThumbRenderer_Rect1_c()];
         _loc1_.id = "_VoiceThumbRenderer_Group1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._VoiceThumbRenderer_Group1 = _loc1_;
         BindingManager.executeBindings(this,"_VoiceThumbRenderer_Group1",this._VoiceThumbRenderer_Group1);
         return _loc1_;
      }
      
      private function _VoiceThumbRenderer_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._VoiceThumbRenderer_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _VoiceThumbRenderer_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 14870509;
         return _loc1_;
      }
      
      private function _VoiceThumbRenderer_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._VoiceThumbRenderer_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _VoiceThumbRenderer_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 14870509;
         return _loc1_;
      }
      
      private function _VoiceThumbRenderer_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.height = 28;
         _loc1_.gap = 4;
         _loc1_.verticalAlign = "baseline";
         _loc1_.paddingLeft = 12;
         _loc1_.paddingRight = 32;
         _loc1_.mxmlContent = [this._VoiceThumbRenderer_Label1_i(),this._VoiceThumbRenderer_Label2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _VoiceThumbRenderer_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.maxDisplayedLines = 1;
         _loc1_.maxWidth = 230;
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("fontSize",13);
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.setStyle("textAlign","left");
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",labelDisplay);
         return _loc1_;
      }
      
      private function _VoiceThumbRenderer_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.maxDisplayedLines = 1;
         _loc1_.percentHeight = 100;
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.setStyle("color",8752789);
         _loc1_.setStyle("fontSize",11);
         _loc1_.id = "durationDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.durationDisplay = _loc1_;
         BindingManager.executeBindings(this,"durationDisplay",this.durationDisplay);
         return _loc1_;
      }
      
      private function _VoiceThumbRenderer_IconButton1_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.right = 12;
         _loc1_.verticalCenter = 0;
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("mouseDown",this.__playButton_mouseDown);
         _loc1_.id = "playButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.playButton = _loc1_;
         BindingManager.executeBindings(this,"playButton",this.playButton);
         return _loc1_;
      }
      
      public function __playButton_mouseDown(param1:MouseEvent) : void
      {
         this.playButtonHandler(param1);
      }
      
      private function _VoiceThumbRenderer_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = _labelText;
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"labelDisplay.text");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = _durationText;
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"durationDisplay.text");
         result[2] = new Binding(this,function():Object
         {
            return !!_playing?"stopSmall":"playSmall";
         },null,"playButton.styleName");
         result[3] = new Binding(this,function():Boolean
         {
            return _playing;
         },null,"playButton.visible");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _VoiceThumbRenderer_Group1() : Group
      {
         return this._1411460949_VoiceThumbRenderer_Group1;
      }
      
      public function set _VoiceThumbRenderer_Group1(param1:Group) : void
      {
         var _loc2_:Object = this._1411460949_VoiceThumbRenderer_Group1;
         if(_loc2_ !== param1)
         {
            this._1411460949_VoiceThumbRenderer_Group1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_VoiceThumbRenderer_Group1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get durationDisplay() : Label
      {
         return this._775506802durationDisplay;
      }
      
      public function set durationDisplay(param1:Label) : void
      {
         var _loc2_:Object = this._775506802durationDisplay;
         if(_loc2_ !== param1)
         {
            this._775506802durationDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"durationDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get playButton() : IconButton
      {
         return this._1097557894playButton;
      }
      
      public function set playButton(param1:IconButton) : void
      {
         var _loc2_:Object = this._1097557894playButton;
         if(_loc2_ !== param1)
         {
            this._1097557894playButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"playButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _dataSource() : SoundThumb
      {
         return this._1934183932_dataSource;
      }
      
      protected function set _dataSource(param1:SoundThumb) : void
      {
         var _loc2_:Object = this._1934183932_dataSource;
         if(_loc2_ !== param1)
         {
            this._1934183932_dataSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_dataSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _labelText() : String
      {
         return this._2096654142_labelText;
      }
      
      protected function set _labelText(param1:String) : void
      {
         var _loc2_:Object = this._2096654142_labelText;
         if(_loc2_ !== param1)
         {
            this._2096654142_labelText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_labelText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _durationText() : String
      {
         return this._256018112_durationText;
      }
      
      protected function set _durationText(param1:String) : void
      {
         var _loc2_:Object = this._256018112_durationText;
         if(_loc2_ !== param1)
         {
            this._256018112_durationText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_durationText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _playing() : Boolean
      {
         return this._1864660719_playing;
      }
      
      protected function set _playing(param1:Boolean) : void
      {
         var _loc2_:Object = this._1864660719_playing;
         if(_loc2_ !== param1)
         {
            this._1864660719_playing = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_playing",_loc2_,param1));
            }
         }
      }
   }
}
