package anifire.studio.core
{
   import anifire.constant.ServerConstants;
   import anifire.effect.EffectMgr;
   import anifire.effect.SuperEffect;
   import anifire.event.CoreEvent;
   import anifire.util.UtilCrypto;
   import anifire.util.UtilDict;
   import anifire.util.UtilNetwork;
   import anifire.util.UtilURLStream;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLRequest;
   import flash.net.URLStream;
   import flash.utils.ByteArray;
   import mx.controls.Image;
   import mx.core.FlexGlobals;
   import mx.styles.CSSStyleDeclaration;
   
   public class EffectThumb extends Thumb
   {
      
      public static const TYPE_PROGRAM:String = "program";
      
      public static const TYPE_ANIME:String = "anime";
      
      public static const TYPE_ZOOM:String = "zoom";
      
      public static const TYPE_DRALERT:String = "dra";
      
      public static const TYPE_SEPIA:String = "sepia";
      
      public static const TYPE_GRAYSCALE:String = "grayscale";
      
      public static const TYPE_HOVERING:String = "hovering";
      
      public static const TYPE_BUMPYRIDE:String = "bumpyride";
      
      public static const TYPE_EARTHQUAKE:String = "earthquake";
      
      public static const TYPE_UPSIDEDOWN:String = "upsidedown";
      
      public static const TYPE_FIREWORK:String = "firework";
      
      public static const TYPE_FIRESPRING:String = "firespring";
      
      public static const TYPE_FADING:String = "fading";
      
      public static const XML_NODE_NAME:String = "effect";
       
      
      private var _effectXML:XML;
      
      private var CSSClassDec:CSSStyleDeclaration;
      
      public function EffectThumb()
      {
         var _loc1_:Class = null;
         this.CSSClassDec = FlexGlobals.topLevelApplication.styleManager.getStyleDeclaration(".thumbTrayIcon");
         super();
         if(this.CSSClassDec)
         {
            _loc1_ = this.CSSClassDec.getStyle("iconEffect") as Class;
         }
         this.imageObject = new Image();
         Image(this.imageObject).source = _loc1_;
      }
      
      override public function deSerialize(param1:XML, param2:Theme) : void
      {
         this._effectXML = param1;
         this.id = param1.@id;
         this.aid = param1.@aid;
         this.name = UtilDict.toDisplay("store",param1.@name);
         this.setFileName(EffectMgr.getFileNameInThemeZip(param1,Console.getConsole().metaData.mver));
         this.theme = param2;
         this.enable = param1.@enable == "N"?false:true;
         if(Console.getConsole().excludedIds.containsKey(this.aid))
         {
            this.enable = false;
         }
         if(this.theme.id == "ugc")
         {
            if(this.id.split(".").length <= 1)
            {
               this.setFileName(this.id + ".swf");
            }
            this.tags = param1.tags;
            this.isPublished = param1.@published == "1"?true:false;
         }
      }
      
      public function getNewEffect(param1:XML = null) : SuperEffect
      {
         var _loc2_:SuperEffect = null;
         if(param1 == null)
         {
            _loc2_ = EffectMgr.getEffectByXML(this._effectXML,Console.getConsole().metaData.mver);
         }
         else
         {
            _loc2_ = EffectMgr.getEffectByXML(param1);
         }
         return _loc2_;
      }
      
      public function getType() : String
      {
         if(EffectMgr.getType(this._effectXML) == EffectMgr.TYPE_ANIME)
         {
            return TYPE_ANIME;
         }
         return TYPE_PROGRAM;
      }
      
      public function getExactType() : String
      {
         switch(EffectMgr.getType(this._effectXML))
         {
            case EffectMgr.TYPE_ANIME:
               return TYPE_ANIME;
            case EffectMgr.TYPE_ZOOM:
               return TYPE_ZOOM;
            case EffectMgr.TYPE_EARTHQUAKE:
               return TYPE_EARTHQUAKE;
            case EffectMgr.TYPE_UPSIDEDOWN:
               return TYPE_UPSIDEDOWN;
            case EffectMgr.TYPE_FIREWORK:
               return TYPE_FIREWORK;
            case EffectMgr.TYPE_FIRESPRING:
               return TYPE_FIRESPRING;
            case EffectMgr.TYPE_HOVERING:
               return TYPE_HOVERING;
            case EffectMgr.TYPE_BUMPYRIDE:
               return TYPE_BUMPYRIDE;
            case EffectMgr.TYPE_DRALERT:
               return TYPE_DRALERT;
            case EffectMgr.TYPE_GRAYSCALE:
               return TYPE_GRAYSCALE;
            case EffectMgr.TYPE_SEPIA:
               return TYPE_SEPIA;
            case EffectMgr.TYPE_FADING:
               return TYPE_FADING;
            default:
               return null;
         }
      }
      
      public function getResize() : String
      {
         return EffectMgr.getResize(this._effectXML);
      }
      
      override public function loadImageData() : void
      {
         var _loc1_:URLRequest = null;
         var _loc2_:UtilURLStream = null;
         if(this.getType() == TYPE_ANIME)
         {
            _loc1_ = UtilNetwork.getGetThemeAssetRequest(this.theme.id,this.id,ServerConstants.PARAM_EFFECT);
            _loc2_ = new UtilURLStream();
            _loc2_.addEventListener(Event.COMPLETE,this.loadImageDataComplete);
            _loc2_.addEventListener(UtilURLStream.TIME_OUT,this.onLoadImageDataFail);
            _loc2_.addEventListener(IOErrorEvent.IO_ERROR,this.onLoadImageDataFail);
            _loc2_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onLoadImageDataFail);
            _loc2_.load(_loc1_);
         }
         else
         {
            this.dispatchEvent(new CoreEvent(CoreEvent.LOAD_THUMB_COMPLETE,this));
         }
      }
      
      private function onLoadImageDataFail(param1:Event) : void
      {
      }
      
      override public function loadImageDataComplete(param1:Event) : void
      {
         var _loc4_:UtilCrypto = null;
         var _loc2_:URLStream = URLStream(param1.target);
         var _loc3_:ByteArray = new ByteArray();
         _loc2_.readBytes(_loc3_,0,_loc2_.bytesAvailable);
         this.imageData = _loc3_;
         if(this.theme.id != "ugc")
         {
            _loc4_ = new UtilCrypto();
            _loc4_.decrypt(ByteArray(this.imageData));
         }
         this.dispatchEvent(new CoreEvent(CoreEvent.LOAD_THUMB_COMPLETE,this));
      }
      
      public function get invisibleFX() : Boolean
      {
         var _loc1_:Array = null;
         if(Console.getConsole().metaData.mver > 3)
         {
            _loc1_ = new Array("zoom","cut","pan");
            if(_loc1_.indexOf(this.id) > -1)
            {
               return true;
            }
         }
         return false;
      }
      
      override public function get shouldBeCopyToNextScene() : Boolean
      {
         var _loc2_:String = null;
         var _loc1_:Array = new Array("ncc_ninja_fx04","ncc_ninja_fx03","ncc_ninja_fx01","ncc_fx","ncc_sci","ncc_jp","zoom","cut","pan","circle_fade","black_bar","earthquake","upsideDown","bumpyride","hovering","effect_gray","effect_spedia","dra","DV_screen","water_flood","bomb","ppl","aud","crowd_music","flash_light","gnn_news","old_film","snow","hyper_snow","lightening","fire","ncc_fx_06","ncc_transition01","hp_bar_fx");
         for each(_loc2_ in _loc1_)
         {
            if(this.id.indexOf(_loc2_) == 0)
            {
               return true;
            }
         }
         return false;
      }
   }
}
