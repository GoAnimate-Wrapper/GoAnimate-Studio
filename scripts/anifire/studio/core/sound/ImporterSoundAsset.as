package anifire.studio.core.sound
{
   import anifire.event.AVM1SoundEvent;
   import anifire.sound.AVM1Sound;
   import flash.display.AVM1Movie;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.utils.ByteArray;
   
   public class ImporterSoundAsset extends EventDispatcher
   {
       
      
      private var _avm1Sound:AVM1Sound;
      
      private var _byteArray:ByteArray = null;
      
      private var _isReadyToPlay:Boolean = false;
      
      public function ImporterSoundAsset()
      {
         super();
      }
      
      public function get byteArray() : ByteArray
      {
         return this._byteArray;
      }
      
      public function initByByteArray(param1:ByteArray) : void
      {
         var loader:Loader = null;
         var byteArray:ByteArray = param1;
         try
         {
            this._byteArray = byteArray;
            loader = new Loader();
            loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.doInitAVMsound);
            loader.loadBytes(byteArray as ByteArray);
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      private function doInitAVMsound(param1:Event) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.doInitAVMsound);
         this._avm1Sound = new AVM1Sound();
         this._avm1Sound.addEventListener(AVM1SoundEvent.SOUND_INIT_COMPLETE,this.doDispatchCompleteEvent);
         this._avm1Sound.init(LoaderInfo(param1.target).content as AVM1Movie);
      }
      
      private function doDispatchCompleteEvent(param1:AVM1SoundEvent) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.doDispatchCompleteEvent);
         var _loc2_:SoundEvent = new SoundEvent(SoundEvent.READY_TO_PLAY,this);
         this._isReadyToPlay = true;
         this.dispatchEvent(_loc2_);
      }
      
      public function play(param1:Number = 0) : void
      {
         this._avm1Sound.addEventListener(AVM1SoundEvent.SOUND_COMPLETE,this.doSayPlayComplete);
         this._avm1Sound.gotoAndPlay(param1);
         this.dispatchEvent(new SoundEvent(SoundEvent.PLAYED,this));
      }
      
      public function stop() : void
      {
         if(this._avm1Sound != null)
         {
            this._avm1Sound.stop();
            this.dispatchEvent(new SoundEvent(SoundEvent.STOPPED,this));
         }
      }
      
      public function getDuration() : Number
      {
         return this._avm1Sound.getDuration();
      }
      
      public function get isReady() : Boolean
      {
         return this._isReadyToPlay;
      }
      
      private function doSayPlayComplete(param1:Event) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.doSayPlayComplete);
         this.dispatchEvent(new SoundEvent(SoundEvent.PLAY_COMPLETE,this));
         this.dispatchEvent(new SoundEvent(SoundEvent.STOPPED,this));
      }
   }
}
