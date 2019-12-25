package anifire.studio.components
{
	import anifire.studio.core.BubbleThumb;
	import anifire.studio.core.Console;
	import anifire.studio.managers.TextComponentManager;
	import anifire.util.FontManager;
	import anifire.util.UtilDict;
	import flash.events.MouseEvent;
	import mx.core.IFlexModuleFactory;
	import mx.graphics.SolidColor;
	import mx.graphics.SolidColorStroke;
	import spark.components.Group;
	import spark.components.Label;
	import spark.components.VGroup;
	import spark.primitives.Rect;
	
	public class TextComponentCreationPanel extends Group
	{
		
		private static const DEFAULT_TEXT_COLOR:uint = 15987699;
		
		private static const DEFAULT_TEXT_ALIGNMENT:String = "center";
		 
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		public function TextComponentCreationPanel()
		{
			super();
			mx_internal::_document = this;
			this.percentWidth = 100;
			this.mxmlContent = [this._TextComponentCreationPanel_Rect1_c(),this._TextComponentCreationPanel_VGroup1_c()];
		}
		
		override public function set moduleFactory(param1:IFlexModuleFactory) : void
		{
			super.moduleFactory = param1;
			if(this.__moduleFactoryInitialized)
			{
				return;
			}
			this.__moduleFactoryInitialized = true;
		}
		
		override public function initialize() : void
		{
			super.initialize();
		}
		
		private function addTextElement(param1:String, param2:String, param3:String, param4:int) : void
		{
			var _loc5_:BubbleThumb = new BubbleThumb();
			var _loc6_:XML = <bubble x="-90" y="-45" w="180" h="90" rotate="0" type="BLANK" hasTail="0">
								<body taily="65" tailx="90" linergb="0" rgb="0xFFFFFF"/>
								<text rgb="{DEFAULT_TEXT_COLOR}" font="{param3}" size="{param4}" align="{DEFAULT_TEXT_ALIGNMENT}" bold="false" italic="false">
								</text>
						  </bubble>;
			_loc5_.imageData = _loc6_;
			_loc5_.promptText = UtilDict.translate(param2);
			_loc5_.componentRole = param1;
			var _loc7_:Console = Console.getConsole();
			if(_loc7_ && _loc7_.thumbTray)
			{
				_loc7_.thumbTray.addAssetToStage(_loc5_);
			}
		}
		
		protected function addTitleButton_clickHandler(param1:MouseEvent) : void
		{
			this.addTextElement(TextComponentManager.COMPONENT_ROLE_TITLE,"Your title here",FontManager.FONT_NAME_LEAGUE_GOTHIC,40);
		}
		
		protected function addSubtitle_clickHandler(param1:MouseEvent) : void
		{
			this.addTextElement(TextComponentManager.COMPONENT_ROLE_SUBTITLE,"Your subtitle here",FontManager.FONT_NAME_LATO,20);
		}
		
		protected function addQuote_clickHandler(param1:MouseEvent) : void
		{
			this.addTextElement(TextComponentManager.COMPONENT_ROLE_QUOTE,"Your quote here",FontManager.FONT_NAME_LATO,20);
		}
		
		protected function addCaption_clickHandler(param1:MouseEvent) : void
		{
			this.addTextElement(TextComponentManager.COMPONENT_ROLE_CAPTION,"Your caption here",FontManager.FONT_NAME_LATO,15);
		}
		
		protected function addText_clickHandler(param1:MouseEvent) : void
		{
			this.addTextElement(TextComponentManager.COMPONENT_ROLE_BODY_TEXT,"Your text here",FontManager.FONT_NAME_LATO,15);
		}
		
		private function _TextComponentCreationPanel_Rect1_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.stroke = this._TextComponentCreationPanel_SolidColorStroke1_c();
			_loc1_.fill = this._TextComponentCreationPanel_SolidColor1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _TextComponentCreationPanel_SolidColorStroke1_c() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.weight = 1;
			_loc1_.color = 14737632;
			return _loc1_;
		}
		
		private function _TextComponentCreationPanel_SolidColor1_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 15594230;
			return _loc1_;
		}
		
		private function _TextComponentCreationPanel_VGroup1_c() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.percentWidth = 100;
			_loc1_.paddingBottom = 20;
			_loc1_.paddingLeft = 20;
			_loc1_.paddingRight = 20;
			_loc1_.paddingTop = 20;
			_loc1_.mxmlContent = [this._TextComponentCreationPanel_Label1_c(),this._TextComponentCreationPanel_Label2_c(),this._TextComponentCreationPanel_Label3_c(),this._TextComponentCreationPanel_Label4_c(),this._TextComponentCreationPanel_Label5_c(),this._TextComponentCreationPanel_Label6_c()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _TextComponentCreationPanel_Label1_c() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.text = "Tagged text element (admin only)";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _TextComponentCreationPanel_Label2_c() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.text = "Title";
			_loc1_.percentWidth = 100;
			_loc1_.buttonMode = true;
			_loc1_.setStyle("paddingTop",10);
			_loc1_.setStyle("fontSize",32);
			_loc1_.setStyle("textAlign","center");
			_loc1_.addEventListener("click",this.___TextComponentCreationPanel_Label2_click);
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		public function ___TextComponentCreationPanel_Label2_click(param1:MouseEvent) : void
		{
			this.addTitleButton_clickHandler(param1);
		}
		
		private function _TextComponentCreationPanel_Label3_c() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.text = "Subtitle";
			_loc1_.percentWidth = 100;
			_loc1_.buttonMode = true;
			_loc1_.setStyle("paddingTop",10);
			_loc1_.setStyle("fontSize",24);
			_loc1_.setStyle("textAlign","center");
			_loc1_.addEventListener("click",this.___TextComponentCreationPanel_Label3_click);
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		public function ___TextComponentCreationPanel_Label3_click(param1:MouseEvent) : void
		{
			this.addSubtitle_clickHandler(param1);
		}
		
		private function _TextComponentCreationPanel_Label4_c() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.text = "Quote";
			_loc1_.percentWidth = 100;
			_loc1_.buttonMode = true;
			_loc1_.setStyle("paddingTop",10);
			_loc1_.setStyle("fontSize",16);
			_loc1_.setStyle("textAlign","center");
			_loc1_.addEventListener("click",this.___TextComponentCreationPanel_Label4_click);
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		public function ___TextComponentCreationPanel_Label4_click(param1:MouseEvent) : void
		{
			this.addQuote_clickHandler(param1);
		}
		
		private function _TextComponentCreationPanel_Label5_c() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.text = "Caption";
			_loc1_.percentWidth = 100;
			_loc1_.buttonMode = true;
			_loc1_.setStyle("paddingTop",10);
			_loc1_.setStyle("fontSize",16);
			_loc1_.setStyle("textAlign","center");
			_loc1_.addEventListener("click",this.___TextComponentCreationPanel_Label5_click);
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		public function ___TextComponentCreationPanel_Label5_click(param1:MouseEvent) : void
		{
			this.addCaption_clickHandler(param1);
		}
		
		private function _TextComponentCreationPanel_Label6_c() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.text = "Text";
			_loc1_.percentWidth = 100;
			_loc1_.buttonMode = true;
			_loc1_.setStyle("paddingTop",10);
			_loc1_.setStyle("fontSize",16);
			_loc1_.setStyle("textAlign","center");
			_loc1_.addEventListener("click",this.___TextComponentCreationPanel_Label6_click);
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		public function ___TextComponentCreationPanel_Label6_click(param1:MouseEvent) : void
		{
			this.addText_clickHandler(param1);
		}
	}
}
