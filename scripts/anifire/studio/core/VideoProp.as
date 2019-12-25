package anifire.studio.core
{
	import anifire.component.VideoPlayback;
	import anifire.constant.AnimeConstants;
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
