package anifire.studio.assets.views
{
   import anifire.studio.assets.image.PropAssetImage;
   import anifire.studio.core.CharThumb;
   import anifire.studio.core.Character;
   import anifire.studio.core.Prop;
   import anifire.studio.events.AssetViewEvent;
   import anifire.studio.events.CharacterAssetEvent;
   import anifire.studio.interfaces.IAssetView;
   import anifire.studio.interfaces.IHoldable;
   import anifire.util.UtilPlain;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   
   public class AssetViewHandPropController extends AbstractAssetViewController
   {
       
      
      private var _propView:IAssetView;
      
      private var _isImageReady:Boolean = true;
      
      public function AssetViewHandPropController()
      {
         super();
      }
      
      override public function set assetView(param1:IAssetView) : void
      {
         super.assetView = param1;
         if(this.prop)
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
      
      private function get prop() : Prop
      {
         if(this.asset is IHoldable)
         {
            return (this.asset as IHoldable).prop;
         }
         return null;
      }
      
      override protected function onAssetImageChange(param1:Event) : void
      {
         var _loc2_:Prop = this.prop;
         if(_loc2_)
         {
            this._isImageReady = false;
            if(this._propView && this._propView.assetImage is PropAssetImage)
            {
               this.updateImage((this._propView.assetImage as PropAssetImage).imageObject);
            }
            else
            {
               this.changeHandheld(this.asset as IHoldable);
            }
         }
         else
         {
            this._isImageReady = true;
         }
      }
      
      private function changeHandheld(param1:IHoldable) : void
      {
         var _loc2_:AssetViewFactory = null;
         this.removeProp();
         if(param1.prop && this.assetImage)
         {
            _loc2_ = new AssetViewFactory();
            this._propView = _loc2_.createAssetView(param1.prop);
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
         if(this._propView && this._propView.assetImage is PropAssetImage)
         {
            this.updateImage((this._propView.assetImage as PropAssetImage).imageObject);
         }
      }
      
      private function updateImage(param1:DisplayObject) : void
      {
         if(param1 && this.assetImage is DisplayObjectContainer)
         {
            this.addPropClipToPropContainer(param1,this.assetImage as DisplayObjectContainer);
            if(this.assetImage is IHoldable && this.prop)
            {
               IHoldable(this.assetImage).addProp(this.prop);
            }
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
            param1.addEventListener(CharacterAssetEvent.HANDHELD_CHANGE,this.onHandheldChange);
         }
      }
      
      override protected function removeAssetEventListeners(param1:IEventDispatcher) : void
      {
         if(param1)
         {
            param1.removeEventListener(CharacterAssetEvent.HANDHELD_CHANGE,this.onHandheldChange);
         }
      }
      
      private function onHandheldChange(param1:CharacterAssetEvent) : void
      {
         this.changeHandheld(param1.asset as IHoldable);
      }
      
      private function addPropClipToPropContainer(param1:DisplayObject, param2:DisplayObjectContainer) : void
      {
         var _loc5_:DisplayObjectContainer = null;
         var _loc3_:DisplayObjectContainer = UtilPlain.getInstance(param2,UtilPlain.THE_CHAR_FLIP);
         var _loc4_:DisplayObjectContainer = UtilPlain.getInstance(param2,UtilPlain.THE_CHAR);
         if(_loc4_ != null)
         {
            if(_loc3_ != null && Character(this.asset).facing != CharThumb(this.asset.thumb).facing)
            {
               _loc5_ = UtilPlain.getProp(_loc3_);
            }
            else
            {
               _loc5_ = UtilPlain.getProp(_loc4_);
            }
            if(_loc5_ != null)
            {
               UtilPlain.removeAllSon(_loc5_);
               _loc5_.addChild(param1);
               this.updatePropSize(param1,_loc5_);
            }
         }
      }
      
      private function updatePropSize(param1:DisplayObject, param2:DisplayObjectContainer) : void
      {
         if(param1)
         {
            try
            {
               param1.scaleX = Math.abs(1 / UtilPlain.getRelativeProperty(param2,this.assetImage as DisplayObjectContainer,UtilPlain.PROPERTY_SCALEX));
               param1.scaleY = Math.abs(1 / UtilPlain.getRelativeProperty(param2,this.assetImage as DisplayObjectContainer,UtilPlain.PROPERTY_SCALEY));
               return;
            }
            catch(e:Error)
            {
               return;
            }
         }
      }
      
      private function removeProp() : void
      {
         if(this._propView)
         {
            this._propView.removeEventListener(AssetViewEvent.VIEW_LOAD_COMPLETE,this.onPropImageReady);
            this._propView.destroy();
            this._propView = null;
         }
         if(this.assetImage is IHoldable)
         {
            IHoldable(this.assetImage).removeProp();
         }
      }
   }
}
