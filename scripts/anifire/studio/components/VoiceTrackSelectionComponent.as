package anifire.studio.components
{
   import anifire.event.ExtraDataEvent;
   import anifire.studio.commands.AssignVoiceToCharacterCommand;
   import anifire.studio.commands.ICommand;
   import anifire.studio.core.AnimeScene;
   import anifire.studio.core.AnimeSound;
   import anifire.studio.core.Character;
   import anifire.studio.core.Console;
   import anifire.studio.core.SoundThumb;
   import anifire.studio.core.sound.SoundEvent;
   import anifire.studio.interfaces.ISpeechSubComponent;
   import anifire.studio.managers.UserAssetManager;
   import anifire.util.UtilDict;
   import anifire.util.UtilErrorLogger;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.ByteArray;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.ArrayCollection;
   import mx.collections.IList;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.Panel;
   import spark.components.VGroup;
   import spark.events.IndexChangeEvent;
   import spark.events.RendererExistenceEvent;
   
   use namespace mx_internal;
   
   public class VoiceTrackSelectionComponent extends Group implements ISpeechSubComponent, IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _1611875017_VoiceTrackSelectionComponent_Group2:Group;
      
      private var _1329631684_btnAdd:Button;
      
      private var _1370988937_btnCancel:Button;
      
      private var _654929731listOfDialog:DialogList;
      
      private var _106433028panel:Panel;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _target:Object;
      
      private var _1203236063errorMessage:String;
      
      private var _1895618663_userAssetManager:UserAssetManager;
      
      private var _1883088414_userSoundReady:Boolean;
      
      private var _soundThumb:SoundThumb;
      
      private var _volume:Number = -1;
      
      private var _193192190soundsCollection:ArrayCollection;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function VoiceTrackSelectionComponent()
      {
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._193192190soundsCollection = new ArrayCollection();
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._VoiceTrackSelectionComponent_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_VoiceTrackSelectionComponentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return VoiceTrackSelectionComponent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.transitions = [];
         this.mxmlContent = [this._VoiceTrackSelectionComponent_Panel1_i()];
         this.currentState = "listing";
         this.addEventListener("creationComplete",this.___VoiceTrackSelectionComponent_Group1_creationComplete);
         states = [new State({
            "name":"listing",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_VoiceTrackSelectionComponent_Group2",
               "name":"visible",
               "value":true
            }),new SetProperty().initializeFromObject({
               "target":"_VoiceTrackSelectionComponent_Group2",
               "name":"includeInLayout",
               "value":true
            })]
         }),new State({
            "name":"selected",
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
         VoiceTrackSelectionComponent._watcherSetupUtil = param1;
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
      
      public function get target() : Object
      {
         return this._target;
      }
      
      public function set target(param1:Object) : void
      {
         currentState = "listing";
         this._target = param1;
         this.init();
      }
      
      public function set loadProgress(param1:Number) : void
      {
      }
      
      private function init() : void
      {
         var _loc2_:Array = null;
         var _loc3_:Number = NaN;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:AnimeSound = null;
         var _loc1_:AnimeScene = Console.getConsole().currentScene;
         _loc2_ = Console.getConsole().getAllSoundOverlapWithScene(_loc1_);
         if(_loc2_ && this._target)
         {
            _loc3_ = _loc2_.length;
            _loc4_ = Console.getConsole().linkageController.getSoundIdByAssetId(_loc1_.id,Character(this._target).id);
            _loc5_ = _loc3_ - 1;
            while(_loc5_ >= 0)
            {
               _loc6_ = _loc2_[_loc5_];
               if(_loc4_.indexOf(_loc6_.id) > -1)
               {
                  _loc2_.splice(_loc5_,1);
               }
               _loc5_--;
            }
         }
         if(_loc2_)
         {
            currentState = "listing";
            this.soundsCollection.source = _loc2_;
            this.soundsCollection.refresh();
         }
         this.listOfDialog.selectedItem = null;
      }
      
      private function onVolumeUpdate(param1:ExtraDataEvent) : void
      {
         this._volume = param1.getData() as Number;
      }
      
      private function onUserSelectThumb(param1:Event) : void
      {
         this._btnAdd.enabled = true;
      }
      
      private function onUserSelect(param1:Event) : void
      {
         if(this.listOfDialog.selectedItem)
         {
            this._btnAdd.enabled = true;
         }
         else
         {
            this._btnAdd.enabled = false;
         }
      }
      
      public function commit(param1:Object) : void
      {
      }
      
      private function onSoundAdded(param1:SoundEvent) : void
      {
         dispatchEvent(new Event(Event.COMPLETE));
      }
      
      private function onClickSave() : void
      {
         var _loc1_:AnimeSound = null;
         var _loc2_:ICommand = null;
         UtilErrorLogger.getInstance().info("SpeechComponent::onClickSave");
         if(this.listOfDialog.selectedItem)
         {
            _loc1_ = this.listOfDialog.selectedItem as AnimeSound;
            if(this._target is AnimeScene)
            {
               Console.getConsole().speechManager.addSoundBySound(_loc1_,AnimeScene(this._target).id);
            }
            else if(this._target is Character)
            {
               _loc2_ = new AssignVoiceToCharacterCommand(_loc1_,Character(this._target));
               _loc2_.execute();
            }
         }
         dispatchEvent(new Event(Event.COMPLETE));
      }
      
      public function updateSoundThumb(param1:SoundThumb) : void
      {
      }
      
      private function onChooseClick() : void
      {
      }
      
      private function onClickCancel() : void
      {
         dispatchEvent(new Event("close"));
      }
      
      public function set added(param1:Boolean) : void
      {
      }
      
      public function destroy() : void
      {
      }
      
      public function saveSoundBySoundThumb(param1:SoundThumb) : void
      {
      }
      
      public function saveSound(param1:ByteArray, param2:XML) : void
      {
      }
      
      protected function onRendererAdd(param1:RendererExistenceEvent) : void
      {
      }
      
      protected function onRendererRemove(param1:RendererExistenceEvent) : void
      {
      }
      
      private function _VoiceTrackSelectionComponent_Panel1_i() : Panel
      {
         var _loc1_:Panel = new Panel();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.controlBarContent = [this._VoiceTrackSelectionComponent_Button1_i(),this._VoiceTrackSelectionComponent_Button2_i()];
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._VoiceTrackSelectionComponent_Array5_c);
         _loc1_.id = "panel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.panel = _loc1_;
         BindingManager.executeBindings(this,"panel",this.panel);
         return _loc1_;
      }
      
      private function _VoiceTrackSelectionComponent_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.styleName = "grey";
         _loc1_.addEventListener("click",this.___btnCancel_click);
         _loc1_.id = "_btnCancel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._btnCancel = _loc1_;
         BindingManager.executeBindings(this,"_btnCancel",this._btnCancel);
         return _loc1_;
      }
      
      public function ___btnCancel_click(param1:MouseEvent) : void
      {
         this.onClickCancel();
      }
      
      private function _VoiceTrackSelectionComponent_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.enabled = false;
         _loc1_.addEventListener("click",this.___btnAdd_click);
         _loc1_.id = "_btnAdd";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._btnAdd = _loc1_;
         BindingManager.executeBindings(this,"_btnAdd",this._btnAdd);
         return _loc1_;
      }
      
      public function ___btnAdd_click(param1:MouseEvent) : void
      {
         this.onClickSave();
      }
      
      private function _VoiceTrackSelectionComponent_Array5_c() : Array
      {
         var _loc1_:Array = [this._VoiceTrackSelectionComponent_PopUpContentBackground1_c(),this._VoiceTrackSelectionComponent_Group2_i()];
         return _loc1_;
      }
      
      private function _VoiceTrackSelectionComponent_PopUpContentBackground1_c() : PopUpContentBackground
      {
         var _loc1_:PopUpContentBackground = new PopUpContentBackground();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _VoiceTrackSelectionComponent_Group2_i() : Group
      {
         var _loc1_:Group = null;
         _loc1_ = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.visible = false;
         _loc1_.includeInLayout = false;
         _loc1_.mxmlContent = [this._VoiceTrackSelectionComponent_VGroup1_c()];
         _loc1_.id = "_VoiceTrackSelectionComponent_Group2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._VoiceTrackSelectionComponent_Group2 = _loc1_;
         BindingManager.executeBindings(this,"_VoiceTrackSelectionComponent_Group2",this._VoiceTrackSelectionComponent_Group2);
         return _loc1_;
      }
      
      private function _VoiceTrackSelectionComponent_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.height = 400;
         _loc1_.mxmlContent = [this._VoiceTrackSelectionComponent_VGroup2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _VoiceTrackSelectionComponent_VGroup2_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.paddingLeft = 24;
         _loc1_.paddingRight = 24;
         _loc1_.paddingTop = 24;
         _loc1_.paddingBottom = 24;
         _loc1_.mxmlContent = [this._VoiceTrackSelectionComponent_DialogList1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _VoiceTrackSelectionComponent_DialogList1_i() : DialogList
      {
         var _loc1_:DialogList = new DialogList();
         _loc1_.percentWidth = 100;
         _loc1_.addEventListener("rendererAdd",this.__listOfDialog_rendererAdd);
         _loc1_.addEventListener("rendererRemove",this.__listOfDialog_rendererRemove);
         _loc1_.addEventListener("change",this.__listOfDialog_change);
         _loc1_.id = "listOfDialog";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.listOfDialog = _loc1_;
         BindingManager.executeBindings(this,"listOfDialog",this.listOfDialog);
         return _loc1_;
      }
      
      public function __listOfDialog_rendererAdd(param1:RendererExistenceEvent) : void
      {
         this.onRendererAdd(param1);
      }
      
      public function __listOfDialog_rendererRemove(param1:RendererExistenceEvent) : void
      {
         this.onRendererRemove(param1);
      }
      
      public function __listOfDialog_change(param1:IndexChangeEvent) : void
      {
         this.onUserSelect(param1);
      }
      
      public function ___VoiceTrackSelectionComponent_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      private function _VoiceTrackSelectionComponent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Select existing voice clips");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"panel.title");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Cancel");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_btnCancel.label");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","LIP-SYNC");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_btnAdd.label");
         result[3] = new Binding(this,function():IList
         {
            return soundsCollection;
         },null,"listOfDialog.dataProvider");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _VoiceTrackSelectionComponent_Group2() : Group
      {
         return this._1611875017_VoiceTrackSelectionComponent_Group2;
      }
      
      public function set _VoiceTrackSelectionComponent_Group2(param1:Group) : void
      {
         var _loc2_:Object = this._1611875017_VoiceTrackSelectionComponent_Group2;
         if(_loc2_ !== param1)
         {
            this._1611875017_VoiceTrackSelectionComponent_Group2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_VoiceTrackSelectionComponent_Group2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _btnAdd() : Button
      {
         return this._1329631684_btnAdd;
      }
      
      public function set _btnAdd(param1:Button) : void
      {
         var _loc2_:Object = this._1329631684_btnAdd;
         if(_loc2_ !== param1)
         {
            this._1329631684_btnAdd = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_btnAdd",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _btnCancel() : Button
      {
         return this._1370988937_btnCancel;
      }
      
      public function set _btnCancel(param1:Button) : void
      {
         var _loc2_:Object = this._1370988937_btnCancel;
         if(_loc2_ !== param1)
         {
            this._1370988937_btnCancel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_btnCancel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get listOfDialog() : DialogList
      {
         return this._654929731listOfDialog;
      }
      
      public function set listOfDialog(param1:DialogList) : void
      {
         var _loc2_:Object = this._654929731listOfDialog;
         if(_loc2_ !== param1)
         {
            this._654929731listOfDialog = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"listOfDialog",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get panel() : Panel
      {
         return this._106433028panel;
      }
      
      public function set panel(param1:Panel) : void
      {
         var _loc2_:Object = this._106433028panel;
         if(_loc2_ !== param1)
         {
            this._106433028panel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"panel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get errorMessage() : String
      {
         return this._1203236063errorMessage;
      }
      
      private function set errorMessage(param1:String) : void
      {
         var _loc2_:Object = this._1203236063errorMessage;
         if(_loc2_ !== param1)
         {
            this._1203236063errorMessage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"errorMessage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _userAssetManager() : UserAssetManager
      {
         return this._1895618663_userAssetManager;
      }
      
      private function set _userAssetManager(param1:UserAssetManager) : void
      {
         var _loc2_:Object = this._1895618663_userAssetManager;
         if(_loc2_ !== param1)
         {
            this._1895618663_userAssetManager = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_userAssetManager",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _userSoundReady() : Boolean
      {
         return this._1883088414_userSoundReady;
      }
      
      private function set _userSoundReady(param1:Boolean) : void
      {
         var _loc2_:Object = this._1883088414_userSoundReady;
         if(_loc2_ !== param1)
         {
            this._1883088414_userSoundReady = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_userSoundReady",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get soundsCollection() : ArrayCollection
      {
         return this._193192190soundsCollection;
      }
      
      private function set soundsCollection(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._193192190soundsCollection;
         if(_loc2_ !== param1)
         {
            this._193192190soundsCollection = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"soundsCollection",_loc2_,param1));
            }
         }
      }
   }
}
