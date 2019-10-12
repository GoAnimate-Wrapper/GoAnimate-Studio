package anifire.component.widgets
{
   import anifire.event.CoreEvent;
   import anifire.event.WidgetEvent;
   import anifire.models.widget.WidgetPartModel;
   import anifire.models.widget.WidgetStyleModel;
   import anifire.util.FontManager;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Rectangle;
   import flash.globalization.NumberFormatter;
   
   public class WidgetMaker extends Sprite
   {
      
      public static const MAX_ENTRANCE_RATIO:Number = 0.2;
      
      public static const NUMBER_FORMAT_NONE:int = 0;
      
      public static const NUMBER_FORMAT_COMMA_DOT:int = 1;
      
      public static const NUMBER_FORMAT_DOT_COMMA:int = 2;
      
      public static const NUMBER_FORMAT_SPACE_COMMA:int = 3;
      
      public static const DEFAULT_TITLE_HEIGHT:Number = 30;
       
      
      protected var _fontManager:FontManager;
      
      protected var _basePartOnTop:Boolean;
      
      protected var _basePart:WidgetBasePart;
      
      protected var _minWidth:Number;
      
      protected var _minHeight:Number;
      
      protected var _dataParts:Vector.<WidgetPart>;
      
      protected var _dataRanges:Vector.<String>;
      
      protected var _numRanges:int;
      
      protected var _layoutInvalidateFlag:Boolean;
      
      protected var _dataPartCount:int;
      
      protected var _properties:Object;
      
      protected var _entranceRatio:Number;
      
      protected var _animationFactor:Number;
      
      protected var _innerPaddingLeft:Number;
      
      protected var _innerPaddingTop:Number;
      
      protected var _innerPaddingRight:Number;
      
      protected var _innerPaddingBottom:Number;
      
      protected var _labelPaddingLeft:Number;
      
      protected var _labelPaddingTop:Number;
      
      protected var _labelPaddingRight:Number;
      
      protected var _labelPaddingBottom:Number;
      
      protected var _displayDataLabel:Boolean;
      
      protected var _displayValueLabel:Boolean;
      
      protected var _displayPercentageLabel:Boolean;
      
      protected var _displayAxis:Boolean;
      
      protected var _displayLegend:Boolean;
      
      protected var _swapAxis:Boolean;
      
      protected var _precision:int;
      
      protected var _iconDirection:String;
      
      protected var _styleModel:WidgetStyleModel;
      
      protected var _numberFormatter:NumberFormatter;
      
      protected var _numberFormatType:int;
      
      protected var _bounds:Rectangle;
      
      protected var _contentPaddingTop:Number;
      
      protected var _contentPaddingBottom:Number;
      
      protected var _contentPaddingLeft:Number;
      
      protected var _contentPaddingRight:Number;
      
      protected var _title:String;
      
      protected var _totalValue:Number;
      
      protected var _maxValue:Number;
      
      protected var _negativeMaxValue:Number;
      
      protected var _combinedMaxValue:Number;
      
      protected var _combinedNegativeMaxValue:Number;
      
      public function WidgetMaker()
      {
         super();
         this.init();
         this.processPadding();
         this.initBasePart();
         this.loadFont();
      }
      
      public function get entranceRatio() : Number
      {
         return this._entranceRatio;
      }
      
      public function get animationFactor() : Number
      {
         return this._animationFactor;
      }
      
      public function get innerPaddingLeft() : Number
      {
         return this._innerPaddingLeft;
      }
      
      public function get innerPaddingTop() : Number
      {
         return this._innerPaddingTop;
      }
      
      public function get innerPaddingRight() : Number
      {
         return this._innerPaddingRight;
      }
      
      public function get innerPaddingBottom() : Number
      {
         return this._innerPaddingBottom;
      }
      
      public function get labelPaddingBottom() : Number
      {
         return this._labelPaddingBottom;
      }
      
      public function get displayDataLabel() : Boolean
      {
         return this._displayDataLabel;
      }
      
      public function set displayDataLabel(param1:Boolean) : void
      {
         if(this._displayDataLabel != param1)
         {
            this._displayDataLabel = param1;
            this.processPadding();
            this.invalidateDataParts();
         }
      }
      
      public function get displayValueLabel() : Boolean
      {
         return this._displayValueLabel;
      }
      
      public function set displayValueLabel(param1:Boolean) : void
      {
         if(this._displayValueLabel != param1)
         {
            this._displayValueLabel = param1;
            this.processPadding();
            this.invalidateDataParts();
         }
      }
      
      public function get displayPercentageLabel() : Boolean
      {
         return this._displayPercentageLabel;
      }
      
      public function set displayPercentageLabel(param1:Boolean) : void
      {
         if(this._displayPercentageLabel != param1)
         {
            this._displayPercentageLabel = param1;
            this.invalidateDataParts();
         }
      }
      
      public function get displayAxis() : Boolean
      {
         return this._displayAxis;
      }
      
      public function set displayAxis(param1:Boolean) : void
      {
         if(this._displayAxis != param1)
         {
            this._displayAxis = param1;
            if(this._basePart)
            {
               this._basePart.invalidate();
            }
         }
      }
      
      public function get displayLegend() : Boolean
      {
         return this._displayLegend;
      }
      
      public function set displayLegend(param1:Boolean) : void
      {
         if(this._displayLegend != param1)
         {
            this._displayLegend = param1;
            this._layoutInvalidateFlag = true;
            if(this._basePart)
            {
               this._basePart.invalidate();
            }
         }
      }
      
      public function get swapAxis() : Boolean
      {
         return this._swapAxis;
      }
      
      public function set swapAxis(param1:Boolean) : void
      {
         if(this._swapAxis != param1)
         {
            this._swapAxis = param1;
         }
      }
      
      public function get precision() : int
      {
         return this._precision;
      }
      
      public function get iconDirection() : String
      {
         return this._iconDirection;
      }
      
      public function set iconDirection(param1:String) : void
      {
         if(this._iconDirection != param1)
         {
            this._iconDirection = param1;
         }
      }
      
      public function get styleModel() : WidgetStyleModel
      {
         return this._styleModel;
      }
      
      public function set styleModel(param1:WidgetStyleModel) : void
      {
         if(this._styleModel != param1)
         {
            if(this._styleModel)
            {
               this._styleModel.removeEventListener(WidgetEvent.WIDGET_STYLE_CHANGE,this.onStyleChange);
               this._styleModel.removeEventListener(WidgetEvent.WIDGET_PROPERTY_CHANGE,this.onStylePropertyChange);
            }
            this._styleModel = param1;
            if(this._styleModel)
            {
               this._styleModel.addEventListener(WidgetEvent.WIDGET_STYLE_CHANGE,this.onStyleChange);
               this._styleModel.addEventListener(WidgetEvent.WIDGET_PROPERTY_CHANGE,this.onStylePropertyChange);
               this.updateStyleProperties();
               this._layoutInvalidateFlag = true;
            }
         }
      }
      
      public function get numberFormatType() : int
      {
         return this._numberFormatType;
      }
      
      public function set numberFormatType(param1:int) : void
      {
         if(this._numberFormatType != param1)
         {
            this._numberFormatType = param1;
            this.updateFormatter();
            this.invalidateDataParts();
         }
      }
      
      protected function loadFont() : void
      {
         if(!this._fontManager.isCffFontLoaded(this._styleModel.font))
         {
            this._layoutInvalidateFlag = true;
            this.setLoadingState(true);
            this.invalidateDataParts();
            this._fontManager.addEventListener(CoreEvent.CFF_FONT_LOADED,this.onFontLoaded);
            this._fontManager.addEventListener(CoreEvent.CFF_FONT_ERROR,this.onFontError);
            this._fontManager.loadCffFont(this._styleModel.font);
         }
         else
         {
            this.setLoadingState(false);
         }
      }
      
      protected function onFontLoaded(param1:CoreEvent) : void
      {
         if(param1.getData() == this._styleModel.font)
         {
            this.removeFontEventListeners();
            this.setLoadingState(false);
            this.updateStyle();
            this.validate();
         }
      }
      
      protected function onFontError(param1:CoreEvent) : void
      {
         if(param1.getData() == this._styleModel.font)
         {
            this.removeFontEventListeners();
         }
      }
      
      protected function removeFontEventListeners() : void
      {
         this._fontManager.removeEventListener(CoreEvent.CFF_FONT_LOADED,this.onFontLoaded);
         this._fontManager.removeEventListener(CoreEvent.CFF_FONT_ERROR,this.onFontError);
      }
      
      protected function setLoadingState(param1:Boolean) : void
      {
         alpha = !!param1?Number(0.4):Number(1);
         if(this._basePart)
         {
            this._basePart.loading = param1;
         }
         var _loc2_:int = 0;
         while(_loc2_ < this._dataPartCount)
         {
            this._dataParts[_loc2_].loading = param1;
            _loc2_++;
         }
      }
      
      public function get bounds() : Rectangle
      {
         return this._bounds;
      }
      
      public function set bounds(param1:Rectangle) : void
      {
         this._bounds = param1;
         if(this._bounds.width < this._minWidth)
         {
            this._bounds.width = this._minWidth;
         }
         if(this._bounds.height < this._minHeight)
         {
            this._bounds.height = this._minHeight;
         }
         this._layoutInvalidateFlag = true;
      }
      
      public function get contentPaddingTop() : Number
      {
         return this._contentPaddingTop;
      }
      
      public function set contentPaddingTop(param1:Number) : void
      {
         this._contentPaddingTop = param1;
         this._layoutInvalidateFlag = true;
      }
      
      public function get contentPaddingBottom() : Number
      {
         return this._contentPaddingBottom;
      }
      
      public function set contentPaddingBottom(param1:Number) : void
      {
         this._contentPaddingBottom = param1;
         this._layoutInvalidateFlag = true;
      }
      
      public function get contentPaddingLeft() : Number
      {
         return this._contentPaddingLeft;
      }
      
      public function set contentPaddingLeft(param1:Number) : void
      {
         this._contentPaddingLeft = param1;
         this._layoutInvalidateFlag = true;
      }
      
      public function get contentPaddingRight() : Number
      {
         return this._contentPaddingRight;
      }
      
      public function set contentPaddingRight(param1:Number) : void
      {
         this._contentPaddingRight = param1;
         this._layoutInvalidateFlag = true;
      }
      
      protected function processPadding() : void
      {
         var _loc1_:Boolean = this.displayLabelPadding;
         this.contentPaddingBottom = this._innerPaddingBottom + (!!_loc1_?this._labelPaddingBottom:0);
         this.contentPaddingLeft = this._innerPaddingLeft + (!!_loc1_?this._labelPaddingLeft:0);
         this.contentPaddingRight = this._innerPaddingRight + (!!_loc1_?this._labelPaddingRight:0);
         this.contentPaddingTop = this._innerPaddingTop + (!!_loc1_?this._labelPaddingTop:0) + (!!this.hasProperTitle?DEFAULT_TITLE_HEIGHT:0);
      }
      
      protected function get displayLabelPadding() : Boolean
      {
         return this._displayDataLabel && this.combinedNegativeMaxValue >= 0;
      }
      
      public function get title() : String
      {
         return this.title;
      }
      
      public function set title(param1:String) : void
      {
         this._title = param1;
         if(this._basePart)
         {
            this._basePart.text = this._title;
         }
         this.processPadding();
      }
      
      protected function get hasProperTitle() : Boolean
      {
         return this._title != null && this._title.length > 0;
      }
      
      public function get totalValue() : Number
      {
         return this._totalValue;
      }
      
      public function get maxValue() : Number
      {
         return this._maxValue;
      }
      
      public function get negativeMaxValue() : Number
      {
         return this._negativeMaxValue;
      }
      
      public function get combinedMaxValue() : Number
      {
         return this._combinedMaxValue;
      }
      
      public function get combinedNegativeMaxValue() : Number
      {
         return this._combinedNegativeMaxValue;
      }
      
      protected function init() : void
      {
         this._fontManager = FontManager.getFontManager();
         this._dataParts = new Vector.<WidgetPart>();
         this._animationFactor = 1;
         this._totalValue = 0;
         this._maxValue = 0;
         this._negativeMaxValue = 0;
         this._minWidth = 50;
         this._minHeight = 50;
         this._innerPaddingLeft = 10;
         this._innerPaddingRight = 10;
         this._innerPaddingTop = 20;
         this._innerPaddingBottom = 20;
         this._labelPaddingLeft = 0;
         this._labelPaddingRight = 0;
         this._labelPaddingTop = 0;
         this._labelPaddingBottom = 30;
         this._displayDataLabel = true;
         this._displayValueLabel = true;
         this._displayPercentageLabel = true;
         this._displayAxis = true;
         this._styleModel = new WidgetStyleModel();
         this._numberFormatType = NUMBER_FORMAT_COMMA_DOT;
         this.updateFormatter();
         this.resetProperties();
         this._layoutInvalidateFlag = true;
      }
      
      protected function resetProperties() : void
      {
         this._properties = {};
      }
      
      protected function initBasePart() : void
      {
         this._basePart = this.createBasePart();
         this._basePart.widgetMaker = this;
         this.updateBasePartLayout();
         addChild(this._basePart);
      }
      
      protected function createBasePart() : WidgetBasePart
      {
         return null;
      }
      
      protected function updateBasePartLayout() : void
      {
         this._basePart.bounds = this._bounds;
         var _loc1_:Number = this.getLegendLayoutHeight();
         var _loc2_:Number = this.getLegendLayoutWidth();
         this._basePart.contentBounds = new Rectangle(this._bounds.x + this.contentPaddingLeft,this._bounds.y + this.contentPaddingTop + _loc1_,this._bounds.width - this.contentPaddingLeft - this.contentPaddingRight - _loc2_,this._bounds.height - this.contentPaddingTop - this.contentPaddingBottom - _loc1_);
         this.postProcessContentBounds();
      }
      
      protected function postProcessContentBounds() : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         if(!this._displayDataLabel)
         {
            return;
         }
         var _loc1_:Number = this.combinedMaxValue - this.combinedNegativeMaxValue;
         var _loc2_:Number = this._basePart.contentBounds.height;
         var _loc3_:Number = -this.combinedNegativeMaxValue / _loc1_;
         if(_loc3_ > 0)
         {
            _loc4_ = _loc2_ + this._labelPaddingBottom;
            _loc5_ = _loc4_ * _loc3_;
            if(_loc5_ < this._labelPaddingBottom)
            {
               _loc2_ = _loc2_ - (this._labelPaddingBottom - _loc5_);
            }
         }
         this._basePart.contentBounds.height = _loc2_;
      }
      
      public function validate() : void
      {
         if(this._layoutInvalidateFlag)
         {
            this.updateBasePartLayout();
            this.updateLayout();
            this._layoutInvalidateFlag = false;
         }
         if(this._basePart)
         {
            this._basePart.validate();
         }
         this.validateDataParts();
      }
      
      protected function invalidateDataParts() : void
      {
         var _loc1_:int = this._dataParts.length;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            this._dataParts[_loc2_].invalidate();
            _loc2_++;
         }
      }
      
      protected function validateDataParts() : void
      {
         var _loc1_:int = this._dataParts.length;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            this._dataParts[_loc2_].validate();
            _loc2_++;
         }
      }
      
      protected function updateLayout() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this._dataPartCount)
         {
            this._dataParts[_loc1_].bounds = this._basePart.contentBounds;
            _loc1_++;
         }
      }
      
      protected function updateStyleProperties() : void
      {
         var _loc1_:* = null;
         this.resetProperties();
         for(_loc1_ in this._styleModel.properties)
         {
            this.setProperty(_loc1_,this._styleModel.getProperty(_loc1_));
         }
         this.loadFont();
         this.updateStyle();
      }
      
      protected function updateStyle() : void
      {
         if(this._basePart)
         {
            this._basePart.updateStyle();
         }
         var _loc1_:int = 0;
         while(_loc1_ < this._dataPartCount)
         {
            this._dataParts[_loc1_].updateStyle();
            _loc1_++;
         }
      }
      
      public function updateModel(param1:Vector.<WidgetPartModel>) : void
      {
         var _loc2_:int = 0;
         var _loc3_:WidgetPart = null;
         var _loc7_:WidgetPartModel = null;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:int = 0;
         var _loc11_:Number = NaN;
         var _loc12_:int = 0;
         var _loc4_:int = param1.length;
         var _loc5_:int = this._dataParts.length;
         var _loc6_:WidgetPart = null;
         this._maxValue = 0;
         this._negativeMaxValue = 0;
         this._combinedMaxValue = 0;
         this._combinedNegativeMaxValue = 0;
         this._totalValue = 0;
         this._precision = 0;
         _loc2_ = 0;
         while(_loc2_ < _loc4_)
         {
            _loc7_ = param1[_loc2_];
            if(_loc2_ < this._dataParts.length)
            {
               _loc3_ = this._dataParts[_loc2_];
               _loc3_.text = _loc7_.labelText;
               _loc3_.values = _loc7_.values.concat();
               _loc3_.extraData = _loc7_.extraData;
            }
            else
            {
               _loc3_ = this.createPart(_loc7_);
               this.addPart(_loc3_);
            }
            _loc8_ = 0;
            _loc9_ = 0;
            _loc10_ = 0;
            while(_loc10_ < _loc7_.numRanges)
            {
               _loc11_ = _loc7_.getValueByRange(_loc10_);
               if(_loc11_ > this._maxValue)
               {
                  this._maxValue = _loc11_;
               }
               if(_loc11_ < this._negativeMaxValue)
               {
                  this._negativeMaxValue = _loc11_;
               }
               if(_loc11_ >= 0)
               {
                  _loc8_ = _loc8_ + _loc11_;
               }
               else
               {
                  _loc9_ = _loc9_ + _loc11_;
               }
               _loc12_ = this.calculatePrecision(_loc7_.getRawValueByRange(_loc10_));
               if(_loc12_ > this._precision)
               {
                  this._precision = _loc12_;
               }
               _loc10_++;
            }
            if(_loc8_ > this._combinedMaxValue)
            {
               this._combinedMaxValue = _loc8_;
            }
            if(_loc9_ < this._combinedNegativeMaxValue)
            {
               this._combinedNegativeMaxValue = _loc9_;
            }
            _loc3_.cumulatedValue = this._totalValue;
            _loc3_.prevPart = _loc6_;
            this._totalValue = this._totalValue + (_loc7_.value > 0?_loc7_.value:0);
            if(_loc6_)
            {
               _loc6_.nextPart = _loc3_;
            }
            _loc6_ = _loc3_;
            _loc2_++;
         }
         this.updateFormatter();
         _loc2_ = this._dataParts.length - 1;
         while(_loc2_ >= _loc4_)
         {
            this.removePartByIndex(_loc2_);
            _loc2_--;
         }
         this.postProcessValues();
         this.processPadding();
         this._layoutInvalidateFlag = true;
      }
      
      public function updateRanges(param1:Vector.<String>) : void
      {
         this._dataRanges = param1;
         if(this._dataRanges)
         {
            this._numRanges = this._dataRanges.length;
         }
         else
         {
            this._numRanges = 0;
         }
         this._layoutInvalidateFlag = true;
         if(this._basePart)
         {
            this._basePart.updateLegend(this._dataRanges);
         }
      }
      
      protected function calculatePrecision(param1:String) : int
      {
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         if(param1)
         {
            _loc3_ = param1.indexOf(".");
            if(_loc3_ > -1)
            {
               _loc2_ = param1.length - _loc3_ - 1;
            }
         }
         if(_loc2_ > 20)
         {
            _loc2_ = 20;
         }
         return _loc2_;
      }
      
      protected function postProcessValues() : void
      {
         this._entranceRatio = Math.min(MAX_ENTRANCE_RATIO,1 / (1 + this._dataPartCount));
      }
      
      protected function createPart(param1:WidgetPartModel) : WidgetPart
      {
         return null;
      }
      
      public function addPart(param1:WidgetPart) : void
      {
         param1.itemIndex = this._dataPartCount;
         param1.widgetMaker = this;
         this._dataParts.push(param1);
         if(this._basePartOnTop)
         {
            addChildAt(param1,this._dataPartCount);
         }
         else
         {
            addChild(param1);
         }
         this._dataPartCount = this._dataParts.length;
      }
      
      public function removePartByIndex(param1:int) : void
      {
         var _loc2_:WidgetPart = null;
         if(param1 < this._dataParts.length)
         {
            _loc2_ = this._dataParts.splice(param1,1)[0];
            _loc2_.widgetMaker = null;
            removeChild(_loc2_);
         }
         this._dataPartCount = this._dataParts.length;
      }
      
      protected function onStyleChange(param1:Event) : void
      {
         this.updateStyle();
      }
      
      protected function onStylePropertyChange(param1:WidgetEvent) : void
      {
         this.updateStyleProperties();
      }
      
      public function animate(param1:Number) : void
      {
         if(param1 >= 0 && param1 <= 1)
         {
            this._animationFactor = param1;
         }
         this.updateAnimation();
         if(this._basePart)
         {
            this._basePart.validate();
         }
         this.validateDataParts();
      }
      
      protected function updateAnimation() : void
      {
      }
      
      public function getProperty(param1:String) : *
      {
         return this._properties[param1];
      }
      
      public function setProperty(param1:String, param2:*) : void
      {
         this._properties[param1] = param2;
      }
      
      public function getPropertyList() : Array
      {
         return [];
      }
      
      public function easeOutQuad(param1:Number) : Number
      {
         return param1 * (2 - param1);
      }
      
      public function easeOutBack(param1:Number, param2:Number = 1.70158) : Number
      {
         param1--;
         return param1 * param1 * ((param2 + 1) * param1 + param2) + 1;
      }
      
      protected function updateFormatter() : void
      {
         if(!this._numberFormatter)
         {
            this._numberFormatter = new NumberFormatter("en_US");
         }
         this._numberFormatter.fractionalDigits = this._precision;
         this._numberFormatter.leadingZero = true;
         this._numberFormatter.trailingZeros = true;
         switch(this._numberFormatType)
         {
            case NUMBER_FORMAT_NONE:
            default:
               this._numberFormatter.useGrouping = false;
               this._numberFormatter.decimalSeparator = ".";
               break;
            case NUMBER_FORMAT_COMMA_DOT:
               this._numberFormatter.useGrouping = true;
               this._numberFormatter.groupingSeparator = ",";
               this._numberFormatter.decimalSeparator = ".";
               break;
            case NUMBER_FORMAT_DOT_COMMA:
               this._numberFormatter.useGrouping = true;
               this._numberFormatter.groupingSeparator = ".";
               this._numberFormatter.decimalSeparator = ",";
               break;
            case NUMBER_FORMAT_SPACE_COMMA:
               this._numberFormatter.useGrouping = true;
               this._numberFormatter.groupingSeparator = " ";
               this._numberFormatter.decimalSeparator = ",";
         }
      }
      
      public function formatValue(param1:Number) : String
      {
         var _loc2_:String = this._numberFormatter.formatNumber(param1);
         return _loc2_;
      }
      
      public function getLegendLayoutWidth() : Number
      {
         return 0;
      }
      
      public function getLegendLayoutHeight() : Number
      {
         return 0;
      }
   }
}
