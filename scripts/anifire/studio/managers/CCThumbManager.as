package anifire.studio.managers
{
   import anifire.component.CCActionThumb;
   import anifire.event.LoadEmbedMovieEvent;
   import anifire.studio.models.ActionThumbModel;
   import anifire.studio.models.CCActionThumbToken;
   import anifire.util.UtilHashBytes;
   import flash.utils.ByteArray;
   
   public class CCThumbManager
   {
      
      public static const MAX_PRODUCER:int = 6;
      
      protected static var _instance:CCThumbManager;
       
      
      protected var workers:Vector.<CCActionThumb>;
      
      protected var tokens:Vector.<CCActionThumbToken>;
      
      protected var loadingTokens:Vector.<CCActionThumbToken>;
      
      public function CCThumbManager()
      {
         super();
         this.tokens = new Vector.<CCActionThumbToken>();
         this.loadingTokens = new Vector.<CCActionThumbToken>();
         this.workers = new Vector.<CCActionThumb>();
         var _loc1_:int = 0;
         while(_loc1_ < MAX_PRODUCER)
         {
            this.workers.push(new CCActionThumb());
            _loc1_++;
         }
      }
      
      public static function get instance() : CCThumbManager
      {
         if(_instance == null)
         {
            _instance = new CCThumbManager();
         }
         return _instance;
      }
      
      public function queueRequest(param1:ActionThumbModel) : CCActionThumbToken
      {
         var _loc2_:CCActionThumbToken = new CCActionThumbToken(param1);
         this.tokens.push(_loc2_);
         this.startProduction();
         return _loc2_;
      }
      
      public function cancelRequest(param1:CCActionThumbToken) : void
      {
         param1.state = CCActionThumbToken.TOKEN_CANCELLED;
         var _loc2_:int = this.tokens.indexOf(param1);
         if(_loc2_ != -1)
         {
            this.tokens.splice(_loc2_,1)[0];
         }
      }
      
      public function releaseToken(param1:CCActionThumbToken) : void
      {
         param1.actionThumb.release();
         this.workers.push(param1.actionThumb);
         this.startProduction();
      }
      
      protected function startProduction() : void
      {
         while(this.tokens.length > 0 && this.workers.length > 0)
         {
            this.handleNextRequest();
         }
      }
      
      protected function handleNextRequest() : void
      {
         var _loc4_:XML = null;
         var _loc5_:UtilHashBytes = null;
         var _loc6_:ByteArray = null;
         var _loc1_:CCActionThumbToken = this.tokens.shift();
         _loc1_.state = CCActionThumbToken.TOKEN_LOADING;
         this.loadingTokens.push(_loc1_);
         var _loc2_:ActionThumbModel = _loc1_.model;
         var _loc3_:CCActionThumb = this.workers.pop();
         _loc3_.reset();
         _loc3_.consumer = _loc1_;
         _loc3_.cacheId = _loc2_.cacheId;
         _loc3_.addEventListener(LoadEmbedMovieEvent.COMPLETE_EVENT,this.onCharacterMakerReady);
         if(_loc2_.characterAction)
         {
            _loc3_.initByCCCharacterActionModel(_loc2_.characterAction);
         }
         else
         {
            _loc4_ = _loc2_.action.imageData["xml"] as XML;
            _loc5_ = _loc2_.action.imageData["imageData"] as UtilHashBytes;
            _loc6_ = _loc2_.action.imageData["figure"] as ByteArray;
            _loc3_.init(_loc4_,_loc5_,null,_loc2_.action.thumb.raceCode,_loc6_);
         }
      }
      
      protected function onCharacterMakerReady(param1:LoadEmbedMovieEvent) : void
      {
         var _loc2_:CCActionThumb = param1.currentTarget as CCActionThumb;
         _loc2_.removeEventListener(LoadEmbedMovieEvent.COMPLETE_EVENT,this.onCharacterMakerReady);
         var _loc3_:int = this.loadingTokens.indexOf(_loc2_.consumer);
         var _loc4_:CCActionThumbToken = this.loadingTokens.splice(_loc3_,1)[0];
         if(_loc4_.state == CCActionThumbToken.TOKEN_CANCELLED)
         {
            _loc2_.release();
            this.workers.push(_loc2_);
            this.startProduction();
         }
         else
         {
            _loc4_.state = CCActionThumbToken.TOKEN_PROCESSING;
            _loc4_.actionThumb = _loc2_;
         }
      }
   }
}
