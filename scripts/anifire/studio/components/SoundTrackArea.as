package anifire.studio.components
{
   import anifire.constant.AnimeConstants;
   import anifire.event.ExtraDataEvent;
   import anifire.studio.commands.AddSoundCommand;
   import anifire.studio.commands.ICommand;
   import anifire.studio.core.AnimeSound;
   import anifire.studio.core.SoundThumb;
   import anifire.studio.events.TimelineEvent;
   import anifire.studio.managers.SoundCollectionController;
   import anifire.studio.managers.StudioDragManager;
   import anifire.studio.managers.StudioSoundManager;
   import anifire.util.UtilUnitConvert;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.ArrayCollection;
   import mx.core.IFlexModuleFactory;
   import mx.core.IUIComponent;
   import mx.core.mx_internal;
   import mx.events.DragEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.managers.DragManager;
   import spark.components.Group;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class SoundTrackArea extends Group implements IBindingClient
   {
      
      private static const SOUND_TRACK_VERTICAL_GAP:Number = 2;
      
      private static const SEPARATOR_COLOR:uint = 14738923;
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _SoundTrackArea_SolidColorStroke1:SolidColorStroke;
      
      public var _SoundTrackArea_SolidColorStroke2:SolidColorStroke;
      
      public var _SoundTrackArea_SolidColorStroke3:SolidColorStroke;
      
      public var _SoundTrackArea_SolidColorStroke4:SolidColorStroke;
      
      public var _SoundTrackArea_SolidColorStroke5:SolidColorStroke;
      
      private var _433101796dropArea:Group;
      
      private var _65731834scrollArea:Group;
      
      private var _188097779scrollContentGroup:Group;
      
      private var _2026140013soundContainerGroup:Group;
      
      private var _356359521soundProxy:SoundContainer;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _soundContainer:ArrayCollection;
      
      private var _soundsController:SoundCollectionController;
      
      private var _newSound:AnimeSound;
      
      private var _defaultTotalFrame:int;
      
      private var _isVoiceTrack:Boolean;
      
      private var _timelineControl:Timeline = null;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SoundTrackArea()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._soundContainer = new ArrayCollection();
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._SoundTrackArea_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_SoundTrackAreaWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SoundTrackArea[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._SoundTrackArea_Line1_c(),this._SoundTrackArea_Line2_c(),this._SoundTrackArea_Line3_c(),this._SoundTrackArea_Line4_c(),this._SoundTrackArea_Line5_c(),this._SoundTrackArea_Group2_i(),this._SoundTrackArea_Group3_i()];
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function trackToPixel(param1:int) : Number
      {
         return Math.floor(param1 * (SoundContainer.SOUNDCONTAINER_HEIGHT + SOUND_TRACK_VERTICAL_GAP));
      }
      
      public static function pixelToTrack(param1:Number) : int
      {
         return int(Math.floor(param1 / (SoundContainer.SOUNDCONTAINER_HEIGHT + SOUND_TRACK_VERTICAL_GAP)));
      }
      
      public static function heightToTrack(param1:Number) : int
      {
         return int(Math.round(param1 / (SoundContainer.SOUNDCONTAINER_HEIGHT + SOUND_TRACK_VERTICAL_GAP)));
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         SoundTrackArea._watcherSetupUtil = param1;
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
      
      public function set soundsController(param1:SoundCollectionController) : void
      {
         this._soundsController = param1;
      }
      
      public function addSound(param1:AnimeSound) : SoundContainer
      {
         var _loc2_:SoundContainer = this.createSoundContainer(param1);
         if(_loc2_)
         {
            this._soundContainer.addItem(_loc2_);
            this.soundContainerGroup.addElement(_loc2_);
         }
         return _loc2_;
      }
      
      private function createSoundContainer(param1:AnimeSound) : SoundContainer
      {
         var _loc2_:SoundContainer = new SoundContainer();
         _loc2_.addEventListener(MouseEvent.MOUSE_DOWN,this.onSoundContainerMouseDown);
         _loc2_.addEventListener("TIMELINE_CHANGE",this.containerMouseUpHandler);
         _loc2_.animeSound = param1;
         _loc2_.name = param1.getID();
         _loc2_.soundsController = this._soundsController;
         _loc2_.setTimelineReferer(this._timelineControl);
         return _loc2_;
      }
      
      public function setTimelineReferer(param1:Timeline) : void
      {
         this._timelineControl = param1;
      }
      
      public function removeSoundById(param1:String) : void
      {
         var _loc2_:SoundContainer = null;
         var _loc3_:int = 0;
         while(_loc3_ < this._soundContainer.length)
         {
            _loc2_ = this._soundContainer.getItemAt(_loc3_) as SoundContainer;
            if(_loc2_.id == param1)
            {
               this.removeSound(_loc3_);
               return;
            }
            _loc3_++;
         }
      }
      
      private function removeSound(param1:int) : void
      {
         var _loc2_:SoundContainer = null;
         if(param1 >= 0)
         {
            _loc2_ = this._soundContainer.getItemAt(param1) as SoundContainer;
            this._soundContainer.removeItemAt(param1);
            this.removeSoundContainer(_loc2_);
         }
      }
      
      public function removeAllSounds() : void
      {
         this.soundContainerGroup.removeAllElements();
         this._soundContainer.removeAll();
      }
      
      private function removeSoundContainer(param1:SoundContainer) : void
      {
         if(param1 && this.soundContainerGroup.containsElement(param1))
         {
            param1.destroy();
            this.soundContainerGroup.removeElement(param1);
            param1.removeEventListener(MouseEvent.MOUSE_DOWN,this.onSoundContainerMouseDown);
         }
      }
      
      protected function containerMouseUpHandler(param1:ExtraDataEvent) : void
      {
         dispatchEvent(new TimelineEvent(TimelineEvent.SOUND_MOUSE_UP));
      }
      
      private function onSoundContainerMouseDown(param1:MouseEvent) : void
      {
         var _loc2_:SoundContainer = param1.currentTarget as SoundContainer;
         if(_loc2_)
         {
            this.soundContainerGroup.addElement(_loc2_);
         }
      }
      
      public function scroll(param1:Number) : void
      {
         this.scrollArea.horizontalScrollPosition = param1;
      }
      
      protected function onDragEnter(param1:DragEvent) : void
      {
         var _loc2_:SoundThumb = null;
         var _loc3_:AnimeSound = null;
         if(param1.dragSource.hasFormat(SoundThumb.DRAG_DATA_FORMAT))
         {
            _loc2_ = param1.dragSource.dataForFormat(SoundThumb.DRAG_DATA_FORMAT) as SoundThumb;
            if(this._isVoiceTrack)
            {
               if(!_loc2_.isVoice)
               {
                  return;
               }
            }
            else if(_loc2_.isVoice)
            {
               return;
            }
            DragManager.acceptDragDrop(param1.target as IUIComponent);
            if(this._newSound == null)
            {
               this._newSound = new AnimeSound();
            }
            this._newSound.soundThumb = _loc2_;
            this._newSound.volume = 1;
            this._newSound.totalFrame = UtilUnitConvert.secToFrame(_loc2_.duration / 1000);
            if(param1.dragSource.hasFormat(AnimeSound.DRAG_DATA_FORMAT))
            {
               _loc3_ = param1.dragSource.dataForFormat(AnimeSound.DRAG_DATA_FORMAT) as AnimeSound;
               this._newSound.totalFrame = _loc3_.totalFrame;
               if(_loc3_.scene)
               {
                  this._newSound.totalFrame = _loc3_.defaultTotalFrame;
               }
               this._newSound.volume = _loc3_.volume;
               this._newSound.trimStartFrame = _loc3_.trimStartFrame;
               this._newSound.trimEndFrame = _loc3_.trimEndFrame;
               if(_loc3_.hasFading)
               {
                  this._newSound.addFading(_loc3_.fadeInDuration,_loc3_.fadeOutDuration,_loc3_.fadeInVolume,_loc3_.fadeOutVolume);
               }
            }
            this.soundProxy.animeSound = this._newSound;
            this._defaultTotalFrame = this._newSound.totalFrame;
            this.onDragOver(param1);
         }
      }
      
      protected function onDragDrop(param1:DragEvent) : void
      {
         var _loc2_:ICommand = null;
         if(param1.dragSource.hasFormat(SoundThumb.DRAG_DATA_FORMAT))
         {
            this.soundProxy.visible = false;
            _loc2_ = new AddSoundCommand(this._newSound);
            _loc2_.execute();
            this._newSound = null;
         }
      }
      
      protected function onDragOver(param1:DragEvent) : void
      {
         var _loc2_:SoundThumb = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:AnimeSound = null;
         var _loc7_:AnimeSound = null;
         var _loc8_:AnimeSound = null;
         var _loc9_:Boolean = false;
         if(param1.dragSource.hasFormat(SoundThumb.DRAG_DATA_FORMAT))
         {
            _loc2_ = param1.dragSource.dataForFormat(SoundThumb.DRAG_DATA_FORMAT) as SoundThumb;
            _loc3_ = UtilUnitConvert.xToFrame(this.scrollArea.contentMouseX - 20);
            _loc4_ = SoundTrackArea.pixelToTrack(param1.localY);
            _loc5_ = this._defaultTotalFrame;
            _loc6_ = this._newSound;
            _loc3_ = StudioSoundManager.validateStartFrame(_loc3_);
            _loc4_ = StudioSoundManager.validateTrack(_loc4_);
            _loc5_ = StudioSoundManager.validateTotalFrame(_loc5_);
            _loc7_ = StudioSoundManager.getLastSoundBeforeFrameOnTrack(this._soundsController.sounds,_loc3_,_loc4_);
            _loc8_ = StudioSoundManager.getFirstSoundAfterFrameOnTrack(this._soundsController.sounds,_loc3_,_loc4_);
            _loc9_ = false;
            if(StudioSoundManager.getSoundAtFrameOnTrack(this._soundsController.sounds,_loc3_,_loc4_) != null)
            {
               _loc9_ = true;
            }
            else if(_loc7_ && _loc7_.endFrame >= _loc3_)
            {
               _loc9_ = true;
            }
            else if(this._isVoiceTrack && _loc8_ && _loc3_ + _loc5_ - 1 >= _loc8_.startFrame)
            {
               _loc9_ = true;
            }
            else if(_loc8_ && _loc3_ + AnimeConstants.SOUND_FRAME_MINIMUM - 1 >= _loc8_.startFrame)
            {
               _loc9_ = true;
            }
            if(_loc9_)
            {
               DragManager.showFeedback(DragManager.NONE);
               this.soundProxy.visible = false;
               if(StudioDragManager.getDragImage(param1.dragSource))
               {
                  StudioDragManager.getDragImage(param1.dragSource).visible = true;
               }
               return;
            }
            DragManager.showFeedback(DragManager.COPY);
            this.soundProxy.visible = true;
            if(StudioDragManager.getDragImage(param1.dragSource))
            {
               StudioDragManager.getDragImage(param1.dragSource).visible = false;
            }
            if(_loc8_ && !this._isVoiceTrack)
            {
               _loc5_ = Math.min(_loc5_,_loc8_.startFrame - _loc3_);
            }
            _loc6_.startFrame = _loc3_;
            _loc6_.totalFrame = _loc5_;
            _loc6_.trackNum = _loc4_;
         }
      }
      
      protected function onDragExit(param1:DragEvent) : void
      {
         if(param1.dragSource.hasFormat(SoundThumb.DRAG_DATA_FORMAT))
         {
            DragManager.showFeedback(DragManager.NONE);
            this.soundProxy.visible = false;
            if(StudioDragManager.getDragImage(param1.dragSource))
            {
               StudioDragManager.getDragImage(param1.dragSource).visible = true;
            }
         }
      }
      
      public function setWaveformVisible(param1:Boolean) : void
      {
         var _loc2_:SoundContainer = null;
         var _loc3_:uint = 0;
         if(this._soundContainer.length > 0)
         {
            _loc3_ = 0;
            _loc3_ = 0;
            while(_loc3_ < this._soundContainer.length)
            {
               _loc2_ = this._soundContainer[_loc3_] as SoundContainer;
               if(_loc2_)
               {
                  _loc2_.soundItem.setWaveformVisible(param1);
               }
               _loc3_++;
            }
         }
      }
      
      public function set isVoiceTrack(param1:Boolean) : void
      {
         this._isVoiceTrack = param1;
      }
      
      private function _SoundTrackArea_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.y = 1;
         _loc1_.percentWidth = 100;
         _loc1_.stroke = this._SoundTrackArea_SolidColorStroke1_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SoundTrackArea_SolidColorStroke1_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         this._SoundTrackArea_SolidColorStroke1 = _loc1_;
         BindingManager.executeBindings(this,"_SoundTrackArea_SolidColorStroke1",this._SoundTrackArea_SolidColorStroke1);
         return _loc1_;
      }
      
      private function _SoundTrackArea_Line2_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.y = 21;
         _loc1_.percentWidth = 100;
         _loc1_.stroke = this._SoundTrackArea_SolidColorStroke2_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SoundTrackArea_SolidColorStroke2_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         this._SoundTrackArea_SolidColorStroke2 = _loc1_;
         BindingManager.executeBindings(this,"_SoundTrackArea_SolidColorStroke2",this._SoundTrackArea_SolidColorStroke2);
         return _loc1_;
      }
      
      private function _SoundTrackArea_Line3_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.y = 41;
         _loc1_.percentWidth = 100;
         _loc1_.stroke = this._SoundTrackArea_SolidColorStroke3_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SoundTrackArea_SolidColorStroke3_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         this._SoundTrackArea_SolidColorStroke3 = _loc1_;
         BindingManager.executeBindings(this,"_SoundTrackArea_SolidColorStroke3",this._SoundTrackArea_SolidColorStroke3);
         return _loc1_;
      }
      
      private function _SoundTrackArea_Line4_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.y = 61;
         _loc1_.percentWidth = 100;
         _loc1_.stroke = this._SoundTrackArea_SolidColorStroke4_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SoundTrackArea_SolidColorStroke4_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         this._SoundTrackArea_SolidColorStroke4 = _loc1_;
         BindingManager.executeBindings(this,"_SoundTrackArea_SolidColorStroke4",this._SoundTrackArea_SolidColorStroke4);
         return _loc1_;
      }
      
      private function _SoundTrackArea_Line5_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.y = 81;
         _loc1_.percentWidth = 100;
         _loc1_.stroke = this._SoundTrackArea_SolidColorStroke5_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SoundTrackArea_SolidColorStroke5_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         this._SoundTrackArea_SolidColorStroke5 = _loc1_;
         BindingManager.executeBindings(this,"_SoundTrackArea_SolidColorStroke5",this._SoundTrackArea_SolidColorStroke5);
         return _loc1_;
      }
      
      private function _SoundTrackArea_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._SoundTrackArea_Rect1_c()];
         _loc1_.addEventListener("dragEnter",this.__dropArea_dragEnter);
         _loc1_.addEventListener("dragOver",this.__dropArea_dragOver);
         _loc1_.addEventListener("dragExit",this.__dropArea_dragExit);
         _loc1_.addEventListener("dragDrop",this.__dropArea_dragDrop);
         _loc1_.id = "dropArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dropArea = _loc1_;
         BindingManager.executeBindings(this,"dropArea",this.dropArea);
         return _loc1_;
      }
      
      private function _SoundTrackArea_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._SoundTrackArea_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SoundTrackArea_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16711680;
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      public function __dropArea_dragEnter(param1:DragEvent) : void
      {
         this.onDragEnter(param1);
      }
      
      public function __dropArea_dragOver(param1:DragEvent) : void
      {
         this.onDragOver(param1);
      }
      
      public function __dropArea_dragExit(param1:DragEvent) : void
      {
         this.onDragExit(param1);
      }
      
      public function __dropArea_dragDrop(param1:DragEvent) : void
      {
         this.onDragDrop(param1);
      }
      
      private function _SoundTrackArea_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.top = 2;
         _loc1_.percentWidth = 100;
         _loc1_.clipAndEnableScrolling = true;
         _loc1_.mouseEnabled = false;
         _loc1_.mxmlContent = [this._SoundTrackArea_Group4_i()];
         _loc1_.id = "scrollArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.scrollArea = _loc1_;
         BindingManager.executeBindings(this,"scrollArea",this.scrollArea);
         return _loc1_;
      }
      
      private function _SoundTrackArea_Group4_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentHeight = 100;
         _loc1_.mouseEnabled = false;
         _loc1_.mxmlContent = [this._SoundTrackArea_SoundContainer1_i(),this._SoundTrackArea_Group5_i()];
         _loc1_.id = "scrollContentGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.scrollContentGroup = _loc1_;
         BindingManager.executeBindings(this,"scrollContentGroup",this.scrollContentGroup);
         return _loc1_;
      }
      
      private function _SoundTrackArea_SoundContainer1_i() : SoundContainer
      {
         var _loc1_:SoundContainer = new SoundContainer();
         _loc1_.visible = false;
         _loc1_.mouseChildren = false;
         _loc1_.mouseEnabled = false;
         _loc1_.id = "soundProxy";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.soundProxy = _loc1_;
         BindingManager.executeBindings(this,"soundProxy",this.soundProxy);
         return _loc1_;
      }
      
      private function _SoundTrackArea_Group5_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mouseEnabled = false;
         _loc1_.id = "soundContainerGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.soundContainerGroup = _loc1_;
         BindingManager.executeBindings(this,"soundContainerGroup",this.soundContainerGroup);
         return _loc1_;
      }
      
      private function _SoundTrackArea_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():uint
         {
            return SEPARATOR_COLOR;
         },null,"_SoundTrackArea_SolidColorStroke1.color");
         result[1] = new Binding(this,function():Number
         {
            return SOUND_TRACK_VERTICAL_GAP;
         },null,"_SoundTrackArea_SolidColorStroke1.weight");
         result[2] = new Binding(this,function():uint
         {
            return SEPARATOR_COLOR;
         },null,"_SoundTrackArea_SolidColorStroke2.color");
         result[3] = new Binding(this,function():Number
         {
            return SOUND_TRACK_VERTICAL_GAP;
         },null,"_SoundTrackArea_SolidColorStroke2.weight");
         result[4] = new Binding(this,function():uint
         {
            return SEPARATOR_COLOR;
         },null,"_SoundTrackArea_SolidColorStroke3.color");
         result[5] = new Binding(this,function():Number
         {
            return SOUND_TRACK_VERTICAL_GAP;
         },null,"_SoundTrackArea_SolidColorStroke3.weight");
         result[6] = new Binding(this,function():uint
         {
            return SEPARATOR_COLOR;
         },null,"_SoundTrackArea_SolidColorStroke4.color");
         result[7] = new Binding(this,function():Number
         {
            return SOUND_TRACK_VERTICAL_GAP;
         },null,"_SoundTrackArea_SolidColorStroke4.weight");
         result[8] = new Binding(this,function():uint
         {
            return SEPARATOR_COLOR;
         },null,"_SoundTrackArea_SolidColorStroke5.color");
         result[9] = new Binding(this,function():Number
         {
            return SOUND_TRACK_VERTICAL_GAP;
         },null,"_SoundTrackArea_SolidColorStroke5.weight");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get dropArea() : Group
      {
         return this._433101796dropArea;
      }
      
      public function set dropArea(param1:Group) : void
      {
         var _loc2_:Object = this._433101796dropArea;
         if(_loc2_ !== param1)
         {
            this._433101796dropArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dropArea",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scrollArea() : Group
      {
         return this._65731834scrollArea;
      }
      
      public function set scrollArea(param1:Group) : void
      {
         var _loc2_:Object = this._65731834scrollArea;
         if(_loc2_ !== param1)
         {
            this._65731834scrollArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scrollArea",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scrollContentGroup() : Group
      {
         return this._188097779scrollContentGroup;
      }
      
      public function set scrollContentGroup(param1:Group) : void
      {
         var _loc2_:Object = this._188097779scrollContentGroup;
         if(_loc2_ !== param1)
         {
            this._188097779scrollContentGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scrollContentGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get soundContainerGroup() : Group
      {
         return this._2026140013soundContainerGroup;
      }
      
      public function set soundContainerGroup(param1:Group) : void
      {
         var _loc2_:Object = this._2026140013soundContainerGroup;
         if(_loc2_ !== param1)
         {
            this._2026140013soundContainerGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"soundContainerGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get soundProxy() : SoundContainer
      {
         return this._356359521soundProxy;
      }
      
      public function set soundProxy(param1:SoundContainer) : void
      {
         var _loc2_:Object = this._356359521soundProxy;
         if(_loc2_ !== param1)
         {
            this._356359521soundProxy = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"soundProxy",_loc2_,param1));
            }
         }
      }
   }
}
