package anifire.bubble
{
   import anifire.event.AddedToStage;
   import anifire.event.CoreEvent;
   import anifire.managers.FontVariantManager;
   import anifire.util.FontManager;
   import anifire.util.Util;
   import anifire.util.UtilColor;
   import anifire.util.UtilPlain;
   import anifire.util.UtilString;
   import anifire.util.UtilXmlInfo;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.filters.DropShadowFilter;
   import flash.filters.GlowFilter;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.Font;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import mx.utils.StringUtil;
   
   public class Bubble extends Sprite
   {
       
      
      private const MAX_FONTSIZE:Number = 127;
      
      private const MIN_FONTSIZE:Number = 1;
      
      private var _visible:Boolean = true;
      
      private var _useDeviceFont:Boolean = false;
      
      private var _x:Number = 0;
      
      private var _y:Number = 0;
      
      private var _textWidth:Number = 200;
      
      private var _textHeight:Number = 100;
      
      private var _type:String = "";
      
      private var _editEnable:Boolean = false;
      
      private var _tailEnable:Boolean = true;
      
      private var _outlineEnable:Boolean = true;
      
      private var _lineSize:Number = 0;
      
      private var _lineRgb:Number = 0;
      
      private var _lineAlpha:Number = 1.0;
      
      private var _fillRgb:Number = 16777215;
      
      private var _fillAlpha:Number = 1;
      
      private var _tailx:Number = 200;
      
      private var _taily:Number = 150;
      
      private var _text:String = "";
      
      private var _backupText:String = "";
      
      private var _promptText:String = "";
      
      private var _textSize:Number = 12;
      
      private var _textRgb:Number = 0;
      
      private var _textFont:String = "";
      
      private var _textAlign:String = "center";
      
      private var _textBold:Boolean = false;
      
      private var _textItalic:Boolean = false;
      
      private var _textEmbed:Boolean = true;
      
      private var _textURL:String = "";
      
      private var _islinkNewWin:Boolean;
      
      private var _textAlpha:Number = 100;
      
      private var _gradientType:String = null;
      
      private var _gradientColors:Array = null;
      
      private var _gradientAlphas:Array = null;
      
      private var _gradientRatios:Array = null;
      
      private var _gradientMatrix_x:Number = 0;
      
      private var _gradientMatrix_y:Number = 0;
      
      private var _gradientMatrix_w:Number = 0;
      
      private var _gradientMatrix_h:Number = 0;
      
      private var _gradientMatrix_r:Number = 0;
      
      private var _gradientX:Number = 0;
      
      private var _gradientY:Number = 0;
      
      private var _gradientWidth:Number = 0;
      
      private var _gradientHeight:Number = 0;
      
      private var _gradientRotation:Number = 0;
      
      private var _prevText:String = "";
      
      private var _autoResize:Boolean = true;
      
      private var _autoTextResize:Boolean = true;
      
      private var _stopAfterRedraw:Boolean = false;
      
      private var _mver:Number;
      
      private var _shadow:Boolean = true;
      
      protected var boundHeight:Number = 100;
      
      protected var boundWidth:Number = 100;
      
      protected var content:Sprite = null;
      
      protected var body:Sprite = null;
      
      protected var tail:Sprite = null;
      
      protected var label:TextField = null;
      
      private var effectIntervalInt:Number;
      
      private var addedToStage:AddedToStage;
      
      private var _colorStyle:Number;
      
      private var _mask:DisplayObject;
      
      private var _fontRef:Font;
      
      private var _textContent:String;
      
      private var _horizontalPadding:Number = 0;
      
      private var _verticalPadding:Number = 0;
      
      private var _paddingEnabled:Boolean;
      
      private var _minLength:int = 20;
      
      public function Bubble()
      {
         super();
         this.content = new Sprite();
         this.content.name = "content";
         addChild(this.content);
         try
         {
            addEventListener(Event.ADDED_TO_STAGE,this.addedToStageHandler);
            return;
         }
         catch(e:Error)
         {
            addedToStage = new AddedToStage(this);
            addedToStage.addEventListener(CoreEvent.ADDED_TO_STAGE_BY_TIMER,addedToStageHandler);
            return;
         }
      }
      
      public function get paddingEnabled() : Boolean
      {
         return this._paddingEnabled;
      }
      
      public function set paddingEnabled(param1:Boolean) : void
      {
         this._paddingEnabled = param1;
      }
      
      public function get textHeight() : Number
      {
         return this._textHeight;
      }
      
      public function set textHeight(param1:Number) : void
      {
         this._textHeight = param1;
      }
      
      public function get textWidth() : Number
      {
         return this._textWidth;
      }
      
      public function set textWidth(param1:Number) : void
      {
         this._textWidth = param1;
      }
      
      public function get verticalPadding() : int
      {
         return this._verticalPadding;
      }
      
      public function set verticalPadding(param1:int) : void
      {
         this._verticalPadding = param1;
         this.redraw();
         dispatchEvent(new BubbleEvent(BubbleEvent.BUBBLE_SIZE_CHANGED));
      }
      
      public function get horizontalPadding() : int
      {
         return this._horizontalPadding;
      }
      
      public function set horizontalPadding(param1:int) : void
      {
         this._horizontalPadding = param1;
         this.redraw();
         dispatchEvent(new BubbleEvent(BubbleEvent.BUBBLE_SIZE_CHANGED));
      }
      
      public function get islinkNewWin() : Boolean
      {
         return this._islinkNewWin;
      }
      
      public function set islinkNewWin(param1:Boolean) : void
      {
         this._islinkNewWin = param1;
      }
      
      private function onTextDoubleClick(param1:MouseEvent) : void
      {
         this.showEditMode();
      }
      
      public function get shadow() : Boolean
      {
         return this._shadow;
      }
      
      public function set shadow(param1:Boolean) : void
      {
         this._shadow = param1;
      }
      
      public function getLabel() : TextField
      {
         return this.label;
      }
      
      public function set labelVisible(param1:Boolean) : void
      {
         this.label.visible = param1;
      }
      
      public function isMouseOnLabel() : Boolean
      {
         if(this.label.mouseX > 0 && this.label.mouseX < this.label.width && this.label.mouseY > 0 && this.label.mouseY < this.label.height)
         {
            return true;
         }
         return false;
      }
      
      override public function get x() : Number
      {
         return this._x - this.horizontalPadding / 2;
      }
      
      override public function get y() : Number
      {
         return this._y - this.verticalPadding / 2;
      }
      
      override public function get width() : Number
      {
         return this._textWidth + this.horizontalPadding;
      }
      
      override public function get height() : Number
      {
         return this._textHeight + this.verticalPadding;
      }
      
      public function get tailx() : Number
      {
         return this._tailx;
      }
      
      public function get taily() : Number
      {
         return this._taily;
      }
      
      public function get fillRgb() : Number
      {
         return this._fillRgb;
      }
      
      public function get fillAlpha() : Number
      {
         return this._fillAlpha;
      }
      
      public function get lineRgb() : Number
      {
         return this._lineRgb;
      }
      
      public function get textSize() : Number
      {
         return this._textSize;
      }
      
      public function get textRgb() : Number
      {
         return this._textRgb;
      }
      
      public function get textFont() : String
      {
         return this._textFont;
      }
      
      public function get textAlign() : String
      {
         return this._textAlign;
      }
      
      public function get textBold() : Boolean
      {
         return this._textBold;
      }
      
      public function get textItalic() : Boolean
      {
         return this._textItalic;
      }
      
      public function get textEmbed() : Boolean
      {
         return this._textEmbed;
      }
      
      public function get textURL() : String
      {
         return this._textURL;
      }
      
      public function get text() : String
      {
         return this._text;
      }
      
      public function get backupText() : String
      {
         return this._backupText;
      }
      
      public function get editEnable() : Boolean
      {
         return this._editEnable;
      }
      
      public function set editEnable(param1:Boolean) : void
      {
         this._editEnable = param1;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get useDeviceFont() : Boolean
      {
         return this._useDeviceFont;
      }
      
      protected function get tailEnable() : Boolean
      {
         return this._tailEnable;
      }
      
      protected function get outlineEnable() : Boolean
      {
         return this._outlineEnable;
      }
      
      public function get autoResize() : Boolean
      {
         return this._autoResize;
      }
      
      override public function set x(param1:Number) : void
      {
         this._x = param1 + this.horizontalPadding / 2;
      }
      
      override public function set y(param1:Number) : void
      {
         this._y = param1 + this.verticalPadding / 2;
      }
      
      override public function set width(param1:Number) : void
      {
         this._textWidth = param1 - this.horizontalPadding;
         this.redraw();
      }
      
      override public function set height(param1:Number) : void
      {
         this._textHeight = param1 - this.verticalPadding;
         this.redraw();
      }
      
      public function set stopAfterRedraw(param1:Boolean) : void
      {
         this._stopAfterRedraw = param1;
      }
      
      public function get stopAfterRedraw() : Boolean
      {
         return this._stopAfterRedraw;
      }
      
      public function set tailx(param1:Number) : void
      {
         this._tailx = param1;
         this.drawTail();
      }
      
      public function set taily(param1:Number) : void
      {
         this._taily = param1;
         this.drawTail();
      }
      
      public function set fillRgb(param1:Number) : void
      {
         this._fillRgb = param1;
         if(this.body)
         {
            UtilColor.setRGB(this.body,param1);
         }
         if(this.tail)
         {
            UtilColor.setRGB(this.tail,param1);
         }
      }
      
      public function set fillAlpha(param1:Number) : void
      {
         this._fillAlpha = param1;
         this.drawBody();
      }
      
      public function set lineRgb(param1:Number) : void
      {
         this._lineRgb = param1;
         this.drawOutline(this.content);
      }
      
      public function get textAlpha() : Number
      {
         return this._textAlpha;
      }
      
      public function set textAlpha(param1:Number) : void
      {
         if(this._textAlpha != param1)
         {
            this._textAlpha = param1;
            this.drawLabel();
         }
      }
      
      public function get autoTextResize() : Boolean
      {
         return this._autoTextResize;
      }
      
      public function set autoTextResize(param1:Boolean) : void
      {
         if(this._autoTextResize != param1)
         {
            this._autoTextResize = param1;
            this.drawLabel();
         }
      }
      
      public function set textSize(param1:Number) : void
      {
         if(this._textSize != param1)
         {
            this._textSize = param1;
            this.drawLabel();
         }
      }
      
      public function set textRgb(param1:Number) : void
      {
         this._textRgb = param1;
         this.drawLabel();
      }
      
      public function set textFont(param1:String) : void
      {
         if(this._textFont != param1)
         {
            this.updateFontRef(param1);
         }
         this._textFont = param1;
         this.drawLabel();
         this.updateTextSize();
      }
      
      public function set textAlign(param1:String) : void
      {
         this._textAlign = param1;
         this.drawLabel();
      }
      
      public function set textBold(param1:Boolean) : void
      {
         this._textBold = param1;
         this.drawLabel();
      }
      
      public function set textItalic(param1:Boolean) : void
      {
         this._textItalic = param1;
         this.drawLabel();
      }
      
      public function set textEmbed(param1:Boolean) : void
      {
         this._textEmbed = param1;
         this.drawLabel();
      }
      
      public function set text(param1:String) : void
      {
         this._text = param1;
         this.label.text = param1;
         this.updateTextSize();
      }
      
      public function set backupText(param1:String) : void
      {
         this._backupText = param1;
      }
      
      public function set promptText(param1:String) : void
      {
         this._promptText = param1;
      }
      
      public function set textURL(param1:String) : void
      {
         this._textURL = param1;
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
      }
      
      public function set scale(param1:Number) : void
      {
         this.width = this.width * param1;
         this.height = this.height * param1;
         this._tailx = (this._tailx + this._x) * param1;
         this._taily = (this._taily + this._y) * param1;
         this.redraw();
      }
      
      public function set useDeviceFont(param1:Boolean) : void
      {
         this._useDeviceFont = param1;
         this.drawLabel();
      }
      
      protected function set tailEnable(param1:Boolean) : void
      {
         this._tailEnable = param1;
      }
      
      protected function set outlineEnable(param1:Boolean) : void
      {
         this._outlineEnable = param1;
      }
      
      public function set autoResize(param1:Boolean) : void
      {
         this._autoResize = param1;
      }
      
      public function get mver() : Number
      {
         return this._mver;
      }
      
      public function getSize() : Rectangle
      {
         var _loc1_:Rectangle = new Rectangle();
         _loc1_.x = Math.min(this._x,this._tailx);
         _loc1_.y = Math.min(this._y,this._taily);
         _loc1_.width = Math.max(this._x + this.width,this._tailx) - _loc1_.x;
         _loc1_.height = Math.max(this._y + this.height,this._taily) - _loc1_.y;
         return _loc1_;
      }
      
      public function isTailEnable() : Boolean
      {
         return this._tailEnable;
      }
      
      public function getLabelType() : String
      {
         return this.label.type;
      }
      
      public function get bubbleObject() : Object
      {
         return {
            "font":this._textFont,
            "size":this._textSize,
            "color":this._textRgb,
            "align":this._textAlign,
            "bold":this._textBold,
            "italic":this._textItalic,
            "alpha":this._textAlpha,
            "fillRgb":this._fillRgb,
            "shadow":this._shadow,
            "embed":this._textEmbed,
            "bubble":this,
            "url":this._textURL,
            "newWin":this._islinkNewWin,
            "autoTextResize":this._autoTextResize,
            "horizontalPadding":this._horizontalPadding,
            "verticalPadding":this._verticalPadding
         };
      }
      
      public function set bubbleText(param1:String) : void
      {
         this.label.text = this._text = this._backupText = param1;
         this.updateTextSize();
         dispatchEvent(new BubbleEvent(BubbleEvent.TEXT_CHANGED));
      }
      
      public function get bubbleText() : String
      {
         return this.label.text;
      }
      
      public function showEditMode() : void
      {
         if(!this._editEnable)
         {
            this._editEnable = true;
            this._prevText = this._text;
            if(this._backupText && this._backupText != "")
            {
               this.text = this._backupText;
            }
            this._textContent = this.text;
            this.label.selectable = true;
            this.label.type = TextFieldType.INPUT;
            this.label.setSelection(0,this.label.text.length);
            if(stage != null)
            {
               stage.focus = this.label;
            }
            this.label.addEventListener(FocusEvent.FOCUS_IN,this.onTextFocusInHandler);
            this.label.addEventListener(FocusEvent.FOCUS_OUT,this.onTextFocusOutHandler);
            this.label.addEventListener(TextEvent.TEXT_INPUT,this.label_textInputHandler);
            this.label.addEventListener(Event.CHANGE,this.onTextChangeHandler);
            this.label.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
            this.label.addEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
            this.onTextFocusInHandler();
         }
      }
      
      private function onMouseDown(param1:Event) : void
      {
         param1.stopImmediatePropagation();
      }
      
      private function onKeyUp(param1:Event) : void
      {
         param1.stopImmediatePropagation();
      }
      
      public function hideEditMode() : void
      {
         var _loc1_:BubbleEvent = null;
         if(this._editEnable)
         {
            this._editEnable = false;
            this.label.removeEventListener(FocusEvent.FOCUS_IN,this.onTextFocusInHandler);
            this.label.removeEventListener(FocusEvent.FOCUS_OUT,this.onTextFocusOutHandler);
            this.label.removeEventListener(TextEvent.TEXT_INPUT,this.label_textInputHandler);
            this.label.removeEventListener(Event.CHANGE,this.onTextChangeHandler);
            this.label.removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
            this.label.removeEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
            this.label.setSelection(0,0);
            this.label.selectable = false;
            this.label.type = TextFieldType.DYNAMIC;
            this.text = this.backupText = UtilString.trimEndingWhitespacePerLine(this.text);
            if(StringUtil.trim(this.text) == "")
            {
               this.bubbleText = this._promptText;
            }
            if(this._textEmbed && !this.checkCharacterSupport(this._textContent))
            {
               _loc1_ = new BubbleEvent(BubbleEvent.TEXT_INPUT_NOT_SUPPORTED);
               _loc1_.textInput = this._textContent;
               dispatchEvent(_loc1_);
            }
            if(this._prevText != this.label.text)
            {
               dispatchEvent(new BubbleEvent(BubbleEvent.TEXT_CHANGED));
            }
         }
      }
      
      protected function returnTail() : Sprite
      {
         var _loc1_:Sprite = new Sprite();
         _loc1_.name = "tail";
         var _loc2_:Number = this.x + this.width / 2;
         var _loc3_:Number = this.y + this.height / 2;
         var _loc4_:Number = Math.min(this.height,this.width);
         var _loc5_:Number = _loc4_ / 4;
         var _loc6_:Point = new Point(this._tailx,this._taily);
         var _loc7_:Circle = new Circle(_loc2_,_loc3_,_loc5_);
         var _loc8_:Object = GMath.getRegPoints(_loc7_,_loc6_);
         _loc1_.graphics.beginFill(this.fillRgb,1);
         _loc1_.graphics.moveTo(_loc8_["p1"]["x"],_loc8_["p1"]["y"]);
         _loc1_.graphics.lineTo(this._tailx,this._taily);
         _loc1_.graphics.lineTo(_loc8_["p2"]["x"],_loc8_["p2"]["y"]);
         _loc1_.graphics.endFill();
         return _loc1_;
      }
      
      protected function returnLabel(param1:String = null, param2:Number = 0, param3:Number = 0) : TextField
      {
         var _loc5_:TextFormat = null;
         var _loc4_:TextField = this.createTextField(0,0,this._textWidth,this._textHeight,this._useDeviceFont);
         _loc4_.name = "label";
         if(param2 != 0 || param3 != 0)
         {
            _loc5_ = new TextFormat();
            _loc5_.leftMargin = param2;
            _loc5_.rightMargin = param3;
            _loc4_.setTextFormat(_loc5_);
         }
         _loc4_.type = TextFieldType.INPUT;
         _loc4_.selectable = this._editEnable;
         _loc4_.text = this._prevText = !param1?this._text:param1;
         _loc4_.autoSize = TextFieldAutoSize.CENTER;
         if(this._editEnable)
         {
            _loc4_.addEventListener(TextEvent.TEXT_INPUT,this.label_textInputHandler);
            _loc4_.addEventListener(Event.CHANGE,this.onTextChangeHandler);
            _loc4_.addEventListener(FocusEvent.FOCUS_IN,this.onTextFocusInHandler);
            _loc4_.addEventListener(FocusEvent.FOCUS_OUT,this.onTextFocusOutHandler);
         }
         else
         {
            _loc4_.removeEventListener(TextEvent.TEXT_INPUT,this.label_textInputHandler);
            _loc4_.removeEventListener(Event.CHANGE,this.onTextChangeHandler);
            _loc4_.removeEventListener(FocusEvent.FOCUS_IN,this.onTextFocusInHandler);
            _loc4_.removeEventListener(FocusEvent.FOCUS_OUT,this.onTextFocusOutHandler);
         }
         _loc4_.doubleClickEnabled = true;
         _loc4_.addEventListener(MouseEvent.DOUBLE_CLICK,this.onTextDoubleClick);
         return _loc4_;
      }
      
      public function checkCharacterSupport(param1:String) : Boolean
      {
         if(param1 == "")
         {
            param1 = this._text;
         }
         param1 = param1.replace(/\s/g,"");
         if(!this._fontRef)
         {
            this.updateFontRef(this._textFont);
         }
         return this._fontRef && this._fontRef.hasGlyphs(param1);
      }
      
      private function createTextField(param1:Number, param2:Number, param3:Number, param4:Number, param5:Boolean = false, param6:TextFormat = null) : TextField
      {
         var _loc8_:TextFormat = null;
         var _loc7_:TextField = new TextField();
         _loc7_.x = param1;
         _loc7_.y = param2;
         _loc7_.width = param3;
         _loc7_.height = param4;
         _loc7_.background = false;
         _loc7_.backgroundColor = 15658734;
         _loc7_.border = false;
         _loc7_.multiline = true;
         _loc7_.wordWrap = true;
         _loc7_.embedFonts = this.textEmbed;
         _loc7_.antiAliasType = "animation";
         _loc7_.alpha = this._textAlpha / 100;
         if(param6 == null)
         {
            _loc8_ = new TextFormat();
            _loc8_.font = this._textFont;
            _loc8_.color = this._textRgb;
            _loc8_.size = this._textSize;
            _loc8_.align = this._textAlign;
            _loc8_.bold = this._textBold;
            _loc7_.defaultTextFormat = _loc8_;
         }
         else
         {
            _loc7_.defaultTextFormat = param6;
         }
         return _loc7_;
      }
      
      public function setSize(param1:Number, param2:Number) : void
      {
         this.width = param1;
         this.height = param2;
         this.redraw();
      }
      
      public function setTail(param1:Number, param2:Number) : void
      {
         this._tailx = param1;
         this._taily = param2;
         this.redraw();
      }
      
      public function setTextFormat(param1:TextFormat) : void
      {
         if(param1.font != null)
         {
            this.textFont = param1.font;
         }
         if(param1.color != null)
         {
            this._textRgb = param1.color as Number;
         }
         if(param1.size != null)
         {
            this._textSize = param1.size as Number;
         }
         if(param1.align != null)
         {
            this._textAlign = param1.align;
         }
         if(param1.bold != null)
         {
            this._textBold = param1.bold;
         }
         if(param1.italic != null)
         {
            this._textItalic = param1.italic;
         }
         this.drawLabel();
      }
      
      public function serializeJson() : Object
      {
         var _loc1_:Object = {
            "x":Util.roundNum(this._x),
            "y":Util.roundNum(this._y),
            "w":Util.roundNum(this.width),
            "h":Util.roundNum(this.height),
            "type":this._type,
            "text":this._text,
            "font":this.textFont,
            "size":this._textSize,
            "autoTextResize":this._autoTextResize,
            "color":this._textRgb,
            "alpha":this._textAlpha,
            "bgColor":this._fillRgb,
            "bgAlpha":this._fillAlpha,
            "lineColor":this._lineRgb,
            "align":this._textAlign,
            "isBold":this._textBold,
            "isItalic":this._textItalic,
            "hasShadow":this._shadow,
            "hasTail":this._tailEnable,
            "tailx":this._tailx,
            "taily":this._taily,
            "colorStyle":this._colorStyle,
            "padding":{
               "horizontal":this._horizontalPadding,
               "vertical":this._verticalPadding
            }
         };
         return _loc1_;
      }
      
      public function serialize() : XML
      {
         var _loc1_:XML = null;
         var _loc2_:String = this._text;
         var _loc3_:String = this._textFont;
         if(this._text != this._backupText)
         {
            _loc1_ = <bubble x="{Util.roundNum(this._x)}" y="{Util.roundNum(this._y)}" w="{Util.roundNum(this.width)}" h="{Util.roundNum(this.height)}" rotate='0' type="{this._type}" hasTail="{!!this._tailEnable?"1":"0"}" colorStyle="{this._colorStyle}" autoTextResize="{this._autoTextResize}">
                                                <body rgb="{this._fillRgb}" shadow="{!!this._shadow?"1":"0"}" bgAlpha="{this._fillAlpha}" linergb="{this._lineRgb}" tailx="{Util.roundNum(this._tailx)}" taily="{Util.roundNum(this._taily)}" paddingHorizontal="{this._horizontalPadding}" paddingVertical="{this._verticalPadding}"/>
                                                <text rgb="{this._textRgb}" alpha="{this._textAlpha}" font="{_loc3_}" size="{this._textSize}" align="{this._textAlign}" bold="{this._textBold}" italic="{this._textItalic}" embed="{this._textEmbed}" badword='1'>
                                                    {UtilXmlInfo.cdataXML(this._text)}
                                                </text>
                                                <backupText>
                                                    {UtilXmlInfo.cdataXML(this._backupText)}
                                                </backupText>
                                                <url target="{!!this.islinkNewWin?"blank":"top"}">
                                                    {UtilXmlInfo.cdataXML(this._textURL)}
                                                </url>
                                             </bubble>;
         }
         else
         {
            _loc1_ = <bubble x="{Util.roundNum(this._x)}" y="{Util.roundNum(this._y)}" w="{Util.roundNum(this.width)}" h="{Util.roundNum(this.height)}" rotate='0' type="{this._type}" hasTail="{!!this._tailEnable?"1":"0"}" colorStyle="{this._colorStyle}" autoTextResize="{this._autoTextResize}">
                                                <body rgb="{this._fillRgb}" shadow="{!!this._shadow?"1":"0"}" bgAlpha="{this._fillAlpha}" linergb="{this._lineRgb}" tailx="{Util.roundNum(this._tailx)}" taily="{Util.roundNum(this._taily)}" paddingHorizontal="{this._horizontalPadding}" paddingVertical="{this._verticalPadding}"/>
                                                <text rgb="{this._textRgb}" alpha="{this._textAlpha}" font="{_loc3_}" size="{this._textSize}" align="{this._textAlign}" bold="{this._textBold}" italic="{this._textItalic}" embed="{this._textEmbed}">
                                                    {UtilXmlInfo.cdataXML(this._text)}
                                                </text>
                                                <url target="{!!this.islinkNewWin?"blank":"top"}">
                                                    {UtilXmlInfo.cdataXML(this._textURL)}
                                                </url>
                                             </bubble>;
         }
         return _loc1_;
      }
      
      public function deSerializeJsonObj(param1:Object, param2:Number = -1) : void
      {
         if(!param1)
         {
            return;
         }
         this._type = param1.type;
         this._x = param1.x;
         this._y = param1.y;
         this._lineRgb = param1.lineColor;
         this._fillRgb = param1.bgColor;
         this._fillAlpha = param1.bgAlpha;
         this._tailEnable = param1.hasTail;
         this._tailx = param1.tailx;
         this._taily = param1.taily;
         this._horizontalPadding = param1.padding.horizontal;
         this._verticalPadding = param1.padding.vertical;
         this.width = param1.w;
         this.height = param1.h;
         this._textRgb = param1.color;
         this._textAlpha = param1.alpha;
         this.textFont = param1.font;
         this._textSize = param1.size;
         this._textAlign = param1.align;
         this._textBold = param1.isBold;
         this._textItalic = param1.isItalic;
         this._shadow = param1.hasShadow;
         this._autoTextResize = param1.autoTextResize;
         this._text = param1.text;
         this._backupText = param1.text;
         if(param2 != -1)
         {
            this._mver = param2;
         }
         this.redraw();
      }
      
      public function deSerialize(param1:XML, param2:Number = -1) : void
      {
         this._x = param1.@x;
         this._y = param1.@y;
         this._fillRgb = param1.body.@rgb;
         if(XML(param1.body).hasOwnProperty("@bgAlpha"))
         {
            this._fillAlpha = Number(param1.body.@bgAlpha);
         }
         this._lineRgb = param1.body.@linergb;
         this._tailx = param1.body.@tailx;
         this._taily = param1.body.@taily;
         this._horizontalPadding = param1.body.@paddingHorizontal;
         this._verticalPadding = param1.body.@paddingVertical;
         this.width = param1.@w;
         this.height = param1.@h;
         this._textRgb = param1.text.@rgb;
         this.textFont = param1.text.@font;
         this._textSize = Math.max(1,Number(param1.text.@size));
         this._textAlign = param1.text.@align;
         this._textBold = param1.text.@bold == "true";
         this._textItalic = param1.text.@italic == "true";
         this._textItalic = false;
         this._textEmbed = param1.text.@embed != "false";
         if(XML(param1.text).hasOwnProperty("@alpha"))
         {
            this._textAlpha = Number(param1.text.@alpha);
         }
         if(this._textFont == "Arial")
         {
            this._textEmbed = false;
         }
         this._shadow = param1.body.@shadow != "0";
         this._colorStyle = param1.@colorStyle.length() > 0?Number(param1.@colorStyle):Number(1);
         if(param1.hasOwnProperty("@autoTextResize"))
         {
            this._autoTextResize = String(param1.@autoTextResize) == "true";
         }
         if(param1.text.@badword == "1")
         {
            this._text = param1.text.text();
            this._backupText = param1.backupText.text();
         }
         else
         {
            this._text = this._backupText = param1.text.text();
         }
         if(this.textFont == FontManager.FONT_NAME_NOTO)
         {
            this.textFont = FontVariantManager.instance.lookupFontLanguageVariant(this.textFont,this._text);
         }
         if(param2 != -1)
         {
            this._mver = param2;
         }
         if(param1.url != null)
         {
            this._textURL = param1.url.text();
            if(param1.url.@target == "blank")
            {
               this._islinkNewWin = true;
            }
         }
         this.redraw();
      }
      
      protected function drawOutline(param1:Sprite = null) : void
      {
         var _loc2_:Array = null;
         var _loc3_:GlowFilter = null;
         var _loc4_:DropShadowFilter = null;
         if(this._outlineEnable)
         {
            param1 = param1 == null?this:param1;
            _loc2_ = [];
            _loc3_ = new GlowFilter(this.lineRgb,1,1.5,3,3,1,false,false);
            _loc2_.push(_loc3_);
            if(this.shadow)
            {
               _loc4_ = new DropShadowFilter(4,45,this.lineRgb,1,4,4,1,1,false,false,false);
               _loc2_.push(_loc4_);
            }
            param1.filters = _loc2_;
            param1.alpha = this._fillAlpha;
         }
      }
      
      protected function updateTextSize() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:TextFormat = null;
         var _loc4_:Number = NaN;
         var _loc5_:TextFormat = null;
         if(this._autoTextResize)
         {
            if(this.textHeight < 0)
            {
               this.textHeight = Math.min(this.boundHeight,this.textHeight);
            }
            _loc1_ = 1;
            if(this.label != null && this.label.text != "" && (this.label.textHeight > 1 && this.label.textWidth > 1))
            {
               if(this._autoResize)
               {
                  _loc2_ = this.MIN_FONTSIZE;
                  _loc1_ = 1;
                  _loc3_ = new TextFormat();
                  do
                  {
                     _loc2_ = _loc2_ + _loc1_;
                     _loc3_.size = this._textSize = _loc2_;
                     this.label.setTextFormat(_loc3_);
                     _loc4_ = this.myActualTextHeight(this.label);
                  }
                  while(Math.floor(_loc4_) < Math.floor(this.textHeight) && this._textSize <= this.MAX_FONTSIZE);
                  
                  do
                  {
                     _loc2_ = _loc2_ - _loc1_;
                     _loc3_.size = this._textSize = _loc2_;
                     this.label.setTextFormat(_loc3_);
                     _loc4_ = this.myActualTextHeight(this.label);
                  }
                  while(Math.floor(_loc4_) > Math.floor(this.textHeight) && this._textSize >= this.MIN_FONTSIZE);
                  
               }
               else
               {
                  _loc2_ = this._textSize;
                  _loc5_ = new TextFormat();
                  while(Math.floor(this.myActualTextHeight(this.label)) > Math.floor(this.textHeight))
                  {
                     _loc2_ = _loc2_ - _loc1_;
                     if(_loc2_ <= 1)
                     {
                        break;
                     }
                     _loc5_.size = this._textSize = _loc2_;
                     this.label.setTextFormat(_loc5_);
                  }
               }
            }
         }
         this.updateVerticalAlign();
         dispatchEvent(new BubbleEvent(BubbleEvent.TEXT_SIZE_CHANGED));
      }
      
      private function myActualTextHeight(param1:TextField) : Number
      {
         var _loc2_:Number = NaN;
         _loc2_ = this.label.textHeight + 4;
         return _loc2_;
      }
      
      protected function updateVerticalAlign() : void
      {
         var _loc1_:Number = NaN;
         if(this.label && this.label.textHeight > 1 && this.label.textWidth > 1)
         {
            _loc1_ = this.myActualTextHeight(this.label);
            this.label.y = this.y + (this.height - _loc1_) / 2;
            this.label.y = this.label.y < this.y?Number(this.y):Number(this.label.y);
         }
      }
      
      public function stopBubble() : void
      {
         UtilPlain.stopFamily(this.content);
      }
      
      public function playBubble() : void
      {
         UtilPlain.playFamily(this.content);
      }
      
      protected function drawBody() : void
      {
      }
      
      protected function drawTail() : void
      {
      }
      
      protected function drawLabel() : void
      {
         this.updateTextSize();
      }
      
      public function redraw() : void
      {
      }
      
      private function onTextChangeHandler(param1:Event) : void
      {
         this._text = this._backupText = param1.currentTarget.text;
         this.updateTextSize();
         dispatchEvent(new BubbleEvent(BubbleEvent.TEXT_TYPING));
      }
      
      private function label_textInputHandler(param1:TextEvent) : void
      {
         this._textContent = param1.text;
         if(param1.text == "\n")
         {
            this.textBoxFairy();
         }
      }
      
      private function textBoxFairy() : void
      {
         this.text = this.text + " ";
      }
      
      private function onTextFocusInHandler(param1:FocusEvent = null) : void
      {
         dispatchEvent(new BubbleEvent(BubbleEvent.TEXT_FOCUS_IN));
      }
      
      private function onTextFocusOutHandler(param1:FocusEvent) : void
      {
         this.hideEditMode();
         dispatchEvent(new BubbleEvent(BubbleEvent.TEXT_FOCUS_OUT));
      }
      
      public function addedToStageHandler(param1:Event, param2:String = null) : void
      {
         var _loc3_:TextFormat = null;
         var _loc5_:AddedToStage = null;
         var _loc6_:FontManager = null;
         this.visible = false;
         if(param1.target is AddedToStage)
         {
            _loc5_ = param1.target as AddedToStage;
            if(_loc5_ && _loc5_.hasEventListener(CoreEvent.ADDED_TO_STAGE_BY_TIMER))
            {
               _loc5_.removeEventListener(CoreEvent.ADDED_TO_STAGE_BY_TIMER,this.addedToStageHandler);
            }
         }
         _loc3_ = !!this.label.getTextFormat()?this.label.getTextFormat():this.label.defaultTextFormat;
         var _loc4_:String = _loc3_.font;
         if(_loc4_)
         {
            if(this.label.embedFonts && !FontManager.getFontManager().isFontLoaded(_loc4_))
            {
               _loc6_ = FontManager.getFontManager();
               _loc6_.loadFont(_loc4_,this.addedToStageHandler);
            }
            else
            {
               this.redraw();
               this.visible = true;
            }
         }
         this.setLabelMask(this._mask);
      }
      
      public function setLabelMask(param1:DisplayObject) : void
      {
         this._mask = param1;
         if(this.label)
         {
            this.label.mask = param1;
         }
      }
      
      protected function updateFontRef(param1:String) : void
      {
         this._fontRef = FontManager.getFontManager().getFontByName(param1);
      }
   }
}
