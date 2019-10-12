package anifire.core
{
   import anifire.component.CcActionLoader;
   import anifire.event.SpeechPitchEvent;
   import anifire.interfaces.ISpeak;
   import anifire.models.creator.CCCharacterActionModel;
   import anifire.util.UtilHashArray;
   import flash.events.IEventDispatcher;
   
   public class CCLipSyncController
   {
      
      public static var LIPSYNC_FILE:String = "talk_sync.swf";
      
      public static var DEMO_LIPSYNC_FILE:String = "talk.swf";
      
      public static var LIPSYNC_LIB_ID:String = "lipsync.swf";
      
      public static var DEMO_LIPSYNC_LIB_ID:String = "demolipsync.swf";
      
      private static var _instance:CCLipSyncController;
       
      
      private var _speechSource:IEventDispatcher;
      
      private var _speakingCharacter:ISpeak;
      
      public function CCLipSyncController()
      {
         super();
      }
      
      public static function getInstance() : CCLipSyncController
      {
         if(!_instance)
         {
            _instance = new CCLipSyncController();
         }
         return _instance;
      }
      
      public static function getLipSyncComponentItems(param1:XML, param2:String, param3:Number = 1) : UtilHashArray
      {
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc4_:UtilHashArray = new UtilHashArray();
         _loc5_ = getLipSyncMouthUrl(param1,param2,param3);
         _loc6_ = param1.@theme_id + "." + param1.@type + "." + CCLipSyncController.LIPSYNC_LIB_ID;
         _loc4_.push(_loc5_,_loc6_);
         _loc5_ = getDemoLipSyncMouthUrl(param1,param2,param3);
         _loc6_ = param1.@theme_id + "." + param1.@type + "." + CCLipSyncController.DEMO_LIPSYNC_LIB_ID;
         _loc4_.push(_loc5_,_loc6_);
         return _loc4_;
      }
      
      public static function getLipSyncComponentItemsByCam(param1:CCCharacterActionModel, param2:String, param3:String, param4:Number = 1) : Object
      {
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc5_:Object = {};
         _loc6_ = getLipSyncMouthUrlByCam(param1,param2,param3,param4);
         _loc7_ = param1.themeId + "." + param2 + "." + CCLipSyncController.LIPSYNC_LIB_ID;
         _loc5_[_loc6_] = _loc7_;
         _loc6_ = getDemoLipSyncMouthUrlByCam(param1,param2,param3,param4);
         _loc7_ = param1.themeId + "." + param2 + "." + CCLipSyncController.DEMO_LIPSYNC_LIB_ID;
         _loc5_[_loc6_] = _loc7_;
         return _loc5_;
      }
      
      public static function getFileName(param1:Boolean, param2:String, param3:String, param4:String, param5:String, param6:String = "", param7:Number = 1) : String
      {
         var _loc9_:String = null;
         var _loc10_:String = null;
         var _loc8_:* = "";
         if(param2.indexOf("_") > -1)
         {
            _loc10_ = String(param2).split("_")[0];
            if(_loc10_ != "talk" && (_loc10_ == "front" || _loc10_ == "side"))
            {
               _loc8_ = _loc10_ + "_";
            }
         }
         if(param1)
         {
            if(param7 == 3)
            {
               _loc9_ = getTalkMouthFileName(param6,param5,_loc8_);
            }
            else
            {
               _loc9_ = getTalkMouthFileName(param2,param5,_loc8_);
            }
         }
         else if(param7 == 3)
         {
            _loc9_ = getLipSyncTalkMouthFileName(param6,param5,_loc8_);
         }
         else
         {
            _loc9_ = getLipSyncTalkMouthFileName(param2,param5,_loc8_);
         }
         return _loc9_;
      }
      
      public static function getLipSyncMouthUrl(param1:XML, param2:String = "", param3:Number = 1) : String
      {
         var _loc4_:String = null;
         var _loc5_:String = param1.@theme_id;
         var _loc6_:String = "";
         _loc4_ = _loc5_ + (param3 == 3?"/charparts":"") + "/" + param1.@type + "/" + param1.@path + "/" + getFileName(false,param1.@file,param1.@type,param1.@path,_loc5_,param2,param3);
         return CcActionLoader.getStoreUrl(_loc4_,param1.@theme_id,param3);
      }
      
      public static function getDemoLipSyncMouthUrl(param1:XML, param2:String = "", param3:Number = 1) : String
      {
         var _loc4_:String = null;
         var _loc5_:String = param1.@theme_id;
         var _loc6_:String = "";
         _loc4_ = _loc5_ + (param3 == 3?"/charparts":"") + "/" + param1.@type + "/" + param1.@path + "/" + getFileName(true,param1.@file,param1.@type,param1.@path,_loc5_,param2,param3);
         return CcActionLoader.getStoreUrl(_loc4_,param1.@theme_id,param3);
      }
      
      public static function getLipSyncMouthUrlByCam(param1:CCCharacterActionModel, param2:String, param3:String = "", param4:Number = 1) : String
      {
         var _loc5_:String = null;
         var _loc6_:String = param1.themeId;
         var _loc7_:String = "";
         var _loc8_:String = param1.getComponentByType(param2).path;
         var _loc9_:Array = _loc8_.split("/");
         _loc5_ = _loc9_[0] + (param4 == 3?"/charparts":"") + "/" + _loc9_[1] + "/" + _loc9_[2] + "/" + getFileName(false,_loc9_[3],_loc9_[1],_loc9_[2],_loc6_,param3,param4);
         return CcActionLoader.getStoreUrl(_loc5_,_loc6_,param4);
      }
      
      public static function getDemoLipSyncMouthUrlByCam(param1:CCCharacterActionModel, param2:String, param3:String = "", param4:Number = 1) : String
      {
         var _loc5_:String = null;
         var _loc6_:String = param1.themeId;
         var _loc7_:String = "";
         var _loc8_:String = param1.getComponentByType(param2).path;
         var _loc9_:Array = _loc8_.split("/");
         _loc5_ = _loc9_[0] + (param4 == 3?"/charparts":"") + "/" + _loc9_[1] + "/" + _loc9_[2] + "/" + getFileName(true,_loc9_[3],_loc9_[1],_loc9_[2],_loc6_,param3,param4);
         return CcActionLoader.getStoreUrl(_loc5_,_loc6_,param4);
      }
      
      private static function getTalkMouthFileName(param1:String, param2:String, param3:String = "") : String
      {
         var _loc4_:String = null;
         if(param2 == "family")
         {
            if(param1.indexOf("talk") >= 0)
            {
               return param3 + param1;
            }
            switch(param1)
            {
               case "talk_happy.swf":
               case "happy.swf":
               case "laugh.swf":
               case "surprised.swf":
               case "chewing.swf":
               case "schemeing.swf":
                  return param3 + "talk_happy.swf";
               case "talk_sad.swf":
               case "talk_cry.swf":
               case "sad.swf":
               case "cry.swf":
               case "shock.swf":
               case "sick.swf":
                  return param3 + "talk_sad.swf";
               case "talk_angry.swf":
               case "angry.swf":
               case "taunt.swf":
                  return param3 + "talk_angry.swf";
               default:
                  return param3 + "talk.swf";
            }
         }
         else
         {
            if(param2 == "politics2")
            {
               _loc4_ = "talk.swf";
               if(param1.indexOf("happy") > -1)
               {
                  _loc4_ = "talk_happy.swf";
               }
               else if(param1.indexOf("sad") > -1 || param1.indexOf("angry") > -1 || param1.indexOf("cry") > -1 || param1.indexOf("head_rolleye") > -1)
               {
                  _loc4_ = "talk_sad.swf";
               }
               return param3 + _loc4_;
            }
            return param3 + "talk.swf";
         }
      }
      
      private static function getLipSyncTalkMouthFileName(param1:String, param2:String, param3:String = "") : String
      {
         var _loc4_:String = null;
         if(param2 == "family")
         {
            switch(param1)
            {
               case "talk_happy.swf":
               case "happy.swf":
               case "laugh.swf":
               case "surprised.swf":
               case "chewing.swf":
               case "schemeing.swf":
                  return param3 + "talk_happy_sync.swf";
               case "talk_sad.swf":
               case "talk_cry.swf":
               case "sad.swf":
               case "cry.swf":
               case "shock.swf":
               case "sick.swf":
                  return param3 + "talk_sad_sync.swf";
               case "talk_angry.swf":
               case "angry.swf":
               case "taunt.swf":
                  return param3 + "talk_angry_sync.swf";
               default:
                  return param3 + "talk_sync.swf";
            }
         }
         else
         {
            if(param2 == "politics2")
            {
               _loc4_ = "talk_sync.swf";
               if(param1.indexOf("happy") > -1)
               {
                  _loc4_ = "talk_happy_sync.swf";
               }
               else if(param1.indexOf("sad") > -1 || param1.indexOf("angry") > -1 || param1.indexOf("cry") > -1 || param1.indexOf("head_rolleye") > -1)
               {
                  _loc4_ = "talk_sad_sync.swf";
               }
               return param3 + _loc4_;
            }
            return param3 + "talk_sync.swf";
         }
      }
      
      public function set speechSource(param1:IEventDispatcher) : void
      {
         if(param1 && param1 != this._speechSource)
         {
            if(this._speechSource)
            {
               this._speechSource.removeEventListener(SpeechPitchEvent.PITCH,this.onSpeechCome);
            }
            param1.addEventListener(SpeechPitchEvent.PITCH,this.onSpeechCome);
            this._speechSource = param1;
         }
      }
      
      public function set speakingCharacter(param1:ISpeak) : void
      {
         if(param1 != this._speakingCharacter)
         {
            this._speakingCharacter = param1;
         }
      }
      
      private function onSpeechCome(param1:SpeechPitchEvent) : void
      {
         if(this._speakingCharacter)
         {
            this._speakingCharacter.speak(param1.value);
         }
      }
   }
}
