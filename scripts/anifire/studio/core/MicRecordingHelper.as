package anifire.studio.core
{
   import anifire.studio.events.MicRecordingEvent;
   import com.adobe.audio.format.WAVWriter;
   import com.jac.ogg.OggEncoder;
   import com.jac.ogg.events.OggEncoderEvent;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.SampleDataEvent;
   import flash.events.StatusEvent;
   import flash.events.TimerEvent;
   import flash.media.Microphone;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   import flash.system.Security;
   import flash.system.SecurityPanel;
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   import flash.utils.Timer;
   import mx.events.PropertyChangeEvent;
   
   public class MicRecordingHelper extends EventDispatcher
   {
      
      private static var _instance:MicRecordingHelper;
      
      public static const BYTES_PER_CALLBACK:uint = 4096;
       
      
      private var _recordByte:ByteArray;
      
      private var _timer:Timer;
      
      private var _pitchShiftFactor:Number;
      
      private var _soundChart:Array;
      
      private var _soundByte:ByteArray;
      
      private var CHANNEL_LENGTH:uint = 256;
      
      private var _oggBytes:ByteArray;
      
      private var _isPlaying:Boolean;
      
      private var _soundOutput:Sound;
      
      private var _soundChannel:SoundChannel;
      
      private var _volume:Number = 1;
      
      private var _oggEncoder:OggEncoder;
      
      private var _1199874172micRecordedTime:int;
      
      private var _2122989593isRecording:Boolean;
      
      private var _376317529microphoneActivity:Number;
      
      private var _microphone:Microphone;
      
      private var _phase:Number;
      
      private var _1293667902currentPosition:uint;
      
      private var _930295060playbackSpeed:Number = 1;
      
      private var _1381423772bytesSpeed:uint;
      
      public function MicRecordingHelper()
      {
         this._timer = new Timer(1000,20);
         this._soundChart = new Array();
         this._oggBytes = new ByteArray();
         this._1381423772bytesSpeed = this.playbackSpeed * BYTES_PER_CALLBACK;
         super();
         this._soundByte = new ByteArray();
         this._pitchShiftFactor = 0;
      }
      
      public static function getInstance() : MicRecordingHelper
      {
         if(!_instance)
         {
            _instance = new MicRecordingHelper();
         }
         return _instance;
      }
      
      public function set volume(param1:Number) : void
      {
         this._volume = param1;
      }
      
      public function get recordByte() : ByteArray
      {
         return this._recordByte;
      }
      
      public function set recordByte(param1:ByteArray) : void
      {
         this._recordByte = param1;
      }
      
      public function get pitchShiftFactor() : Number
      {
         return this._pitchShiftFactor;
      }
      
      public function set pitchShiftFactor(param1:Number) : void
      {
         this._pitchShiftFactor = param1;
      }
      
      public function get timer() : Timer
      {
         return this._timer;
      }
      
      private function get oggEncoder() : OggEncoder
      {
         if(!this._oggEncoder)
         {
            this._oggEncoder = new OggEncoder();
            this._oggEncoder.addEventListener(OggEncoderEvent.ENCODE_PROGRESS,this.onEncodeProgress);
            this._oggEncoder.addEventListener(OggEncoderEvent.ENCODE_COMPLETE,this.onEncodeComplete);
         }
         return this._oggEncoder;
      }
      
      public function encodeOGG() : void
      {
         this._recordByte = this.shiftBytes(this._recordByte);
         var _loc1_:ByteArray = new ByteArray();
         var _loc2_:WAVWriter = new WAVWriter();
         _loc1_.position = 0;
         _loc1_.endian = Endian.LITTLE_ENDIAN;
         this._recordByte.position = 0;
         _loc2_.processSamples(_loc1_,this._recordByte,_loc2_.samplingRate,1);
         this.oggEncoder.encode(_loc1_);
      }
      
      public function saveOGG() : ByteArray
      {
         return this.oggEncoder.encodedBytes;
      }
      
      private function onEncodeProgress(param1:OggEncoderEvent) : void
      {
         dispatchEvent(param1);
      }
      
      private function onEncodeComplete(param1:OggEncoderEvent) : void
      {
         this._oggBytes = this.oggEncoder.encodedBytes;
         dispatchEvent(new Event(Event.COMPLETE));
      }
      
      public function requestMicrophoneAccess() : void
      {
         this._microphone = Microphone.getMicrophone();
         if(this._microphone)
         {
            this._microphone.rate = 44;
            this._microphone.setSilenceLevel(0,0);
            this._microphone.setLoopBack(false);
            this.micRecordedTime = 0;
            if(this._microphone.muted)
            {
               this._microphone.addEventListener(StatusEvent.STATUS,this.onMicrophoneStatus);
               Security.showSettings(SecurityPanel.PRIVACY);
            }
            else
            {
               dispatchEvent(new MicRecordingEvent(MicRecordingEvent.APPROVED));
            }
         }
         else
         {
            dispatchEvent(new MicRecordingEvent(MicRecordingEvent.DENIED));
         }
      }
      
      private function onMicrophoneTimer(param1:TimerEvent) : void
      {
         this.micRecordedTime = this._timer.currentCount;
         this.dispatchActivityEvent();
      }
      
      private function onMicrophoneTimerComplete(param1:TimerEvent) : void
      {
         this.dispatchActivityEvent();
         this.stopRecording();
      }
      
      private function onMicrophoneStatus(param1:StatusEvent) : void
      {
         if(param1.code == "Microphone.Unmuted")
         {
            dispatchEvent(new MicRecordingEvent(MicRecordingEvent.APPROVED));
         }
         else if(param1.code == "Microphone.Muted")
         {
            dispatchEvent(new MicRecordingEvent(MicRecordingEvent.DENIED));
         }
      }
      
      private function onMicrophoneData(param1:SampleDataEvent) : void
      {
         this._recordByte.writeBytes(param1.data);
         if(!this.timer.running)
         {
            this.timer.start();
         }
         this.dispatchActivityEvent();
      }
      
      private function dispatchActivityEvent() : void
      {
         var _loc1_:MicRecordingEvent = new MicRecordingEvent(MicRecordingEvent.ACTIVITY);
         _loc1_.data = this._microphone.activityLevel;
         dispatchEvent(_loc1_);
      }
      
      public function microphone() : Microphone
      {
         return this._microphone;
      }
      
      public function playRecording() : void
      {
         this.stopRecordingPlayback();
         if(this._recordByte)
         {
            this._recordByte.position = 0;
            this._soundOutput = new Sound();
            this._soundOutput.addEventListener(SampleDataEvent.SAMPLE_DATA,this.onPlaySoundSampleDataHandler);
            this._soundChannel = this._soundOutput.play();
            this._soundChannel.soundTransform = new SoundTransform(this._volume);
            this._soundChannel.addEventListener(Event.SOUND_COMPLETE,this.onSoundChannelComplete);
            this._isPlaying = true;
         }
      }
      
      public function stopRecordingPlayback() : void
      {
         this._isPlaying = false;
         if(this._soundOutput)
         {
            this._soundOutput.removeEventListener(SampleDataEvent.SAMPLE_DATA,this.onPlaySoundSampleDataHandler);
            this._soundOutput = null;
         }
         if(this._soundChannel)
         {
            this._soundChannel.stop();
            this._soundChannel.removeEventListener(Event.SOUND_COMPLETE,this.onSoundChannelComplete);
            this._soundChannel = null;
         }
      }
      
      private function onSoundChannelComplete(param1:Event) : void
      {
         this.stopRecordingPlayback();
         var _loc2_:MicRecordingEvent = new MicRecordingEvent(MicRecordingEvent.OUT_OF_DATA);
         dispatchEvent(_loc2_);
      }
      
      private function onPlaySoundSampleDataHandler(param1:SampleDataEvent) : void
      {
         var _loc3_:Number = NaN;
         if(!this._recordByte.bytesAvailable > 0)
         {
            return;
         }
         var _loc2_:int = 0;
         var _loc4_:ByteArray = new ByteArray();
         while(_loc2_ < 8192)
         {
            _loc3_ = 0;
            if(this._recordByte.bytesAvailable > 0)
            {
               _loc3_ = this._recordByte.readFloat();
            }
            if(this.pitchShiftFactor == 0)
            {
               param1.data.writeFloat(_loc3_);
               param1.data.writeFloat(_loc3_);
            }
            else
            {
               _loc4_.writeFloat(_loc3_);
               _loc4_.writeFloat(_loc3_);
            }
            _loc2_++;
         }
         if(this.pitchShiftFactor == 0)
         {
            return;
         }
         _loc4_ = this.shiftBytes(_loc4_);
         var _loc5_:int = 0;
         _loc4_.position = 0;
         while(_loc5_ < _loc4_.bytesAvailable)
         {
            param1.data.writeFloat(_loc4_.readFloat());
            _loc5_++;
         }
      }
      
      public function startRecording() : void
      {
         this._recordByte = new ByteArray();
         this.micRecordedTime = 0;
         this.isRecording = true;
         this._timer.addEventListener(TimerEvent.TIMER,this.onMicrophoneTimer);
         this._timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onMicrophoneTimerComplete);
         this._microphone.addEventListener(SampleDataEvent.SAMPLE_DATA,this.onMicrophoneData);
         this._timer.reset();
         if(!this.timer.running)
         {
            this.timer.start();
         }
         dispatchEvent(new MicRecordingEvent(MicRecordingEvent.START));
         this.dispatchActivityEvent();
      }
      
      public function stopRecording(param1:Boolean = false) : void
      {
         if(this.isRecording)
         {
            this.isRecording = false;
            this._timer.stop();
            this._timer.removeEventListener(TimerEvent.TIMER,this.onMicrophoneTimer);
            this._timer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onMicrophoneTimerComplete);
            this._microphone.removeEventListener(SampleDataEvent.SAMPLE_DATA,this.onMicrophoneData);
            if(!param1)
            {
               dispatchEvent(new MicRecordingEvent(MicRecordingEvent.STOP));
            }
         }
      }
      
      private function shiftBytes(param1:ByteArray) : ByteArray
      {
         var _loc3_:Number = NaN;
         this.pitchShiftFactor = Math.floor(this.pitchShiftFactor);
         var _loc2_:Number = 0;
         if(this.pitchShiftFactor < 0)
         {
            _loc3_ = -8;
         }
         else
         {
            _loc3_ = 8;
         }
         var _loc4_:Number = this.pitchShiftFactor + 10;
         if(_loc4_ > 10)
         {
            _loc4_ = 20 - _loc4_;
         }
         var _loc5_:ByteArray = new ByteArray();
         param1.position = 0;
         if(this.pitchShiftFactor > 0 && _loc4_ <= 8)
         {
            _loc4_--;
         }
         if(this.pitchShiftFactor > 0 && _loc4_ <= 5)
         {
            _loc4_--;
         }
         while(param1.bytesAvailable > 0)
         {
            if(_loc4_ == 10)
            {
               _loc5_.writeFloat(param1.readFloat());
               _loc5_.writeFloat(param1.readFloat());
            }
            else
            {
               _loc2_++;
               if(_loc2_ <= _loc4_)
               {
                  _loc5_.writeFloat(param1.readFloat());
                  _loc5_.writeFloat(param1.readFloat());
               }
               else
               {
                  param1.position = param1.position + _loc3_;
                  if(_loc3_ < 0)
                  {
                     _loc5_.writeFloat(param1.readFloat());
                     _loc5_.writeFloat(param1.readFloat());
                  }
                  _loc2_ = _loc2_ - _loc4_;
               }
            }
         }
         return _loc5_;
      }
      
      [Bindable(event="propertyChange")]
      public function get micRecordedTime() : int
      {
         return this._1199874172micRecordedTime;
      }
      
      public function set micRecordedTime(param1:int) : void
      {
         var _loc2_:Object = this._1199874172micRecordedTime;
         if(_loc2_ !== param1)
         {
            this._1199874172micRecordedTime = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"micRecordedTime",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get isRecording() : Boolean
      {
         return this._2122989593isRecording;
      }
      
      public function set isRecording(param1:Boolean) : void
      {
         var _loc2_:Object = this._2122989593isRecording;
         if(_loc2_ !== param1)
         {
            this._2122989593isRecording = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"isRecording",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get microphoneActivity() : Number
      {
         return this._376317529microphoneActivity;
      }
      
      public function set microphoneActivity(param1:Number) : void
      {
         var _loc2_:Object = this._376317529microphoneActivity;
         if(_loc2_ !== param1)
         {
            this._376317529microphoneActivity = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"microphoneActivity",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get currentPosition() : uint
      {
         return this._1293667902currentPosition;
      }
      
      private function set currentPosition(param1:uint) : void
      {
         var _loc2_:Object = this._1293667902currentPosition;
         if(_loc2_ !== param1)
         {
            this._1293667902currentPosition = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"currentPosition",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get playbackSpeed() : Number
      {
         return this._930295060playbackSpeed;
      }
      
      private function set playbackSpeed(param1:Number) : void
      {
         var _loc2_:Object = this._930295060playbackSpeed;
         if(_loc2_ !== param1)
         {
            this._930295060playbackSpeed = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"playbackSpeed",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get bytesSpeed() : uint
      {
         return this._1381423772bytesSpeed;
      }
      
      private function set bytesSpeed(param1:uint) : void
      {
         var _loc2_:Object = this._1381423772bytesSpeed;
         if(_loc2_ !== param1)
         {
            this._1381423772bytesSpeed = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bytesSpeed",_loc2_,param1));
            }
         }
      }
   }
}
