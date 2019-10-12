package anifire.studio.core
{
   import anifire.bubble.BlankBubble;
   import anifire.bubble.Bubble;
   import anifire.bubble.BubbleEvent;
   import anifire.bubble.BubbleMgr;
   import anifire.constant.AnimeConstants;
   import anifire.constant.ThemeConstants;
   import anifire.errors.SerializeError;
   import anifire.managers.FontVariantManager;
   import anifire.studio.assets.controllers.AssetTransitionHelper;
   import anifire.studio.assets.models.AssetRotation;
   import anifire.studio.assets.models.AssetTransition;
   import anifire.studio.commands.ChangeBubbleTextCommand;
   import anifire.studio.commands.UpdateBubbleTextCommand;
   import anifire.studio.components.ConfirmPopUp;
   import anifire.studio.events.AssetEvent;
   import anifire.studio.events.BubbleAssetEvent;
   import anifire.studio.interfaces.IBubble;
   import anifire.studio.interfaces.IBubbleTail;
   import anifire.studio.interfaces.IBubbleText;
   import anifire.studio.interfaces.IMotion;
   import anifire.studio.interfaces.IMovable;
   import anifire.studio.interfaces.IResizable;
   import anifire.studio.interfaces.IRotatable;
   import anifire.studio.interfaces.IScalable;
   import anifire.studio.interfaces.ISlidable;
   import anifire.studio.managers.TextComponentManager;
   import anifire.studio.managers.ThemeManager;
   import anifire.studio.skins.InternationalLanguagePopUpSkin;
   import anifire.util.BadwordFilter;
   import anifire.util.FontManager;
   import anifire.util.Util;
   import anifire.util.UtilDict;
   import anifire.util.UtilMath;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.Font;
   import mx.core.FlexGlobals;
   import spark.events.PopUpEvent;
   
   public class BubbleAsset extends Asset implements IRotatable, IMovable, IBubble, IResizable, IBubbleText, IBubbleTail, ISlidable, IMotion, IScalable
   {
      
      public static var ASSET_TYPE:String = "bubbleAsset";
      
      public static var XML_NODE_NAME:String = "bubbleAsset";
       
      
      private var _fromTray:Boolean = false;
      
      private var _bubble:Bubble;
      
      private var _sttime:Number = -1;
      
      private var _edtime:Number = -1;
      
      private var _fxDuration:Number;
      
      private var _fxName:String;
      
      protected var _myBubbleXML:XML;
      
      private var _motionData:MotionData;
      
      private var _shadowParent:BubbleAsset;
      
      private var _motionShadow:BubbleAsset;
      
      private var _isShadow:Boolean;
      
      private var _rotation:AssetRotation;
      
      private var _textInput:String;
      
      private var _textUpdateCommand:UpdateBubbleTextCommand;
      
      public function BubbleAsset(param1:String = "")
      {
         this._rotation = new AssetRotation();
         super();
         if(param1 == "")
         {
            param1 = "BUBBLE" + this.assetCount;
         }
         this.id = param1;
      }
      
      public function get shadow() : Object
      {
         return this._motionShadow;
      }
      
      public function get motionData() : MotionData
      {
         return this._motionData;
      }
      
      public function get motionShadow() : BubbleAsset
      {
         return this._motionShadow;
      }
      
      public function set motionShadow(param1:BubbleAsset) : void
      {
         if(this._motionShadow)
         {
            this._motionShadow.removeEventListener(AssetEvent.ASSET_MOVED,this.onShadowMoved);
         }
         this._motionShadow = param1;
         if(this._motionShadow)
         {
            this._motionShadow.addEventListener(AssetEvent.ASSET_MOVED,this.onShadowMoved);
         }
      }
      
      override public function get minWidth() : Number
      {
         return 20 + this.horizontalPadding;
      }
      
      override public function get minHeight() : Number
      {
         return 20 + this.verticalPadding;
      }
      
      public function get hasTail() : Boolean
      {
         if(this._bubble)
         {
            return this._bubble.isTailEnable();
         }
         return true;
      }
      
      public function set fxDuration(param1:Number) : void
      {
         this._fxDuration = param1;
      }
      
      public function get fxDuration() : Number
      {
         return this._fxDuration;
      }
      
      public function set fxName(param1:String) : void
      {
         this._fxName = param1;
      }
      
      public function get fxName() : String
      {
         return this._fxName;
      }
      
      public function set sttime(param1:Number) : void
      {
      }
      
      public function get sttime() : Number
      {
         return this._sttime;
      }
      
      public function set edtime(param1:Number) : void
      {
      }
      
      public function get edtime() : Number
      {
         return this._edtime;
      }
      
      [Bindable(event="TEXT_CHANGE")]
      public function get text() : String
      {
         return this._bubble.text;
      }
      
      public function set text(param1:String) : void
      {
         this._bubble.text = param1;
         if(this.motionShadow)
         {
            this.motionShadow.text = param1;
         }
         this.dispatchEvent(new BubbleAssetEvent(BubbleAssetEvent.TEXT_CHANGE,this));
      }
      
      public function get textFont() : String
      {
         return this._bubble.textFont;
      }
      
      public function set textFont(param1:String) : void
      {
         var _loc2_:Array = null;
         var _loc3_:AssetTransition = null;
         if(param1 == FontManager.FONT_NAME_NOTO)
         {
            param1 = FontVariantManager.instance.lookupFontLanguageVariant(FontManager.FONT_NAME_NOTO,this.text);
         }
         this._bubble.textFont = param1;
         if(this.motionShadow)
         {
            this.motionShadow.textFont = this.bubble.textFont;
         }
         if(this.scene)
         {
            _loc2_ = AssetTransitionHelper.getTransitions(this.id,this.scene.assetTransitions);
            if(_loc2_ && _loc2_.length > 0)
            {
               for each(_loc3_ in _loc2_)
               {
                  AssetTransitionHelper.checkConflictWithFontFamily(param1,_loc3_);
               }
            }
         }
         this.dispatchEvent(new BubbleAssetEvent(BubbleAssetEvent.TEXT_FONT_CHANGE,this));
      }
      
      public function get textSize() : Number
      {
         return this._bubble.textSize;
      }
      
      public function set textSize(param1:Number) : void
      {
         var _loc2_:Point = new Point(this.globalCenter.x,this.globalCenter.y);
         this._bubble.textSize = param1;
         if(this.motionShadow)
         {
            this.motionShadow.textSize = param1;
         }
         if(!this.isShadow)
         {
            this.scaleX = 1;
            this.scaleY = 1;
            this.move(this.x + _loc2_.x - this.globalCenter.x,this.y + _loc2_.y - this.globalCenter.y);
            this.setReferencePoint(this.globalCenter.x,this.globalCenter.y);
         }
         this.dispatchEvent(new BubbleAssetEvent(BubbleAssetEvent.TEXT_SIZE_CHANGE,this));
      }
      
      public function get autoTextResize() : Boolean
      {
         return this._bubble.autoTextResize;
      }
      
      public function set autoTextResize(param1:Boolean) : void
      {
         this._bubble.autoTextResize = param1;
         if(this.motionShadow)
         {
            this.motionShadow.autoTextResize = param1;
         }
         this.dispatchEvent(new BubbleAssetEvent(BubbleAssetEvent.AUTO_TEXT_RESIZE_CHANGE,this));
      }
      
      public function get textAlign() : String
      {
         return this._bubble.textAlign;
      }
      
      public function set textAlign(param1:String) : void
      {
         this._bubble.textAlign = param1;
         if(this.motionShadow)
         {
            this.motionShadow.textAlign = param1;
         }
         this.dispatchEvent(new BubbleAssetEvent(BubbleAssetEvent.TEXT_ALIGN_CHANGE,this));
      }
      
      public function get textBold() : Boolean
      {
         return this._bubble.textBold;
      }
      
      public function set textBold(param1:Boolean) : void
      {
         this._bubble.textBold = param1;
         if(this.motionShadow)
         {
            this.motionShadow.textBold = param1;
         }
         this.dispatchEvent(new BubbleAssetEvent(BubbleAssetEvent.TEXT_BOLD_CHANGE,this));
      }
      
      public function get textItalic() : Boolean
      {
         return this._bubble.textItalic;
      }
      
      public function set textItalic(param1:Boolean) : void
      {
         this._bubble.textItalic = param1;
         this.dispatchEvent(new BubbleAssetEvent(BubbleAssetEvent.TEXT_STYLE_CHANGE,this));
      }
      
      public function get textEmbed() : Boolean
      {
         return !!this._bubble?Boolean(this._bubble.textEmbed):false;
      }
      
      public function set textEmbed(param1:Boolean) : void
      {
         var _loc2_:Point = null;
         this._bubble.textEmbed = param1;
         if(!param1)
         {
            _loc2_ = new Point(this.globalCenter.x,this.globalCenter.y);
            this.scaleX = 1;
            this.scaleY = 1;
            this.rotation = 0;
            this.move(this.x + _loc2_.x - this.globalCenter.x,this.y + _loc2_.y - this.globalCenter.y);
            this.setReferencePoint(this.globalCenter.x,this.globalCenter.y);
         }
         if(this._motionShadow)
         {
            this._motionShadow.textEmbed = this.bubble.textEmbed;
         }
         this.dispatchEvent(new BubbleAssetEvent(BubbleAssetEvent.TEXT_EMBED_CHANGE,this));
      }
      
      function set fromTray(param1:Boolean) : void
      {
         this._fromTray = param1;
      }
      
      function get fromTray() : Boolean
      {
         return this._fromTray;
      }
      
      public function get bubble() : Bubble
      {
         return this._bubble;
      }
      
      public function set bubble(param1:Bubble) : void
      {
         this._bubble = param1;
      }
      
      public function resizeBubble(param1:Rectangle) : void
      {
         if(param1 && this._bubble)
         {
            this._bubble.x = param1.x;
            this._bubble.y = param1.y;
            this._bubble.setSize(param1.width,param1.height);
            this.dispatchEvent(new BubbleAssetEvent(BubbleAssetEvent.BUBBLE_RESIZED,this));
            this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED,this));
         }
         if(this.motionShadow)
         {
            this.motionShadow.resizeBubble(param1);
         }
      }
      
      public function get bubbleSize() : Rectangle
      {
         var _loc1_:Rectangle = null;
         if(this._bubble)
         {
            _loc1_ = new Rectangle(this._bubble.x,this._bubble.y,this._bubble.width,this._bubble.height);
         }
         return _loc1_;
      }
      
      override public function set x(param1:Number) : void
      {
         if(param1 != this.x)
         {
            super.x = param1;
            if(this._motionData)
            {
               this._motionData.startX = this.x;
            }
            this.dispatchEvent(new AssetEvent(AssetEvent.MOTION_CHANGE,this));
         }
      }
      
      override public function set y(param1:Number) : void
      {
         if(param1 != this.y)
         {
            super.y = param1;
            if(this._motionData)
            {
               this._motionData.startY = this.y;
            }
            this.dispatchEvent(new AssetEvent(AssetEvent.MOTION_CHANGE,this));
         }
      }
      
      override public function move(param1:Number, param2:Number) : void
      {
         if(param1 != this.x || param2 != this.y)
         {
            super.move(param1,param2);
            if(this._motionData)
            {
               this._motionData.moveStartPoint(this.x,this.y);
            }
            this.dispatchEvent(new AssetEvent(AssetEvent.MOTION_CHANGE,this));
         }
      }
      
      public function get globalCenter() : Point
      {
         var _loc1_:Point = new Point();
         if(this.bubble)
         {
            _loc1_.offset(this.bubble.x + this.bubble.width / 2,this.bubble.y + this.bubble.height / 2);
         }
         var _loc2_:Matrix = new Matrix();
         _loc2_.scale(this.scaleX,this.scaleY);
         _loc2_.rotate(this.rotation * Math.PI / 180);
         _loc2_.translate(this.x,this.y);
         _loc1_ = _loc2_.transformPoint(_loc1_);
         return _loc1_;
      }
      
      override public function get width() : Number
      {
         return !!this._bubble?Number(this._bubble.width):Number(0);
      }
      
      override public function set width(param1:Number) : void
      {
         param1 = UtilMath.boundaryCheck(param1,this.minWidth,this.maxWidth);
         if(this._bubble)
         {
            this._bubble.width = this.width;
         }
         if(this.motionShadow)
         {
            this.motionShadow.width = param1;
         }
         this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED,this));
         this.dispatchEvent(new AssetEvent(AssetEvent.MOTION_CHANGE,this));
      }
      
      override public function get height() : Number
      {
         return !!this._bubble?Number(this._bubble.height):Number(0);
      }
      
      override public function set height(param1:Number) : void
      {
         param1 = UtilMath.boundaryCheck(param1,this.minHeight,this.maxHeight);
         if(this._bubble)
         {
            this._bubble.height = this.height;
         }
         if(this.motionShadow)
         {
            this.motionShadow.height = param1;
         }
         this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED,this));
         this.dispatchEvent(new AssetEvent(AssetEvent.MOTION_CHANGE,this));
      }
      
      public function get rect() : Rectangle
      {
         return new Rectangle();
      }
      
      public function resize(param1:Number, param2:Number, param3:Boolean = false) : void
      {
         if(param1 != this.width || param2 != this.height)
         {
            this.width = param1;
            this.height = param2;
         }
      }
      
      public function get tailX() : Number
      {
         return !!this._bubble?Number(this._bubble.tailx):Number(0);
      }
      
      public function get tailY() : Number
      {
         return !!this._bubble?Number(this._bubble.taily):Number(0);
      }
      
      public function get textColor() : uint
      {
         return this._bubble.textRgb;
      }
      
      public function set textColor(param1:uint) : void
      {
         this._bubble.textRgb = param1;
         if(this.motionShadow)
         {
            this.motionShadow.textColor = param1;
         }
         this.dispatchEvent(new BubbleAssetEvent(BubbleAssetEvent.TEXT_COLOR_CHANGE,this));
      }
      
      public function get textAlpha() : uint
      {
         return this._bubble.textAlpha;
      }
      
      public function set textAlpha(param1:uint) : void
      {
         this._bubble.textAlpha = param1;
         if(this.motionShadow)
         {
            this.motionShadow.textAlpha = param1;
         }
         this.dispatchEvent(new BubbleAssetEvent(BubbleAssetEvent.TEXT_COLOR_CHANGE,this));
      }
      
      public function set tailX(param1:Number) : void
      {
         this._bubble.tailx = param1;
         if(this.motionShadow)
         {
            this.motionShadow.tailX = param1;
         }
         this.dispatchEvent(new BubbleAssetEvent(BubbleAssetEvent.TAIL_MOVED,this));
      }
      
      public function set tailY(param1:Number) : void
      {
         this._bubble.taily = param1;
         if(this.motionShadow)
         {
            this.motionShadow.tailY = param1;
         }
         this.dispatchEvent(new BubbleAssetEvent(BubbleAssetEvent.TAIL_MOVED,this));
      }
      
      public function moveTail(param1:Number, param2:Number) : void
      {
         if(param1 != this.tailX || param2 != this.tailY)
         {
            if(this._bubble)
            {
               this._bubble.setTail(param1,param2);
            }
            if(this.motionShadow)
            {
               this.motionShadow.moveTail(param1,param2);
            }
            this.dispatchEvent(new BubbleAssetEvent(BubbleAssetEvent.TAIL_MOVED,this));
         }
      }
      
      public function updateTimeByScene(param1:Number, param2:Number) : void
      {
      }
      
      override public function cloneNext() : Asset
      {
         var _loc1_:BubbleAsset = this.clone() as BubbleAsset;
         if(this._motionShadow)
         {
            _loc1_.rotation = this._motionShadow.rotation;
            _loc1_.scaleX = this._motionShadow.scaleX;
            _loc1_.scaleY = this._motionShadow.scaleY;
            _loc1_.move(this._motionShadow.x,this._motionShadow.y);
            _loc1_.setReferencePoint(this._motionShadow.referenceX,this._motionShadow.referenceY);
            _loc1_.removeSlideMotion();
         }
         return _loc1_;
      }
      
      override public function clone(param1:Boolean = false, param2:AnimeScene = null) : Asset
      {
         var _loc3_:BubbleAsset = null;
         try
         {
            _loc3_ = new BubbleAsset();
            _loc3_._myBubbleXML = this.bubble.serialize();
            _loc3_.id = this.id;
            _loc3_.scene = this.scene;
            _loc3_.thumb = this.thumb;
            _loc3_.setReferencePoint(this.referenceX,this.referenceY);
            _loc3_.move(this.x,this.y);
            _loc3_.scaleX = this.scaleX;
            _loc3_.scaleY = this.scaleY;
            _loc3_.rotation = this.rotation;
            _loc3_.attachedBg = this.attachedBg;
            _loc3_.componentRole = this.componentRole;
            if(this._motionData)
            {
               _loc3_.motionData = this._motionData.clone();
            }
            if(this._motionShadow)
            {
               _loc3_.motionShadow = this._motionShadow.clone() as BubbleAsset;
            }
         }
         catch(e:Error)
         {
         }
         return _loc3_;
      }
      
      override public function get shouldBeCopyToNextScene() : Boolean
      {
         if(this.bubble && this.bubble.isTailEnable())
         {
            return false;
         }
         return true;
      }
      
      private function onStageMouseMoveHandler(param1:MouseEvent) : void
      {
         param1.updateAfterEvent();
      }
      
      private function onTextChangedHandler(param1:BubbleEvent) : void
      {
         var _loc2_:BadwordFilter = new BadwordFilter(Console.getConsole().getBadTerms(),null,Console.getConsole().getWhiteTerms());
         this.text = _loc2_.filter(this.text);
         this.scene.updateDuration();
      }
      
      private function onTextTyping(param1:BubbleEvent) : void
      {
         this.scene.updateDuration();
         this.dispatchEvent(new BubbleAssetEvent(BubbleAssetEvent.TEXT_TYPING,this));
      }
      
      private function bubble_textInputNotSupportedHandler(param1:BubbleEvent) : void
      {
         this._textInput = param1.textInput;
         if(FontVariantManager.instance.isVariantOfFont(this.textFont,FontManager.FONT_NAME_NOTO))
         {
            this.changeToFallbackFont();
         }
         else
         {
            this.showFontSupportPopUp();
         }
      }
      
      private function showFontSupportPopUp() : void
      {
         var _loc1_:ConfirmPopUp = new ConfirmPopUp();
         _loc1_.setStyle("skinClass",InternationalLanguagePopUpSkin);
         _loc1_.createDefaultPopUp();
         _loc1_.iconType = ConfirmPopUp.CONFIRM_POPUP_ERROR;
         _loc1_.title = UtilDict.translate("About Foreign Languages");
         _loc1_.confirmText = UtilDict.translate("Use \"Noto\" font");
         _loc1_.addEventListener(PopUpEvent.CLOSE,this.fontSupportPopUp_closeHandler);
         _loc1_.open(FlexGlobals.topLevelApplication as DisplayObjectContainer,true);
      }
      
      private function fontSupportPopUp_closeHandler(param1:PopUpEvent) : void
      {
         var _loc2_:ConfirmPopUp = param1.currentTarget as ConfirmPopUp;
         _loc2_.removeEventListener(PopUpEvent.CLOSE,this.fontSupportPopUp_closeHandler);
         if(param1.commit)
         {
            this.changeToFallbackFont();
         }
      }
      
      private function changeToFallbackFont() : void
      {
         var _loc1_:String = FontVariantManager.instance.lookupFontLanguageVariant(FontManager.FONT_NAME_NOTO,this._textInput);
         if(FontManager.instance.isFontLoaded(_loc1_))
         {
            this.changeBubbleFont(_loc1_);
         }
         else
         {
            FontManager.instance.loadFont(_loc1_,this.fontManager_loadFontCompleteHandler);
         }
      }
      
      private function fontManager_loadFontCompleteHandler(param1:Event, param2:String = "") : void
      {
         if(param2 != "")
         {
            this.changeBubbleFont(param2);
         }
      }
      
      private function changeBubbleFont(param1:String) : void
      {
         var _loc2_:Font = FontManager.instance.getFontByName(param1);
         if(_loc2_)
         {
            FontVariantManager.instance.logLanguageUsage(this._textInput,_loc2_);
         }
         var _loc3_:ChangeBubbleTextCommand = new ChangeBubbleTextCommand(this,this._textInput,param1);
         _loc3_.execute();
      }
      
      private function onBubbleTextSizeChange(param1:Event) : void
      {
         this.dispatchEvent(new BubbleAssetEvent(BubbleAssetEvent.TEXT_SIZE_CHANGE,this));
      }
      
      public function set bgColor(param1:uint) : void
      {
         this._bubble.fillRgb = param1;
         if(this.motionShadow)
         {
            this.motionShadow.bgColor = param1;
         }
         this.dispatchEvent(new BubbleAssetEvent(BubbleAssetEvent.BG_COLOR_CHANGE,this));
      }
      
      public function get bgColor() : uint
      {
         return this._bubble.fillRgb;
      }
      
      public function set bgAlpha(param1:Number) : void
      {
         this._bubble.fillAlpha = param1;
         if(this.motionShadow)
         {
            this.motionShadow.bgAlpha = param1;
         }
         this.dispatchEvent(new BubbleAssetEvent(BubbleAssetEvent.BG_COLOR_CHANGE,this));
      }
      
      public function get bgAlpha() : Number
      {
         return this._bubble.fillAlpha;
      }
      
      override protected function loadAssetImage() : void
      {
         var _loc1_:XML = XML(this.imageData);
         if(this._myBubbleXML == null)
         {
            this._bubble = BubbleMgr.getBubbleByXML(_loc1_);
         }
         else
         {
            this._bubble = BubbleMgr.getBubbleByXML(XML(this._myBubbleXML));
         }
         this._bubble.promptText = this.getPromptText();
         this._bubble.addEventListener(BubbleEvent.TEXT_CHANGED,this.onTextChangedHandler);
         this._bubble.addEventListener(BubbleEvent.TEXT_TYPING,this.onTextTyping);
         this._bubble.addEventListener(BubbleEvent.TEXT_SIZE_CHANGED,this.onBubbleTextSizeChange);
         this._bubble.addEventListener(BubbleEvent.TEXT_INPUT_NOT_SUPPORTED,this.bubble_textInputNotSupportedHandler);
         this._bubble.addEventListener(BubbleEvent.BUBBLE_SIZE_CHANGED,this.bubble_changeHandler);
         this._bubble.addEventListener(BubbleEvent.TEXT_FOCUS_IN,this.bubble_FocusInHandler);
         this._bubble.addEventListener(BubbleEvent.TEXT_FOCUS_OUT,this.bubble_FocusOutHandler);
         if(this._fromTray)
         {
            this._bubble.bubbleText = this.getPromptText();
         }
         if(this._bubble.text == "")
         {
            this._bubble.bubbleText = this.getPromptText();
         }
         var _loc2_:BadwordFilter = new BadwordFilter(Console.getConsole().getBadTerms(),null,Console.getConsole().getWhiteTerms());
         this.text = _loc2_.filter(this.text);
         this._bubble.useDeviceFont = true;
         this.setReferencePoint(this.globalCenter.x,this.globalCenter.y);
      }
      
      private function bubble_FocusInHandler(param1:Event) : void
      {
         this._textUpdateCommand = new UpdateBubbleTextCommand(this,this.text);
      }
      
      private function bubble_FocusOutHandler(param1:Event) : void
      {
         if(this._textUpdateCommand)
         {
            this._textUpdateCommand.execute();
         }
      }
      
      protected function bubble_changeHandler(param1:Event) : void
      {
         dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED,this));
      }
      
      public function setSize(param1:Number) : void
      {
         var _loc2_:Number = this.bubble.width * param1;
         var _loc3_:Number = this.bubble.height * param1;
         _loc2_ = Math.max(_loc2_,this.minWidth);
         _loc3_ = Math.max(_loc3_,this.minHeight);
         var _loc4_:Number = this.bubble.height / this.bubble.width;
         if(_loc4_ > 1)
         {
            _loc3_ = _loc4_ * _loc2_;
         }
         else
         {
            _loc2_ = _loc3_ / _loc4_;
         }
         param1 = _loc3_ / this.bubble.height;
         this.bubble.x = this.bubble.x + (this.bubble.width - _loc2_) / 2;
         this.bubble.y = this.bubble.y + (this.bubble.height - _loc3_) / 2;
         this.bubble.setTail(this.bubble.tailx * param1 + (this.bubble.width - _loc2_) / 2,this.bubble.taily * param1 + (this.bubble.height - _loc3_) / 2);
         this.bubble.setSize(_loc2_,_loc3_);
      }
      
      public function convertToJsonObj() : Object
      {
         var _loc1_:uint = this.scene.getOverallOrdering(this);
         var _loc2_:Object = {
            "type":ASSET_TYPE,
            "id":this.id,
            "index":_loc1_,
            "x":x,
            "y":y,
            "sx":scaleX,
            "sy":scaleY,
            "rotate":this.rotation,
            "componentRole":componentRole,
            "motion":{
               "x":this.serializeMotion("x",this.motionShadow),
               "y":this.serializeMotion("y",this.motionShadow),
               "xscale":this.serializeMotion("xscale",this.motionShadow),
               "yscale":this.serializeMotion("yscale",this.motionShadow),
               "rotation":this.serializeMotion("rotation",this.motionShadow)
            },
            "spec":this._bubble.serializeJson()
         };
         return _loc2_;
      }
      
      override public function convertToXml() : XML
      {
         var index:uint = 0;
         var xml:XML = <bubbleAsset/>;
         try
         {
            index = this.scene.getOverallOrdering(this);
            xml.@id = this.id;
            xml.@index = String(index);
            if(componentRole)
            {
               xml.@componentRole = componentRole;
            }
            xml.x = this.serializeMotion("x",this.motionShadow);
            xml.y = this.serializeMotion("y",this.motionShadow);
            xml.xscale = this.serializeMotion("xscale",this.motionShadow);
            xml.yscale = this.serializeMotion("yscale",this.motionShadow);
            xml.rotation = this.serializeMotion("rotation",this.motionShadow);
            if(!this.hasTail)
            {
               this.fxName = "easeNone";
               this.fxDuration = 0;
               xml.fx = this.fxName;
               xml.fxdur = this.fxDuration;
            }
            if(this._motionData)
            {
               xml.appendChild(this._motionData.convertToXml());
            }
            xml.appendChild(this._bubble.serialize());
         }
         catch(e:Error)
         {
            xml = SerializeError.createErrorNode("Failed to serialize bubble asset: " + this.id);
         }
         return xml;
      }
      
      override public function serialize() : String
      {
         return this.convertToXml().toXMLString();
      }
      
      private function serializeMotion(param1:String, param2:BubbleAsset) : Array
      {
         var tempArray:Array = null;
         var i:int = 0;
         var path:Vector.<Point> = null;
         var property:String = param1;
         var shadow:BubbleAsset = param2;
         try
         {
            tempArray = new Array();
            switch(property)
            {
               case "x":
                  tempArray.push(Util.roundNum(this.x));
                  break;
               case "y":
                  tempArray.push(Util.roundNum(this.y));
                  break;
               case "xscale":
                  tempArray.push(Util.roundNum(this.scaleX));
                  break;
               case "yscale":
                  tempArray.push(Util.roundNum(this.scaleY));
                  break;
               case "refX":
                  tempArray.push(Util.roundNum(this.referenceX));
                  break;
               case "refY":
                  tempArray.push(Util.roundNum(this.referenceY));
                  break;
               case "rotation":
                  tempArray.push(Util.roundNum(this.rotation));
            }
            if(this._motionData && this._motionData.path.length > 2)
            {
               i = 0;
               path = this._motionData.path;
               switch(property)
               {
                  case "x":
                     i = 1;
                     while(i < path.length - 1)
                     {
                        tempArray.push(Util.roundNum(Point(path[i]).x));
                        i++;
                     }
                     break;
                  case "y":
                     i = 1;
                     while(i < path.length - 1)
                     {
                        tempArray.push(Util.roundNum(Point(path[i]).y));
                        i++;
                     }
                     break;
                  case "refX":
                     i = 1;
                     while(i < path.length - 1)
                     {
                        tempArray.push(Util.roundNum(Point(path[i]).x));
                        i++;
                     }
                     break;
                  case "refY":
                     i = 1;
                     while(i < path.length - 1)
                     {
                        tempArray.push(Util.roundNum(Point(path[i]).y));
                        i++;
                     }
               }
            }
            if(shadow)
            {
               switch(property)
               {
                  case "x":
                     tempArray.push(Util.roundNum(shadow.x));
                     break;
                  case "y":
                     tempArray.push(Util.roundNum(shadow.y));
                     break;
                  case "xscale":
                     tempArray.push(Util.roundNum(shadow.scaleX));
                     break;
                  case "yscale":
                     tempArray.push(Util.roundNum(shadow.scaleY));
                     break;
                  case "refX":
                     tempArray.push(Util.roundNum(shadow.referenceX));
                     break;
                  case "refY":
                     tempArray.push(Util.roundNum(shadow.referenceY));
                     break;
                  case "rotation":
                     tempArray.push(Util.roundNum(shadow.rotation));
               }
            }
         }
         catch(e:Error)
         {
            throw new SerializeError("Failed to serialize bubble motion " + this.id,tempArray.toString(),e);
         }
         return tempArray;
      }
      
      public function deSerializeJsonObj(param1:Object, param2:AnimeScene) : void
      {
         var _loc7_:Array = null;
         var _loc8_:Array = null;
         var _loc9_:Array = null;
         var _loc10_:Array = null;
         var _loc11_:Array = null;
         var _loc12_:MotionData = null;
         var _loc13_:Vector.<Point> = null;
         var _loc14_:int = 0;
         if(!param1)
         {
            return;
         }
         var _loc3_:Object = param1.motion;
         var _loc4_:BubbleThumb = new BubbleThumb();
         var _loc5_:Bubble = new Bubble();
         _loc5_.deSerializeJsonObj(param1.spec);
         _loc4_.imageData = _loc5_.serialize();
         this.scene = param2;
         this.componentRole = param1.componentRole;
         this.idFromTextComponent = param1.id;
         this.move(param1.x,param1.y);
         this.setReferencePoint(param1.x,param1.y);
         this.scaleX = param1.sx;
         this.scaleY = param1.sy;
         this._rotation.rotation = param1.rotate;
         this.thumb = _loc4_;
         this.isLoadded = true;
         if(_loc3_ && _loc3_.xscale && _loc3_.xscale.length > 1)
         {
            _loc7_ = _loc3_.x;
            _loc8_ = _loc3_.y;
            _loc9_ = _loc3_.rotation;
            _loc10_ = _loc3_.xscale;
            _loc11_ = _loc3_.yscale;
            _loc12_ = new MotionData();
            _loc13_ = new Vector.<Point>();
            _loc14_ = 0;
            while(_loc14_ < _loc7_.length)
            {
               _loc13_.push(new Point(Number(_loc7_[_loc14_]),Number(_loc8_[_loc14_])));
               _loc14_++;
            }
            _loc12_.path = _loc13_;
            _loc12_.startRotation = this.rotation;
            this.motionData = _loc12_;
            if(this._motionShadow)
            {
               this._motionShadow.setReferencePoint(_loc7_[_loc7_.length - 1],_loc8_[_loc8_.length - 1]);
               this._motionShadow.move(_loc7_[_loc7_.length - 1],_loc8_[_loc8_.length - 1]);
               if(_loc9_ && _loc9_.length > 1)
               {
                  this._motionShadow.rotation = _loc9_[_loc9_.length - 1];
               }
               if(_loc10_ && _loc10_.length > 1 && _loc11_ && _loc11_.length > 1)
               {
                  this._motionShadow.scaleX = _loc10_[1];
                  this._motionShadow.scaleY = _loc11_[1];
               }
            }
         }
         var _loc6_:Object = FontManager.CUSTOM_FONT_ID_REGEXP.exec(this.textFont);
         if(_loc6_)
         {
            _loc4_.themeId = ThemeConstants.UGC_THEME_ID;
         }
         else
         {
            _loc4_.themeId = ThemeManager.instance.movieTheme.id;
         }
         _loc4_.id = this.textFont;
      }
      
      public function deSerialize(param1:XML, param2:AnimeScene) : void
      {
         var _loc7_:Array = null;
         var _loc8_:Array = null;
         var _loc9_:Array = null;
         var _loc3_:BubbleThumb = new BubbleThumb();
         _loc3_.imageData = param1.bubble;
         this.scene = param2;
         var _loc4_:Array = String(param1.x).split(",");
         var _loc5_:Array = String(param1.y).split(",");
         this.move(_loc4_[0],_loc5_[0]);
         this.setReferencePoint(_loc4_[0],_loc5_[0]);
         if(param1.hasOwnProperty("@" + TextComponentManager.XML_ATTRIBUTE_NAME_COMPONENT_ROLE))
         {
            this.componentRole = String(param1.attribute(TextComponentManager.XML_ATTRIBUTE_NAME_COMPONENT_ROLE)[0]);
         }
         if(param1.hasOwnProperty("xscale"))
         {
            _loc7_ = String(param1.xscale).split(",");
            _loc8_ = String(param1.yscale).split(",");
            this.scaleX = _loc7_[0];
            this.scaleY = _loc8_[0];
         }
         if(param1.hasOwnProperty("ref"))
         {
            this.setReferencePoint(Number(param1.ref.@x),Number(param1.ref.@y));
         }
         if(param1.hasOwnProperty("rotation"))
         {
            _loc9_ = String(param1.rotation).split(",");
            this._rotation.rotation = _loc9_[0];
         }
         _loc3_.colorStyle = param1.bubble.@colorStyle.length() > 0?int(param1.bubble.@colorStyle):1;
         this.thumb = _loc3_;
         this.isLoadded = true;
         this.deserializeMotion(param1,_loc4_,_loc5_,_loc9_,_loc7_,_loc8_);
         var _loc6_:Object = FontManager.CUSTOM_FONT_ID_REGEXP.exec(this.textFont);
         if(_loc6_)
         {
            _loc3_.themeId = ThemeConstants.UGC_THEME_ID;
         }
         else
         {
            _loc3_.themeId = ThemeManager.instance.movieTheme.id;
         }
         _loc3_.id = this.textFont;
      }
      
      private function deserializeMotion(param1:XML, param2:Array, param3:Array, param4:Array, param5:Array, param6:Array) : void
      {
         var _loc7_:MotionData = null;
         var _loc8_:Vector.<Point> = null;
         var _loc9_:int = 0;
         if(param2.length > 1 && param2.length == param3.length)
         {
            _loc7_ = new MotionData();
            _loc8_ = new Vector.<Point>();
            _loc9_ = 0;
            while(_loc9_ < param2.length)
            {
               _loc8_.push(new Point(Number(param2[_loc9_]),Number(param3[_loc9_])));
               _loc9_++;
            }
            _loc7_.path = _loc8_;
            _loc7_.startRotation = this.rotation;
            if(param1.hasOwnProperty(MotionData.XML_TAG_NAME))
            {
               _loc7_.convertFromXml(param1.child(MotionData.XML_TAG_NAME)[0]);
            }
            else
            {
               _loc7_.version = "1";
            }
            this.motionData = _loc7_;
            if(this._motionShadow)
            {
               this._motionShadow.setReferencePoint(param2[param2.length - 1],param3[param3.length - 1]);
               this._motionShadow.move(param2[param2.length - 1],param3[param3.length - 1]);
               if(param4 && param4.length > 1)
               {
                  this._motionShadow.rotation = param4[param4.length - 1];
               }
               if(param5 && param5.length > 1 && param6 && param6.length > 1)
               {
                  this._motionShadow.scaleX = param5[1];
                  this._motionShadow.scaleY = param6[1];
               }
            }
         }
      }
      
      override public function set thumb(param1:Thumb) : void
      {
         super.thumb = param1;
         this.imageData = param1.imageData;
      }
      
      public function startSlideMotion() : void
      {
         var _loc1_:MotionData = null;
         var _loc2_:int = 0;
         if(!this._motionData)
         {
            _loc1_ = new MotionData();
            _loc1_.moveStartPoint(this.x,this.y);
            _loc1_.moveEndPoint(this.x,this.y);
            _loc1_.startRotation = this.rotation;
            _loc2_ = this.x > AnimeConstants.STAGE_WIDTH / 2?-100:100;
            _loc1_.endX = _loc1_.endX + _loc2_;
            this.motionData = _loc1_;
         }
      }
      
      public function set motionData(param1:MotionData) : void
      {
         var _loc2_:Point = null;
         if(param1 != this._motionData)
         {
            this.motionShadow = null;
            if(this._motionData)
            {
               this._motionData.removeEventListener(Event.CHANGE,this.onMotionChange);
               this._motionData = null;
            }
            if(param1)
            {
               this.addMotionShadow();
               this._motionData = param1.clone();
               this._motionData.addEventListener(Event.CHANGE,this.onMotionChange);
               if(this._motionShadow)
               {
                  this._motionShadow.move(this._motionData.endX,this._motionData.endY);
                  this._motionShadow.setReferencePoint(this._motionData.endX,this._motionData.endY);
                  if(this._motionData.pathOriented)
                  {
                     this._motionShadow.isRotatable = false;
                     this._motionShadow.rotation = this._motionData.endRotation;
                     _loc2_ = this._motionShadow.globalCenter;
                     this._motionShadow.setReferencePoint(_loc2_.x,_loc2_.y);
                  }
                  else
                  {
                     this._motionShadow.isRotatable = true;
                  }
               }
            }
            this.dispatchEvent(new AssetEvent(AssetEvent.MOTION_CHANGE,this));
         }
      }
      
      public function get slideEnabled() : Boolean
      {
         return true;
      }
      
      public function removeSlideMotion() : void
      {
         this.motionData = null;
      }
      
      public function get isSliding() : Boolean
      {
         return this._motionShadow != null;
      }
      
      private function onMotionChange(param1:Event) : void
      {
         var _loc2_:Point = null;
         if(this._motionData && this._motionShadow)
         {
            if(this._motionData.pathOriented)
            {
               this._motionShadow.isRotatable = false;
               this._motionShadow.rotation = this._motionData.endRotation;
               _loc2_ = this._motionShadow.globalCenter;
               this._motionShadow.setReferencePoint(_loc2_.x,_loc2_.y);
            }
            else
            {
               this._motionShadow.isRotatable = true;
            }
         }
      }
      
      private function onShadowMoved(param1:Event) : void
      {
         if(this._motionShadow && this._motionData)
         {
            this._motionData.moveEndPoint(this._motionShadow.x,this._motionShadow.y);
            this.dispatchEvent(new AssetEvent(AssetEvent.MOTION_CHANGE,this));
         }
      }
      
      private function addMotionShadow() : void
      {
         var _loc1_:BubbleAsset = null;
         if(!this.isShadow && this._motionShadow == null)
         {
            _loc1_ = this.clone() as BubbleAsset;
            _loc1_.removeSlideMotion();
            _loc1_.isShadow = true;
            _loc1_.bubble.mouseChildren = false;
            this.motionShadow = _loc1_;
         }
      }
      
      public function get isShadow() : Boolean
      {
         return this._isShadow;
      }
      
      public function set isShadow(param1:Boolean) : void
      {
         this._isShadow = param1;
      }
      
      public function set isRotatable(param1:Boolean) : void
      {
         if(this._rotation.enabled != param1)
         {
            this._rotation.enabled = param1;
            this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED,this));
         }
      }
      
      public function get isRotatable() : Boolean
      {
         return this._rotation.enabled && this.textEmbed;
      }
      
      public function get rotation() : Number
      {
         return this._rotation.rotation;
      }
      
      public function set rotation(param1:Number) : void
      {
         if(!this.textEmbed)
         {
            param1 = 0;
         }
         if(param1 != this.rotation)
         {
            this._rotation.rotation = param1;
            if(this._motionData)
            {
               this._motionData.startRotation = this.rotation;
            }
            this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_ROTATED,this));
         }
      }
      
      public function get isBlankBubble() : Boolean
      {
         return this.bubble is BlankBubble;
      }
      
      public function get horizontalPadding() : int
      {
         if(this._bubble)
         {
            return this._bubble.horizontalPadding;
         }
         return 0;
      }
      
      public function set horizontalPadding(param1:int) : void
      {
         if(this._bubble)
         {
            this._bubble.horizontalPadding = param1;
         }
      }
      
      public function get verticalPadding() : int
      {
         if(this._bubble)
         {
            return this._bubble.verticalPadding;
         }
         return 0;
      }
      
      public function set verticalPadding(param1:int) : void
      {
         if(this._bubble)
         {
            this._bubble.verticalPadding = param1;
         }
      }
      
      public function getPromptText() : String
      {
         var _loc1_:BubbleThumb = this.thumb as BubbleThumb;
         if(_loc1_ && _loc1_.promptText)
         {
            return _loc1_.promptText;
         }
         return UtilDict.translate("Double-click to input text");
      }
   }
}
