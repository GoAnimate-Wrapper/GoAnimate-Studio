package anifire.studio.core
{
   import flash.net.URLStream;
   
   public class ThumbDataLoader extends URLStream
   {
       
      
      public var assetId:String;
      
      public var assetType:String;
      
      public var data:Object;
      
      private var listeners:Vector.<Object>;
      
      public function ThumbDataLoader()
      {
         super();
         this.listeners = new Vector.<Object>();
      }
      
      override public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         var _loc6_:Object = {
            "type":param1,
            "listener":param2
         };
         this.listeners.push(_loc6_);
         super.addEventListener(param1,param2,param3,param4,param5);
      }
      
      override public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         var _loc4_:int = this.listeners.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            if(this.listeners[_loc5_].type == param1 && this.listeners[_loc5_].listener == param2)
            {
               this.listeners.splice(_loc5_,1);
               break;
            }
            _loc5_++;
         }
         super.removeEventListener(param1,param2,param3);
      }
      
      public function removeAllEventListeners() : void
      {
         var _loc1_:int = this.listeners.length;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            super.removeEventListener(this.listeners[_loc2_].type,this.listeners[_loc2_].listener);
            _loc2_++;
         }
         this.listeners.splice(0,this.listeners.length);
      }
   }
}
