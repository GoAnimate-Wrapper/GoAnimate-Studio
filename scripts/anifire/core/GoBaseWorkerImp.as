package anifire.core
{
   import anifire.constant.AnimeConstants;
   import anifire.constant.CcLibConstant;
   import anifire.event.LoadEmbedMovieEvent;
   import anifire.interfaces.ICharacter;
   import anifire.util.UtilPlain;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.utils.getQualifiedClassName;
   import flash.utils.getQualifiedSuperclassName;
   import flash.utils.setTimeout;
   
   public class GoBaseWorkerImp extends GoBaseWorker
   {
       
      
      private var _myDisplayObject:DisplayObjectContainer;
      
      private var _count:Number = 0;
      
      public function GoBaseWorkerImp()
      {
         super();
      }
      
      override public function initSkin(param1:DisplayObjectContainer = null, param2:Boolean = false) : void
      {
         var _loc6_:Loader = null;
         var _loc7_:DisplayObject = null;
         var _loc8_:Array = null;
         var _loc9_:int = 0;
         var _loc10_:DisplayObjectContainer = null;
         var _loc11_:DisplayObjectContainer = null;
         var _loc12_:DisplayObject = null;
         if(this._myDisplayObject == null)
         {
            this._myDisplayObject = param1;
         }
         if(param1 == null && this._myDisplayObject != null)
         {
            param1 = this._myDisplayObject;
         }
         var _loc3_:String = getQualifiedClassName(param1);
         var _loc4_:String = getQualifiedSuperclassName(param1);
         var _loc5_:Number = _loc4_.lastIndexOf(":");
         _loc4_ = _loc4_.substr(_loc5_ + 1);
         if(param1.loaderInfo != null)
         {
            _loc6_ = Loader(param1.loaderInfo.loader);
            if(_loc6_ != null)
            {
               _loc7_ = _loc6_.parent;
               if(_loc7_ != null && _loc7_ is ICharacter)
               {
                  while(param1.numChildren > 0)
                  {
                     param1.removeChildAt(0);
                  }
                  if(this.needToUseCacheBitmap(_loc3_) && !param1.cacheAsBitmap)
                  {
                     param1.cacheAsBitmap = true;
                  }
                  _loc8_ = new Array(_loc3_,"default");
                  _loc9_ = 0;
                  while(_loc9_ < _loc8_.length)
                  {
                     _loc10_ = ICharacter(_loc7_).CCM.getSkin(_loc8_[_loc9_],_loc4_,param2);
                     if(_loc10_ != null)
                     {
                        ICharacter(_loc7_).CCM.addSkinLoadingCount();
                        if(CcLibConstant.HEAD_RELATED_LIBRARY.indexOf(_loc4_) > -1)
                        {
                           _loc11_ = UtilPlain.getInstance(param1.root as DisplayObjectContainer,AnimeConstants.MOVIECLIP_THE_HEAD);
                           _loc12_ = _loc11_.getChildAt(0);
                           if(_loc12_)
                           {
                              _loc10_.scaleX = _loc10_.scaleY = _loc12_.scaleX;
                           }
                        }
                        param1.addChild(_loc10_ as DisplayObject);
                        break;
                     }
                     _loc9_++;
                  }
                  ICharacter(_loc7_).eventDispatcher.removeEventListener(LoadEmbedMovieEvent.RELOAD_MOVIE_EVENT,this.refreshSkin);
                  ICharacter(_loc7_).eventDispatcher.addEventListener(LoadEmbedMovieEvent.RELOAD_MOVIE_EVENT,this.refreshSkin);
               }
               else if(this._count < 5)
               {
                  setTimeout(this.refreshSkin,200);
               }
            }
         }
      }
      
      private function needToUseCacheBitmap(param1:String) : Boolean
      {
         if(param1 == "body")
         {
            return true;
         }
         return false;
      }
      
      private function refreshSkin(param1:Event = null) : void
      {
         if(param1 != null)
         {
            (param1.target as IEventDispatcher).removeEventListener(param1.type,this.refreshSkin);
         }
         else
         {
            this._count++;
         }
         this.initSkin(null,true);
      }
   }
}
