package anifire.studio.assets.image
{
	import anifire.component.flowFrames.FlowFrameMaker;
	import anifire.event.FlowFrameMakerEvent;
	import anifire.studio.assets.image.library.IReusableObject;
	import anifire.studio.core.Asset;
	import anifire.studio.core.FlowFrame;
	import anifire.studio.core.FlowFrameThumb;
	import anifire.studio.core.Thumb;
	import anifire.studio.managers.ThemeManager;
	
	public class FlowFrameImage extends AssetImageBase implements IReusableObject
	{
		 
		
		private var _flowFrameMaker:FlowFrameMaker;
		
		protected var _flowFrame:FlowFrame;
		
		private var _reusable:Boolean;
		
		public function FlowFrameImage()
		{
			super();
		}
		
		override public function set asset(param1:Asset) : void
		{
			super.asset = param1;
			this.init();
		}
		
		private function init() : void
		{
			this._flowFrame = _asset as FlowFrame;
			if(!this._flowFrame)
			{
				return;
			}
			var _loc1_:FlowFrameThumb = this._flowFrame.thumb as FlowFrameThumb;
			this._flowFrameMaker = new FlowFrameMaker();
			this._flowFrameMaker.displayContentRect = true;
			this._flowFrameMaker.fitMode = this._flowFrame.fitMode;
			this.addChild(this._flowFrameMaker);
			this._flowFrameMaker.addEventListener(FlowFrameMakerEvent.RESIZE_BY_INNER_IMAGE,this.flowFrameMaker_resizeByInnerImageHandler);
			this._flowFrameMaker.addEventListener(FlowFrameMakerEvent.INNER_IMAGE_AUTO_LAYOUT,this.flowFrameMaker_innerImageAutoLayoutHandler);
			this._flowFrameMaker.addEventListener(FlowFrameMakerEvent.LOAD_IMAGE_COMPLETE,this.flowFrameMaker_loadImageCompleteHandler);
			this._flowFrameMaker.readNode(_loc1_.xml);
			this._flowFrameMaker.initFlowImageSource(_loc1_.themeId,_loc1_.id);
			var _loc2_:Thumb = ThemeManager.instance.userTheme.propThumbs.getValueByKey(this._flowFrame.innerImageAssetId);
			var _loc3_:String = !!_loc2_?_loc2_.encAssetId:"";
			var _loc4_:String = !!_loc2_?_loc2_.signature:"";
			this._flowFrameMaker.initInnerImageSource(this._flowFrame.innerImageThemeId,_loc3_,false,_loc4_);
			this._flowFrameMaker.resizeFrame(this._flowFrame.width,this._flowFrame.height);
			this._flowFrameMaker.loadImage();
		}
		
		private function flowFrameMaker_loadImageCompleteHandler(param1:FlowFrameMakerEvent) : void
		{
			this.resizeFrame(this._flowFrame.width,this._flowFrame.height);
			dispatchImageReady();
		}
		
		private function flowFrameMaker_resizeByInnerImageHandler(param1:FlowFrameMakerEvent) : void
		{
			if(this._flowFrame && this._flowFrameMaker)
			{
				this._flowFrame.resize(this._flowFrameMaker.flowWidth,this._flowFrameMaker.flowHeight);
			}
		}
		
		private function flowFrameMaker_innerImageAutoLayoutHandler(param1:FlowFrameMakerEvent) : void
		{
			if(this._flowFrame && this._flowFrameMaker)
			{
				this._flowFrame.moveInnerImage(this._flowFrameMaker.innerImageX,this._flowFrameMaker.innerImageY);
				this._flowFrame.scaleInnerImage(this._flowFrameMaker.innerImageScaleX,this._flowFrameMaker.innerImageScaleY);
				this._flowFrame.innerImageRotation = this._flowFrameMaker.innerImageRotation;
			}
		}
		
		public function resizeFrame(param1:Number, param2:Number) : void
		{
			if(!this._flowFrameMaker)
			{
				return;
			}
			this._flowFrameMaker.resizeFrame(param1,param2);
			_rect.x = -0.5 * param1;
			_rect.y = -0.5 * param2;
			_rect.width = param1;
			_rect.height = param2;
		}
		
		public function moveInnerImage(param1:Number, param2:Number) : void
		{
			if(this._flowFrameMaker)
			{
				this._flowFrameMaker.moveInnerImage(param1,param2);
			}
		}
		
		public function scaleInnerImage(param1:Number, param2:Number) : void
		{
			if(this._flowFrameMaker)
			{
				this._flowFrameMaker.scaleInnerImage(param1,param2);
			}
		}
		
		public function rotateInnerImage(param1:Number) : void
		{
			if(this._flowFrameMaker)
			{
				this._flowFrameMaker.rotateInnerImage(param1);
			}
		}
		
		public function setColor(param1:uint, param2:int = 1) : void
		{
			if(this._flowFrameMaker)
			{
				this._flowFrameMaker.baseColor = param1;
				this._flowFrameMaker.opacity = param2;
				this._flowFrameMaker.validate();
			}
		}
		
		public function updateInnerImage(param1:String, param2:String, param3:Boolean = true) : void
		{
			var _loc4_:Thumb = null;
			if(!this._flowFrameMaker)
			{
				return;
			}
			if(param1 && param2)
			{
				_loc4_ = ThemeManager.instance.getTheme(param1).getPropThumbById(param2);
				if(_loc4_)
				{
					this._flowFrameMaker.updateInnerImageSource(param1,_loc4_.encAssetId,param3,_loc4_.signature);
				}
			}
			else
			{
				this._flowFrameMaker.removeInnerImageSource();
			}
		}
		
		public function showInnerImage() : void
		{
			if(this._flowFrameMaker)
			{
				this._flowFrameMaker.showInnerImage();
			}
		}
		
		public function hideInnerImage() : void
		{
			if(this._flowFrameMaker)
			{
				this._flowFrameMaker.hideInnerImage();
			}
		}
		
		public function updateFitMode(param1:int) : void
		{
			if(!this._flowFrameMaker)
			{
				return;
			}
			this._flowFrameMaker.fitMode = param1;
		}
		
		override public function destroy(param1:String = "rip") : void
		{
			if(this._reusable)
			{
				return;
			}
			if(this._flowFrameMaker)
			{
				this._flowFrameMaker.removeEventListener(FlowFrameMakerEvent.RESIZE_BY_INNER_IMAGE,this.flowFrameMaker_resizeByInnerImageHandler);
				this._flowFrameMaker.removeEventListener(FlowFrameMakerEvent.INNER_IMAGE_AUTO_LAYOUT,this.flowFrameMaker_innerImageAutoLayoutHandler);
				this._flowFrameMaker.removeEventListener(FlowFrameMakerEvent.LOAD_IMAGE_COMPLETE,this.flowFrameMaker_loadImageCompleteHandler);
				this._flowFrameMaker.dispose();
			}
		}
		
		public function doBeforeReuse() : void
		{
			this._reusable = true;
			if(this._flowFrameMaker)
			{
				this._flowFrameMaker.baseColor = 0;
				this._flowFrameMaker.opacity = 0;
				this._flowFrameMaker.removeInnerImageSource();
			}
		}
		
		public function releaseResource() : void
		{
			this._reusable = false;
			this.destroy();
		}
	}
}
