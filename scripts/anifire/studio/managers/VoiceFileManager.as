package anifire.studio.managers
{
   import anifire.core.AssetLinkage;
   import anifire.studio.assets.controllers.AssetTransitionHelper;
   import anifire.studio.core.AnimeScene;
   import anifire.studio.core.AnimeSound;
   import anifire.studio.core.Console;
   import anifire.util.UtilErrorLogger;
   import anifire.util.UtilHashArray;
   import flash.events.EventDispatcher;
   
   public class VoiceFileManager extends EventDispatcher
   {
       
      
      private var _sounds:UtilHashArray;
      
      public function VoiceFileManager()
      {
         this._sounds = new UtilHashArray();
         super();
      }
      
      public function get sounds() : UtilHashArray
      {
         return this._sounds;
      }
      
      public function addSoundBySound(param1:AnimeSound, param2:Boolean = true) : void
      {
         Console.getConsole().thumbTray.stopAllSounds();
         if(param2)
         {
            param1.previewSound();
         }
         this.sounds.push(param1.getID(),param1);
      }
      
      public function serializeSound(param1:Boolean = true, param2:Object = null) : String
      {
         var curSound:AnimeSound = null;
         var scId:String = null;
         var scene:AnimeScene = null;
         var delay:int = 0;
         var logger:UtilErrorLogger = null;
         var stockdata:Boolean = param1;
         var log:Object = param2;
         var xmlStr:String = "";
         var n:int = this.sounds.length;
         var i:int = 0;
         while(i < n)
         {
            try
            {
               curSound = this.sounds.getValueByIndex(i) as AnimeSound;
               scId = Console.getConsole().linkageController.getTargetIdOfSpeech(curSound.getID());
               scene = Console.getConsole().getScenebyId(scId.split(AssetLinkage.LINK)[0]);
               delay = AssetTransitionHelper.getTotalFrameOfTransitionBeforeNarration(scene.assetTransitions);
               curSound.startFrame = Console.getConsole().timelineController.getGlobalStartFrame(scene) + delay;
               curSound.endFrame = curSound.startFrame + curSound.soundThumb.totalFrame - 1;
               xmlStr = xmlStr + curSound.serialize(stockdata,true,log);
            }
            catch(e:Error)
            {
               logger = UtilErrorLogger.getInstance();
               logger.appendCustomError("VoiceFile::serialize()",e);
            }
            i++;
         }
         return xmlStr;
      }
      
      public function removeSoundById(param1:String) : AnimeSound
      {
         var _loc2_:AnimeSound = AnimeSound(this.sounds.getValueByKey(param1));
         if(_loc2_ != null)
         {
            _loc2_.stopSound();
            this.sounds.remove(this.sounds.getIndex(param1),1);
         }
         return _loc2_;
      }
   }
}
