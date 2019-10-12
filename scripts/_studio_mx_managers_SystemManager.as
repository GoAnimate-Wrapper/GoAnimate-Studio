package
{
   import anifire.studio.components.StudioPreloader;
   import flash.display.LoaderInfo;
   import flash.system.ApplicationDomain;
   import flash.system.Security;
   import flash.utils.Dictionary;
   import flashx.textLayout.compose.ISWFContext;
   import mx.core.EmbeddedFontRegistry;
   import mx.core.IFlexModule;
   import mx.core.IFlexModuleFactory;
   import mx.core.RSLData;
   import mx.core.Singleton;
   import mx.events.RSLEvent;
   import mx.managers.SystemManager;
   
   public class _studio_mx_managers_SystemManager extends SystemManager implements IFlexModuleFactory, ISWFContext
   {
       
      
      private var _info:Object;
      
      private var _preloadedRSLs:Dictionary;
      
      private var _allowDomainParameters:Vector.<Array>;
      
      private var _allowInsecureDomainParameters:Vector.<Array>;
      
      public function _studio_mx_managers_SystemManager()
      {
         super();
      }
      
      override public function callInContext(param1:Function, param2:Object, param3:Array, param4:Boolean = true) : *
      {
         if(param4)
         {
            return param1.apply(param2,param3);
         }
         param1.apply(param2,param3);
      }
      
      override public function create(... rest) : Object
      {
         if(rest.length > 0 && !(rest[0] is String))
         {
            return super.create.apply(this,rest);
         }
         var _loc2_:String = rest.length == 0?"studio":String(rest[0]);
         var _loc3_:Class = Class(getDefinitionByName(_loc2_));
         if(!_loc3_)
         {
            return null;
         }
         var _loc4_:Object = new _loc3_();
         if(_loc4_ is IFlexModule)
         {
            IFlexModule(_loc4_).moduleFactory = this;
         }
         if(rest.length == 0)
         {
            Singleton.registerClass("mx.core::IEmbeddedFontRegistry",Class(getDefinitionByName("mx.core::EmbeddedFontRegistry")));
            EmbeddedFontRegistry.registerFonts(this.info()["fonts"],this);
         }
         return _loc4_;
      }
      
      override public function info() : Object
      {
         if(!this._info)
         {
            this._info = {
               "applicationComplete":"onApplicationComplete()",
               "backgroundColor":"0xEEEEEE",
               "cdRsls":[[new RSLData("http://fpdownload.adobe.com/pub/swz/flex/4.6.0.23201/framework_4.6.0.23201.swz","http://fpdownload.adobe.com/pub/swz/crossdomain.xml","abd49354324081cebb8f60184cf5fee81f0f9298e64dbec968c96d68fe16c437","SHA-256",true,true,"default"),new RSLData("framework_4.6.0.23201.swz","","abd49354324081cebb8f60184cf5fee81f0f9298e64dbec968c96d68fe16c437","SHA-256",true,true,"default")],[new RSLData("http://fpdownload.adobe.com/pub/swz/tlf/2.0.0.232/textLayout_2.0.0.232.swz","http://fpdownload.adobe.com/pub/swz/crossdomain.xml","8f903698240fe799f61eeda8595181137b996156bb176da70ad6f41645c64c74","SHA-256",true,true,"default"),new RSLData("textLayout_2.0.0.232.swz","","8f903698240fe799f61eeda8595181137b996156bb176da70ad6f41645c64c74","SHA-256",true,true,"default")],[new RSLData("http://fpdownload.adobe.com/pub/swz/flex/4.6.0.23201/spark_4.6.0.23201.swz","http://fpdownload.adobe.com/pub/swz/crossdomain.xml","4bae91dbaef0ceec0fce5505d96ddea865edbfc14dd96e89fb54de12f58432eb","SHA-256",true,true,"default"),new RSLData("spark_4.6.0.23201.swz","","4bae91dbaef0ceec0fce5505d96ddea865edbfc14dd96e89fb54de12f58432eb","SHA-256",true,true,"default")],[new RSLData("http://fpdownload.adobe.com/pub/swz/flex/4.6.0.23201/sparkskins_4.6.0.23201.swz","http://fpdownload.adobe.com/pub/swz/crossdomain.xml","84d36bdf5e2577bfb0b8ce6a12a8646bb1aadddd24c92e5c12d157d44ad7ce61","SHA-256",true,true,"default"),new RSLData("sparkskins_4.6.0.23201.swz","","84d36bdf5e2577bfb0b8ce6a12a8646bb1aadddd24c92e5c12d157d44ad7ce61","SHA-256",true,true,"default")],[new RSLData("http://fpdownload.adobe.com/pub/swz/flex/4.6.0.23201/rpc_4.6.0.23201.swz","http://fpdownload.adobe.com/pub/swz/crossdomain.xml","98eeca3e014a0fa3c4c613006bdcea12da3beace6a8c9eccdde2e07cb486bab5","SHA-256",true,true,"default"),new RSLData("rpc_4.6.0.23201.swz","","98eeca3e014a0fa3c4c613006bdcea12da3beace6a8c9eccdde2e07cb486bab5","SHA-256",true,true,"default")],[new RSLData("http://fpdownload.adobe.com/pub/swz/flex/4.6.0.23201/mx_4.6.0.23201.swz","http://fpdownload.adobe.com/pub/swz/crossdomain.xml","d888aee0ce49f58a35c32eb138edd00f0d6b9fae68b78d7eb83932c09ef0b6f1","SHA-256",true,true,"default"),new RSLData("mx_4.6.0.23201.swz","","d888aee0ce49f58a35c32eb138edd00f0d6b9fae68b78d7eb83932c09ef0b6f1","SHA-256",true,true,"default")]],
               "compiledLocales":["en_US"],
               "compiledResourceBundleNames":["SharedResources","collections","components","containers","controls","core","effects","formatters","layout","skins","sparkEffects","styles","textLayout","utils","validators"],
               "currentDomain":ApplicationDomain.currentDomain,
               "fonts":{
                  "GoAPreview":{
                     "regular":true,
                     "bold":false,
                     "italic":false,
                     "boldItalic":false
                  },
                  "StudioSparkMain":{
                     "regular":true,
                     "bold":true,
                     "italic":true,
                     "boldItalic":false
                  }
               },
               "frameRate":"24",
               "mainClassName":"studio",
               "mixins":["_studio_FlexInit","_studio_Styles","mx.messaging.config.LoaderConfig","mx.managers.systemClasses.ActiveWindowManager"],
               "placeholderRsls":[[new RSLData("http://fpdownload.adobe.com/pub/swz/flex/4.6.0.23201/charts_4.6.0.23201.swz","http://fpdownload.adobe.com/pub/swz/crossdomain.xml","b07e6a4389510e372fc066449e5bcca0f689a3c5e51b5aae55e4a0eeae7f80a6","SHA-256",true,true,"default"),new RSLData("charts_4.6.0.23201.swz","","b07e6a4389510e372fc066449e5bcca0f689a3c5e51b5aae55e4a0eeae7f80a6","SHA-256",true,true,"default")],[new RSLData("http://fpdownload.adobe.com/pub/swz/flex/4.6.0.23201/spark_dmv_4.6.0.23201.swz","http://fpdownload.adobe.com/pub/swz/crossdomain.xml","d38dbc462676d679b79eb7d46887d34b5b33dfe9065751946ea104fd387ec69c","SHA-256",true,true,"default"),new RSLData("spark_dmv_4.6.0.23201.swz","","d38dbc462676d679b79eb7d46887d34b5b33dfe9065751946ea104fd387ec69c","SHA-256",true,true,"default")],[new RSLData("http://fpdownload.adobe.com/pub/swz/flex/4.6.0.23201/osmf_1.0.0.16316.swz","http://fpdownload.adobe.com/pub/swz/crossdomain.xml","b63185fca5d2bdbb568593f2bf232e87e5a20a7ea2ce2e26671d159838d598ed","SHA-256",true,true,"default"),new RSLData("osmf_1.0.0.16316.swz","","b63185fca5d2bdbb568593f2bf232e87e5a20a7ea2ce2e26671d159838d598ed","SHA-256",true,true,"default")],[new RSLData("http://fpdownload.adobe.com/pub/swz/flex/4.6.0.23201/advancedgrids_4.6.0.23201.swz","http://fpdownload.adobe.com/pub/swz/crossdomain.xml","529c81ac00092e51dcd0016be8ba25f6d54c55dd9a3a94f9a67d25a3d1ea6015","SHA-256",true,true,"default"),new RSLData("advancedgrids_4.6.0.23201.swz","","529c81ac00092e51dcd0016be8ba25f6d54c55dd9a3a94f9a67d25a3d1ea6015","SHA-256",true,true,"default")]],
               "preinitialize":"initApp()",
               "preloader":StudioPreloader,
               "usePreloader":true
            };
         }
         return this._info;
      }
      
      override public function get preloadedRSLs() : Dictionary
      {
         if(this._preloadedRSLs == null)
         {
            this._preloadedRSLs = new Dictionary(true);
         }
         return this._preloadedRSLs;
      }
      
      override public function allowDomain(... rest) : void
      {
         var _loc2_:* = null;
         Security.allowDomain.apply(null,rest);
         for(_loc2_ in this._preloadedRSLs)
         {
            if(_loc2_.content && "allowDomainInRSL" in _loc2_.content)
            {
               _loc2_.content["allowDomainInRSL"].apply(null,rest);
            }
         }
         if(!this._allowDomainParameters)
         {
            this._allowDomainParameters = new Vector.<Array>();
         }
         this._allowDomainParameters.push(rest);
         addEventListener(RSLEvent.RSL_ADD_PRELOADED,this.addPreloadedRSLHandler,false,50);
      }
      
      override public function allowInsecureDomain(... rest) : void
      {
         var _loc2_:* = null;
         Security.allowInsecureDomain.apply(null,rest);
         for(_loc2_ in this._preloadedRSLs)
         {
            if(_loc2_.content && "allowInsecureDomainInRSL" in _loc2_.content)
            {
               _loc2_.content["allowInsecureDomainInRSL"].apply(null,rest);
            }
         }
         if(!this._allowInsecureDomainParameters)
         {
            this._allowInsecureDomainParameters = new Vector.<Array>();
         }
         this._allowInsecureDomainParameters.push(rest);
         addEventListener(RSLEvent.RSL_ADD_PRELOADED,this.addPreloadedRSLHandler,false,50);
      }
      
      private function addPreloadedRSLHandler(param1:RSLEvent) : void
      {
         var _loc3_:Array = null;
         var _loc2_:LoaderInfo = param1.loaderInfo;
         if(!_loc2_ || !_loc2_.content)
         {
            return;
         }
         if(allowDomainsInNewRSLs && this._allowDomainParameters)
         {
            for each(_loc3_ in this._allowDomainParameters)
            {
               if("allowDomainInRSL" in _loc2_.content)
               {
                  _loc2_.content["allowDomainInRSL"].apply(null,_loc3_);
               }
            }
         }
         if(allowInsecureDomainsInNewRSLs && this._allowInsecureDomainParameters)
         {
            for each(_loc3_ in this._allowInsecureDomainParameters)
            {
               if("allowInsecureDomainInRSL" in _loc2_.content)
               {
                  _loc2_.content["allowInsecureDomainInRSL"].apply(null,_loc3_);
               }
            }
         }
      }
   }
}
