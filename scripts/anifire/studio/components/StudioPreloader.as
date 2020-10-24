package anifire.studio.components
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.geom.Matrix;
	import mx.events.FlexEvent;
	import mx.events.RSLEvent;
	import mx.preloaders.IPreloaderDisplay;
	
	public class StudioPreloader extends Sprite implements IPreloaderDisplay
	{
		
		private static var imgLogo:Class = StudioPreloader_imgLogo;
		
		private static var imgBarTrack:Class = StudioPreloader_imgBarTrack;
		
		private static var imgBarFill:Class = StudioPreloader_imgBarFill;
		
		private static const LOGO_WIDTH:int = 188;
		
		private static const LOGO_HEIGHT:int = 36;
		
		private static const TRACK_WIDTH:int = 224;
		
		private static const TRACK_HEIGHT:int = 12;
		
		private static const FILL_WIDTH:int = 221;
		
		private static const FILL_HEIGHT:int = 8;
		
		private static const MARGIN:int = 20;
		 
		
		private var _preloader:Sprite;
		
		private var _stageWidth:Number = 0;
		
		private var _stageHeight:Number = 0;
		
		private var _trackX:Number;
		
		private var _trackY:Number;
		
		private var _fillX:Number;
		
		private var _fillY:Number;
		
		private var _rendered:Boolean;
		
		private var _barFillBitmapData:BitmapData;
		
		private var _fillSprite:Sprite;
		
		public function StudioPreloader()
		{
			super();
		}
		
		public function set preloader(param1:Sprite) : void
		{
			this._preloader = param1;
			param1.addEventListener(Event.COMPLETE,this.handleLoadComplete);
			param1.addEventListener(ProgressEvent.PROGRESS,this.handleLoadProgress);
			param1.addEventListener(FlexEvent.INIT_COMPLETE,this.handleInitComplete);
			param1.addEventListener(RSLEvent.RSL_ERROR,this.handleRslError);
		}
		
		public function initialize() : void
		{
		}
		
		private function show() : void
		{
			if(this.stageWidth == 0 && this.stageHeight == 0)
			{
				try
				{
					this.stageWidth = stage.stageWidth;
					this.stageHeight = stage.stageHeight;
				}
				catch(e:Error)
				{
					stageWidth = loaderInfo.width;
					stageHeight = loaderInfo.height;
				}
				if(this.stageWidth == 0 && this.stageHeight == 0)
				{
					return;
				}
			}
			if(!this._rendered)
			{
				this.createChildren();
			}
		}
		
		protected function createChildren() : void
		{
			var _loc1_:Number = this._stageWidth * 0.5;
			var _loc2_:Number = this._stageHeight * 0.5;
			var _loc3_:Number = (LOGO_HEIGHT + MARGIN + TRACK_HEIGHT) * 0.5;
			var _loc4_:Bitmap = new imgLogo();
			var _loc5_:Number = _loc1_ - LOGO_WIDTH * 0.5;
			var _loc6_:Number = _loc2_ - _loc3_;
			graphics.beginBitmapFill(_loc4_.bitmapData,new Matrix(1,0,0,1,_loc5_,_loc6_),false,true);
			graphics.drawRect(_loc5_,_loc6_,LOGO_WIDTH,LOGO_HEIGHT);
			graphics.endFill();
			this._trackX = _loc1_ - TRACK_WIDTH * 0.5;
			this._trackY = _loc2_ - _loc3_ + LOGO_HEIGHT + MARGIN;
			this._fillX = _loc1_ - FILL_WIDTH * 0.5;
			this._fillY = this._trackY + (TRACK_HEIGHT - FILL_HEIGHT) * 0.5;
			var _loc7_:Bitmap = new imgBarTrack();
			graphics.beginBitmapFill(_loc7_.bitmapData,new Matrix(1,0,0,1,this._trackX,this._trackY),false,true);
			graphics.drawRect(this._trackX,this._trackY,TRACK_WIDTH,TRACK_HEIGHT);
			graphics.endFill();
			var _loc8_:Bitmap = new imgBarFill();
			this._barFillBitmapData = _loc8_.bitmapData;
			this._fillSprite = new Sprite();
			this._fillSprite.x = this._fillX;
			this._fillSprite.y = this._fillY;
			addChild(this._fillSprite);
			this._rendered = true;
		}
		
		protected function updateProgress(param1:Number) : void
		{
			this._fillSprite.graphics.clear();
			this._fillSprite.graphics.beginBitmapFill(this._barFillBitmapData,null,false,true);
			this._fillSprite.graphics.drawRect(0,0,FILL_WIDTH * param1,FILL_HEIGHT);
			this._fillSprite.graphics.endFill();
		}
		
		private function handleLoadProgress(param1:ProgressEvent) : void
		{
			if(!this._rendered)
			{
				this.createChildren();
			}
			this.updateProgress(param1.bytesLoaded / param1.bytesTotal);
		}
		
		private function handleLoadComplete(param1:Event) : void
		{
		}
		
		private function handleInitComplete(param1:FlexEvent) : void
		{
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
		private function handleRslError(param1:Event) : void
		{
		}
		
		public function get backgroundColor() : uint
		{
			return 16777215;
		}
		
		public function set backgroundColor(param1:uint) : void
		{
		}
		
		public function get backgroundAlpha() : Number
		{
			return 0;
		}
		
		public function set backgroundAlpha(param1:Number) : void
		{
		}
		
		public function get backgroundImage() : Object
		{
			return undefined;
		}
		
		public function set backgroundImage(param1:Object) : void
		{
		}
		
		public function get backgroundSize() : String
		{
			return "";
		}
		
		public function set backgroundSize(param1:String) : void
		{
		}
		
		public function get stageWidth() : Number
		{
			return this._stageWidth;
		}
		
		public function set stageWidth(param1:Number) : void
		{
			this._stageWidth = param1;
		}
		
		public function get stageHeight() : Number
		{
			return this._stageHeight;
		}
		
		public function set stageHeight(param1:Number) : void
		{
			this._stageHeight = param1;
		}
	}
}
