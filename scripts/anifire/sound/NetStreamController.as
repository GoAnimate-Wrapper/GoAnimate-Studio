package anifire.sound
{
   import anifire.event.NetStreamClientEvent;
   import anifire.util.UtilCrypto;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.NetStatusEvent;
   import flash.media.SoundTransform;
   import flash.net.NetConnection;
   import flash.net.NetStream;
   import flash.utils.setTimeout;
   
   public class NetStreamController extends EventDispatcher
   {
      
      private static const isDebug:Boolean = true;
      
      public static const CONNECT_STATE__NOT_CONNECT:int = 0;
      
      public static const CONNECT_STATE__CONNECTING:int = 1;
      
      public static const CONNECT_STATE__CONNECTED:int = 2;
      
      private static const PLAYHEAD_STATUS__NULL:int = 0;
      
      private static const PLAYHEAD_STATUS__PLAYING:int = 1;
      
      private static const PLAYHEAD_STATUS__PAUSED:int = 2;
      
      private static const TIME_TOLERANCE:Number = 0.1;
       
      
      private const TIME_INTERVAL:Number = 100;
      
      private const MAX_TIME_INTERVAL:Number = 800;
      
      private var playHeadCommands:Array;
      
      private var _netConnetion:NetConnection;
      
      private var _netStream:NetStream;
      
      private var _netClient:NetStreamClient;
      
      private var _playHeadStatus:int = 0;
      
      private var _netConnectionStatus:int = 0;
      
      private var _url:String;
      
      private var _filename:String;
      
      private var _duration_in_second:Number = 0;
      
      private var _bufferLength:Number = 0;
      
      private var _soundTransform:SoundTransform;
      
      private var _position_snapshot_before_seek:Number;
      
      private var _seek_time_interval:Number;
      
      private var _assume_seek_time_ready:Boolean;
      
      public function NetStreamController(param1:Number)
      {
         this.playHeadCommands = new Array();
         this._soundTransform = new SoundTransform();
         super();
         this._duration_in_second = param1;
         this.addPlayHeadCommand(new PlayHeadCommand(PlayHeadCommand.PLAYHEAD_COMMAND_PAUSE,0));
      }
      
      private function get playHeadStatus() : int
      {
         return this._playHeadStatus;
      }
      
      private function set playHeadStatus(param1:int) : void
      {
         this._playHeadStatus = param1;
      }
      
      public function get netConnectionStatus() : int
      {
         return this._netConnectionStatus;
      }
      
      public function set netConnectionStatus(param1:int) : void
      {
         this._netConnectionStatus = param1;
      }
      
      private function get netConnection() : NetConnection
      {
         return this._netConnetion;
      }
      
      private function set netConnection(param1:NetConnection) : void
      {
         this._netConnetion = param1;
      }
      
      private function get netStream() : NetStream
      {
         return this._netStream;
      }
      
      private function set netStream(param1:NetStream) : void
      {
         this._netStream = param1;
      }
      
      private function get netClient() : NetStreamClient
      {
         return this._netClient;
      }
      
      private function set netClient(param1:NetStreamClient) : void
      {
         this._netClient = param1;
      }
      
      public function get duration_in_second() : Number
      {
         return this._duration_in_second;
      }
      
      private function addPlayHeadCommand(param1:PlayHeadCommand) : void
      {
         var _loc4_:PlayHeadCommand = null;
         var _loc5_:PlayHeadCommand = null;
         var _loc2_:Boolean = false;
         if(this.netConnectionStatus == CONNECT_STATE__CONNECTED && this.playHeadCommands.length <= 0)
         {
            _loc2_ = true;
         }
         var _loc3_:PlayHeadCommand = new PlayHeadCommand(PlayHeadCommand.PLAYHEAD_COMMAND_SEPERATOR,0);
         this.playHeadCommands.push(param1);
         this.playHeadCommands.push(_loc3_);
         if(param1.playHeadCommand == PlayHeadCommand.PLAYHEAD_COMMAND_SEEK)
         {
            _loc4_ = new PlayHeadCommand(PlayHeadCommand.PLAYHEAD_COMMAND_SEPERATOR,0);
            _loc5_ = new PlayHeadCommand(PlayHeadCommand.PLAYHEAD_COMMAND_SEPERATOR,0);
            if(this.playHeadStatus == PLAYHEAD_STATUS__PAUSED)
            {
               this.playHeadCommands.push(new PlayHeadCommand(PlayHeadCommand.PLAYHEAD_COMMAND_RESUME));
               this.playHeadCommands.push(_loc4_);
               this.playHeadCommands.push(new PlayHeadCommand(PlayHeadCommand.PLAYHEAD_COMMAND_PAUSE));
               this.playHeadCommands.push(_loc5_);
            }
            else if(this.playHeadStatus == PLAYHEAD_STATUS__PLAYING)
            {
               this.playHeadCommands.push(new PlayHeadCommand(PlayHeadCommand.PLAYHEAD_COMMAND_PAUSE));
               this.playHeadCommands.push(_loc4_);
               this.playHeadCommands.push(new PlayHeadCommand(PlayHeadCommand.PLAYHEAD_COMMAND_RESUME));
               this.playHeadCommands.push(_loc5_);
            }
         }
         if(_loc2_)
         {
            this.execPlayHeadCommand();
         }
      }
      
      private function execPlayHeadCommand() : void
      {
         var _loc1_:PlayHeadCommand = null;
         var _loc2_:Number = NaN;
         if(this.playHeadCommands.length > 0)
         {
            _loc1_ = this.playHeadCommands.shift() as PlayHeadCommand;
            if(_loc1_.playHeadCommand == PlayHeadCommand.PLAYHEAD_COMMAND_PAUSE)
            {
               this.netStream.addEventListener(NetStatusEvent.NET_STATUS,this.doExecOnPauseReady);
               this.netStream.pause();
            }
            else if(_loc1_.playHeadCommand == PlayHeadCommand.PLAYHEAD_COMMAND_RESUME)
            {
               this.netStream.addEventListener(NetStatusEvent.NET_STATUS,this.doExecOnResumeReady);
               this.netStream.resume();
            }
            else if(_loc1_.playHeadCommand == PlayHeadCommand.PLAYHEAD_COMMAND_SEEK)
            {
               _loc2_ = _loc1_.time_in_second - TIME_TOLERANCE;
               if(_loc2_ <= 0)
               {
                  _loc2_ = 0;
               }
               if(Math.abs(_loc2_ - this.netStream.time) < TIME_TOLERANCE)
               {
                  this._seek_time_interval = this.MAX_TIME_INTERVAL;
                  this._assume_seek_time_ready = true;
               }
               else
               {
                  this._seek_time_interval = this.TIME_INTERVAL;
                  this._assume_seek_time_ready = false;
               }
               this._position_snapshot_before_seek = this.netStream.time;
               this.netStream.addEventListener(NetStatusEvent.NET_STATUS,this.doExecOnSeekReady);
               this.netStream.seek(_loc2_);
            }
         }
      }
      
      private function doExecOnPauseReady(param1:NetStatusEvent) : void
      {
         var _loc2_:String = param1.info.code as String;
         if(_loc2_ == "NetStream.Pause.Notify" || _loc2_ == "NetStream.Buffer.Flush")
         {
            (param1.target as IEventDispatcher).removeEventListener(param1.type,this.doExecOnPauseReady);
            this.proceedToNextCommand();
         }
      }
      
      private function doExecOnSeekReady(param1:NetStatusEvent) : void
      {
         var _loc2_:String = param1.info.code as String;
         if(_loc2_ == "NetStream.Seek.Notify" || _loc2_ == "NetStream.Buffer.Flush")
         {
            (param1.target as IEventDispatcher).removeEventListener(param1.type,this.doExecOnSeekReady);
            setTimeout(this.onPositionReadyAfterSeek,this._seek_time_interval,this._position_snapshot_before_seek);
         }
      }
      
      private function onPositionReadyAfterSeek(param1:Number) : void
      {
         if(!this._assume_seek_time_ready && param1 == this.netStream.time)
         {
            setTimeout(this.onPositionReadyAfterSeek,this._seek_time_interval,param1);
         }
         else
         {
            this.proceedToNextCommand();
         }
      }
      
      private function doExecOnResumeReady(param1:NetStatusEvent) : void
      {
         var _loc2_:String = param1.info.code as String;
         if(_loc2_ == "NetStream.Unpause.Notify" || _loc2_ == "NetStream.Play.Start")
         {
            (param1.target as IEventDispatcher).removeEventListener(param1.type,this.doExecOnResumeReady);
            this.proceedToNextCommand();
         }
      }
      
      private function proceedToNextCommand() : void
      {
         this.playHeadCommands.shift();
         this.execPlayHeadCommand();
      }
      
      public function get position() : Number
      {
         if(this.netConnectionStatus == CONNECT_STATE__CONNECTED)
         {
            return this.netStream.time;
         }
         return 0;
      }
      
      public function get bufferLength() : Number
      {
         if(this.netConnectionStatus == CONNECT_STATE__CONNECTED)
         {
            return this.netStream.bufferLength;
         }
         return 0;
      }
      
      public function set soundTransform(param1:SoundTransform) : void
      {
         this._soundTransform = param1;
         if(this.netConnectionStatus == CONNECT_STATE__CONNECTED)
         {
            this.netStream.soundTransform = this._soundTransform;
         }
      }
      
      public function get soundTransform() : SoundTransform
      {
         return this._soundTransform;
      }
      
      public function resume() : void
      {
         if(this.netConnectionStatus == CONNECT_STATE__CONNECTED)
         {
            this.netStream.soundTransform = this.soundTransform;
            this.addPlayHeadCommand(new PlayHeadCommand(PlayHeadCommand.PLAYHEAD_COMMAND_RESUME));
         }
         this.playHeadStatus = PLAYHEAD_STATUS__PLAYING;
      }
      
      public function pause() : void
      {
         if(this.netConnectionStatus == CONNECT_STATE__CONNECTED)
         {
            this.addPlayHeadCommand(new PlayHeadCommand(PlayHeadCommand.PLAYHEAD_COMMAND_PAUSE));
         }
         this.playHeadStatus = PLAYHEAD_STATUS__PAUSED;
      }
      
      public function seek(param1:Number) : void
      {
         var _loc2_:Number = NaN;
         if(this.netConnectionStatus == CONNECT_STATE__CONNECTED)
         {
            _loc2_ = 0.2;
            this.addPlayHeadCommand(new PlayHeadCommand(PlayHeadCommand.PLAYHEAD_COMMAND_SEEK,param1));
         }
      }
      
      public function load(param1:String, param2:String) : void
      {
         if(this.netConnectionStatus == CONNECT_STATE__NOT_CONNECT)
         {
            this.netConnectionStatus = CONNECT_STATE__CONNECTING;
            this._url = param1;
            this._filename = param2;
            this.netConnection = new NetConnection();
            this.netConnection.addEventListener(NetStatusEvent.NET_STATUS,this.doStartLoadNetstream);
            this.netConnection.connect(this._url);
            if(isDebug)
            {
               this.netConnection.addEventListener(NetStatusEvent.NET_STATUS,this.doTraceNetstatus);
            }
         }
      }
      
      private function doStartLoadNetstream(param1:NetStatusEvent) : void
      {
         var _loc2_:String = null;
         var _loc3_:UtilCrypto = null;
         var _loc4_:String = null;
         if(param1.info.code == "NetConnection.Connect.Success")
         {
            (param1.target as IEventDispatcher).removeEventListener(param1.type,this.doTraceNetstatus);
            _loc2_ = param1.info.secureToken;
            if(_loc2_ != null)
            {
               _loc3_ = new UtilCrypto(UtilCrypto.MODE_DECRYPT_RTMPE_TOKEN);
               _loc4_ = _loc3_.decryptString(_loc2_);
               this.netConnection.call("secureTokenResponse",null,_loc4_);
            }
            this.netStream = new NetStream(this.netConnection);
            this.netStream.bufferTime = 1;
            if(isDebug)
            {
               this.netStream.addEventListener(NetStatusEvent.NET_STATUS,this.doTraceNetstatus);
            }
            this.netStream.addEventListener(NetStatusEvent.NET_STATUS,this.doInitializePlayHead);
            this.netClient = new NetStreamClient();
            this.netClient.addEventListener(NetStreamClientEvent.PLAY_STATUS_READY,this.doSayPlayComplete);
            this.netClient.addEventListener(NetStreamClientEvent.META_DATA_READY,this.doUpdateDuration);
            this.netStream.client = this.netClient;
            this.netStream.soundTransform = this.soundTransform;
            this.netStream.play("mp3:" + this._filename);
         }
      }
      
      private function doInitializePlayHead(param1:NetStatusEvent) : void
      {
         if(param1.info.code == "NetStream.Play.Start")
         {
            (param1.target as IEventDispatcher).removeEventListener(param1.type,this.doInitializePlayHead);
            this.netConnectionStatus = CONNECT_STATE__CONNECTED;
            this.execPlayHeadCommand();
         }
      }
      
      private function doSayPlayComplete(param1:NetStreamClientEvent) : void
      {
         if(param1.infoObject.code == "NetStream.Play.Complete")
         {
            (param1.target as IEventDispatcher).removeEventListener(param1.type,this.doSayPlayComplete);
            this.dispatchEvent(new Event(Event.SOUND_COMPLETE));
         }
      }
      
      private function doUpdateDuration(param1:NetStreamClientEvent) : void
      {
         if(param1.infoObject.duration != null)
         {
            (param1.target as IEventDispatcher).removeEventListener(param1.type,this.doUpdateDuration);
            this._duration_in_second = param1.infoObject.duration as Number;
         }
      }
      
      private function doTraceNetstatus(param1:NetStatusEvent) : void
      {
         this.traceInfo("net status event trigger: ",param1.info);
      }
      
      private function traceInfo(param1:String, param2:Object) : void
      {
         var _loc3_:* = null;
         for(_loc3_ in param2)
         {
         }
      }
   }
}

class PlayHeadCommand
{
   
   public static const PLAYHEAD_COMMAND_SEPERATOR:int = 0;
   
   public static const PLAYHEAD_COMMAND_RESUME:int = 1;
   
   public static const PLAYHEAD_COMMAND_PAUSE:int = 2;
   
   public static const PLAYHEAD_COMMAND_SEEK:int = 3;
    
   
   public var playHeadCommand:int;
   
   public var time_in_second:Number;
   
   function PlayHeadCommand(param1:int, param2:Number = 0)
   {
      super();
      this.playHeadCommand = param1;
      this.time_in_second = param2;
   }
}
