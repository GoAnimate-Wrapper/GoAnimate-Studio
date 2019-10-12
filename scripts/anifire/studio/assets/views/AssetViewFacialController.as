package anifire.studio.assets.views
{
   import anifire.constant.AnimeConstants;
   import anifire.studio.assets.image.CharacterAssetImage;
   import anifire.studio.assets.image.PropAssetImage;
   import anifire.studio.core.Asset;
   import anifire.studio.core.CharThumb;
   import anifire.studio.core.Character;
   import anifire.studio.events.AssetViewEvent;
   import anifire.studio.events.CharacterAssetEvent;
   import anifire.studio.interfaces.IAssetView;
   import anifire.studio.interfaces.IFacial;
   import anifire.util.UtilPlain;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   
   public class AssetViewFacialController extends AbstractAssetViewController
   {
       
      
      private var _propView:IAssetView;
      
      private var _isImageReady:Boolean = true;
      
      public function AssetViewFacialController()
      {
         super();
      }
      
      override public function set assetView(param1:IAssetView) : void
      {
         super.assetView = param1;
         if(this.head)
         {
            this._isImageReady = false;
         }
         else
         {
            this._isImageReady = true;
         }
      }
      
      public function get isImageReady() : Boolean
      {
         return this._isImageReady;
      }
      
      private function get head() : Asset
      {
         if(this.asset is IFacial)
         {
            return (this.asset as IFacial).head;
         }
         return null;
      }
      
      override protected function onAssetImageChange(param1:Event) : void
      {
         var _loc2_:Asset = this.head;
         if(_loc2_)
         {
            if(this._propView && this._propView.assetImage is PropAssetImage)
            {
               this.updateImage((this._propView.assetImage as PropAssetImage).imageObject);
            }
            else
            {
               this.changeFacial(this.asset as IFacial);
            }
         }
         else
         {
            this._isImageReady = true;
         }
      }
      
      private function changeFacial(param1:IFacial) : void
      {
         var _loc2_:AssetViewFactory = null;
         this.removeHead();
         if(param1 && param1.head && this.assetImage)
         {
            _loc2_ = new AssetViewFactory();
            this._propView = _loc2_.createAssetView(param1.head);
            this._propView.addEventListener(AssetViewEvent.VIEW_LOAD_COMPLETE,this.onPropImageReady);
            this._propView.loadImage();
         }
         else
         {
            this._isImageReady = true;
            this.dispatchEvent(new AssetViewEvent(AssetViewEvent.VIEW_IMAGE_CHANGE));
         }
      }
      
      private function onPropImageReady(param1:Event) : void
      {
         IEventDispatcher(param1.currentTarget).removeEventListener(param1.type,this.onPropImageReady);
         this.updateImage((this._propView.assetImage as PropAssetImage).imageObject);
      }
      
      private function updateImage(param1:DisplayObject) : void
      {
         if(param1)
         {
            this.addHeadClipToHeadContainer(param1,super.assetImage as DisplayObjectContainer);
            this._isImageReady = true;
            this.dispatchEvent(new AssetViewEvent(AssetViewEvent.VIEW_IMAGE_CHANGE));
         }
      }
      
      override public function destroy(param1:String = "rip") : void
      {
         if(this._propView)
         {
            this._propView.removeEventListener(AssetViewEvent.VIEW_LOAD_COMPLETE,this.onPropImageReady);
            this._propView.destroy(param1);
            this._propView = null;
         }
         super.destroy(param1);
      }
      
      override protected function addAssetEventListeners(param1:IEventDispatcher) : void
      {
         if(param1)
         {
            param1.addEventListener(CharacterAssetEvent.FACIAL_CHANGE,this.onFacialChange);
         }
      }
      
      override protected function removeAssetEventListeners(param1:IEventDispatcher) : void
      {
         if(param1)
         {
            param1.removeEventListener(CharacterAssetEvent.FACIAL_CHANGE,this.onFacialChange);
         }
      }
      
      private function onFacialChange(param1:CharacterAssetEvent) : void
      {
         this.changeFacial(param1.asset as IFacial);
      }
      
      private function addHeadClipToHeadContainer(param1:DisplayObject, param2:DisplayObjectContainer) : void
      {
         var _loc5_:DisplayObjectContainer = null;
         var _loc6_:int = 0;
         var _loc3_:DisplayObjectContainer = UtilPlain.getInstance(param2,UtilPlain.THE_CHAR_FLIP);
         var _loc4_:DisplayObjectContainer = UtilPlain.getInstance(param2,UtilPlain.THE_CHAR);
         if(_loc4_ != null)
         {
            if(_loc3_ != null && Character(super.asset).facing != CharThumb(super.asset.thumb).facing)
            {
               _loc5_ = UtilPlain.getHead(_loc3_);
            }
            else
            {
               _loc5_ = UtilPlain.getHead(_loc4_);
            }
            if(_loc5_ != null)
            {
               _loc5_.getChildByName(AnimeConstants.MOVIECLIP_DEFAULT_HEAD).alpha = 0;
               _loc5_.addChildAt(param1,0);
               this.updateHeadSize(param1,_loc5_);
            }
            if(_loc3_ != null && Character(super.asset).facing != CharThumb(super.asset.thumb).facing)
            {
               _loc5_ = UtilPlain.getTail(_loc3_);
            }
            else
            {
               _loc5_ = UtilPlain.getTail(_loc4_);
            }
            if(_loc5_ != null)
            {
               _loc6_ = 0;
               while(_loc6_ < _loc5_.numChildren)
               {
                  if(_loc5_.getChildAt(_loc6_).name == AnimeConstants.MOVIECLIP_DEFAULT_TAIL)
                  {
                     _loc5_.getChildAt(_loc6_).alpha = 0;
                  }
                  _loc6_++;
               }
            }
         }
         this.refreshProp();
      }
      
      private function updateHeadSize(param1:DisplayObject, param2:DisplayObjectContainer) : void
      {
         try
         {
            param1.scaleX = Math.abs(1 / UtilPlain.getRelativeProperty(param2,super.assetImage as DisplayObjectContainer,UtilPlain.PROPERTY_SCALEX));
            param1.scaleY = Math.abs(1 / UtilPlain.getRelativeProperty(param2,super.assetImage as DisplayObjectContainer,UtilPlain.PROPERTY_SCALEY));
            if(super.assetImage is CharacterAssetImage)
            {
               CharacterAssetImage(super.assetImage).refreshScale();
            }
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      private function removeHead() : void
      {
         var _loc3_:DisplayObjectContainer = null;
         var _loc4_:DisplayObject = null;
         var _loc5_:int = 0;
         if(this._propView == null)
         {
         }
         var _loc1_:DisplayObjectContainer = UtilPlain.getInstance(super.assetImage as DisplayObjectContainer,UtilPlain.THE_CHAR);
         var _loc2_:DisplayObjectContainer = UtilPlain.getInstance(super.assetImage as DisplayObjectContainer,UtilPlain.THE_CHAR_FLIP);
         if(_loc1_ != null)
         {
            _loc3_ = UtilPlain.getHead(_loc1_);
            if(_loc3_ != null)
            {
               _loc3_.getChildByName(AnimeConstants.MOVIECLIP_DEFAULT_HEAD).alpha = 1;
               _loc3_.getChildByName(AnimeConstants.MOVIECLIP_DEFAULT_HEAD).visible = true;
               _loc5_ = _loc3_.numChildren - 1;
               while(_loc5_ >= 0)
               {
                  _loc4_ = _loc3_.getChildAt(_loc5_);
                  if(_loc4_.name != AnimeConstants.MOVIECLIP_DEFAULT_HEAD && _loc4_.name != AnimeConstants.MOVIECLIP_THE_WEAR)
                  {
                     _loc3_.removeChildAt(_loc5_);
                  }
                  _loc5_--;
               }
            }
            _loc3_ = UtilPlain.getTail(_loc1_);
            if(_loc3_ != null)
            {
               _loc3_.getChildByName(AnimeConstants.MOVIECLIP_DEFAULT_TAIL).alpha = 1;
               _loc3_.getChildByName(AnimeConstants.MOVIECLIP_DEFAULT_TAIL).visible = true;
               _loc5_ = _loc3_.numChildren - 1;
               while(_loc5_ >= 0)
               {
                  _loc4_ = _loc3_.getChildAt(_loc5_);
                  if(_loc4_.name != AnimeConstants.MOVIECLIP_DEFAULT_TAIL)
                  {
                     _loc3_.removeChildAt(_loc5_);
                  }
                  _loc5_--;
               }
            }
         }
         if(_loc2_ != null)
         {
            _loc3_ = UtilPlain.getHead(_loc2_);
            if(_loc3_ != null)
            {
               _loc3_.getChildByName(AnimeConstants.MOVIECLIP_DEFAULT_HEAD).alpha = 1;
               _loc3_.getChildByName(AnimeConstants.MOVIECLIP_DEFAULT_HEAD).visible = true;
               _loc5_ = _loc3_.numChildren - 1;
               while(_loc5_ >= 0)
               {
                  _loc4_ = _loc3_.getChildAt(_loc5_);
                  if(_loc4_.name != AnimeConstants.MOVIECLIP_DEFAULT_HEAD && _loc4_.name != AnimeConstants.MOVIECLIP_THE_WEAR)
                  {
                     _loc3_.removeChildAt(_loc5_);
                  }
                  _loc5_--;
               }
            }
            _loc3_ = UtilPlain.getTail(_loc2_);
            if(_loc3_ != null)
            {
               _loc3_.getChildByName(AnimeConstants.MOVIECLIP_DEFAULT_TAIL).alpha = 1;
               _loc3_.getChildByName(AnimeConstants.MOVIECLIP_DEFAULT_TAIL).visible = true;
               _loc5_ = _loc3_.numChildren - 1;
               while(_loc5_ >= 0)
               {
                  _loc4_ = _loc3_.getChildAt(_loc5_);
                  if(_loc4_.name != AnimeConstants.MOVIECLIP_DEFAULT_TAIL)
                  {
                     _loc3_.removeChildAt(_loc5_);
                  }
                  _loc5_--;
               }
            }
         }
         if(this._propView)
         {
            this._propView.removeEventListener(AssetViewEvent.VIEW_LOAD_COMPLETE,this.onPropImageReady);
            this._propView.destroy();
            this._propView = null;
         }
      }
      
      private function refreshProp() : void
      {
      }
   }
}
