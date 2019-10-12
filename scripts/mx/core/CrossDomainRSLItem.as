package mx.core
{
   import flash.display.Loader;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.system.Security;
   import flash.utils.ByteArray;
   import mx.events.RSLEvent;
   import mx.utils.LoaderUtil;
   import mx.utils.SHA256;
   
   use namespace mx_internal;
   
   public class CrossDomainRSLItem extends RSLItem
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      private var rsls:Array;
      
      private var urlIndex:int = 0;
      
      private var loadBytesLoader:Loader;
      
      public function CrossDomainRSLItem(param1:Array, param2:String = null, param3:IFlexModuleFactory = null)
      {
         this.rsls = [];
         super(param1[0].rslURL,param2,param3);
         this.rsls = param1;
      }
      
      private function get currentRSLData() : RSLData
      {
         return RSLData(this.rsls[this.urlIndex]);
      }
      
      override public function load(param1:Function, param2:Function, param3:Function, param4:Function, param5:Function) : void
      {
         chainedProgressHandler = param1;
         chainedCompleteHandler = param2;
         chainedIOErrorHandler = param3;
         chainedSecurityErrorHandler = param4;
         chainedRSLErrorHandler = param5;
         var _loc6_:RSLData = this.currentRSLData;
         urlRequest = new URLRequest(LoaderUtil.createAbsoluteURL(rootURL,_loc6_.rslURL));
         var _loc7_:URLLoader = new URLLoader();
         _loc7_.dataFormat = URLLoaderDataFormat.BINARY;
         _loc7_.addEventListener(ProgressEvent.PROGRESS,itemProgressHandler);
         _loc7_.addEventListener(Event.COMPLETE,this.itemCompleteHandler);
         _loc7_.addEventListener(IOErrorEvent.IO_ERROR,this.itemErrorHandler);
         _loc7_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.itemErrorHandler);
         if(_loc6_.policyFileURL != "")
         {
            Security.loadPolicyFile(_loc6_.policyFileURL);
         }
         if(_loc6_.isSigned)
         {
            urlRequest.digest = _loc6_.digest;
         }
         _loc7_.load(urlRequest);
      }
      
      private function completeCdRslLoad(param1:URLLoader) : Boolean
      {
         var _loc4_:Boolean = false;
         var _loc5_:String = null;
         var _loc6_:Boolean = false;
         var _loc7_:ErrorEvent = null;
         if(param1 == null || param1.data == null || ByteArray(param1.data).bytesAvailable == 0)
         {
            return true;
         }
         this.loadBytesLoader = new Loader();
         var _loc2_:LoaderContext = new LoaderContext();
         var _loc3_:RSLData = this.currentRSLData;
         if(_loc3_.moduleFactory)
         {
            _loc2_.applicationDomain = _loc3_.moduleFactory.info()["currentDomain"];
         }
         else if(moduleFactory)
         {
            _loc2_.applicationDomain = moduleFactory.info()["currentDomain"];
         }
         else
         {
            _loc2_.applicationDomain = ApplicationDomain.currentDomain;
         }
         _loc2_.securityDomain = null;
         _loc2_.allowCodeImport = true;
         if(_loc3_.digest != null && _loc3_.verifyDigest)
         {
            _loc4_ = false;
            if(!_loc3_.isSigned)
            {
               if(_loc3_.hashType == SHA256.TYPE_ID)
               {
                  _loc5_ = null;
                  if(param1.data != null)
                  {
                     _loc5_ = SHA256.computeDigest(param1.data);
                  }
                  if(_loc5_ == _loc3_.digest)
                  {
                     _loc4_ = true;
                  }
               }
            }
            else
            {
               _loc4_ = true;
            }
            if(!_loc4_)
            {
               _loc6_ = this.hasFailover();
               _loc7_ = new ErrorEvent(RSLEvent.RSL_ERROR);
               _loc7_.text = "Flex Error #1001: Digest mismatch with RSL " + urlRequest.url + ". Redeploy the matching RSL or relink your application with the matching library.";
               this.itemErrorHandler(_loc7_);
               return !_loc6_;
            }
         }
         this.loadBytesLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.loadBytesCompleteHandler);
         this.loadBytesLoader.loadBytes(param1.data,_loc2_);
         return true;
      }
      
      public function hasFailover() : Boolean
      {
         return this.rsls.length > this.urlIndex + 1;
      }
      
      public function loadFailover() : void
      {
         if(this.urlIndex < this.rsls.length)
         {
            trace("Failed to load RSL " + this.currentRSLData.rslURL);
            trace("Failing over to RSL " + RSLData(this.rsls[this.urlIndex + 1]).rslURL);
            this.urlIndex++;
            url = this.currentRSLData.rslURL;
            this.load(chainedProgressHandler,chainedCompleteHandler,chainedIOErrorHandler,chainedSecurityErrorHandler,chainedRSLErrorHandler);
         }
      }
      
      override public function itemCompleteHandler(param1:Event) : void
      {
         this.completeCdRslLoad(param1.target as URLLoader);
      }
      
      override public function itemErrorHandler(param1:ErrorEvent) : void
      {
         if(this.hasFailover())
         {
            trace(decodeURI(param1.text));
            this.loadFailover();
         }
         else
         {
            super.itemErrorHandler(param1);
         }
      }
      
      private function loadBytesCompleteHandler(param1:Event) : void
      {
         this.loadBytesLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.loadBytesCompleteHandler);
         this.loadBytesLoader = null;
         super.itemCompleteHandler(param1);
      }
   }
}
