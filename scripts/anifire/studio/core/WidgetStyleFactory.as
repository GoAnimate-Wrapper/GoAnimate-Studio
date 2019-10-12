package anifire.studio.core
{
   import anifire.component.widgets.WidgetConstants;
   import anifire.models.widget.WidgetStyleModel;
   import anifire.studio.models.ColorPaletteModel;
   import anifire.studio.models.WidgetStyleVariantModel;
   import mx.collections.ArrayCollection;
   
   public class WidgetStyleFactory
   {
      
      public static const BUSINESS_LIGHT_FULL_COLOR:Array = [14414078,7917809,4111595,296375,2967901,7701911,13883873,12569045,11122631,9544627,16211847,16441349,16509893,16243085,15976799,15974211,16035879,10738173,109033,2714007];
      
      public static const BUSINESS_DARK_FULL_COLOR:Array = [16185078,11919871,42987,94109,2704471,1651011,13883873,12569045,11122631,9544627,16365621,16211847,16374085,16509893,16046478,15976799,15974211,10738173,109033,2714007];
      
      public static const RETRO_LIGHT_FULL_COLOR:Array = [15287625,15841599,9149811,11221287,8894395,1918789,15829824,4660531,15829823,3774357,1909575,15297349,7571357,12427619,7940949,4289907,9398029,10031379,12287861,11120477];
      
      public static const RETRO_DARK_FULL_COLOR:Array = [16344681,16765536,11188885,12998723,10932435,3565414,16755296,6764113,5748147,3554919,16354406,9807546,14007684,10111350,6395285,11438367,12002600,13934486,12962174,9661291];
      
      public static const PASTEL_LIGHT_FULL_COLOR:Array = [9159890,15189969,15130298,11193787,13480902,6470352,15182033,15130255,8048059,13470918,6462672,15171737,15119700,5885371,11373766,5741734,12550297,13869892,4700859,8746162];
      
      public static const PASTEL_DARK_FULL_COLOR:Array = [3332835,13384512,14763855,6909314,4814778,4699570,10826812,11883613,9211545,6456242,43186,8003900,11879017,7704217,6448854,4287853,6303044,5978954,7764860,6909352];
      
      public static const BUSINESS_LIGHT_TWO_COLOR:Array = [167866,15974211];
      
      public static const BUSINESS_DARK_TWO_COLOR:Array = [94109,16374085];
      
      public static const RETRO_LIGHT_TWO_COLOR:Array = [9149811,15287881];
      
      public static const RETRO_DARK_TWO_COLOR:Array = [11188885,16344681];
      
      public static const PASTEL_LIGHT_TWO_COLOR:Array = [15130298,9159890];
      
      public static const PASTEL_DARK_TWO_COLOR:Array = [6122129,3332835];
      
      public static const BUSINESS_LIGHT_ONE_COLOR:Array = [15974211];
      
      public static const BUSINESS_DARK_ONE_COLOR:Array = [16374085];
      
      public static const RETRO_LIGHT_ONE_COLOR:Array = [15287881];
      
      public static const RETRO_DARK_ONE_COLOR:Array = [16344681];
      
      public static const PASTEL_LIGHT_ONE_COLOR:Array = [9159890];
      
      public static const PASTEL_DARK_ONE_COLOR:Array = [3332835];
      
      public static const BUSINESS_LIGHT_CALENDAR:Array = [109033,11788799,7701911];
      
      public static const BUSINESS_DARK_CALENDAR:Array = [42987,2714007,1651011];
      
      public static const RETRO_LIGHT_CALENDAR:Array = [12935762,15061455,1918789];
      
      public static const RETRO_DARK_CALENDAR:Array = [16344681,13934486,1918789];
      
      public static const PASTEL_LIGHT_CALENDAR:Array = [9159890,15130298,15171737];
      
      public static const PASTEL_DARK_CALENDAR:Array = [3332835,6122129,0];
      
      public static const SINGLE_COLOR_A:Array = [174825];
      
      public static const SINGLE_COLOR_B:Array = [15287625];
      
      public static const SINGLE_COLOR_C:Array = [16053492];
      
      public static const SINGLE_COLOR_D:Array = [15841599];
      
      public static const SINGLE_COLOR_E:Array = [4119267];
      
      public static const BUSINESS_LIGHT_LINE:uint = 7701911;
      
      public static const BUSINESS_LIGHT_TEXT:uint = 5000268;
      
      public static const BUSINESS_DARK_LINE:uint = 13224393;
      
      public static const BUSINESS_DARK_TEXT:uint = 12305873;
      
      public static const RETRO_LIGHT_LINE:uint = 1918790;
      
      public static const RETRO_LIGHT_TEXT:uint = 12935762;
      
      public static const RETRO_DARK_LINE:uint = 16344681;
      
      public static const RETRO_DARK_TEXT:uint = 13934486;
      
      public static const PASTEL_LIGHT_LINE:uint = 10984836;
      
      public static const PASTEL_LIGHT_TEXT:uint = 5524022;
      
      public static const PASTEL_DARK_LINE:uint = 16316664;
      
      public static const PASTEL_DARK_TEXT:uint = 16316664;
      
      public static const RETRO_LIGHT_CALENDAR_TEXT:uint = 5524022;
      
      public static const RETRO_LIGHT_CALENDAR_LINE:uint = 1918789;
      
      public static const RETRO_LIGHT_CALENDAR_TITLE:uint = 16777215;
      
      public static const RETRO_DARK_CALENDAR_TEXT:uint = 16777215;
      
      public static const RETRO_DARK_CALENDAR_LINE:uint = 1918789;
      
      public static const RETRO_DARK_CALENDAR_TITLE:uint = 16777215;
      
      public static const BUSINESS_LIGHT_CALENDAR_TEXT:uint = 5000268;
      
      public static const BUSINESS_LIGHT_CALENDAR_LINE:uint = 16035879;
      
      public static const BUSINESS_LIGHT_CALENDAR_TITLE:uint = 16777215;
      
      public static const BUSINESS_DARK_CALENDAR_TEXT:uint = 16777215;
      
      public static const BUSINESS_DARK_CALENDAR_LINE:uint = 16374085;
      
      public static const BUSINESS_DARK_CALENDAR_TITLE:uint = 16777215;
      
      public static const PASTEL_LIGHT_CALENDAR_TEXT:uint = 5524022;
      
      public static const PASTEL_LIGHT_CALENDAR_LINE:uint = 6462672;
      
      public static const PASTEL_LIGHT_CALENDAR_TITLE:uint = 16777215;
      
      public static const PASTEL_DARK_CALENDAR_TEXT:uint = 16777215;
      
      public static const PASTEL_DARK_CALENDAR_LINE:uint = 3332835;
      
      public static const PASTEL_DARK_CALENDAR_TITLE:uint = 0;
      
      public static const DEFAULT_STYLE_VARIANT:String = "default";
      
      private static var __instance:WidgetStyleFactory;
      
      public static const DEFAULT_STYLE_VARIANT_ID:String = "default";
      
      public static const STYLE_VARIANT_PREFIX:String = "style";
       
      
      public var businessLightFullPalette:ColorPaletteModel;
      
      public var businessDarkFullPalette:ColorPaletteModel;
      
      public var businessLightTwoColorPalette:ColorPaletteModel;
      
      public var businessDarkTwoColorPalette:ColorPaletteModel;
      
      public var businessLightOneColorPalette:ColorPaletteModel;
      
      public var businessDarkOneColorPalette:ColorPaletteModel;
      
      public var retroLightFullPalette:ColorPaletteModel;
      
      public var retroLightTwoColorPalette:ColorPaletteModel;
      
      public var retroLightOneColorPalette:ColorPaletteModel;
      
      public var retroDarkFullPalette:ColorPaletteModel;
      
      public var retroDarkTwoColorPalette:ColorPaletteModel;
      
      public var retroDarkOneColorPalette:ColorPaletteModel;
      
      public var pastelLightFullPalette:ColorPaletteModel;
      
      public var pastelDarkFullPalette:ColorPaletteModel;
      
      public var pastelLightTwoColorPalette:ColorPaletteModel;
      
      public var pastelDarkTwoColorPalette:ColorPaletteModel;
      
      public var pastelLightOneColorPalette:ColorPaletteModel;
      
      public var pastelDarkOneColorPalette:ColorPaletteModel;
      
      public var singleColorAPalette:ColorPaletteModel;
      
      public var singleColorBPalette:ColorPaletteModel;
      
      public var singleColorCPalette:ColorPaletteModel;
      
      public var singleColorDPalette:ColorPaletteModel;
      
      public var singleColorEPalette:ColorPaletteModel;
      
      public var businessLightCalendarPalette:ColorPaletteModel;
      
      public var businessDarkCalendarPalette:ColorPaletteModel;
      
      public var retroLightCalendarPalette:ColorPaletteModel;
      
      public var retroDarkCalendarPalette:ColorPaletteModel;
      
      public var pastelLightCalendarPalette:ColorPaletteModel;
      
      public var pastelDarkCalendarPalette:ColorPaletteModel;
      
      private var _paletteLookup:Object;
      
      private var _styleVariantsLookup:Object;
      
      public function WidgetStyleFactory()
      {
         super();
         this.init();
      }
      
      public static function get instance() : WidgetStyleFactory
      {
         if(!__instance)
         {
            __instance = new WidgetStyleFactory();
         }
         return __instance;
      }
      
      protected function init() : void
      {
         this._paletteLookup = {};
         this.businessLightFullPalette = new ColorPaletteModel("businessLight",BUSINESS_LIGHT_FULL_COLOR,BUSINESS_LIGHT_LINE,BUSINESS_LIGHT_TEXT);
         this.businessDarkFullPalette = new ColorPaletteModel("businessDark",BUSINESS_DARK_FULL_COLOR,BUSINESS_DARK_LINE,BUSINESS_DARK_TEXT);
         this.pastelLightFullPalette = new ColorPaletteModel("pastelLight",PASTEL_LIGHT_FULL_COLOR,PASTEL_LIGHT_LINE,PASTEL_LIGHT_TEXT);
         this.pastelDarkFullPalette = new ColorPaletteModel("pastelDark",PASTEL_DARK_FULL_COLOR,PASTEL_DARK_LINE,PASTEL_DARK_TEXT);
         this.retroLightFullPalette = new ColorPaletteModel("retroLight",RETRO_LIGHT_FULL_COLOR,RETRO_LIGHT_LINE,RETRO_LIGHT_TEXT);
         this.retroDarkFullPalette = new ColorPaletteModel("retroDark",RETRO_DARK_FULL_COLOR,RETRO_DARK_LINE,RETRO_DARK_TEXT);
         this.businessLightFullPalette.colorSchemeName = "businessLight";
         this.businessDarkFullPalette.colorSchemeName = "businessDark";
         this.pastelLightFullPalette.colorSchemeName = "pastelLight";
         this.pastelDarkFullPalette.colorSchemeName = "pastelDark";
         this.retroLightFullPalette.colorSchemeName = "retroLight";
         this.retroDarkFullPalette.colorSchemeName = "retroDark";
         this.businessLightTwoColorPalette = new ColorPaletteModel("businessLight2",BUSINESS_LIGHT_TWO_COLOR,BUSINESS_LIGHT_LINE,BUSINESS_LIGHT_TEXT);
         this.businessLightTwoColorPalette.initDisplayColors(BUSINESS_LIGHT_FULL_COLOR);
         this.businessDarkTwoColorPalette = new ColorPaletteModel("businessDark2",BUSINESS_DARK_TWO_COLOR,BUSINESS_DARK_LINE,BUSINESS_DARK_TEXT);
         this.businessDarkTwoColorPalette.initDisplayColors(BUSINESS_DARK_FULL_COLOR);
         this.retroLightTwoColorPalette = new ColorPaletteModel("retroLight2",RETRO_LIGHT_TWO_COLOR,RETRO_LIGHT_LINE,RETRO_LIGHT_TEXT);
         this.retroLightTwoColorPalette.initDisplayColors(RETRO_LIGHT_FULL_COLOR);
         this.retroDarkTwoColorPalette = new ColorPaletteModel("retroDark2",RETRO_DARK_TWO_COLOR,RETRO_DARK_LINE,RETRO_DARK_TEXT);
         this.retroDarkTwoColorPalette.initDisplayColors(RETRO_DARK_FULL_COLOR);
         this.pastelLightTwoColorPalette = new ColorPaletteModel("pastelLight2",PASTEL_LIGHT_TWO_COLOR,PASTEL_LIGHT_LINE,PASTEL_LIGHT_TEXT);
         this.pastelLightTwoColorPalette.initDisplayColors(PASTEL_LIGHT_FULL_COLOR);
         this.pastelDarkTwoColorPalette = new ColorPaletteModel("pastelDark2",PASTEL_DARK_TWO_COLOR,PASTEL_DARK_LINE,PASTEL_DARK_TEXT);
         this.pastelDarkTwoColorPalette.initDisplayColors(PASTEL_DARK_FULL_COLOR);
         this.businessLightTwoColorPalette.colorSchemeName = "businessLight";
         this.businessDarkTwoColorPalette.colorSchemeName = "businessDark";
         this.pastelLightTwoColorPalette.colorSchemeName = "pastelLight";
         this.pastelDarkTwoColorPalette.colorSchemeName = "pastelDark";
         this.retroLightTwoColorPalette.colorSchemeName = "retroLight";
         this.retroDarkTwoColorPalette.colorSchemeName = "retroDark";
         this.businessLightOneColorPalette = new ColorPaletteModel("businessLight1",BUSINESS_LIGHT_ONE_COLOR,BUSINESS_LIGHT_LINE,BUSINESS_LIGHT_TEXT);
         this.businessLightOneColorPalette.initDisplayColors(BUSINESS_LIGHT_FULL_COLOR);
         this.businessDarkOneColorPalette = new ColorPaletteModel("businessDark1",BUSINESS_DARK_ONE_COLOR,BUSINESS_DARK_LINE,BUSINESS_DARK_TEXT);
         this.businessDarkOneColorPalette.initDisplayColors(BUSINESS_DARK_FULL_COLOR);
         this.retroLightOneColorPalette = new ColorPaletteModel("retroLight1",RETRO_LIGHT_ONE_COLOR,RETRO_LIGHT_LINE,RETRO_LIGHT_TEXT);
         this.retroLightOneColorPalette.initDisplayColors(RETRO_LIGHT_FULL_COLOR);
         this.retroDarkOneColorPalette = new ColorPaletteModel("retroDark1",RETRO_DARK_ONE_COLOR,RETRO_DARK_LINE,RETRO_DARK_TEXT);
         this.retroDarkOneColorPalette.initDisplayColors(RETRO_DARK_FULL_COLOR);
         this.pastelLightOneColorPalette = new ColorPaletteModel("pastelLight1",PASTEL_LIGHT_ONE_COLOR,PASTEL_LIGHT_LINE,PASTEL_LIGHT_TEXT);
         this.pastelLightOneColorPalette.initDisplayColors(PASTEL_LIGHT_FULL_COLOR);
         this.pastelDarkOneColorPalette = new ColorPaletteModel("pastelDark1",PASTEL_DARK_ONE_COLOR,PASTEL_DARK_LINE,PASTEL_DARK_TEXT);
         this.pastelDarkOneColorPalette.initDisplayColors(PASTEL_DARK_FULL_COLOR);
         this.businessLightOneColorPalette.colorSchemeName = "businessLight";
         this.businessDarkOneColorPalette.colorSchemeName = "businessDark";
         this.pastelLightOneColorPalette.colorSchemeName = "pastelLight";
         this.pastelDarkOneColorPalette.colorSchemeName = "pastelDark";
         this.retroLightOneColorPalette.colorSchemeName = "retroLight";
         this.retroDarkOneColorPalette.colorSchemeName = "retroDark";
         this.businessLightCalendarPalette = new ColorPaletteModel("businessLightCal",BUSINESS_LIGHT_CALENDAR,BUSINESS_LIGHT_CALENDAR_LINE,BUSINESS_LIGHT_CALENDAR_TEXT,BUSINESS_LIGHT_CALENDAR_TITLE);
         this.businessLightCalendarPalette.initDisplayColors(BUSINESS_LIGHT_FULL_COLOR);
         this.businessDarkCalendarPalette = new ColorPaletteModel("businessDarkCal",BUSINESS_DARK_CALENDAR,BUSINESS_DARK_CALENDAR_LINE,BUSINESS_DARK_CALENDAR_TEXT,BUSINESS_DARK_CALENDAR_TITLE);
         this.businessDarkCalendarPalette.initDisplayColors(BUSINESS_DARK_FULL_COLOR);
         this.retroLightCalendarPalette = new ColorPaletteModel("retroLightCal",RETRO_LIGHT_CALENDAR,RETRO_LIGHT_CALENDAR_LINE,RETRO_LIGHT_CALENDAR_TEXT,RETRO_LIGHT_CALENDAR_TITLE);
         this.retroLightCalendarPalette.initDisplayColors(RETRO_LIGHT_FULL_COLOR);
         this.retroDarkCalendarPalette = new ColorPaletteModel("retroDarkCal",RETRO_DARK_CALENDAR,RETRO_DARK_CALENDAR_LINE,RETRO_DARK_CALENDAR_TEXT,RETRO_DARK_CALENDAR_TITLE);
         this.retroDarkCalendarPalette.initDisplayColors(RETRO_DARK_FULL_COLOR);
         this.pastelLightCalendarPalette = new ColorPaletteModel("pastelLightCal",PASTEL_LIGHT_CALENDAR,PASTEL_LIGHT_CALENDAR_LINE,PASTEL_LIGHT_CALENDAR_TEXT,PASTEL_LIGHT_CALENDAR_TITLE);
         this.pastelLightCalendarPalette.initDisplayColors(PASTEL_LIGHT_FULL_COLOR);
         this.pastelDarkCalendarPalette = new ColorPaletteModel("pastelDarkCal",PASTEL_DARK_CALENDAR,PASTEL_DARK_CALENDAR_LINE,PASTEL_DARK_CALENDAR_TEXT,PASTEL_DARK_CALENDAR_TITLE);
         this.pastelDarkCalendarPalette.initDisplayColors(PASTEL_DARK_FULL_COLOR);
         this.businessLightCalendarPalette.colorSchemeName = "businessLight";
         this.businessDarkCalendarPalette.colorSchemeName = "businessDark";
         this.pastelLightCalendarPalette.colorSchemeName = "pastelLight";
         this.pastelDarkCalendarPalette.colorSchemeName = "pastelDark";
         this.retroLightCalendarPalette.colorSchemeName = "retroLight";
         this.retroDarkCalendarPalette.colorSchemeName = "retroDark";
         this.singleColorAPalette = new ColorPaletteModel("single1",SINGLE_COLOR_A,BUSINESS_LIGHT_LINE,BUSINESS_LIGHT_TEXT);
         this.singleColorAPalette.isSingle = true;
         this.singleColorBPalette = new ColorPaletteModel("single2",SINGLE_COLOR_B,BUSINESS_LIGHT_LINE,BUSINESS_LIGHT_TEXT);
         this.singleColorBPalette.isSingle = true;
         this.singleColorCPalette = new ColorPaletteModel("single3",SINGLE_COLOR_C,BUSINESS_LIGHT_LINE,BUSINESS_LIGHT_TEXT);
         this.singleColorCPalette.isSingle = true;
         this.singleColorDPalette = new ColorPaletteModel("single4",SINGLE_COLOR_D,BUSINESS_LIGHT_LINE,BUSINESS_LIGHT_TEXT);
         this.singleColorDPalette.isSingle = true;
         this.singleColorEPalette = new ColorPaletteModel("single5",SINGLE_COLOR_E,BUSINESS_LIGHT_LINE,BUSINESS_LIGHT_TEXT);
         this.singleColorEPalette.isSingle = true;
         this.addPalette(this.businessLightFullPalette);
         this.addPalette(this.businessDarkFullPalette);
         this.addPalette(this.retroLightFullPalette);
         this.addPalette(this.retroDarkFullPalette);
         this.addPalette(this.pastelLightFullPalette);
         this.addPalette(this.pastelDarkFullPalette);
         this.addPalette(this.businessLightTwoColorPalette);
         this.addPalette(this.businessDarkTwoColorPalette);
         this.addPalette(this.retroLightTwoColorPalette);
         this.addPalette(this.retroDarkTwoColorPalette);
         this.addPalette(this.pastelLightTwoColorPalette);
         this.addPalette(this.pastelDarkTwoColorPalette);
         this.addPalette(this.businessLightOneColorPalette);
         this.addPalette(this.businessDarkOneColorPalette);
         this.addPalette(this.retroLightOneColorPalette);
         this.addPalette(this.retroDarkOneColorPalette);
         this.addPalette(this.pastelLightOneColorPalette);
         this.addPalette(this.pastelDarkOneColorPalette);
         this.addPalette(this.businessLightCalendarPalette);
         this.addPalette(this.businessDarkCalendarPalette);
         this.addPalette(this.retroLightCalendarPalette);
         this.addPalette(this.retroDarkCalendarPalette);
         this.addPalette(this.pastelLightCalendarPalette);
         this.addPalette(this.pastelDarkCalendarPalette);
         this.addPalette(this.singleColorAPalette);
         this.addPalette(this.singleColorBPalette);
         this.addPalette(this.singleColorCPalette);
         this.addPalette(this.singleColorDPalette);
         this.addPalette(this.singleColorEPalette);
         this._styleVariantsLookup = {};
      }
      
      protected function addPalette(param1:ColorPaletteModel) : void
      {
         this._paletteLookup[param1.id] = param1;
      }
      
      public function getColorPalette(param1:String) : ColorPaletteModel
      {
         return this._paletteLookup[param1];
      }
      
      public function getCompatiblePalette(param1:String, param2:String) : ColorPaletteModel
      {
         var _loc3_:String = null;
         switch(param2)
         {
            case WidgetConstants.CHART_TYPE_BAR_CHART:
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
            case WidgetConstants.CHART_TYPE_PIE_CHART:
            case WidgetConstants.CHART_TYPE_RING_CHART:
               _loc3_ = "";
               break;
            case WidgetConstants.CHART_TYPE_PLAIN_COUNTER:
            case WidgetConstants.CHART_TYPE_BAR_COUNTER:
            case WidgetConstants.CHART_TYPE_HORI_BAR_COUNTER:
            case WidgetConstants.CHART_TYPE_PIE_COUNTER:
            case WidgetConstants.CHART_TYPE_RING_COUNTER:
            case WidgetConstants.CHART_TYPE_FILL_ICON:
            case WidgetConstants.CHART_TYPE_REPEAT_ICON:
               _loc3_ = "2";
               break;
            case WidgetConstants.CHART_TYPE_MONTH_CALENDAR:
            case WidgetConstants.CHART_TYPE_DATE_CALENDAR:
               _loc3_ = "Cal";
         }
         var _loc4_:ColorPaletteModel = this.getColorPalette(param1 + _loc3_);
         if(!_loc4_)
         {
            _loc4_ = this.businessLightFullPalette;
         }
         return _loc4_;
      }
      
      public function changeLayoutStyle(param1:WidgetStyleModel, param2:String, param3:String = "default") : void
      {
         param1.clearProperties();
         switch(param2)
         {
            case WidgetConstants.CHART_TYPE_HORI_BAR_CHART:
            case WidgetConstants.CHART_TYPE_HORI_GROUPED_BAR_CHART:
            case WidgetConstants.CHART_TYPE_CINEMATIC_HORI_BAR_CHART:
               this.changeHBarChartLayoutStyle(param1,param3);
               break;
            case WidgetConstants.CHART_TYPE_BAR_CHART:
            case WidgetConstants.CHART_TYPE_GROUPED_BAR_CHART:
            case WidgetConstants.CHART_TYPE_CINEMATIC_BAR_CHART:
               this.changeBarChartLayoutStyle(param1,param3);
               break;
            case WidgetConstants.CHART_TYPE_PIE_CHART:
               this.changePieChartLayoutStyle(param1,param3);
               break;
            case WidgetConstants.CHART_TYPE_RING_CHART:
               this.changeRingChartLayoutStyle(param1,param3);
               break;
            case WidgetConstants.CHART_TYPE_LINE_CHART:
            case WidgetConstants.CHART_TYPE_CINEMATIC_LINE_CHART:
               this.changeLineChartLayoutStyle(param1,param3);
               break;
            case WidgetConstants.CHART_TYPE_AREA_CHART:
            case WidgetConstants.CHART_TYPE_CINEMATIC_AREA_CHART:
               this.changeAreaChartLayoutStyle(param1,param3);
               break;
            case WidgetConstants.CHART_TYPE_PLAIN_COUNTER:
               this.changePlainCounterLayoutStyle(param1,param3);
               break;
            case WidgetConstants.CHART_TYPE_HORI_BAR_COUNTER:
               this.changeHBarCounterLayoutStyle(param1,param3);
               break;
            case WidgetConstants.CHART_TYPE_BAR_COUNTER:
               this.changeBarCounterLayoutStyle(param1,param3);
               break;
            case WidgetConstants.CHART_TYPE_PIE_COUNTER:
               this.changePieCounterLayoutStyle(param1,param3);
               break;
            case WidgetConstants.CHART_TYPE_RING_COUNTER:
               this.changeRingCounterLayoutStyle(param1,param3);
               break;
            case WidgetConstants.CHART_TYPE_MONTH_CALENDAR:
               this.changeCalendarLayoutStyle(param1,param3);
               break;
            case WidgetConstants.CHART_TYPE_DATE_CALENDAR:
               this.changeDateLayoutStyle(param1,param3);
         }
         param1.notifyChange();
      }
      
      private function changeBarChartLayoutStyle(param1:WidgetStyleModel, param2:String) : void
      {
         switch(param2)
         {
            case "default":
            default:
               param1.setProperty("barWidth",25);
               param1.setProperty("gap",15);
               param1.setProperty("lineWeight",2);
               param1.setProperty("offset",2);
               param1.valueBold = true;
               break;
            case "style1":
               param1.setProperty("barWidth",10);
               param1.setProperty("gap",40);
               param1.setProperty("lineWeight",1);
               param1.valueBold = true;
               break;
            case "style2":
               param1.setProperty("barWidth",50);
               param1.setProperty("gap",0);
               param1.setProperty("lineWeight",3);
               param1.setProperty("valuePosition","vertical");
               param1.valueSize = 24;
               param1.valueBold = true;
               break;
            case "style3":
               param1.setProperty("barWidth",20);
               param1.setProperty("gap",8);
               param1.setProperty("lineWeight",4);
               param1.setProperty("offset",2);
               param1.setProperty("border",2);
               param1.setProperty("minBarWidth",10);
               param1.valueBold = true;
               break;
            case "style4":
               param1.setProperty("barWidth",50);
               param1.setProperty("gap",0);
               param1.setProperty("lineWeight",3);
               param1.valueSize = 20;
               param1.valueBold = true;
         }
      }
      
      private function changeHBarChartLayoutStyle(param1:WidgetStyleModel, param2:String) : void
      {
         switch(param2)
         {
            case "default":
            default:
               param1.setProperty("barHeight",25);
               param1.setProperty("gap",15);
               param1.setProperty("lineWeight",2);
               param1.setProperty("offset",2);
               param1.valueBold = true;
               break;
            case "style1":
               param1.setProperty("barHeight",10);
               param1.setProperty("gap",30);
               param1.setProperty("lineWeight",1);
               param1.valueBold = true;
               break;
            case "style2":
               param1.setProperty("barHeight",50);
               param1.setProperty("gap",0);
               param1.setProperty("valuePosition","left");
               param1.setProperty("lineWeight",3);
               param1.valueBold = true;
               param1.valueSize = 20;
               break;
            case "style3":
               param1.setProperty("barHeight",20);
               param1.setProperty("gap",10);
               param1.setProperty("lineWeight",4);
               param1.setProperty("offset",2);
               param1.setProperty("border",2);
               param1.setProperty("minBarHeight",10);
               param1.valueBold = true;
               break;
            case "style4":
               param1.setProperty("barHeight",50);
               param1.setProperty("gap",0);
               param1.setProperty("lineWeight",3);
               param1.valueBold = true;
               param1.valueSize = 20;
         }
      }
      
      private function changeLineChartLayoutStyle(param1:WidgetStyleModel, param2:String) : void
      {
         switch(param2)
         {
            case "default":
            default:
               param1.valueBold = true;
               param1.setProperty("node","solid");
               param1.setProperty("dataLineWeight",3);
               param1.setProperty("lineWeight",1);
               break;
            case "style1":
               param1.valueBold = true;
               param1.setProperty("node","none");
               param1.setProperty("dataLineWeight",1);
               param1.setProperty("lineWeight",2);
               break;
            case "style2":
               param1.valueBold = true;
               param1.setProperty("node","none");
               param1.setProperty("dataLineWeight",5);
               param1.setProperty("lineWeight",1);
               break;
            case "style3":
               param1.valueBold = true;
               param1.setProperty("node","dot");
               param1.setProperty("dataLineWeight",3);
               param1.setProperty("lineWeight",1);
               break;
            case "style4":
               param1.valueBold = true;
               param1.setProperty("node","square");
               param1.setProperty("dataLineWeight",2);
               param1.setProperty("lineWeight",1);
         }
      }
      
      private function changeAreaChartLayoutStyle(param1:WidgetStyleModel, param2:String) : void
      {
         switch(param2)
         {
            case "default":
         }
         param1.valueBold = true;
         param1.setProperty("lineWeight",2);
      }
      
      private function changePieChartLayoutStyle(param1:WidgetStyleModel, param2:String) : void
      {
         switch(param2)
         {
            case "default":
            default:
               param1.dataBold = true;
               param1.valueBold = true;
               param1.setProperty("valuePosition","center");
               param1.setProperty("gap",3);
               break;
            case "style1":
               param1.dataBold = true;
               param1.valueBold = true;
               param1.setProperty("valuePosition","center");
               break;
            case "style2":
               param1.dataBold = true;
               param1.valueBold = true;
               param1.setProperty("valuePosition","center");
               param1.setProperty("offset",3);
               param1.setProperty("lineWeight",3);
         }
      }
      
      private function changeRingChartLayoutStyle(param1:WidgetStyleModel, param2:String) : void
      {
         switch(param2)
         {
            case "default":
            default:
               param1.dataBold = true;
               param1.valueBold = true;
               param1.setProperty("innerRatio",0.6);
               param1.setProperty("valuePosition","center");
               param1.setProperty("gap",2);
               break;
            case "style1":
               param1.dataBold = true;
               param1.valueBold = true;
               param1.setProperty("innerRatio",0.8);
               param1.setProperty("valuePosition","center");
               param1.setProperty("gap",3);
               break;
            case "style2":
               param1.dataBold = true;
               param1.valueBold = true;
               param1.setProperty("innerRatio",0.45);
               param1.setProperty("valuePosition","center");
               break;
            case "style3":
               param1.dataBold = true;
               param1.valueBold = true;
               param1.setProperty("innerRatio",0.6);
               param1.setProperty("valuePosition","center");
               param1.setProperty("offset",2);
               param1.setProperty("lineWeight",2);
         }
      }
      
      private function changePlainCounterLayoutStyle(param1:WidgetStyleModel, param2:String) : void
      {
         switch(param2)
         {
            case "default":
            default:
               param1.dataBold = true;
               param1.dataSize = 120;
               param1.setProperty("valuePosition","right");
               break;
            case "style1":
               param1.dataBold = true;
               param1.dataSize = 120;
               param1.setProperty("valuePosition","middle");
               param1.setProperty("border","circle");
               break;
            case "style2":
               param1.dataBold = true;
               param1.dataSize = 120;
               param1.setProperty("valuePosition","middle");
               param1.setProperty("border","square");
         }
      }
      
      private function changeBarCounterLayoutStyle(param1:WidgetStyleModel, param2:String) : void
      {
         switch(param2)
         {
            case "default":
            default:
               param1.dataSize = 21;
               param1.dataBold = true;
               param1.setProperty("valuePosition","bottom");
               break;
            case "style1":
               param1.dataSize = 24;
               param1.dataBold = true;
               param1.setProperty("valuePosition","vertical");
               break;
            case "style2":
               param1.dataSize = 21;
               param1.dataBold = true;
               param1.setProperty("border",2);
               param1.setProperty("offset",2);
               param1.setProperty("valuePosition","bottom");
         }
      }
      
      private function changeHBarCounterLayoutStyle(param1:WidgetStyleModel, param2:String) : void
      {
         switch(param2)
         {
            case "default":
            default:
               param1.dataSize = 18;
               param1.dataBold = true;
               param1.setProperty("valuePosition","left");
               break;
            case "style1":
               param1.dataSize = 20;
               param1.dataBold = true;
               param1.setProperty("valuePosition","inside");
               break;
            case "style2":
               param1.dataSize = 18;
               param1.dataBold = true;
               param1.setProperty("border",2);
               param1.setProperty("offset",2);
               param1.setProperty("valuePosition","left");
         }
      }
      
      private function changePieCounterLayoutStyle(param1:WidgetStyleModel, param2:String) : void
      {
         switch(param2)
         {
            case "default":
            default:
               param1.dataBold = true;
               param1.dataSize = 18;
               param1.setProperty("gap",2);
               break;
            case "style1":
               param1.dataBold = true;
               param1.dataSize = 18;
               break;
            case "style2":
               param1.dataBold = true;
               param1.dataSize = 18;
               param1.setProperty("lineWeight",2);
               param1.setProperty("offset",2);
         }
      }
      
      private function changeRingCounterLayoutStyle(param1:WidgetStyleModel, param2:String) : void
      {
         switch(param2)
         {
            case "default":
            default:
               param1.dataBold = true;
               param1.dataSize = 30;
               param1.setProperty("gap",2);
               param1.setProperty("innerRatio",0.6);
               param1.setProperty("valuePosition","inside");
               break;
            case "style1":
               param1.dataBold = true;
               param1.dataSize = 18;
               param1.setProperty("gap",2);
               param1.setProperty("innerRatio",0.6);
               param1.setProperty("backgroundOuter",0.1);
               param1.setProperty("backgroundInner",0.7);
               param1.setProperty("valuePosition","inside");
               break;
            case "style2":
               param1.dataBold = true;
               param1.dataSize = 18;
               param1.setProperty("innerRatio",0.48);
               break;
            case "style3":
               param1.dataBold = true;
               param1.dataSize = 18;
               param1.setProperty("innerRatio",0.7);
               param1.setProperty("lineWeight",2);
               param1.setProperty("offset",2);
               param1.setProperty("valuePosition","inside");
         }
      }
      
      private function changeCalendarLayoutStyle(param1:WidgetStyleModel, param2:String) : void
      {
         switch(param2)
         {
            case "default":
            default:
               param1.titleSize = 18;
               param1.dataSize = 13;
               param1.setProperty("lineWeight",4);
               param1.setProperty("drawStyle","normal");
               break;
            case "style1":
               param1.titleSize = 24;
               param1.dataSize = 18;
               param1.setProperty("lineWeight",4);
               param1.setProperty("corner",8);
               param1.setProperty("drawStyle","round");
               break;
            case "style2":
               param1.titleSize = 24;
               param1.dataSize = 12;
               param1.setProperty("corner",10);
               param1.setProperty("lineWeight",4);
               param1.setProperty("drawStyle","ringnote");
         }
      }
      
      private function changeDateLayoutStyle(param1:WidgetStyleModel, param2:String) : void
      {
         switch(param2)
         {
            case "default":
            default:
               param1.titleSize = 18;
               param1.dataSize = 72;
               param1.setProperty("lineWeight",4);
               param1.setProperty("drawStyle","normal");
               break;
            case "style1":
               param1.titleSize = 24;
               param1.dataSize = 72;
               param1.setProperty("lineWeight",4);
               param1.setProperty("corner",8);
               param1.setProperty("drawStyle","round");
               break;
            case "style2":
               param1.titleSize = 24;
               param1.dataSize = 72;
               param1.setProperty("corner",10);
               param1.setProperty("lineWeight",4);
               param1.setProperty("drawStyle","ringnote");
               break;
            case "style3":
               param1.titleSize = 24;
               param1.dataSize = 72;
               param1.setProperty("lineWeight",6);
               param1.setProperty("drawStyle","simple");
         }
      }
      
      public function getStyleVariants(param1:String) : ArrayCollection
      {
         var _loc2_:ArrayCollection = this._styleVariantsLookup[param1];
         if(!_loc2_)
         {
            _loc2_ = this.createStyleVariants(param1);
            this._styleVariantsLookup[param1] = _loc2_;
         }
         return _loc2_;
      }
      
      private function createStyleVariants(param1:String) : ArrayCollection
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         var _loc6_:WidgetStyleVariantModel = null;
         switch(param1)
         {
            default:
            case WidgetConstants.CHART_TYPE_HORI_BAR_CHART:
            case WidgetConstants.CHART_TYPE_HORI_GROUPED_BAR_CHART:
            case WidgetConstants.CHART_TYPE_CINEMATIC_HORI_BAR_CHART:
               _loc3_ = 5;
               _loc2_ = WidgetConstants.CHART_TYPE_HORI_BAR_CHART;
               break;
            case WidgetConstants.CHART_TYPE_BAR_CHART:
            case WidgetConstants.CHART_TYPE_GROUPED_BAR_CHART:
            case WidgetConstants.CHART_TYPE_CINEMATIC_BAR_CHART:
               _loc3_ = 5;
               _loc2_ = WidgetConstants.CHART_TYPE_BAR_CHART;
               break;
            case WidgetConstants.CHART_TYPE_LINE_CHART:
            case WidgetConstants.CHART_TYPE_CINEMATIC_LINE_CHART:
               _loc3_ = 5;
               _loc2_ = WidgetConstants.CHART_TYPE_LINE_CHART;
               break;
            case WidgetConstants.CHART_TYPE_AREA_CHART:
            case WidgetConstants.CHART_TYPE_CINEMATIC_AREA_CHART:
               _loc3_ = 0;
               _loc2_ = WidgetConstants.CHART_TYPE_AREA_CHART;
               break;
            case WidgetConstants.CHART_TYPE_PIE_CHART:
            case WidgetConstants.CHART_TYPE_PIE_COUNTER:
            case WidgetConstants.CHART_TYPE_BAR_COUNTER:
            case WidgetConstants.CHART_TYPE_HORI_BAR_COUNTER:
            case WidgetConstants.CHART_TYPE_PLAIN_COUNTER:
               _loc3_ = 3;
               _loc2_ = param1;
               break;
            case WidgetConstants.CHART_TYPE_RING_CHART:
            case WidgetConstants.CHART_TYPE_RING_COUNTER:
               _loc3_ = 4;
               _loc2_ = param1;
               break;
            case WidgetConstants.CHART_TYPE_MONTH_CALENDAR:
               _loc3_ = 3;
               _loc2_ = param1;
               break;
            case WidgetConstants.CHART_TYPE_DATE_CALENDAR:
               _loc3_ = 4;
               _loc2_ = param1;
         }
         var _loc4_:ArrayCollection = new ArrayCollection();
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc6_ = new WidgetStyleVariantModel();
            _loc6_.id = _loc5_ == 0?DEFAULT_STYLE_VARIANT_ID:STYLE_VARIANT_PREFIX + _loc5_;
            _loc6_.chartType = param1;
            _loc6_.imageName = _loc2_ + "_" + _loc6_.id + ".png";
            _loc4_.addItem(_loc6_);
            _loc5_++;
         }
         return _loc4_;
      }
   }
}
