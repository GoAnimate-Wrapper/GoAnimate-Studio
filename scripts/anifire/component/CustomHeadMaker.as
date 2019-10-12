package anifire.component
{
   import anifire.cc.view.CCHeadView;
   import anifire.cc.view.CcHeadComponent;
   import anifire.color.SelectedColor;
   import anifire.event.LoadEmbedMovieEvent;
   import anifire.models.creator.CCCharacterActionModel;
   import anifire.util.UtilColor;
   import anifire.util.UtilPlain;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   
   public class CustomHeadMaker extends MovieClip
   {
      
      public static const COMPONENT_NEEDS_REPLACE:String = "event_replace_comp";
      
      public static const STATE_NULL:String = "null";
      
      public static const STATE_LOADING:String = "loading";
      
      public static const STATE_FINISH_LOAD:String = "finish_load";
       
      
      private const SKELETON:String = "skeleton";
      
      private const BODYSHAPE:String = "bodyshape";
      
      private const SWF_EXT:String = ".swf";
      
      private const NODE_COMPONENT:String = "component";
      
      private const XML_DESC:String = "desc.xml";
      
      private const UPPERBODY:String = "upper_body";
      
      private const CLIPUPPER:String = "theUpper";
      
      private const LOWERBODY:String = "lower_body";
      
      private const CLIPLOWER:String = "theLower";
      
      private const DEFAULTHEAD:String = "defaultHead";
      
      private const LIB_LEFT:String = "Left";
      
      private const LIB_RIGHT:String = "Right";
      
      private var _headXML:XML;
      
      private var _eventDispatcher:EventDispatcher;
      
      private var should_decrypt:Boolean = true;
      
      private var _shouldPauseOnLoadByteComplete:Boolean;
      
      private var _useSpeechMouth:Boolean = false;
      
      private var _state:String;
      
      private var _head:CcHeadComponent;
      
      private var _head2:CCHeadView;
      
      private var _useImageLibrary:Boolean = false;
      
      private var _sceneId:String;
      
      public function CustomHeadMaker()
      {
         super();
         this.state = STATE_NULL;
         this._eventDispatcher = new EventDispatcher();
      }
      
      private function get useSpeechMouth() : Boolean
      {
         return this._useSpeechMouth;
      }
      
      private function set useSpeechMouth(param1:Boolean) : void
      {
         this._useSpeechMouth = param1;
      }
      
      public function get shouldPauseOnLoadBytesComplete() : Boolean
      {
         return this._shouldPauseOnLoadByteComplete;
      }
      
      public function set shouldPauseOnLoadBytesComplete(param1:Boolean) : void
      {
         this._shouldPauseOnLoadByteComplete = param1;
      }
      
      private function get headXML() : XML
      {
         return this._headXML;
      }
      
      private function set headXML(param1:XML) : void
      {
         this._headXML = param1;
      }
      
      private function get state() : String
      {
         return this._state;
      }
      
      private function set state(param1:String) : void
      {
         this._state = param1;
      }
      
      public function get eventDispatcher() : EventDispatcher
      {
         return this._eventDispatcher;
      }
      
      public function get lookAtCameraSupported() : Boolean
      {
         if(this._head)
         {
            return this._head.supportLookAtCamera;
         }
         if(this._head2)
         {
            return this._head2.supportLookAtCamera;
         }
         return false;
      }
      
      public function get lookAtCamera() : Boolean
      {
         if(this._head)
         {
            return this._head.lookAtCamera;
         }
         if(this._head2)
         {
            return this._head2.lookAtCamera;
         }
         return false;
      }
      
      public function set lookAtCamera(param1:Boolean) : void
      {
         if(this._head)
         {
            this._head.lookAtCamera = param1;
         }
         if(this._head2)
         {
            this._head2.lookAtCamera = param1;
         }
      }
      
      public function set sceneId(param1:String) : void
      {
         this._sceneId = param1;
      }
      
      public function get demoSpeech() : Boolean
      {
         return false;
      }
      
      public function set demoSpeech(param1:Boolean) : void
      {
         if(this._head)
         {
            this._head.useTalkMouth = param1;
         }
         else if(this._head2)
         {
            this._head2.useTalkMouth = param1;
         }
      }
      
      public function initBySwfs(param1:XML) : void
      {
         this.initByXml(param1);
      }
      
      public function set useImageLibrary(param1:Boolean) : void
      {
         this._useImageLibrary = param1;
      }
      
      public function init(param1:Object) : void
      {
         if(param1 is XML)
         {
            this.initByXml(param1 as XML);
         }
         else if(param1 is CCCharacterActionModel)
         {
            this.initByCam(param1 as CCCharacterActionModel);
         }
      }
      
      private function onHeadLoaded(param1:Event) : void
      {
         IEventDispatcher(param1.target).removeEventListener(param1.type,this.onHeadLoaded);
         this.dispatchEvent(new LoadEmbedMovieEvent(LoadEmbedMovieEvent.COMPLETE_EVENT));
      }
      
      public function prepareImage(param1:String, param2:Boolean = true) : void
      {
         if(this._useImageLibrary)
         {
            if(this._head)
            {
               this._head.prepareImage(param1,param2);
            }
            else if(this._head2)
            {
               this._head2.prepareImage(param1,param2);
            }
         }
      }
      
      public function initByXml(param1:XML) : void
      {
         if(!this._head)
         {
            this._head = new CcHeadComponent();
            this.addChild(this._head);
         }
         this._head.init(param1,this._sceneId,this._useImageLibrary);
         this._head.addEventListener(Event.COMPLETE,this.onHeadLoaded);
         this._head.load();
      }
      
      public function initByCam(param1:CCCharacterActionModel) : void
      {
         if(!this._head2)
         {
            this._head2 = new CCHeadView();
            this.addChild(this._head2);
         }
         this._head2.initByCam(param1,this._sceneId,this._useImageLibrary);
         this._head2.addEventListener(Event.COMPLETE,this.onHeadLoaded);
         this._head2.load();
      }
      
      public function speak(param1:Number) : void
      {
         if(this._head)
         {
            this._head.speak(param1);
         }
         else if(this._head2)
         {
            this._head2.speak(param1);
         }
      }
      
      public function changeColor(param1:SelectedColor, param2:String = "") : Number
      {
         var _loc3_:DisplayObject = null;
         if(param2 == "")
         {
            _loc3_ = this;
         }
         else
         {
            _loc3_ = UtilPlain.getInstance(this,param2);
         }
         var _loc4_:uint = UtilColor.setAssetPartColor(_loc3_,param1.areaName,param1.dstColor);
         return _loc4_;
      }
      
      public function removeComponentById(param1:String) : void
      {
         var _loc2_:DisplayObjectContainer = null;
         _loc2_ = UtilPlain.getInstance(this,param1);
         var _loc3_:DisplayObjectContainer = _loc2_.parent;
         var _loc4_:int = _loc3_.numChildren - 1;
         while(_loc4_ >= 0)
         {
            if(_loc3_.getChildAt(_loc4_).name == param1)
            {
               _loc3_.removeChildAt(_loc4_);
            }
            _loc4_--;
         }
      }
      
      public function unloadAssetImage(param1:Boolean) : void
      {
         this.destroy(param1);
      }
      
      public function destroy(param1:Boolean = true, param2:Boolean = false) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Array = UtilPlain.getLoaderItem(this);
         _loc3_ = 0;
         while(_loc3_ < _loc4_.length)
         {
            Loader(_loc4_[_loc3_]).unloadAndStop(param1);
            Loader(_loc4_[_loc3_]).parent.removeChild(Loader(_loc4_[_loc3_]));
            _loc3_++;
         }
         _loc3_ = this.numChildren;
         while(_loc3_ > 0)
         {
            _loc3_--;
         }
         this.state = STATE_NULL;
         this._eventDispatcher = new EventDispatcher();
         if(this._head)
         {
            this._head.destroy();
         }
         else if(this._head2)
         {
            this._head2.destroy();
         }
      }
   }
}
