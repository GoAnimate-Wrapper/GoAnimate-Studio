package anifire.studio.managers
{
   import anifire.constant.ServerConstants;
   import anifire.managers.AppConfigManager;
   import anifire.studio.models.LanguageModel;
   import anifire.studio.models.VoiceModel;
   import anifire.util.UtilErrorLogger;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.utils.Dictionary;
   import mx.collections.ArrayCollection;
   
   public class VoiceInfoManager extends EventDispatcher
   {
      
      private static var _instance:VoiceInfoManager;
       
      
      public var languages:ArrayCollection;
      
      private var languageLookup:Dictionary;
      
      private var voiceLookup:Dictionary;
      
      private var _ready:Boolean;
      
      private var _loading:Boolean;
      
      private var loader:URLLoader;
      
      public function VoiceInfoManager()
      {
         super();
         this.languageLookup = new Dictionary();
         this.voiceLookup = new Dictionary();
      }
      
      public static function get instance() : VoiceInfoManager
      {
         if(_instance == null)
         {
            _instance = new VoiceInfoManager();
         }
         return _instance;
      }
      
      public function get isReady() : Boolean
      {
         return this._ready;
      }
      
      public function load() : void
      {
         var _loc1_:URLVariables = null;
         var _loc2_:URLRequest = null;
         if(!this._ready && !this._loading)
         {
            _loc1_ = AppConfigManager.instance.createURLVariables();
            _loc2_ = new URLRequest(ServerConstants.ACTION_GET_TTSVOICE);
            _loc2_.method = URLRequestMethod.POST;
            _loc2_.data = _loc1_;
            this.loader = new URLLoader();
            this.loader.dataFormat = URLLoaderDataFormat.TEXT;
            this.loader.addEventListener(IOErrorEvent.IO_ERROR,this.onIOError);
            this.loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onSecurityError);
            this.loader.addEventListener(Event.COMPLETE,this.onComplete);
            this.loader.load(_loc2_);
            this._loading = true;
         }
      }
      
      private function handleError() : void
      {
         this._loading = false;
         UtilErrorLogger.getInstance().appendCustomError("GetVoiceXML Fail");
      }
      
      private function onIOError(param1:IOErrorEvent) : void
      {
         this.handleError();
      }
      
      private function onSecurityError(param1:SecurityErrorEvent) : void
      {
         this.handleError();
      }
      
      private function onComplete(param1:Event) : void
      {
         this._loading = false;
         this.parse(new XML(this.loader.data as String));
      }
      
      private function parse(param1:XML) : void
      {
         this.languages = new ArrayCollection();
         var _loc2_:XMLList = param1.child("language");
         var _loc3_:int = _loc2_.length();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            this.addLanguage(_loc2_[_loc4_]);
            _loc4_++;
         }
         this._ready = true;
         dispatchEvent(new Event(Event.COMPLETE));
      }
      
      private function addLanguage(param1:XML) : void
      {
         var _loc3_:VoiceModel = null;
         var _loc2_:LanguageModel = new LanguageModel(param1);
         this.languageLookup[_loc2_.id] = _loc2_;
         for each(_loc3_ in _loc2_.voices)
         {
            this.voiceLookup[_loc3_.id] = _loc3_;
         }
         this.languages.addItem(_loc2_);
      }
      
      public function getLanguageById(param1:String) : LanguageModel
      {
         return this.languageLookup[param1];
      }
      
      public function getVoiceById(param1:String) : VoiceModel
      {
         return this.voiceLookup[param1];
      }
      
      public function getGenderByLangId(param1:String) : ArrayCollection
      {
         var _loc6_:VoiceModel = null;
         var _loc2_:ArrayCollection = new ArrayCollection();
         var _loc3_:LanguageModel = this.languageLookup[param1];
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = false;
         if(_loc3_)
         {
            for each(_loc6_ in _loc3_.voices)
            {
               if(_loc6_.gender == "M")
               {
                  _loc4_ = true;
               }
               else if(_loc6_.gender == "F")
               {
                  _loc5_ = true;
               }
            }
         }
         if(_loc4_)
         {
            _loc2_.addItem({
               "label":"Male",
               "data":"M"
            });
         }
         if(_loc5_)
         {
            _loc2_.addItem({
               "label":"Female",
               "data":"F"
            });
         }
         return _loc2_;
      }
   }
}
