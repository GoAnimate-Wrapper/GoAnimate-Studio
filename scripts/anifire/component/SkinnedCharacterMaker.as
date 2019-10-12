package anifire.component
{
   import anifire.constant.AnimeConstants;
   import anifire.constant.CcLibConstant;
   import anifire.core.CCManager;
   import anifire.event.LoadEmbedMovieEvent;
   import anifire.event.LoadMgrEvent;
   import anifire.util.ExtraDataLoader;
   import anifire.util.UtilHashArray;
   import anifire.util.UtilHashBytes;
   import anifire.util.UtilLoadMgr;
   import anifire.util.UtilPlain;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.geom.Point;
   import flash.utils.ByteArray;
   import flash.utils.setTimeout;
   
   public class SkinnedCharacterMaker extends SkinnedAssetMaker
   {
       
      
      public function SkinnedCharacterMaker()
      {
         super();
         CCM = new CCManager();
      }
      
      public function init(param1:XML, param2:ByteArray, param3:UtilHashBytes, param4:Boolean = false, param5:Boolean = false, param6:String = "", param7:String = "default") : void
      {
         if(this.state == STATE_NULL)
         {
            this.state = STATE_LOADING;
         }
         else
         {
            if(this.state == STATE_LOADING)
            {
               return;
            }
            if(this.state == STATE_FINISH_LOAD)
            {
               setTimeout(loadAssetImageComplete,100);
               return;
            }
         }
         this.visible = false;
         charXML = param1;
         figure = param2;
         var _loc8_:CcActionLoader = CcActionLoader.getActionLoader(param6);
         _loc8_.addEventListener(Event.COMPLETE,this.onCcActionLoaded);
         _loc8_.loadCcComponents(param1,0,0,param3,ver,param5,param6,param7);
      }
      
      private function onCcActionLoaded(param1:Event) : void
      {
         if(param1 != null)
         {
            (param1.target as IEventDispatcher).removeEventListener(param1.type,this.onCcActionLoaded);
         }
         var _loc2_:CcActionLoader = param1.target as CcActionLoader;
         charSwfs = _loc2_.imageData["imageData"] as UtilHashBytes;
         prepareXML(charXML);
         this.prepareSkin();
      }
      
      private function prepareSkin(param1:UtilHashArray = null) : void
      {
         var _loc2_:XML = null;
         var _loc3_:* = null;
         var _loc4_:ByteArray = null;
         var _loc6_:ExtraDataLoader = null;
         var _loc7_:String = null;
         var _loc8_:Object = null;
         var _loc5_:UtilLoadMgr = new UtilLoadMgr();
         _loc5_.addEventListener(LoadMgrEvent.ALL_COMPLETE,doLoadMainImage);
         for each(_loc2_ in charXML.child(CcLibConstant.NODE_LIBRARY))
         {
            _loc6_ = new ExtraDataLoader();
            _loc7_ = _loc2_.@type;
            if(_loc7_ == "hands")
            {
               _loc7_ = CcLibConstant.LIBRARY_TYPE_GOHANDS;
            }
            _loc3_ = _loc2_.@theme_id + "." + _loc7_ + "." + _loc2_.@path + ".swf";
            if(param1 == null || param1.length == 0)
            {
               if(charSwfs != null)
               {
                  _loc4_ = charSwfs.getValueByKey(_loc3_);
               }
            }
            else
            {
               _loc4_ = param1.getValueByKey(_loc3_);
            }
            if(_loc4_ != null)
            {
               _loc8_ = new Object();
               _loc8_["part"] = _loc7_;
               _loc6_.extraData = _loc8_;
               _loc5_.addEventDispatcher(_loc6_.contentLoaderInfo,Event.COMPLETE);
               _loc6_.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onLoadStyleDone);
               _loc6_.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.onError);
               _loc6_.loadBytes(_loc4_);
            }
         }
         _loc5_.commit();
      }
      
      private function onError(param1:Event) : void
      {
      }
      
      private function onLoadStyleDone(param1:Event) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.onLoadStyleDone);
         var _loc2_:LoaderInfo = LoaderInfo(param1.currentTarget);
         var _loc3_:Object = ExtraDataLoader(_loc2_.loader).extraData;
         CCM.addStyle(_loc3_["part"],_loc2_);
      }
      
      override public function reloadSkin() : void
      {
         dispatchEvent(new LoadEmbedMovieEvent(LoadEmbedMovieEvent.RELOAD_MOVIE_EVENT));
      }
      
      public function refreshScale() : void
      {
         if(charXML.@xscale > 0 && charXML.@yscale > 0)
         {
            this.updateBodyScale(Number(charXML.@xscale),Number(charXML.@yscale));
         }
         if(charXML.@hxscale > 0 && charXML.@hyscale > 0)
         {
            this.updateHeadScale(Number(charXML.@hxscale),Number(charXML.@hyscale));
         }
         if(charXML.@headdx.length() > 0 && charXML.@headdy.length() > 0 && (charXML.@headdx as Number != 0 || charXML.@headdy as Number != 0))
         {
            this.resetHeadPos();
            this.updateHeadPos(Number(charXML.@headdx),Number(charXML.@headdy));
         }
      }
      
      public function get headPos() : Point
      {
         var _loc1_:DisplayObjectContainer = UtilPlain.getInstance(this,AnimeConstants.MOVIECLIP_DEFAULT_HEAD);
         return new Point(_loc1_.x,_loc1_.y);
      }
      
      public function resetHeadPos() : void
      {
         var _loc2_:int = 0;
         var _loc3_:DisplayObject = null;
         var _loc1_:DisplayObjectContainer = UtilPlain.getInstance(this,AnimeConstants.MOVIECLIP_THE_HEAD);
         if(_loc1_ != null)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc1_.numChildren)
            {
               _loc3_ = _loc1_.getChildAt(_loc2_);
               _loc3_.x = 0;
               _loc3_.y = 0;
               _loc2_++;
            }
         }
      }
      
      public function updateHeadPos(param1:Number, param2:Number) : void
      {
         var _loc4_:int = 0;
         var _loc5_:DisplayObject = null;
         var _loc3_:DisplayObjectContainer = UtilPlain.getInstance(this,AnimeConstants.MOVIECLIP_THE_HEAD);
         if(_loc3_ != null)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc3_.numChildren)
            {
               _loc5_ = _loc3_.getChildAt(_loc4_);
               _loc5_.x = _loc5_.x + param1;
               _loc5_.y = _loc5_.y + param2;
               _loc4_++;
            }
         }
      }
      
      public function updateHeadScale(param1:Number, param2:Number) : void
      {
         var _loc4_:int = 0;
         var _loc5_:DisplayObject = null;
         var _loc3_:DisplayObjectContainer = UtilPlain.getInstance(this,AnimeConstants.MOVIECLIP_THE_HEAD);
         if(_loc3_ != null)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc3_.numChildren)
            {
               _loc5_ = _loc3_.getChildAt(_loc4_);
               _loc5_.scaleX = param1;
               _loc5_.scaleY = param2;
               _loc4_++;
            }
         }
      }
      
      public function updateBodyScale(param1:Number, param2:Number) : void
      {
         var _loc3_:DisplayObjectContainer = this.getSkeletonContainer(this.ver);
         if(_loc3_ != null)
         {
            _loc3_.scaleX = param1;
            _loc3_.scaleY = param2;
         }
      }
      
      private function getSkeletonContainer(param1:Number = 0) : DisplayObjectContainer
      {
         return this;
      }
      
      public function get head() : DisplayObjectContainer
      {
         return UtilPlain.getInstance(this,AnimeConstants.MOVIECLIP_THE_HEAD);
      }
   }
}
