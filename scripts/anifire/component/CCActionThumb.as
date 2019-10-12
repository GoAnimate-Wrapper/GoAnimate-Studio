package anifire.component
{
   import anifire.constant.RaceConstants;
   import anifire.event.LoadEmbedMovieEvent;
   import anifire.interfaces.ICharacter;
   import anifire.models.creator.CCCharacterActionModel;
   import anifire.util.UtilHashBytes;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.utils.ByteArray;
   
   public class CCActionThumb extends Sprite
   {
       
      
      public var consumer;
      
      public var cacheId:String;
      
      public var captureTarget:DisplayObject;
      
      protected var ccMaker:CustomActionMaker;
      
      protected var scMaker:SkinnedCharacterMaker;
      
      public function CCActionThumb()
      {
         super();
         this.ccMaker = new CustomActionMaker();
      }
      
      public function reset() : void
      {
         if(this.ccMaker)
         {
            this.ccMaker.reset();
         }
         this.cacheId = null;
         this.captureTarget = null;
      }
      
      public function release() : void
      {
         this.consumer = null;
         if(this.ccMaker)
         {
            this.ccMaker.destroy(false);
         }
         if(this.scMaker)
         {
            this.scMaker.destroy(false);
            this.scMaker = null;
         }
      }
      
      public function init(param1:XML, param2:UtilHashBytes, param3:UtilHashBytes = null, param4:int = 1, param5:ByteArray = null) : void
      {
         switch(param4)
         {
            case RaceConstants.CUSTOM_CHARACTER:
               this.ccMaker.addEventListener(LoadEmbedMovieEvent.COMPLETE_EVENT,this.initCCMakerComplete);
               this.ccMaker.initBySwfs(param1,param2,param3);
               break;
            case RaceConstants.SKINNED_SWF:
               this.scMaker = new SkinnedCharacterMaker();
               this.scMaker.addEventListener(LoadEmbedMovieEvent.COMPLETE_EVENT,this.initCCMakerComplete);
               this.scMaker.init(param1,param5,param2);
         }
      }
      
      public function initByXml(param1:XML) : void
      {
         if(param1)
         {
            this.ccMaker.addEventListener(LoadEmbedMovieEvent.COMPLETE_EVENT,this.initCCMakerComplete);
            this.ccMaker.initByXml(param1);
         }
      }
      
      public function initByCCCharacterActionModel(param1:CCCharacterActionModel) : void
      {
         if(param1)
         {
            this.ccMaker.addEventListener(LoadEmbedMovieEvent.COMPLETE_EVENT,this.initCCMakerComplete);
            this.ccMaker.initByCam(param1);
         }
      }
      
      private function initCCMakerComplete(param1:Event) : void
      {
         var _loc2_:ICharacter = ICharacter(param1.currentTarget);
         _loc2_.reloadSkin();
         this.captureTarget = param1.currentTarget as DisplayObject;
         dispatchEvent(new LoadEmbedMovieEvent(LoadEmbedMovieEvent.COMPLETE_EVENT));
      }
   }
}
