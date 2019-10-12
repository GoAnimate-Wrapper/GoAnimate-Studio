package anifire.studio.assets.image
{
   import anifire.color.SelectedColor;
   import anifire.component.ActionSequence;
   import anifire.component.CustomCharacterMaker;
   import anifire.component.SkinnedCharacterMaker;
   import anifire.constant.AnimeConstants;
   import anifire.constant.CcLibConstant;
   import anifire.constant.RaceConstants;
   import anifire.event.ByteLoaderEvent;
   import anifire.event.LoadEmbedMovieEvent;
   import anifire.interfaces.ICharacter;
   import anifire.interfaces.ISequentialAction;
   import anifire.managers.CCBodyManager;
   import anifire.managers.CCThemeManager;
   import anifire.studio.assets.image.library.IReusableObject;
   import anifire.studio.core.Asset;
   import anifire.studio.core.CharThumb;
   import anifire.studio.core.Character;
   import anifire.studio.core.Prop;
   import anifire.studio.core.Thumb;
   import anifire.studio.events.AssetViewEvent;
   import anifire.studio.interfaces.IColorable;
   import anifire.studio.interfaces.IEye;
   import anifire.studio.interfaces.IFlippable;
   import anifire.studio.interfaces.IHoldable;
   import anifire.studio.interfaces.IMouth;
   import anifire.util.UtilArray;
   import anifire.util.UtilColor;
   import anifire.util.UtilErrorLogger;
   import anifire.util.UtilHashBytes;
   import anifire.util.UtilHashSelectedColor;
   import anifire.util.UtilPlain;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   
   public class CharacterAssetImage extends AssetImageBase implements IColorable, IEye, IHoldable, IMouth, IFlippable, IReusableObject
   {
      
      public static const THE_CHAR:String = "theChar";
      
      public static const THE_CHAR_FLIP:String = "theCharFlip";
       
      
      private var _imageObject:DisplayObject;
      
      private var _actionSeq:ActionSequence;
      
      private var _facing:String = "left";
      
      protected var _faceRect:Rectangle;
      
      private var _reusable:Boolean;
      
      private var _customColor:UtilHashSelectedColor;
      
      public function CharacterAssetImage()
      {
         super();
      }
      
      override public function get thumbnailRect() : Rectangle
      {
         if(this._faceRect)
         {
            return this._faceRect;
         }
         return super.thumbnailRect;
      }
      
      override public function set asset(param1:Asset) : void
      {
         var _loc2_:Thumb = null;
         var _loc3_:Object = null;
         var _loc4_:Loader = null;
         var _loc5_:SkinnedCharacterMaker = null;
         var _loc6_:Object = null;
         var _loc7_:Character = null;
         var _loc8_:CustomCharacterMaker = null;
         var _loc9_:Object = null;
         var _loc10_:CharThumb = null;
         var _loc11_:Character = null;
         super.asset = param1;
         if(this._imageObject)
         {
            this.dispatchImageReady();
            return;
         }
         if(param1)
         {
            _loc2_ = param1.thumb;
            _loc3_ = param1.imageData;
            if(_asset is ISequentialAction)
            {
               this._actionSeq = ISequentialAction(_asset).actionSequence;
            }
            if(_loc2_ && _loc3_)
            {
               if(!CharThumb(_loc2_).isCC)
               {
                  switch(_loc2_.raceCode)
                  {
                     case RaceConstants.STATIC_SWF:
                        _loc4_ = new Loader();
                        this._imageObject = _loc4_;
                        _loc4_.contentLoaderInfo.addEventListener(Event.COMPLETE,this.loadAssetImageComplete);
                        if(_loc3_ is ByteArray)
                        {
                           _loc4_.loadBytes(ByteArray(_loc3_));
                        }
                        else
                        {
                           _loc4_.loadBytes(ByteArray(_loc3_["figure"]));
                        }
                        _loc4_.name = AnimeConstants.IMAGE_OBJECT_NAME;
                        this.addChild(_loc4_);
                        break;
                     case RaceConstants.SKINNED_SWF:
                        _loc5_ = new SkinnedCharacterMaker();
                        this._imageObject = _loc5_;
                        _loc5_.name = AnimeConstants.IMAGE_OBJECT_NAME;
                        _loc5_.themeId = _loc2_.themeId;
                        this.addChild(_loc5_);
                        _loc6_ = _loc3_;
                        _loc5_.addEventListener(LoadEmbedMovieEvent.COMPLETE_EVENT,this.loadAssetImageComplete);
                        _loc7_ = param1 as Character;
                        if(_loc6_ is ByteArray)
                        {
                           _loc5_.init(_loc2_.xml,_loc6_ as ByteArray,null,false,false,"",_loc7_.actionId);
                        }
                        else
                        {
                           _loc5_.init(_loc2_.xml,_loc6_["figure"],_loc6_["imageData"],false,false,"",_loc7_.actionId);
                        }
                  }
               }
               else
               {
                  _loc8_ = new CustomCharacterMaker();
                  this._imageObject = _loc8_;
                  _loc8_.name = AnimeConstants.IMAGE_OBJECT_NAME;
                  this.addChild(_loc8_);
                  _loc9_ = _loc3_;
                  _loc8_.addEventListener(LoadEmbedMovieEvent.COMPLETE_EVENT,this.loadAssetImageComplete);
                  if(_asset is IMouth)
                  {
                     _loc8_.demoSpeech = IMouth(_asset).demoSpeech;
                  }
                  if(_loc9_["xml"] as XML)
                  {
                     _loc8_.initByXMLWithData(_loc9_["xml"] as XML,0,0,_loc9_["imageData"] as UtilHashBytes);
                  }
                  else
                  {
                     _loc10_ = _loc2_ as CharThumb;
                     _loc11_ = _asset as Character;
                     _loc8_.initByCam(CCThemeManager.instance.getThemeModel(_loc10_.ccThemeId).getCharacterActionModel(CCBodyManager.instance.getBodyModel(_loc10_.id),_loc11_.actionId));
                  }
               }
            }
         }
      }
      
      private function loadAssetImageComplete(param1:Event) : void
      {
         var _loc3_:MovieClip = null;
         var _loc4_:Rectangle = null;
         var _loc5_:DisplayObjectContainer = null;
         var _loc6_:CustomCharacterMaker = null;
         var _loc7_:SkinnedCharacterMaker = null;
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.loadAssetImageComplete);
         if(this._actionSeq && this._imageObject)
         {
            _loc3_ = UtilPlain.getCharacter(Sprite(this._imageObject));
            if(_loc3_)
            {
               this._actionSeq.initByFrameLabels(_loc3_.currentLabels,_loc3_.totalFrames);
               _loc3_.addEventListener(Event.ENTER_FRAME,this.clipEnterFrame,false,0,true);
               _loc3_.gotoAndPlay(this._actionSeq.behaviourToClipFrame(1));
            }
         }
         if(this._imageObject)
         {
            _loc4_ = this._imageObject.getBounds(this);
            super.rect.x = _loc4_.x;
            super.rect.y = _loc4_.y;
            super.rect.width = _loc4_.width;
            super.rect.height = _loc4_.height;
            if(_asset is Character)
            {
               (_asset as Character).imageLocalCenter = new Point(_loc4_.x + _loc4_.width / 2,_loc4_.y + _loc4_.height / 2);
            }
            if(this._imageObject is CustomCharacterMaker)
            {
               _loc6_ = this._imageObject as CustomCharacterMaker;
               _loc5_ = _loc6_.head;
            }
            else if(this._imageObject is SkinnedCharacterMaker)
            {
               _loc7_ = this._imageObject as SkinnedCharacterMaker;
               _loc5_ = _loc7_.head;
            }
            else if(this._imageObject is DisplayObjectContainer)
            {
               _loc5_ = UtilPlain.getHead(this._imageObject as DisplayObjectContainer);
            }
            if(_loc5_)
            {
               this._faceRect = _loc5_.getBounds(this);
            }
         }
         var _loc2_:DisplayObject = UtilPlain.getInstance(this,THE_CHAR_FLIP);
         if(_loc2_)
         {
            _loc2_.visible = false;
         }
         if(this._imageObject is CustomCharacterMaker)
         {
            this._customColor = CustomCharacterMaker(this._imageObject).CCM.colors;
         }
         dispatchImageReady();
      }
      
      public function flipIt() : void
      {
         this._facing = this._facing == "left"?"right":"left";
         var _loc1_:DisplayObject = UtilPlain.getInstance(this,THE_CHAR);
         var _loc2_:DisplayObject = UtilPlain.getInstance(this,THE_CHAR_FLIP);
         if(_loc2_)
         {
            _loc2_.visible = this._facing != "left";
            if(_loc1_)
            {
               _loc1_.visible = this._facing == "left";
            }
         }
         this.dispatchEvent(new AssetViewEvent(AssetViewEvent.VIEW_CHANGE,true));
      }
      
      public function get facing() : String
      {
         return this._facing;
      }
      
      public function get isFlipped() : Boolean
      {
         return this._facing != "left";
      }
      
      private function clipEnterFrame(param1:Event) : void
      {
         var _loc2_:MovieClip = null;
         if(this._actionSeq)
         {
            if(param1.currentTarget is MovieClip)
            {
               _loc2_ = MovieClip(param1.currentTarget);
               if(_loc2_ && this._actionSeq.shouldChangeSubAction(_loc2_.currentFrame))
               {
                  _loc2_.gotoAndPlay(this._actionSeq.getNextSubActionStartFrame(_loc2_.currentFrame));
               }
            }
         }
      }
      
      override public function pause() : void
      {
         var _loc1_:MovieClip = null;
         super.pause();
         if(this._actionSeq && this._imageObject)
         {
            _loc1_ = UtilPlain.getCharacter(Sprite(this._imageObject));
            if(_loc1_)
            {
               _loc1_.removeEventListener(Event.ENTER_FRAME,this.clipEnterFrame);
            }
         }
      }
      
      override public function resume() : void
      {
         var _loc1_:MovieClip = null;
         super.resume();
         if(this._actionSeq && this._imageObject)
         {
            _loc1_ = UtilPlain.getCharacter(Sprite(this._imageObject));
            if(_loc1_)
            {
               _loc1_.addEventListener(Event.ENTER_FRAME,this.clipEnterFrame,false,0,true);
               _loc1_.gotoAndPlay(this._actionSeq.behaviourToClipFrame(1));
            }
         }
      }
      
      public function get lookAtCameraSupported() : Boolean
      {
         if(this._imageObject is CustomCharacterMaker)
         {
            return CustomCharacterMaker(this._imageObject).lookAtCameraSupported;
         }
         return false;
      }
      
      public function get lookAtCamera() : Boolean
      {
         if(this._imageObject is CustomCharacterMaker)
         {
            return CustomCharacterMaker(this._imageObject).lookAtCamera;
         }
         return false;
      }
      
      public function set lookAtCamera(param1:Boolean) : void
      {
         if(this._imageObject is CustomCharacterMaker)
         {
            CustomCharacterMaker(this._imageObject).lookAtCamera = param1;
         }
      }
      
      public function get demoSpeech() : Boolean
      {
         if(this._imageObject is CustomCharacterMaker)
         {
            return CustomCharacterMaker(this._imageObject).demoSpeech;
         }
         if(this._imageObject is SkinnedCharacterMaker)
         {
            return SkinnedCharacterMaker(this._imageObject).demoSpeech;
         }
         return false;
      }
      
      public function set demoSpeech(param1:Boolean) : void
      {
         if(this._imageObject is CustomCharacterMaker)
         {
            CustomCharacterMaker(this._imageObject).demoSpeech = param1;
         }
         else if(this._imageObject is SkinnedCharacterMaker)
         {
            SkinnedCharacterMaker(this._imageObject).demoSpeech = param1;
         }
      }
      
      public function addProp(param1:Prop) : void
      {
         if(this._imageObject is ICharacter)
         {
            ICharacter(this._imageObject).CCM.addEventListener(ByteLoaderEvent.LOAD_BYTES_COMPLETE,this.onLoadThumbForCcComplete);
            ICharacter(this._imageObject).CCM.loadPropThumbAsStyle(param1.state == null?param1.imageData:param1.state.imageData,param1.thumb.handStyle);
         }
      }
      
      public function removeProp() : void
      {
         var _loc3_:DisplayObjectContainer = null;
         if(this._imageObject is ICharacter && ICharacter(this._imageObject).ver >= 2)
         {
            ICharacter(this._imageObject).removeLibrary(AnimeConstants.CLASS_GOPROP);
            ICharacter(this._imageObject).CCM.removeStyle(AnimeConstants.CLASS_GOPROP);
            ICharacter(this._imageObject).reloadSkin();
         }
         var _loc1_:DisplayObjectContainer = UtilPlain.getInstance(this,UtilPlain.THE_CHAR);
         var _loc2_:DisplayObjectContainer = UtilPlain.getInstance(this,UtilPlain.THE_CHAR_FLIP);
         if(_loc1_ != null)
         {
            _loc3_ = UtilPlain.getProp(_loc1_);
            if(_loc3_ != null)
            {
               UtilPlain.removeAllSon(_loc3_);
            }
         }
         if(_loc2_ != null)
         {
            _loc3_ = UtilPlain.getProp(_loc2_);
            if(_loc3_ != null)
            {
               UtilPlain.removeAllSon(_loc3_);
            }
         }
      }
      
      public function removeHead() : void
      {
         var _loc3_:DisplayObjectContainer = null;
         var _loc4_:DisplayObject = null;
         var _loc5_:int = 0;
         var _loc1_:DisplayObjectContainer = UtilPlain.getInstance(this,UtilPlain.THE_CHAR);
         var _loc2_:DisplayObjectContainer = UtilPlain.getInstance(this,UtilPlain.THE_CHAR_FLIP);
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
      }
      
      public function removeWear() : void
      {
         var _loc3_:DisplayObjectContainer = null;
         var _loc1_:DisplayObjectContainer = UtilPlain.getInstance(this,UtilPlain.THE_CHAR);
         var _loc2_:DisplayObjectContainer = UtilPlain.getInstance(this,UtilPlain.THE_CHAR_FLIP);
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
      }
      
      private function onLoadThumbForCcComplete(param1:Event) : void
      {
         var e:Event = param1;
         try
         {
            ICharacter(this._imageObject).CCM.removeEventListener(ByteLoaderEvent.LOAD_BYTES_COMPLETE,this.onLoadThumbForCcComplete);
            ICharacter(this._imageObject).addLibrary(AnimeConstants.CLASS_GOPROP,"","");
            ICharacter(this._imageObject).reloadSkin();
            return;
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("CharacterAssetImage:onLoadThumbForCcComplete",e);
            return;
         }
      }
      
      public function get prop() : Prop
      {
         return null;
      }
      
      public function changeColor(param1:String, param2:uint = 4.294967295E9) : Number
      {
         var _loc4_:uint = 0;
         var _loc5_:SelectedColor = null;
         var _loc3_:uint = 0;
         _loc3_ = UtilColor.setAssetPartColor(this._imageObject,param1,param2);
         if(this._imageObject is CustomCharacterMaker)
         {
            _loc4_ = uint.MAX_VALUE;
            _loc5_ = new SelectedColor(param1,_loc4_,param2);
            CustomCharacterMaker(this._imageObject).CCM.addColor(param1,_loc5_);
         }
         return _loc3_;
      }
      
      public function get colorableArea() : Array
      {
         var _loc3_:int = 0;
         var _loc4_:Array = null;
         var _loc1_:Array = new Array();
         var _loc2_:Array = UtilPlain.getColorItem(this._imageObject);
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
         return _loc1_;
      }
      
      private function removeCCUsedColor(param1:Array) : Array
      {
         var _loc2_:Array = null;
         _loc2_ = param1.filter(this.isNotInsideCC);
         return _loc2_;
      }
      
      private function isNotInsideCC(param1:Object, param2:int, param3:Array) : Boolean
      {
         if(CcLibConstant.ALL_COLOR_CODE_USED.indexOf(param1 as String) > -1)
         {
            return false;
         }
         return true;
      }
      
      public function getCCSelectedColor() : UtilHashSelectedColor
      {
         if(this._imageObject is CustomCharacterMaker)
         {
            return CustomCharacterMaker(this._imageObject).CCM.colors;
         }
         return null;
      }
      
      public function restoreColor() : void
      {
         var _loc1_:Array = null;
         var _loc2_:int = 0;
         if(this._imageObject is Loader)
         {
            UtilColor.resetAssetPartsColor(this._imageObject);
         }
         else if(this._imageObject is CustomCharacterMaker)
         {
            _loc1_ = this.colorableArea;
            _loc2_ = 0;
            while(_loc2_ < _loc1_.length)
            {
               CustomCharacterMaker(this._imageObject).CCM.deleteColor(_loc1_[_loc2_]);
               _loc2_++;
            }
            CustomCharacterMaker(this._imageObject).prepareDataByCam();
            CustomCharacterMaker(this._imageObject).reloadSkin();
            CustomCharacterMaker(this._imageObject).restoreHeadColor();
         }
      }
      
      public function refreshScale() : void
      {
         if(this._imageObject is CustomCharacterMaker)
         {
            CustomCharacterMaker(this._imageObject).refreshScale();
         }
      }
      
      public function get customColor() : UtilHashSelectedColor
      {
         return this._customColor;
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
            Loader(this._imageObject).unloadAndStop();
         }
         else if(this._imageObject is CustomCharacterMaker)
         {
            CustomCharacterMaker(this._imageObject).unloadAssetImage();
         }
         else if(this._imageObject is SkinnedCharacterMaker)
         {
            SkinnedCharacterMaker(this._imageObject).unloadAssetImage();
         }
         _asset = null;
         this._imageObject = null;
         this._actionSeq = null;
      }
      
      public function doBeforeReuse() : void
      {
         this._reusable = true;
         this.removeProp();
         this.removeHead();
         this.removeWear();
      }
      
      public function releaseResource() : void
      {
         this._reusable = false;
         this.destroy();
      }
   }
}
