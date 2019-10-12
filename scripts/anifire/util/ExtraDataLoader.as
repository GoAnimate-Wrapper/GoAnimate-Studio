package anifire.util
{
   import anifire.event.ExtraDataEvent;
   import anifire.interfaces.IRegulatedProcess;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class ExtraDataLoader extends Loader implements IRegulatedProcess
   {
       
      
      public var extraData;
      
      private var _bytes:ByteArray;
      
      public function ExtraDataLoader()
      {
         super();
      }
      
      private function set bytes(param1:ByteArray) : void
      {
         this._bytes = param1;
      }
      
      override public function dispatchEvent(param1:Event) : Boolean
      {
         var _loc2_:ExtraDataEvent = new ExtraDataEvent(param1.type,new Object(),this.extraData,param1.bubbles,param1.cancelable);
         return super.dispatchEvent(_loc2_);
      }
      
      public function writeExternal(param1:IDataOutput) : void
      {
         param1.writeObject(this.extraData);
      }
      
      public function readExternal(param1:IDataInput) : void
      {
         this.extraData = param1.readObject();
      }
      
      override public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         super.addEventListener(param1,param2,param3,param4,true);
      }
      
      public function startProcess(param1:Boolean = false, param2:Number = 0) : void
      {
         this.loadBytes(this._bytes);
      }
   }
}
