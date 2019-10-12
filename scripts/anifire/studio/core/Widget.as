package anifire.studio.core
{
   import anifire.component.widgets.WidgetConstants;
   import anifire.component.widgets.WidgetMaker;
   import anifire.event.WidgetEvent;
   import anifire.managers.FontVariantManager;
   import anifire.models.widget.WidgetPartModel;
   import anifire.models.widget.WidgetStyleModel;
   import anifire.studio.components.ConfirmPopUp;
   import anifire.studio.events.AssetEvent;
   import anifire.studio.interfaces.IResizable;
   import anifire.studio.managers.ThemeManager;
   import anifire.studio.models.ColorPaletteModel;
   import anifire.studio.models.WidgetProxy;
   import anifire.studio.skins.InternationalLanguagePopUpSkin;
   import anifire.util.FontManager;
   import anifire.util.Util;
   import anifire.util.UtilDict;
   import anifire.util.UtilMath;
   import flash.display.DisplayObjectContainer;
   import flash.geom.Rectangle;
   import flash.utils.setTimeout;
   import mx.core.FlexGlobals;
   import spark.events.PopUpEvent;
   
   public class Widget extends Prop implements IResizable
   {
      
      public static const DEFAULT_FRAME_DURATION:int = 24;
      
      private static const CINEMATIC_CHART_ENTRANCE_FRAMES:int = 24;
      
      private static const CINEMATIC_CHART_RANGE_TRANSITION_FRAMES:int = 36;
      
      private static const CINEMATIC_CHART_DATA_POINT_OVERLAP_FRAMES:int = 6;
      
      private static const CINEMATIC_CHART_DISPLAY_FRAMES:int = 36;
      
      private static const CINEMATIC_CHART_MINIMUM_FRAMES:int = 24;
      
      public static const CHART_PRESET_DATA_ROW_1:Number = 25;
      
      public static const CHART_PRESET_DATA_ROW_2:Number = 75;
      
      public static const CHART_PRESET_DATA_ROW_3:Number = 40;
      
      public static const CHART_PRESET_DATA_ROW_4:Number = 35;
      
      public static const CHART_PRESET_DATA_ROW_5:Number = 85;
      
      public static const CHART_PRESET_DATA_ROW_6:Number = 60;
      
      public static const XML_NODE_NAME:String = "widget";
      
      private static var _counter:int = 0;
      
      private static const DEFAULT_COUNTER_ICON_PROP_ID:String = "infographics.g4b_003.swf";
      
      private static const DEFAULT_REPEAT_ICON_PROP_ID:String = "infographics.g4b_246.swf";
      
      protected static var DEFAULT_RANGE_FOR_MULTI:Number = 3;
       
      
      protected var _chartType:String;
      
      protected var _dataRows:Vector.<WidgetPartModel>;
      
      protected var _styleModel:WidgetStyleModel;
      
      protected var _title:String = "";
      
      protected var _displayInPercentage:Boolean;
      
      protected var _displayDataLabel:Boolean;
      
      protected var _displayValueLabel:Boolean;
      
      protected var _displayAxis:Boolean;
      
      protected var _numberFormatType:int;
      
      private var _maxDay:uint = 31;
      
      private var _propId:String;
      
      private var _bounds:Rectangle;
      
      private var _minWidth:Number;
      
      private var _minHeight:Number;
      
      private var _colorPalette:ColorPaletteModel;
      
      protected var _fontLanguageVariant:String;
      
      protected var _internationalLanguageValidatingFlag:Boolean;
      
      protected var _dataRanges:Vector.<String>;
      
      protected var _displayLegend:Boolean;
      
      protected var _swapAxis:Boolean;
      
      protected var _iconDirection:String;
      
      private var _layoutStyleName:String;
      
      private var _currentDate:Date;
      
      protected var _selectedDate:int;
      
      protected var _selectedDateEnd:int;
      
      protected var _gridColumns:int;
      
      protected var _gridRows:int;
      
      protected var _autoGrid:Boolean;
      
      protected var isSwapping:Boolean;
      
      public function Widget(param1:String = "", param2:String = "")
      {
         super(param1);
         this._chartType = param2;
         this.initBounds(200,200);
         this._dataRows = new Vector.<WidgetPartModel>();
         this._styleModel = new WidgetStyleModel();
         if(param2 != "")
         {
            this.initValues();
            this.initMinDimension();
         }
      }
      
      public function get dataRanges() : Vector.<String>
      {
         return this._dataRanges;
      }
      
      public function set dataRanges(param1:Vector.<String>) : void
      {
         this._dataRanges = param1;
         dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_DATA_CHANGE));
         this.validateInternationalText();
      }
      
      public function get dataRangesLength() : int
      {
         return !!this._dataRanges?int(this._dataRanges.length):0;
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
            dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_OPTION_CHANGE));
            dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED,this));
            dispatchEvent(new AssetEvent(AssetEvent.ASSET_MOVED,this));
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
            this.swapAxisImpl();
            dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_AXIS_SWAP));
            dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_OPTION_CHANGE));
            dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED,this));
            dispatchEvent(new AssetEvent(AssetEvent.ASSET_MOVED,this));
         }
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
            dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_OPTION_CHANGE));
            dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED,this));
            dispatchEvent(new AssetEvent(AssetEvent.ASSET_MOVED,this));
         }
      }
      
      public function get colorPalette() : ColorPaletteModel
      {
         return this._colorPalette;
      }
      
      public function get layoutStyleName() : String
      {
         return this._layoutStyleName;
      }
      
      public function set layoutStyleName(param1:String) : void
      {
         this._layoutStyleName = param1;
      }
      
      public function get dataRows() : Vector.<WidgetPartModel>
      {
         return this._dataRows;
      }
      
      public function set dataRows(param1:Vector.<WidgetPartModel>) : void
      {
         this._dataRows = param1;
         dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_DATA_CHANGE));
         this.validateInternationalText();
      }
      
      public function get dataRowsLength() : int
      {
         return !!this._dataRows?int(this._dataRows.length):0;
      }
      
      public function get styleModel() : WidgetStyleModel
      {
         return this._styleModel;
      }
      
      public function set styleModel(param1:WidgetStyleModel) : void
      {
         if(this._styleModel != param1)
         {
            this._styleModel = param1;
            dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_STYLE_CHANGE));
         }
      }
      
      protected function resetRangeValues() : void
      {
         this._dataRanges = new Vector.<String>();
         this._dataRanges.push("Range 1");
      }
      
      protected function initValues() : void
      {
         this.resetRangeValues();
         this._numberFormatType = WidgetMaker.NUMBER_FORMAT_COMMA_DOT;
         this._displayValueLabel = !this.supportMultipleRanges || this.isCinematicType;
         this._displayDataLabel = true;
         this._displayAxis = true;
         this._displayLegend = true;
         WidgetStyleFactory.instance.changeLayoutStyle(this._styleModel,this._chartType);
         switch(this.chartType)
         {
            case WidgetConstants.CHART_TYPE_BAR_COUNTER:
               this.initBounds(50,200);
               this.initCounterValues();
               break;
            case WidgetConstants.CHART_TYPE_HORI_BAR_COUNTER:
               this.initBounds(200,50);
               this.initCounterValues();
               break;
            case WidgetConstants.CHART_TYPE_PLAIN_COUNTER:
            case WidgetConstants.CHART_TYPE_PIE_COUNTER:
            case WidgetConstants.CHART_TYPE_RING_COUNTER:
            case WidgetConstants.CHART_TYPE_FILL_ICON:
               this.initCounterValues();
               break;
            case WidgetConstants.CHART_TYPE_REPEAT_ICON:
               this.initRepeatIconValues();
               break;
            case WidgetConstants.CHART_TYPE_MONTH_CALENDAR:
               this.initBounds(160,140);
               this.initCalendarValues();
               break;
            case WidgetConstants.CHART_TYPE_DATE_CALENDAR:
               this.initBounds(120,140);
               this.initCalendarValues();
               break;
            default:
               this.initChartValues();
         }
      }
      
      protected function initMinDimension() : void
      {
         switch(this._chartType)
         {
            case WidgetConstants.CHART_TYPE_PIE_CHART:
            case WidgetConstants.CHART_TYPE_RING_CHART:
               this._minWidth = 200;
               this._minHeight = 200;
               break;
            case WidgetConstants.CHART_TYPE_LINE_CHART:
            case WidgetConstants.CHART_TYPE_AREA_CHART:
            case WidgetConstants.CHART_TYPE_BAR_CHART:
            case WidgetConstants.CHART_TYPE_HORI_BAR_CHART:
            case WidgetConstants.CHART_TYPE_GROUPED_BAR_CHART:
            case WidgetConstants.CHART_TYPE_HORI_GROUPED_BAR_CHART:
            case WidgetConstants.CHART_TYPE_CINEMATIC_BAR_CHART:
            case WidgetConstants.CHART_TYPE_CINEMATIC_HORI_BAR_CHART:
            case WidgetConstants.CHART_TYPE_CINEMATIC_LINE_CHART:
            case WidgetConstants.CHART_TYPE_CINEMATIC_AREA_CHART:
               this._minWidth = 150;
               this._minHeight = 120;
               break;
            case WidgetConstants.CHART_TYPE_BAR_COUNTER:
               this._minWidth = 10;
               this._minHeight = 50;
               break;
            case WidgetConstants.CHART_TYPE_HORI_BAR_COUNTER:
               this._minHeight = 10;
               this._minWidth = 50;
               break;
            case WidgetConstants.CHART_TYPE_PIE_COUNTER:
            case WidgetConstants.CHART_TYPE_RING_COUNTER:
               this._minWidth = 130;
               this._minHeight = 110;
               break;
            case WidgetConstants.CHART_TYPE_MONTH_CALENDAR:
               this._minWidth = 100;
               this._minHeight = 80;
               break;
            case WidgetConstants.CHART_TYPE_DATE_CALENDAR:
               this._minWidth = 80;
               this._minHeight = 50;
               break;
            case WidgetConstants.CHART_TYPE_FILL_ICON:
            case WidgetConstants.CHART_TYPE_REPEAT_ICON:
               this._minWidth = 50;
               this._minHeight = 80;
               break;
            default:
               this._minWidth = 50;
               this._minHeight = 50;
         }
      }
      
      protected function initBounds(param1:Number, param2:Number) : void
      {
         this._bounds = new Rectangle(param1 * -0.5,param2 * -0.5,param1,param2);
      }
      
      protected function initCounterValues() : void
      {
         var _loc1_:WidgetPartModel = null;
         _loc1_ = new WidgetPartModel();
         _loc1_.value = 0;
         _loc1_.rawValue = "0";
         this._dataRows.push(_loc1_);
         _loc1_ = new WidgetPartModel();
         _loc1_.value = 75;
         _loc1_.rawValue = "75";
         this._dataRows.push(_loc1_);
         _loc1_ = new WidgetPartModel();
         _loc1_.value = 100;
         _loc1_.rawValue = "100";
         this._dataRows.push(_loc1_);
         this.displayValueLabel = false;
         this.displayInPercentage = true;
         if(!this.isSwapping)
         {
            this.changeColorPalette(WidgetStyleFactory.instance.businessLightTwoColorPalette);
         }
         this._propId = DEFAULT_COUNTER_ICON_PROP_ID;
      }
      
      protected function initRepeatIconValues() : void
      {
         var _loc1_:WidgetPartModel = null;
         _loc1_ = new WidgetPartModel();
         _loc1_.value = 0;
         _loc1_.rawValue = "0";
         this._dataRows.push(_loc1_);
         _loc1_ = new WidgetPartModel();
         _loc1_.value = 7;
         _loc1_.rawValue = "7";
         this._dataRows.push(_loc1_);
         _loc1_ = new WidgetPartModel();
         _loc1_.value = 10;
         _loc1_.rawValue = "10";
         this._dataRows.push(_loc1_);
         this.displayInPercentage = true;
         if(!this.isSwapping)
         {
            this.changeColorPalette(WidgetStyleFactory.instance.businessLightTwoColorPalette);
         }
         this._propId = DEFAULT_REPEAT_ICON_PROP_ID;
         this.setAutoGrid();
      }
      
      protected function initCalendarValues() : void
      {
         this._currentDate = new Date();
         this._selectedDate = this._currentDate.date;
         this._selectedDateEnd = 0;
         if(!this.isSwapping)
         {
            this.changeColorPalette(WidgetStyleFactory.instance.businessLightCalendarPalette);
         }
      }
      
      protected function initChartValues() : void
      {
         var _loc1_:ColorPaletteModel = null;
         var _loc2_:int = 0;
         this.resetRangeValues();
         if(this.supportMultipleRanges)
         {
            _loc2_ = 1;
            while(_loc2_ < DEFAULT_RANGE_FOR_MULTI)
            {
               this.addRange();
               _loc2_++;
            }
         }
         this.addDataRow(CHART_PRESET_DATA_ROW_1);
         this.addDataRow(CHART_PRESET_DATA_ROW_2);
         this.addDataRow(CHART_PRESET_DATA_ROW_3);
         if(this.shouldAddMoreRows)
         {
            this.addDataRow(CHART_PRESET_DATA_ROW_4);
            this.addDataRow(CHART_PRESET_DATA_ROW_5);
            this.addDataRow(CHART_PRESET_DATA_ROW_6);
         }
         _loc1_ = WidgetStyleFactory.instance.businessLightFullPalette;
         if(!this.isSwapping)
         {
            this.changeColorPalette(_loc1_);
         }
      }
      
      override public function deSerialize(param1:XML, param2:Character, param3:AnimeScene = null, param4:Boolean = true, param5:Boolean = true) : void
      {
         var _loc7_:Thumb = null;
         var _loc8_:String = null;
         var _loc9_:Array = null;
         var _loc10_:Array = null;
         var _loc11_:Array = null;
         var _loc12_:Array = null;
         var _loc13_:Array = null;
         var _loc14_:Array = null;
         var _loc6_:String = param1.name();
         if(_loc6_ == XML_NODE_NAME)
         {
            _loc8_ = param1.file;
            _loc9_ = _loc8_.split(".");
            _loc7_ = ThemeManager.instance.getPropById(_loc9_[0],_loc9_[1]);
            if(!_loc7_)
            {
               _loc7_ = new WidgetThumb();
            }
            this.thumb = _loc7_;
            this.scene = param3;
            if(param1.hasOwnProperty("chart"))
            {
               this.deserializeChartXml(param1.chart[0]);
            }
            if(param1.hasOwnProperty("x"))
            {
               _loc10_ = String(param1.x).split(",");
            }
            if(param1.hasOwnProperty("y"))
            {
               _loc11_ = String(param1.y).split(",");
            }
            if(param1.hasOwnProperty("xscale"))
            {
               _loc12_ = String(param1.xscale).split(",");
            }
            if(param1.hasOwnProperty("yscale"))
            {
               _loc13_ = String(param1.yscale).split(",");
            }
            if(param1.hasOwnProperty("rotation"))
            {
               _loc14_ = String(param1.rotation).split(",");
            }
            this.setReferencePoint(_loc10_[0],_loc11_[0]);
            this.move(_loc10_[0],_loc11_[0]);
            this.scaleX = _loc12_[0];
            this.scaleY = _loc13_[0];
            this.rotation = _loc14_[0];
            if(param1.isBG)
            {
               this.attachedBg = String(param1.isBG) == "1"?true:false;
            }
            this.deserializeMotion(param1,_loc10_,_loc11_,_loc14_,_loc12_,_loc13_);
         }
      }
      
      override public function convertToXml() : XML
      {
         var _loc3_:XML = null;
         var _loc1_:uint = this.scene.getOverallOrdering(this);
         var _loc2_:XML = new XML("<" + XML_NODE_NAME + " id=\"" + ({this.id}) + "\" index=\"" + ({_loc1_}) + "\"/>");
         _loc2_.file = thumb.themeId + "." + thumb.id;
         _loc3_ = this.generateChartXml();
         if(_loc3_)
         {
            _loc2_.appendChild(_loc3_);
         }
         _loc2_.x = this.serializeMotion("x",this.motionShadow);
         _loc2_.y = this.serializeMotion("y",this.motionShadow);
         _loc2_.xscale = this.serializeMotion("xscale",this.motionShadow);
         _loc2_.yscale = this.serializeMotion("yscale",this.motionShadow);
         _loc2_.rotation = this.serializeMotion("rotation",this.motionShadow);
         if(attachedBg)
         {
            _loc2_.isBG = 1;
         }
         if(this.motionData)
         {
            _loc3_ = this.motionData.convertToXml();
            _loc2_.appendChild(_loc3_);
         }
         return _loc2_;
      }
      
      private function generateChartXml() : XML
      {
         var _loc1_:XML = <chart type="{this._chartType}"/>;
         _loc1_.bounds.x = Util.roundNum(this._bounds.x);
         _loc1_.bounds.y = Util.roundNum(this._bounds.y);
         _loc1_.bounds.width = Util.roundNum(this._bounds.width);
         _loc1_.bounds.height = Util.roundNum(this._bounds.height);
         if(this._displayDataLabel)
         {
            _loc1_.@dataLabel = "Y";
         }
         if(this._displayValueLabel)
         {
            _loc1_.@valueLabel = "Y";
         }
         if(this._displayInPercentage)
         {
            _loc1_.@percentLabel = "Y";
         }
         if(this._displayAxis)
         {
            _loc1_.@axis = "Y";
         }
         if(this._displayLegend)
         {
            _loc1_.@legend = "Y";
         }
         if(this._swapAxis)
         {
            _loc1_.@swap = "Y";
         }
         if(this._title)
         {
            _loc1_.title = this._title;
         }
         if(this._dataRanges)
         {
            _loc1_.range = this.generateRangeXml();
         }
         _loc1_.data = this.generateDataXml();
         _loc1_.style = this._styleModel.convertToXml();
         if(this._numberFormatType != 0)
         {
            _loc1_.@format = this._numberFormatType;
         }
         if(this._layoutStyleName != "default")
         {
            _loc1_.@variant = this._layoutStyleName;
         }
         if(this.isIconType)
         {
            _loc1_.prop = this.generatePropXml();
            if(this._iconDirection != null && this._iconDirection != "")
            {
               _loc1_.@iconFill = this._iconDirection;
            }
         }
         if(this._chartType == WidgetConstants.CHART_TYPE_REPEAT_ICON)
         {
            _loc1_.@gRow = this._gridRows;
            _loc1_.@gCol = this._gridColumns;
            if(this._autoGrid)
            {
               _loc1_.@gAuto = "Y";
            }
         }
         if(this._colorPalette)
         {
            _loc1_.@palette = this._colorPalette.id;
         }
         return _loc1_;
      }
      
      protected function generateRangeXml() : XML
      {
         var _loc3_:String = null;
         var _loc4_:XML = null;
         var _loc1_:XML = <range/>;
         var _loc2_:int = 0;
         while(_loc2_ < this._dataRanges.length)
         {
            _loc3_ = this.dataRanges[_loc2_];
            _loc4_ = <cell>{_loc3_}</cell>;
            _loc1_.appendChild(_loc4_);
            _loc2_++;
         }
         return _loc1_;
      }
      
      private function generatePropXml() : XML
      {
         return <prop><file>{this._propId}</file></prop>;
      }
      
      private function deserializeChartXml(param1:XML) : void
      {
         if(param1.hasOwnProperty("@type"))
         {
            this._chartType = String(param1.@type);
         }
         if(param1.hasOwnProperty("bounds"))
         {
            this._bounds.x = Number(param1.bounds.x);
            this._bounds.y = Number(param1.bounds.y);
            this._bounds.width = Number(param1.bounds.width);
            this._bounds.height = Number(param1.bounds.height);
         }
         this._displayValueLabel = String(param1.@valueLabel) == "Y";
         this._displayInPercentage = String(param1.@percentLabel) == "Y";
         this._displayDataLabel = String(param1.@dataLabel) == "Y";
         this._displayAxis = String(param1.@axis) == "Y";
         this._displayLegend = String(param1.@legend) == "Y";
         if(param1.hasOwnProperty("title"))
         {
            this._title = String(param1.title);
         }
         if(param1.hasOwnProperty("data"))
         {
            this.deserializeDataXml(param1.data[0]);
         }
         if(param1.hasOwnProperty("range"))
         {
            this.deserializeRangeXml(param1.range[0]);
         }
         else
         {
            this.resetRangeValues();
         }
         if(param1.hasOwnProperty("@variant"))
         {
            this._layoutStyleName = param1.@variant;
         }
         if(param1.hasOwnProperty("@format"))
         {
            this._numberFormatType = param1.@format;
         }
         if(param1.hasOwnProperty("@palette"))
         {
            this._colorPalette = WidgetStyleFactory.instance.getColorPalette(param1.@palette);
         }
         if(param1.hasOwnProperty("style"))
         {
            this._styleModel.deserialize(param1.style[0]);
            dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_OPTION_CHANGE));
         }
         if(param1.hasOwnProperty("prop"))
         {
            this.deserializePropXml(param1.prop[0]);
         }
         if(param1.hasOwnProperty("@gCol"))
         {
            this._gridColumns = int(param1.@gCol);
         }
         else
         {
            this._gridColumns = 1;
         }
         if(param1.hasOwnProperty("@gRow"))
         {
            this._gridRows = int(param1.@gRow);
         }
         else
         {
            this._gridRows = 1;
         }
         if(this._chartType == WidgetConstants.CHART_TYPE_REPEAT_ICON)
         {
            if(param1.hasOwnProperty("@gAuto"))
            {
               this._autoGrid = String(param1.@gAuto) == "Y";
            }
            else
            {
               this._autoGrid = false;
            }
         }
         if(param1.hasOwnProperty("@iconFill"))
         {
            this._iconDirection = param1.@iconFill;
         }
         this.initMinDimension();
      }
      
      private function deserializePropXml(param1:XML) : void
      {
         this._propId = param1.file[0].toString();
      }
      
      public function generateData() : String
      {
         return this.generateDataXml().toXMLString();
      }
      
      private function generateDataXml() : XML
      {
         var _loc2_:XML = null;
         var _loc3_:XML = null;
         var _loc4_:int = 0;
         var _loc1_:XML = <data/>;
         if(this.isCalendarType)
         {
            _loc2_ = <row/>;
            _loc1_.appendChild(_loc2_);
            _loc3_ = <cell>Year</cell>;
            _loc2_.appendChild(_loc3_);
            _loc3_ = <cell>{this.selectedYear}</cell>;
            _loc2_.appendChild(_loc3_);
            _loc2_ = <row/>;
            _loc1_.appendChild(_loc2_);
            _loc3_ = <cell>Month</cell>;
            _loc2_.appendChild(_loc3_);
            _loc3_ = <cell>{this.selectedMonth}</cell>;
            _loc2_.appendChild(_loc3_);
            if(this.selectedDate)
            {
               _loc2_ = <row/>;
               _loc1_.appendChild(_loc2_);
               _loc3_ = <cell>Selected Date</cell>;
               _loc2_.appendChild(_loc3_);
               _loc3_ = <cell>{this.selectedDate}</cell>;
               _loc2_.appendChild(_loc3_);
            }
            if(this.selectedDateEnd)
            {
               _loc2_ = <row/>;
               _loc1_.appendChild(_loc2_);
               _loc3_ = <cell>Selected Date End</cell>;
               _loc2_.appendChild(_loc3_);
               _loc3_ = <cell>{this.selectedDateEnd}</cell>;
               _loc2_.appendChild(_loc3_);
            }
         }
         else
         {
            _loc4_ = 0;
            while(_loc4_ < this._dataRows.length)
            {
               _loc2_ = this._dataRows[_loc4_].writeToXml();
               _loc1_.appendChild(_loc2_);
               _loc4_++;
            }
         }
         return _loc1_;
      }
      
      private function deserializeRangeXml(param1:XML) : void
      {
         var _loc3_:Array = null;
         var _loc4_:String = null;
         var _loc2_:XMLList = param1.cell;
         this._dataRanges = new Vector.<String>();
         var _loc5_:int = _loc2_.length();
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            this._dataRanges.push(String(_loc2_[_loc6_]));
            _loc6_++;
         }
      }
      
      private function deserializeDataXml(param1:XML) : void
      {
         var _loc2_:XMLList = null;
         var _loc3_:XMLList = null;
         var _loc4_:WidgetPartModel = null;
         var _loc5_:Array = null;
         var _loc6_:String = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         if(param1 && param1.hasOwnProperty("row"))
         {
            this._dataRows = new Vector.<WidgetPartModel>();
            _loc2_ = param1.row;
            _loc7_ = _loc2_.length();
            _loc8_ = 0;
            while(_loc8_ < _loc7_)
            {
               _loc3_ = _loc2_[_loc8_].cell;
               if(_loc3_)
               {
                  _loc4_ = new WidgetPartModel();
                  _loc4_.readFromXml(_loc3_);
                  this._dataRows.push(_loc4_);
               }
               _loc8_++;
            }
            if(this._chartType == WidgetConstants.CHART_TYPE_MONTH_CALENDAR || this._chartType == WidgetConstants.CHART_TYPE_DATE_CALENDAR)
            {
               this.updateDateValues();
            }
            dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_DATA_CHANGE));
            dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED,this));
            dispatchEvent(new AssetEvent(AssetEvent.ASSET_MOVED,this));
         }
      }
      
      override public function clone(param1:Boolean = false, param2:AnimeScene = null) : Asset
      {
         var _loc3_:Widget = new Widget("",this.chartType);
         _loc3_.scene = this.scene;
         _loc3_.id = this.id;
         _loc3_.attachedBg = this.attachedBg;
         _loc3_.init(Thumb(this.thumb),this.char);
         _loc3_.x = this.x;
         _loc3_.y = this.y;
         _loc3_.scaleX = this.scaleX;
         _loc3_.scaleY = this.scaleY;
         _loc3_.rotation = this.rotation;
         _loc3_.setReferencePoint(this.referenceX,this.referenceY);
         if(this.imageLocalCenter)
         {
            _loc3_.imageLocalCenter = this.imageLocalCenter.clone();
         }
         if(this.motionData)
         {
            _loc3_.motionData = this.motionData.clone();
         }
         if(this.motionShadow)
         {
            _loc3_.motionShadow = this.motionShadow.clone() as Prop;
         }
         _loc3_.title = this.title;
         _loc3_.data = this.generateData();
         _loc3_.dataRanges = this._dataRanges.concat();
         _loc3_.styleModel = this.styleModel.clone();
         _loc3_.displayDataLabel = this._displayDataLabel;
         _loc3_.displayValueLabel = this._displayValueLabel;
         _loc3_.displayInPercentage = this._displayInPercentage;
         _loc3_.displayAxis = this._displayAxis;
         _loc3_.displayLegend = this._displayLegend;
         _loc3_.iconDirection = this._iconDirection;
         _loc3_.swapAxis = this._swapAxis;
         _loc3_.numberFormatType = this._numberFormatType;
         _loc3_._colorPalette = this._colorPalette;
         _loc3_._layoutStyleName = this._layoutStyleName;
         _loc3_.selectedDate = this.selectedDate;
         _loc3_.selectedDateEnd = this.selectedDateEnd;
         _loc3_.selectedMonth = this.selectedMonth;
         _loc3_.selectedYear = this.selectedYear;
         _loc3_.propId = this.propId;
         if(this._autoGrid)
         {
            _loc3_.setAutoGrid();
         }
         else
         {
            _loc3_.setManualGrid(this._gridRows,this._gridColumns);
         }
         _loc3_.bounds = this._bounds;
         return _loc3_;
      }
      
      public function set data(param1:String) : void
      {
         var xml:XML = null;
         var value:String = param1;
         if(value)
         {
            try
            {
               xml = new XML(value);
            }
            catch(e:Error)
            {
               xml = null;
            }
            if(xml)
            {
               this.deserializeDataXml(xml);
            }
            if(this._autoGrid)
            {
               this.updateAutoGridValues();
            }
         }
         this.validateInternationalText();
      }
      
      public function addDataRow(param1:Number) : WidgetPartModel
      {
         var _loc2_:WidgetPartModel = this.generateWidgetPartModel(param1);
         this.addDataRowAt(_loc2_,this.dataRowsLength);
         return _loc2_;
      }
      
      public function generateWidgetPartModel(param1:Number) : WidgetPartModel
      {
         var _loc2_:WidgetPartModel = new WidgetPartModel();
         _loc2_.labelText = "Data " + (this._dataRows.length + 1);
         _loc2_.value = param1;
         _loc2_.rawValue = String(param1);
         var _loc3_:int = this.dataRangesLength;
         var _loc4_:int = 1;
         while(_loc4_ < _loc3_)
         {
            param1 = Math.round(Math.random() * 100);
            _loc2_.addRange(String(param1),param1);
            _loc4_++;
         }
         return _loc2_;
      }
      
      public function addDataRowAt(param1:WidgetPartModel, param2:int) : void
      {
         if(param1 && this._dataRows && param2 >= 0 && param2 <= this.dataRowsLength && this.dataRowsLength < WidgetThumb.MAX_DATA_ROWS)
         {
            this._dataRows.splice(param2,0,param1);
            dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_DATA_CHANGE));
         }
      }
      
      public function addRange() : void
      {
         this.addRangeAt(this.dataRangesLength);
      }
      
      public function addRangeAt(param1:int, param2:Vector.<String> = null) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         var _loc6_:WidgetPartModel = null;
         if(this._dataRanges && this._dataRanges.length < WidgetThumb.MAX_NUM_RANGES && param1 >= 0 && param1 <= this._dataRanges.length)
         {
            if(param2 && param2.length > 0)
            {
               this._dataRanges.splice(param1,0,param2[0]);
            }
            else
            {
               this._dataRanges.splice(param1,0,"Range " + (this._dataRanges.length + 1));
            }
            if(this._dataRows)
            {
               _loc3_ = this._dataRows.length;
               _loc5_ = 0;
               while(_loc5_ < _loc3_)
               {
                  _loc6_ = this._dataRows[_loc5_];
                  if(_loc6_)
                  {
                     if(param2 && _loc5_ + 1 < param2.length)
                     {
                        _loc4_ = Number(param2[_loc5_ + 1]);
                     }
                     else
                     {
                        _loc4_ = Math.round(Math.random() * 100);
                     }
                     _loc6_.addRangeAt(param1,String(_loc4_),_loc4_);
                  }
                  _loc5_++;
               }
               dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_DATA_CHANGE));
            }
         }
      }
      
      public function removeRangeAt(param1:int) : Vector.<String>
      {
         var _loc2_:Vector.<String> = null;
         var _loc3_:String = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:WidgetPartModel = null;
         if(this._dataRanges && param1 >= 0 && param1 < this._dataRanges.length && this._dataRanges.length > WidgetThumb.MIN_NUM_RANGES)
         {
            _loc2_ = this._dataRanges.splice(param1,1);
            if(this._dataRows)
            {
               _loc4_ = this._dataRows.length;
               _loc5_ = 0;
               while(_loc5_ < _loc4_)
               {
                  _loc6_ = this._dataRows[_loc5_];
                  if(_loc6_)
                  {
                     _loc3_ = _loc6_.removeRangeAt(param1);
                     _loc2_.push(_loc3_);
                  }
                  _loc5_++;
               }
               dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_DATA_CHANGE));
            }
            return _loc2_;
         }
         return null;
      }
      
      public function moveRange(param1:int, param2:int) : Vector.<String>
      {
         var _loc3_:Vector.<String> = null;
         var _loc4_:String = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:WidgetPartModel = null;
         if(this._dataRanges && param1 != param2 && param1 >= 0 && param1 < this._dataRanges.length && param2 >= 0 && param2 <= this._dataRanges.length)
         {
            _loc3_ = this._dataRanges.splice(param1,1);
            this._dataRanges.splice(param2,0,_loc3_[0]);
            if(this._dataRows)
            {
               _loc5_ = this._dataRows.length;
               _loc6_ = 0;
               while(_loc6_ < _loc5_)
               {
                  _loc7_ = this._dataRows[_loc6_];
                  if(_loc7_)
                  {
                     _loc4_ = _loc7_.removeRangeAt(param1);
                     _loc3_.push(_loc4_);
                     _loc7_.addRangeAt(param2,_loc4_,Number(_loc4_));
                  }
                  _loc6_++;
               }
               dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_DATA_CHANGE));
            }
            return _loc3_;
         }
         return null;
      }
      
      public function removeDataRowAt(param1:int) : WidgetPartModel
      {
         var _loc2_:WidgetPartModel = null;
         if(this._dataRows && param1 >= 0 && param1 < this._dataRows.length && this._dataRows.length > WidgetThumb.MIN_DATA_ROWS)
         {
            _loc2_ = this._dataRows.splice(param1,1)[0];
            dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_DATA_CHANGE));
            return _loc2_;
         }
         return null;
      }
      
      public function moveDataRow(param1:int, param2:int) : WidgetPartModel
      {
         var _loc3_:WidgetPartModel = null;
         if(this._dataRows && param1 != param2 && param1 >= 0 && param1 < this._dataRows.length && param2 >= 0 && param2 <= this._dataRows.length)
         {
            _loc3_ = this._dataRows.splice(param1,1)[0];
            this._dataRows.splice(param2,0,_loc3_);
            dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_DATA_CHANGE));
            return _loc3_;
         }
         return null;
      }
      
      public function get supportNegativeValue() : Boolean
      {
         switch(this._chartType)
         {
            case WidgetConstants.CHART_TYPE_AREA_CHART:
            case WidgetConstants.CHART_TYPE_PIE_CHART:
            case WidgetConstants.CHART_TYPE_RING_CHART:
               return false;
            default:
               return true;
         }
      }
      
      public function get supportMultipleRanges() : Boolean
      {
         switch(this._chartType)
         {
            case WidgetConstants.CHART_TYPE_AREA_CHART:
            case WidgetConstants.CHART_TYPE_BAR_CHART:
            case WidgetConstants.CHART_TYPE_CINEMATIC_BAR_CHART:
            case WidgetConstants.CHART_TYPE_GROUPED_BAR_CHART:
            case WidgetConstants.CHART_TYPE_HORI_BAR_CHART:
            case WidgetConstants.CHART_TYPE_HORI_GROUPED_BAR_CHART:
            case WidgetConstants.CHART_TYPE_LINE_CHART:
            case WidgetConstants.CHART_TYPE_CINEMATIC_BAR_CHART:
            case WidgetConstants.CHART_TYPE_CINEMATIC_HORI_BAR_CHART:
            case WidgetConstants.CHART_TYPE_CINEMATIC_LINE_CHART:
            case WidgetConstants.CHART_TYPE_CINEMATIC_AREA_CHART:
               return true;
            default:
               return false;
         }
      }
      
      public function get supportPercentage() : Boolean
      {
         switch(this._chartType)
         {
            case WidgetConstants.CHART_TYPE_PIE_CHART:
            case WidgetConstants.CHART_TYPE_RING_CHART:
            case WidgetConstants.CHART_TYPE_BAR_COUNTER:
            case WidgetConstants.CHART_TYPE_HORI_BAR_COUNTER:
            case WidgetConstants.CHART_TYPE_PLAIN_COUNTER:
            case WidgetConstants.CHART_TYPE_FILL_ICON:
            case WidgetConstants.CHART_TYPE_REPEAT_ICON:
               return true;
            default:
               return false;
         }
      }
      
      public function get isCounterType() : Boolean
      {
         return this.supportPercentage;
      }
      
      public function get chartType() : String
      {
         return this._chartType;
      }
      
      public function get isIconType() : Boolean
      {
         switch(this._chartType)
         {
            case WidgetConstants.CHART_TYPE_FILL_ICON:
            case WidgetConstants.CHART_TYPE_REPEAT_ICON:
               return true;
            default:
               return false;
         }
      }
      
      public function get isCalendarType() : Boolean
      {
         switch(this._chartType)
         {
            case WidgetConstants.CHART_TYPE_DATE_CALENDAR:
            case WidgetConstants.CHART_TYPE_MONTH_CALENDAR:
               return true;
            default:
               return false;
         }
      }
      
      protected function get shouldAddMoreRows() : Boolean
      {
         switch(this._chartType)
         {
            case WidgetConstants.CHART_TYPE_LINE_CHART:
            case WidgetConstants.CHART_TYPE_AREA_CHART:
            case WidgetConstants.CHART_TYPE_CINEMATIC_LINE_CHART:
            case WidgetConstants.CHART_TYPE_CINEMATIC_AREA_CHART:
               return true;
            default:
               return false;
         }
      }
      
      public function get isCinematicType() : Boolean
      {
         switch(this._chartType)
         {
            case WidgetConstants.CHART_TYPE_CINEMATIC_BAR_CHART:
            case WidgetConstants.CHART_TYPE_CINEMATIC_HORI_BAR_CHART:
            case WidgetConstants.CHART_TYPE_CINEMATIC_LINE_CHART:
            case WidgetConstants.CHART_TYPE_CINEMATIC_AREA_CHART:
               return true;
            default:
               return false;
         }
      }
      
      public function getDefaultCinematicFrameDuration() : int
      {
         var _loc1_:int = !!this._dataRows?int(this._dataRows.length):1;
         var _loc2_:int = !!this._dataRanges?int(this._dataRanges.length):1;
         var _loc3_:int = CINEMATIC_CHART_ENTRANCE_FRAMES + ((_loc1_ - 1) * CINEMATIC_CHART_DATA_POINT_OVERLAP_FRAMES + CINEMATIC_CHART_RANGE_TRANSITION_FRAMES) * _loc2_ + CINEMATIC_CHART_DISPLAY_FRAMES;
         return Math.max(_loc3_,CINEMATIC_CHART_MINIMUM_FRAMES);
      }
      
      public function get title() : String
      {
         return this._title;
      }
      
      public function set title(param1:String) : void
      {
         if(this._title != param1 && param1 != null)
         {
            this._title = param1;
            dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_DATA_CHANGE));
            dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED,this));
            dispatchEvent(new AssetEvent(AssetEvent.ASSET_MOVED,this));
            this.validateInternationalText();
         }
      }
      
      public function get displayInPercentage() : Boolean
      {
         return this._displayInPercentage;
      }
      
      public function set displayInPercentage(param1:Boolean) : void
      {
         if(this._displayInPercentage != param1)
         {
            this._displayInPercentage = param1;
            dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_OPTION_CHANGE));
            dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED,this));
            dispatchEvent(new AssetEvent(AssetEvent.ASSET_MOVED,this));
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
            dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_OPTION_CHANGE));
            dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED,this));
            dispatchEvent(new AssetEvent(AssetEvent.ASSET_MOVED,this));
         }
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
            dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_OPTION_CHANGE));
            dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED,this));
            dispatchEvent(new AssetEvent(AssetEvent.ASSET_MOVED,this));
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
            dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_OPTION_CHANGE));
            dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED,this));
            dispatchEvent(new AssetEvent(AssetEvent.ASSET_MOVED,this));
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
            dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_OPTION_CHANGE));
            dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED,this));
            dispatchEvent(new AssetEvent(AssetEvent.ASSET_MOVED,this));
         }
      }
      
      public function set colorSet(param1:Array) : void
      {
         if(this._styleModel)
         {
            this._styleModel.colorSet = param1;
            dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_STYLE_CHANGE));
         }
      }
      
      public function changeColorPalette(param1:ColorPaletteModel) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(param1)
         {
            this._colorPalette = param1;
            _loc2_ = [];
            _loc3_ = param1.length;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc2_.push(param1.getColorAt(_loc4_));
               _loc4_++;
            }
            this._styleModel.colorSet = _loc2_;
            this._styleModel.color = param1.textColor;
            this._styleModel.lineColor = param1.lineColor;
            this._styleModel.titleColor = param1.titleColor;
         }
         if(!this.isSwapping)
         {
            dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_STYLE_CHANGE));
         }
      }
      
      public function changeLayoutProperties(param1:String) : void
      {
         this._layoutStyleName = param1;
         WidgetStyleFactory.instance.changeLayoutStyle(this._styleModel,this._chartType,param1);
         dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_STYLE_CHANGE));
         dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED,this));
         dispatchEvent(new AssetEvent(AssetEvent.ASSET_MOVED,this));
      }
      
      public function changeWidgetColor(param1:uint) : void
      {
         this._styleModel.color = param1;
         dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_STYLE_CHANGE));
      }
      
      public function changeFont(param1:String) : void
      {
         var _loc2_:String = null;
         if(param1 == FontManager.FONT_NAME_NOTO)
         {
            _loc2_ = this.getAllTextInWidget();
            param1 = FontVariantManager.instance.lookupFontLanguageVariant(param1,_loc2_);
         }
         this._styleModel.font = param1;
         dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_STYLE_CHANGE));
         if(!this._internationalLanguageValidatingFlag)
         {
            this.validateInternationalText();
         }
      }
      
      public function get currentDate() : Date
      {
         return this._currentDate;
      }
      
      public function set currentDate(param1:Date) : void
      {
         if(this._currentDate != param1)
         {
            this._currentDate = param1;
            dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_DATA_CHANGE));
         }
      }
      
      public function get selectedYear() : int
      {
         if(this._currentDate)
         {
            return this._currentDate.fullYear;
         }
         return 2014;
      }
      
      public function set selectedYear(param1:int) : void
      {
         var _loc2_:Date = null;
         if(this._currentDate)
         {
            _loc2_ = new Date(param1,0);
            this._currentDate.fullYear = _loc2_.fullYear;
            dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_DATA_CHANGE));
         }
      }
      
      public function get selectedMonth() : int
      {
         if(this._currentDate)
         {
            return this._currentDate.month + 1;
         }
         return 1;
      }
      
      public function set selectedMonth(param1:int) : void
      {
         if(param1 < 1)
         {
            param1 = 1;
         }
         else if(param1 > 12)
         {
            param1 = 12;
         }
         var _loc2_:Date = new Date(this.selectedYear,param1,0);
         this._maxDay = _loc2_.getDate();
         if(this.selectedDate > this._maxDay)
         {
            this.selectedDate = this._maxDay;
         }
         if(this.selectedDateEnd > this._maxDay)
         {
            this.selectedDateEnd = this._maxDay;
         }
         if(this._currentDate)
         {
            this._currentDate.month = param1 - 1;
            dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_DATA_CHANGE));
         }
      }
      
      public function get selectedDate() : int
      {
         return this._selectedDate;
      }
      
      public function set selectedDate(param1:int) : void
      {
         if(param1 < 1 || param1 > this._maxDay)
         {
            param1 = 0;
         }
         if(param1 >= this.selectedDateEnd)
         {
            this.selectedDateEnd = 0;
         }
         if(this._selectedDate != param1)
         {
            this._selectedDate = param1;
            dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_DATA_CHANGE));
         }
      }
      
      public function get selectedDateEnd() : int
      {
         return this._selectedDateEnd;
      }
      
      public function set selectedDateEnd(param1:int) : void
      {
         if(param1 < 1 || param1 > this._maxDay)
         {
            param1 = 0;
         }
         if(param1 <= this.selectedDate)
         {
            param1 = 0;
         }
         if(this._selectedDateEnd != param1)
         {
            this._selectedDateEnd = param1;
            dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_DATA_CHANGE));
         }
      }
      
      protected function updateDateValues() : void
      {
         this._currentDate = new Date();
         if(this._dataRows.length >= 2)
         {
            this.selectedYear = this._dataRows[0].value;
            this.selectedMonth = this._dataRows[1].value;
         }
         if(this._dataRows.length > 2)
         {
            this.selectedDate = this._dataRows[2].value;
         }
         if(this._dataRows.length > 3)
         {
            this.selectedDateEnd = this._dataRows[3].value;
         }
         else
         {
            this.selectedDateEnd = 0;
         }
      }
      
      public function get propId() : String
      {
         return this._propId;
      }
      
      public function set propId(param1:String) : void
      {
         if(this._propId != param1)
         {
            this._propId = param1;
            dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_STYLE_CHANGE));
         }
      }
      
      public function get gridColumns() : int
      {
         return this._gridColumns;
      }
      
      public function get gridRows() : int
      {
         return this._gridRows;
      }
      
      public function setManualGrid(param1:int, param2:int) : void
      {
         this._gridRows = param1;
         this._gridColumns = param2;
         this._autoGrid = false;
         dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_STYLE_CHANGE));
         dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED,this));
         dispatchEvent(new AssetEvent(AssetEvent.ASSET_MOVED,this));
      }
      
      public function get autoGrid() : Boolean
      {
         return this._autoGrid;
      }
      
      public function setAutoGrid() : void
      {
         if(!this._autoGrid)
         {
            this._autoGrid = true;
            this.updateAutoGridValues();
         }
      }
      
      public function get bounds() : Rectangle
      {
         return this._bounds;
      }
      
      public function set bounds(param1:Rectangle) : void
      {
         if(param1)
         {
            this._bounds.x = param1.x;
            this._bounds.y = param1.y;
            this._bounds.width = param1.width;
            this._bounds.height = param1.height;
            this.dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_RESIZED));
            this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED,this));
         }
         if(motionShadow is Widget)
         {
            (motionShadow as Widget).bounds = param1;
         }
      }
      
      override public function get minWidth() : Number
      {
         return this._minWidth;
      }
      
      override public function get minHeight() : Number
      {
         return this._minHeight;
      }
      
      override public function get width() : Number
      {
         return this._bounds.width;
      }
      
      public function get rect() : Rectangle
      {
         return new Rectangle();
      }
      
      override public function set width(param1:Number) : void
      {
         param1 = UtilMath.boundaryCheck(param1,this.minWidth,this.maxWidth);
         this._bounds.width = param1;
         if(motionShadow)
         {
            motionShadow.width = param1;
         }
         this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED,this));
         this.dispatchEvent(new AssetEvent(AssetEvent.MOTION_CHANGE,this));
      }
      
      override public function get height() : Number
      {
         return this._bounds.height;
      }
      
      override public function set height(param1:Number) : void
      {
         param1 = UtilMath.boundaryCheck(param1,this.minHeight,this.maxHeight);
         this._bounds.height = param1;
         if(motionShadow)
         {
            motionShadow.height = param1;
         }
         this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED,this));
         this.dispatchEvent(new AssetEvent(AssetEvent.MOTION_CHANGE,this));
      }
      
      public function resize(param1:Number, param2:Number, param3:Boolean = false) : void
      {
         if(param1 != this.width || param2 != this.height)
         {
            this.width = param1;
            this.height = param2;
         }
      }
      
      protected function updateAutoGridValues() : void
      {
         var _loc1_:int = 10;
         var _loc2_:int = 10;
         var _loc3_:int = this._dataRows[2].value;
         if(_loc3_ <= 40)
         {
            _loc1_ = Math.ceil(_loc3_ / 5);
            _loc2_ = 5;
         }
         else if(_loc3_ < 100)
         {
            _loc1_ = Math.ceil(_loc3_ / 10);
            _loc2_ = 10;
         }
         this._gridRows = _loc1_;
         this._gridColumns = _loc2_;
         dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_STYLE_CHANGE));
         dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED,this));
         dispatchEvent(new AssetEvent(AssetEvent.ASSET_MOVED,this));
      }
      
      public function swapWithWidget(param1:WidgetThumb, param2:WidgetProxy) : void
      {
         if(param1 && !this.isSwapping)
         {
            this.isSwapping = true;
            dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_SWAP_START));
            setTimeout(this.swapWithWidgetImpl,50,param1,param2);
         }
      }
      
      protected function swapWithWidgetImpl(param1:WidgetThumb, param2:WidgetProxy) : void
      {
         this.thumb = param1;
         this._chartType = param1.chartType;
         this.initMinDimension();
         this._bounds.width = UtilMath.boundaryCheck(this._bounds.width,this._minWidth,maxWidth);
         this._bounds.height = UtilMath.boundaryCheck(this._bounds.height,this._minHeight,maxHeight);
         if(motionShadow)
         {
            motionShadow.width = this._bounds.width;
            motionShadow.height = this._bounds.height;
         }
         WidgetStyleFactory.instance.changeLayoutStyle(this._styleModel,this._chartType,param2.styleVariant);
         var _loc3_:Boolean = this.applySetting(param2);
         if(!_loc3_)
         {
            this._dataRows = new Vector.<WidgetPartModel>();
            switch(this._chartType)
            {
               case WidgetConstants.CHART_TYPE_BAR_COUNTER:
               case WidgetConstants.CHART_TYPE_HORI_BAR_COUNTER:
               case WidgetConstants.CHART_TYPE_PLAIN_COUNTER:
               case WidgetConstants.CHART_TYPE_PIE_COUNTER:
               case WidgetConstants.CHART_TYPE_RING_COUNTER:
               case WidgetConstants.CHART_TYPE_FILL_ICON:
                  this.initCounterValues();
                  break;
               case WidgetConstants.CHART_TYPE_REPEAT_ICON:
                  this.initRepeatIconValues();
                  break;
               case WidgetConstants.CHART_TYPE_MONTH_CALENDAR:
               case WidgetConstants.CHART_TYPE_DATE_CALENDAR:
                  this.initCalendarValues();
                  break;
               default:
                  this.initChartValues();
            }
         }
         if(this._chartType == WidgetConstants.CHART_TYPE_REPEAT_ICON)
         {
            if(this._gridRows * this._gridColumns <= 0)
            {
               this._gridRows = 2;
               this._gridColumns = 5;
            }
            if(!this._propId)
            {
               this._propId = DEFAULT_REPEAT_ICON_PROP_ID;
            }
         }
         else if(this.isCounterType)
         {
            if(!this._propId)
            {
               this._propId = DEFAULT_COUNTER_ICON_PROP_ID;
            }
         }
         var _loc4_:String = "businessLight";
         if(this.colorPalette)
         {
            _loc4_ = this.colorPalette.colorSchemeName;
         }
         var _loc5_:ColorPaletteModel = WidgetStyleFactory.instance.getCompatiblePalette(_loc4_,this._chartType);
         this.changeColorPalette(_loc5_);
         param2.restoreColor(this);
         recreateMotionShadow();
         this.isSwapping = false;
         dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_RESIZED));
         dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED,this));
         dispatchEvent(new AssetEvent(AssetEvent.ASSET_MOVED,this));
         dispatchEvent(new AssetEvent(AssetEvent.STATE_CHANGE,this));
         dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_STYLE_CHANGE));
         dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_DATA_CHANGE));
         dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_OPTION_CHANGE));
      }
      
      public function applySetting(param1:WidgetProxy) : Boolean
      {
         this.styleModel.font = param1.fontFamily;
         this.title = param1.title;
         if(this.supportPercentage)
         {
            this._displayInPercentage = param1.displayInPercentage;
         }
         else
         {
            this._displayInPercentage = false;
         }
         this._displayDataLabel = param1.displayDataLabel;
         this._displayValueLabel = param1.displayValueLabel;
         this._displayAxis = param1.displayAxis;
         this._displayLegend = param1.displayLegend;
         this._swapAxis = param1.swapAxis;
         this._iconDirection = "";
         this._numberFormatType = param1.numberFormatType;
         this._propId = param1.propId;
         this._gridRows = param1.gridRows;
         this._gridColumns = param1.gridColumns;
         this._autoGrid = param1.autoGrid;
         return param1.restoreDataRows(this);
      }
      
      public function dispatchSwapComplete() : void
      {
         dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_SWAP_COMPLETE));
      }
      
      public function undoSwap(param1:XML) : void
      {
         this.deSerialize(param1,null,scene);
         dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_RESIZED));
         dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED,this));
         dispatchEvent(new AssetEvent(AssetEvent.ASSET_MOVED,this));
         dispatchEvent(new AssetEvent(AssetEvent.STATE_CHANGE,this));
         dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_STYLE_CHANGE));
         dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_DATA_CHANGE));
         dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_OPTION_CHANGE));
      }
      
      protected function swapAxisImpl() : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc7_:WidgetPartModel = null;
         var _loc8_:String = null;
         var _loc9_:Number = NaN;
         var _loc1_:Vector.<WidgetPartModel> = new Vector.<WidgetPartModel>();
         var _loc2_:Vector.<String> = new Vector.<String>();
         var _loc5_:int = this._dataRows.length;
         var _loc6_:int = this._dataRanges.length;
         _loc3_ = 0;
         while(_loc3_ < _loc6_)
         {
            _loc7_ = new WidgetPartModel();
            _loc7_.labelText = this._dataRanges[_loc3_];
            _loc4_ = 0;
            while(_loc4_ < _loc5_)
            {
               _loc8_ = this._dataRows[_loc4_].getRawValueByRange(_loc3_);
               _loc9_ = this._dataRows[_loc4_].getValueByRange(_loc3_);
               if(_loc4_ == 0)
               {
                  _loc7_.rawValue = _loc8_;
                  _loc7_.value = _loc9_;
               }
               else
               {
                  _loc7_.addRangeAt(_loc4_,_loc8_,_loc9_);
               }
               _loc4_++;
            }
            _loc1_.push(_loc7_);
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < _loc5_)
         {
            _loc2_.push(this._dataRows[_loc3_].labelText);
            _loc3_++;
         }
         this._dataRanges = _loc2_;
         this._dataRows = _loc1_;
      }
      
      protected function validateInternationalText() : void
      {
         this._internationalLanguageValidatingFlag = true;
         var _loc1_:FontVariantManager = FontVariantManager.instance;
         var _loc2_:String = this.getAllTextInWidget();
         this._fontLanguageVariant = _loc1_.lookupFontLanguageVariant(FontManager.FONT_NAME_NOTO,_loc2_);
         if(this._fontLanguageVariant == this._styleModel.font)
         {
            return;
         }
         if(_loc1_.isVariantOfFont(this._styleModel.font,FontManager.FONT_NAME_NOTO))
         {
            this.updateFontLanguageVariant();
         }
         else if(_loc1_.textContainsInternationalCharacter(_loc2_))
         {
            this.showFontSupportPopUp();
         }
      }
      
      protected function updateFontLanguageVariant() : void
      {
         this.changeFont(this._fontLanguageVariant);
         this._internationalLanguageValidatingFlag = false;
      }
      
      protected function getAllTextInWidget() : String
      {
         var _loc2_:int = 0;
         var _loc1_:String = "";
         _loc1_ = _loc1_ + this._title;
         if(this._dataRows)
         {
            _loc2_ = 0;
            while(_loc2_ < this.dataRowsLength)
            {
               _loc1_ = _loc1_ + this._dataRows[_loc2_].labelText;
               _loc2_++;
            }
         }
         if(this._dataRanges)
         {
            _loc2_ = 0;
            while(_loc2_ < this.dataRangesLength)
            {
               _loc1_ = _loc1_ + this._dataRanges[_loc2_];
               _loc2_++;
            }
         }
         return _loc1_;
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
            this.updateFontLanguageVariant();
         }
      }
   }
}
