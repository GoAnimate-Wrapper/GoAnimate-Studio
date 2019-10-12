package anifire.studio.assets.image
{
   import anifire.component.CustomHeadMaker;
   import anifire.component.SkinnedHeadMaker;
   import anifire.constant.AnimeConstants;
   import anifire.constant.RaceConstants;
   import anifire.event.LoadEmbedMovieEvent;
   import anifire.models.creator.CCCharacterActionModel;
   import anifire.studio.assets.image.library.IReusableObject;
   import anifire.studio.core.Asset;
   import anifire.studio.core.Prop;
   import anifire.studio.core.PropThumb;
   import anifire.studio.core.Thumb;
   import anifire.studio.interfaces.IColorable;
   import anifire.studio.interfaces.IEye;
   import anifire.studio.interfaces.IMouth;
   import anifire.util.UtilArray;
   import anifire.util.UtilColor;
   import anifire.util.UtilCommonLoader;
   import anifire.util.UtilErrorLogger;
   import anifire.util.UtilHashBytes;
   import anifire.util.UtilHashSelectedColor;
   import anifire.util.UtilPlain;
   import flash.display.AVM1Movie;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   
   public class PropAssetImage extends AssetImageBase implements IColorable, IEye, IMouth, IReusableObject
   {
       
      
      private var _prop:Prop;
      
      private var _imageObject:DisplayObject;
      
      private var _imageCenter:Point;
      
      private var _reusable:Boolean;
      
      protected var _originalWidth:Number;
      
      protected var _originalHeight:Number;
      
      public function PropAssetImage()
      {
         super();
      }
      
      public function get originalWidth() : Number
      {
         return this._originalWidth;
      }
      
      public function get originalHeight() : Number
      {
         return this._originalHeight;
      }
      
      public function get imageObject() : DisplayObject
      {
         return this._imageObject;
      }
      
      override public function get asset() : Asset
      {
         return this._prop;
      }
      
      override public function set asset(param1:Asset) : void
      {
         var _loc2_:Thumb = null;
         var _loc3_:PropThumb = null;
         var _loc4_:Object = null;
         var _loc5_:CustomHeadMaker = null;
         var _loc6_:Object = null;
         var _loc7_:SkinnedHeadMaker = null;
         var _loc8_:Loader = null;
         super.asset = param1;
         if(this._imageObject)
         {
            if(param1 is Prop)
            {
               this._prop = param1 as Prop;
               this._prop.moveOnStateChange(this._imageCenter);
            }
            this.dispatchImageReady();
            return;
         }
         if(param1 is Prop)
         {
            this._prop = param1 as Prop;
            _loc2_ = param1.thumb;
            if(_loc2_ is PropThumb)
            {
               _loc3_ = _loc2_ as PropThumb;
               if(param1 is Prop)
               {
                  if(this._prop.state && this._prop.state.imageData)
                  {
                     _loc4_ = this._prop.state.imageData;
                  }
                  else
                  {
                     _loc4_ = _loc2_.imageData;
                  }
               }
               if(_loc4_)
               {
                  switch(_loc3_.raceCode)
                  {
                     case RaceConstants.CUSTOM_CHARACTER:
                        _loc5_ = new CustomHeadMaker();
                        this._imageObject = _loc5_;
                        _loc6_ = _loc4_;
                        _loc5_.addEventListener(LoadEmbedMovieEvent.COMPLETE_EVENT,this.onImageReady);
                        if(this._prop is IMouth)
                        {
                           _loc5_.demoSpeech = IMouth(this._prop).demoSpeech;
                        }
                        if(_loc6_["xml"])
                        {
                           _loc5_.init(_loc6_["xml"] as XML);
                        }
                        else if(_loc6_["cam"])
                        {
                           _loc5_.initByCam(_loc6_["cam"] as CCCharacterActionModel);
                        }
                        _loc5_.name = AnimeConstants.IMAGE_OBJECT_NAME;
                        this.addChild(_loc5_);
                        this.visible = false;
                        break;
                     case RaceConstants.SKINNED_SWF:
                        _loc7_ = new SkinnedHeadMaker();
                        this._imageObject = _loc7_;
                        _loc7_.themeId = _loc3_.themeId;
                        _loc7_.addEventListener(LoadEmbedMovieEvent.COMPLETE_EVENT,this.onImageReady);
                        if(_loc4_ is ByteArray)
                        {
                           _loc7_.init(_loc3_.xml,ByteArray(_loc4_),null,false,false,"",this._prop.stateId);
                        }
                        else
                        {
                           _loc7_.init(_loc3_.xml,ByteArray(_loc4_["figure"]),_loc4_["imageData"] as UtilHashBytes,false,false,"",this._prop.stateId);
                        }
                        _loc7_.name = AnimeConstants.IMAGE_OBJECT_NAME;
                        this.addChild(_loc7_);
                        this.visible = false;
                        break;
                     case RaceConstants.STATIC_SWF:
                        _loc8_ = new Loader();
                        this._imageObject = _loc8_;
                        _loc8_.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onImageReady);
                        _loc8_.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.onLoadByteError);
                        if(_loc4_ is ByteArray)
                        {
                           _loc8_.loadBytes(ByteArray(_loc4_),UtilCommonLoader.externalLoaderContext);
                        }
                        else
                        {
                           _loc8_.loadBytes(ByteArray(_loc4_["figure"]));
                        }
                        _loc8_.name = AnimeConstants.IMAGE_OBJECT_NAME;
                        this.addChild(_loc8_);
                  }
               }
            }
         }
      }
      
      private function onLoadByteError(param1:Event) : void
      {
         IEventDispatcher(param1.target).removeEventListener(param1.type,this.onLoadByteError);
         UtilErrorLogger.getInstance().error("PropAssetImage::onLoadByteError" + param1);
      }
      
      private function onImageReady(param1:Event) : void
      {
         var _loc2_:Loader = null;
         var _loc3_:Bitmap = null;
         var _loc4_:Rectangle = null;
         var _loc5_:Point = null;
         IEventDispatcher(param1.target).removeEventListener(param1.type,this.onImageReady);
         if(!(param1 is LoadEmbedMovieEvent))
         {
            _loc2_ = param1.target.loader;
         }
         if(_loc2_ != null)
         {
            _loc3_ = _loc2_.content as Bitmap;
            if(_loc3_)
            {
               _loc3_.smoothing = true;
            }
            if(this._prop && this._prop.char == null)
            {
               _loc4_ = _loc2_.getBounds(_loc2_);
               this._originalWidth = _loc4_.width;
               this._originalHeight = _loc4_.height;
               _loc5_ = new Point(_loc4_.x + _loc4_.width / 2,_loc4_.y + _loc4_.height / 2);
               _loc2_.content.x = -_loc5_.x;
               _loc2_.content.y = -_loc5_.y;
               this._imageCenter = _loc5_;
               this._prop.moveOnStateChange(_loc5_);
            }
            else if(_loc2_.content is AVM1Movie)
            {
               _loc4_ = _loc2_.getBounds(this);
               if(_loc4_.x < 0 && _loc4_.y < 0)
               {
                  this.graphics.beginFill(0,0);
                  this.graphics.drawRect(_loc4_.x,_loc4_.y,_loc4_.width,_loc4_.height);
                  this.graphics.endFill();
               }
            }
         }
         if(this._imageObject)
         {
            _loc4_ = this._imageObject.getBounds(this);
            super.rect.x = _loc4_.x;
            super.rect.y = _loc4_.y;
            super.rect.width = _loc4_.width;
            super.rect.height = _loc4_.height;
            if(this._prop)
            {
               this._prop.updateImageSize(_loc4_.width,_loc4_.height);
            }
         }
         this.visible = true;
         dispatchImageReady();
      }
      
      public function get lookAtCameraSupported() : Boolean
      {
         if(this._imageObject is CustomHeadMaker)
         {
            return CustomHeadMaker(this._imageObject).lookAtCameraSupported;
         }
         return false;
      }
      
      public function get lookAtCamera() : Boolean
      {
         if(this._imageObject is CustomHeadMaker)
         {
            return CustomHeadMaker(this._imageObject).lookAtCamera;
         }
         return false;
      }
      
      public function set lookAtCamera(param1:Boolean) : void
      {
         if(this._imageObject is CustomHeadMaker)
         {
            CustomHeadMaker(this._imageObject).lookAtCamera = param1;
         }
      }
      
      public function changeColor(param1:String, param2:uint = 4.294967295E9) : Number
      {
         var _loc3_:uint = 0;
         if(this._imageObject is Loader)
         {
            UtilColor.setAssetPartColor(this._imageObject,param1,param2);
         }
         return _loc3_;
      }
      
      public function get colorableArea() : Array
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:Array = null;
         var _loc1_:Array = new Array();
         if(this._imageObject is Loader)
         {
            _loc2_ = UtilPlain.getColorItem(this._imageObject);
            if(_loc2_.length > 0)
            {
               _loc3_ = 0;
               while(_loc3_ < _loc2_.length)
               {
                  _loc4_ = DisplayObject(_loc2_[_loc3_]).name.split("_");
                  _loc1_.push(_loc4_[1]);
                  _loc3_++;
               }
               _loc1_ = UtilArray.removeDuplicates(_loc1_,true);
            }
         }
         return _loc1_;
      }
      
      public function restoreColor() : void
      {
         if(this._imageObject is Loader)
         {
            UtilColor.resetAssetPartsColor(this._imageObject);
         }
      }
      
      public function get customColor() : UtilHashSelectedColor
      {
         return new UtilHashSelectedColor();
      }
      
      public function get demoSpeech() : Boolean
      {
         if(this._imageObject is CustomHeadMaker)
         {
            return CustomHeadMaker(this._imageObject).demoSpeech;
         }
         return false;
      }
      
      public function set demoSpeech(param1:Boolean) : void
      {
         if(this._imageObject is CustomHeadMaker)
         {
            CustomHeadMaker(this._imageObject).demoSpeech = param1;
         }
      }
      
      override public function destroy(param1:String = "rip") : void
      {
         if(this._reusable)
         {
            return;
         }
         super.destroy(param1);
         if(this._imageObject is Loader)
         {
            (this._imageObject as Loader).unloadAndStop();
         }
         this._prop = null;
         this._imageObject = null;
      }
      
      public function doBeforeReuse() : void
      {
         this._reusable = true;
      }
      
      public function releaseResource() : void
      {
         this._reusable = false;
         this.destroy();
      }
   }
}
