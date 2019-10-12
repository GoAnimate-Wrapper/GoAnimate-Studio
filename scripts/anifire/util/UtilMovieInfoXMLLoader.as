package anifire.util
{
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   
   public class UtilMovieInfoXMLLoader extends URLLoader
   {
      
      public static const LOAD_COMPLETE:String = "movieinfo_complete";
       
      
      private var _loading:Boolean = false;
      
      private var _xml:XML;
      
      public function UtilMovieInfoXMLLoader()
      {
         super();
      }
      
      public function loadMovieInfo(param1:String) : void
      {
         var _loc2_:URLRequest = null;
         try
         {
            if(!this._loading && param1 && param1 != "")
            {
               _loc2_ = UtilNetwork.getGetMovieInfoRequest(param1);
               if(_loc2_)
               {
                  this.configureListeners(this);
                  this._loading = true;
                  this.load(_loc2_);
                  return;
               }
            }
         }
         catch(err:Error)
         {
         }
         this._loading = false;
         dispatchEvent(new Event(LOAD_COMPLETE));
      }
      
      public function get loading() : Boolean
      {
         return this._loading;
      }
      
      private function configureListeners(param1:IEventDispatcher) : void
      {
         param1.addEventListener(Event.COMPLETE,this.completeHandler);
         param1.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.securityErrorHandler);
         param1.addEventListener(IOErrorEvent.IO_ERROR,this.ioErrorHandler);
      }
      
      private function completeHandler(param1:Event) : void
      {
         try
         {
            this._xml = new XML(param1.target.data);
         }
         catch(err:Error)
         {
         }
         this._loading = false;
         dispatchEvent(new Event(LOAD_COMPLETE));
      }
      
      private function openHandler(param1:Event) : void
      {
      }
      
      private function securityErrorHandler(param1:SecurityErrorEvent) : void
      {
         this._loading = false;
         dispatchEvent(new Event(LOAD_COMPLETE));
      }
      
      private function ioErrorHandler(param1:IOErrorEvent) : void
      {
         this._loading = false;
         dispatchEvent(new Event(LOAD_COMPLETE));
      }
      
      public function get xml() : XML
      {
         return this._xml;
      }
   }
}
