package anifire.studio.core
{
	import anifire.component.VideoPlayback;
	import anifire.constant.AnimeConstants;
	import anifire.util.UtilUnitConvert;
	import flash.utils.setTimeout;
	import mx.containers.Canvas;
	
	public class VideoProp extends Prop
	{
		 
		
		private var _image:Canvas;
		
		private var videoPlayBack:VideoPlayback;
		
		public function VideoProp(param1:String = "")
		{
			super();
		}
		
		public function get image() : Canvas
		{
			return this._image;
		}
		
		public function set image(param1:Canvas) : void
		{
			this._image = param1;
		}
		
		override public function set imageData(param1:Object) : void
		{
			super.imageData = param1;
			this.loadAssetImage();
		}
		
		override public function set facing(param1:String) : void
		{
			super.facing = param1;
		}
		
		override public function clone(param1:Boolean = false, param2:AnimeScene = null) : Asset
		{
			var _loc3_:VideoProp = new VideoProp();
			_loc3_.x = this.x;
			_loc3_.y = this.y;
			_loc3_.scaleX = this.scaleX;
			_loc3_.scaleY = this.scaleY;
			_loc3_.rotation = this.rotation;
			_loc3_.scene = this.scene;
			_loc3_.id = this.id;
			_loc3_.attachedBg = this.attachedBg;
			_loc3_.init(Thumb(this.thumb),null);
			_loc3_.facing = this.facing;
			_loc3_.stateId = this.stateId;
			_loc3_.state = this.state;
			if(this.motionShadow != null)
			{
				_loc3_.x = this.motionShadow.x;
				_loc3_.y = this.motionShadow.y;
				_loc3_.facing = this.motionShadow.facing;
				_loc3_.scaleX = this.motionShadow.scaleX;
				_loc3_.scaleY = this.motionShadow.scaleY;
				_loc3_.rotation = this.motionShadow.rotation;
			}
			return _loc3_;
		}
		
		private function loadDefaultImage() : void
		{
			this.image = new Canvas();
			this.image.width = VideoPropThumb(this.thumb).videoWidth;
			this.image.height = VideoPropThumb(this.thumb).videoHeight;
			this.image.graphics.clear();
			this.image.graphics.beginFill(15658734,1);
			this.image.graphics.drawRect(-this.image.width / 2,-this.image.height / 2,this.image.width,this.image.height);
			this.image.graphics.endFill();
			this.image.clipContent = false;
			var _loc1_:Canvas = new Canvas();
			_loc1_.x = -this.image.width / 2;
			_loc1_.y = -this.image.height / 2;
			_loc1_.styleName = "iconVideo";
			_loc1_.width = 48;
			_loc1_.height = 40;
			_loc1_.graphics.beginFill(16711680,0);
			_loc1_.graphics.drawRect(0,0,_loc1_.width,_loc1_.height);
			_loc1_.graphics.endFill();
			this.image.addChild(_loc1_);
			this.image.name = AnimeConstants.IMAGE_OBJECT_NAME;
		}
		
		override public function isColorable() : Boolean
		{
			return false;
		}
		
		public function stopProp() : void
		{
			if(this.videoPlayBack != null)
			{
				this.videoPlayBack.pause();
			}
		}
		
		public function pauseMovie() : void
		{
			if(this.videoPlayBack != null)
			{
				this.videoPlayBack.pause();
			}
		}
		
		public function playMovie() : void
		{
			var _loc3_:int = 0;
			var _loc4_:AnimeScene = null;
			var _loc5_:Number = NaN;
			var _loc6_:Boolean = false;
			var _loc7_:int = 0;
			var _loc8_:Prop = null;
			var _loc1_:Number = Console.getConsole().getSceneIndex(this.scene);
			var _loc2_:Number = 0;
			if(_loc1_ > 0)
			{
				_loc3_ = _loc1_ - 1;
				while(_loc3_ >= 0)
				{
					_loc4_ = Console.getConsole().getScene(_loc3_);
					_loc5_ = _loc4_.props.length;
					_loc6_ = false;
					_loc7_ = 0;
					while(_loc7_ < _loc5_)
					{
						_loc8_ = _loc4_.props.getValueByIndex(_loc7_) as Prop;
						if(_loc8_.thumb == this.thumb)
						{
							_loc6_ = true;
						}
						_loc7_++;
					}
					if(!_loc6_)
					{
						break;
					}
					_loc2_ = _loc2_ + _loc4_.totalFrames;
					_loc3_--;
				}
				_loc2_ = UtilUnitConvert.frameToSec(_loc2_);
			}
			if(this.videoPlayBack == null)
			{
				this.videoPlayBack = new VideoPlayback();
				this.videoPlayBack.loadAndSeekPlayVideoByAssetId(this.thumb.id,_loc2_);
			}
			else
			{
				this.videoPlayBack.seekAndPlay(_loc2_);
			}
			setTimeout(this.pauseMovie,this.scene.duration * 1000);
		}
		
		override public function deleteAsset() : void
		{
			if(this.videoPlayBack != null)
			{
				this.videoPlayBack.pause();
			}
			super.deleteAsset();
		}
		
		override public function unloadAssetImage(param1:Boolean) : void
		{
		}
	}
}
