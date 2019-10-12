package anifire.studio.assets.views
{
   import anifire.constant.AnimeConstants;
   import anifire.studio.assets.image.PropAssetImage;
   import anifire.studio.core.Asset;
   import anifire.studio.core.CharThumb;
   import anifire.studio.core.Character;
   import anifire.studio.events.AssetViewEvent;
   import anifire.studio.events.CharacterAssetEvent;
   import anifire.studio.interfaces.IAssetView;
   import anifire.studio.interfaces.IWearable;
   import anifire.util.UtilPlain;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   
   public class AssetViewHeadWearController extends AbstractAssetViewController
   {
       
      
      private var _propView:IAssetView;
      
      private var _isImageReady:Boolean = true;
      
      public function AssetViewHeadWearController()
      {
         super();
      }
      
      override public function set assetView(param1:IAssetView) : void
      {
         super.assetView = param1;
         if(this.wear)
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
      
      private function get wear() : Asset
      {
         if(this.asset is IWearable)
         {
            return (this.asset as IWearable).wear;
         }
         return null;
      }
      
      override protected function onAssetImageChange(param1:Event) : void
      {
         var _loc2_:Asset = this.wear;
         if(_loc2_)
         {
            if(this._propView && this._propView.assetImage is PropAssetImage)
            {
               this.updateImage((this._propView.assetImage as PropAssetImage).imageObject);
            }
            else
            {
               this.changeWear(this.asset as IWearable);
            }
         }
         else
         {
            this._isImageReady = true;
         }
      }
      
      private function changeWear(param1:IWearable) : void
      {
         var _loc2_:AssetViewFactory = null;
         this.removeWear();
         if(param1.wear && super.assetImage)
         {
            _loc2_ = new AssetViewFactory();
            this._propView = _loc2_.createAssetView(param1.wear);
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
         this.updateImage(PropAssetImage(this._propView.assetImage).imageObject);
      }
      
      private function updateImage(param1:DisplayObject) : void
      {
         if(param1)
         {
            this.addWearClipToHeadContainer(param1,super.assetImage as DisplayObjectContainer);
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
            param1.addEventListener(CharacterAssetEvent.WEAR_CHANGE,this.onHandheldChange);
         }
      }
      
      override protected function removeAssetEventListeners(param1:IEventDispatcher) : void
      {
         if(param1)
         {
            param1.removeEventListener(CharacterAssetEvent.WEAR_CHANGE,this.onHandheldChange);
         }
      }
      
      private function onHandheldChange(param1:CharacterAssetEvent) : void
      {
         if(param1.asset is IWearable)
         {
            this.changeWear(param1.asset as IWearable);
         }
      }
      
      private function addWearClipToHeadContainer(param1:DisplayObject, param2:DisplayObjectContainer) : void
      {
         var _loc5_:DisplayObjectContainer = null;
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
               param1.name = AnimeConstants.MOVIECLIP_THE_WEAR;
               _loc5_.addChild(param1);
               this.updateWearSize(param1,_loc5_);
               this.updateWearPosition(_loc5_);
            }
         }
      }
      
      private function updateWearPosition(param1:DisplayObjectContainer) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:DisplayObject = null;
         var _loc5_:uint = 0;
         var _loc2_:DisplayObjectContainer = UtilPlain.getInstance(param1,"theTop");
         if(_loc2_ != null)
         {
            _loc3_ = 0;
            if(param1.getChildByName(AnimeConstants.MOVIECLIP_DEFAULT_HEAD).alpha != 0)
            {
               _loc3_ = param1.getChildByName(AnimeConstants.MOVIECLIP_DEFAULT_HEAD).getBounds(param1).y;
            }
            else
            {
               _loc5_ = 0;
               _loc5_ = param1.numChildren - 1;
               while(_loc5_ >= 0)
               {
                  _loc4_ = param1.getChildAt(_loc5_);
                  if(_loc4_.name != AnimeConstants.MOVIECLIP_DEFAULT_HEAD && _loc4_.name != AnimeConstants.MOVIECLIP_THE_WEAR)
                  {
                     _loc3_ = _loc4_.getBounds(param1).y;
                     break;
                  }
                  _loc5_--;
               }
            }
            _loc2_.y = _loc3_;
         }
      }
      
      private function updateWearSize(param1:DisplayObject, param2:DisplayObjectContainer) : void
      {
         if(param1)
         {
            try
            {
               param1.scaleX = Math.abs(1 / UtilPlain.getRelativeProperty(param2,super.assetImage as DisplayObjectContainer,UtilPlain.PROPERTY_SCALEX));
               param1.scaleY = Math.abs(1 / UtilPlain.getRelativeProperty(param2,super.assetImage as DisplayObjectContainer,UtilPlain.PROPERTY_SCALEY));
               return;
            }
            catch(e:Error)
            {
               return;
            }
         }
      }
      
      private function removeWear() : void
      {
         var _loc3_:DisplayObjectContainer = null;
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
               if(_loc3_.getChildByName(AnimeConstants.MOVIECLIP_THE_WEAR))
               {
                  _loc3_.removeChild(_loc3_.getChildByName(AnimeConstants.MOVIECLIP_THE_WEAR));
               }
            }
         }
         if(_loc2_ != null)
         {
            _loc3_ = UtilPlain.getHead(_loc2_);
            if(_loc3_ != null)
            {
               if(_loc3_.getChildByName(AnimeConstants.MOVIECLIP_THE_WEAR))
               {
                  _loc3_.removeChild(_loc3_.getChildByName(AnimeConstants.MOVIECLIP_THE_WEAR));
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
   }
}
