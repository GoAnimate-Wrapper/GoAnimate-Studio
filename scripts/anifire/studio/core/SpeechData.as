package anifire.studio.core
{
   import anifire.util.UtilDict;
   import anifire.util.UtilXmlInfo;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   public class SpeechData extends EventDispatcher
   {
      
      public static const SOURCE_TYPE_TTS:String = "tts";
      
      public static const SOURCE_TYPE_MIC_RECORDING:String = "mic";
      
      public static const SOURCE_TYPE_VOICE_FILE:String = "file";
      
      public static const SOURCE_TYPE_LIB:String = "lib";
       
      
      private var _text:String;
      
      private var _voice:String;
      
      private var _speed:Number;
      
      private var _pitch:Number;
      
      private var _type:String;
      
      private var _hasZoom:Boolean;
      
      public function SpeechData()
      {
         super();
         this.init();
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
      }
      
      public function get text() : String
      {
         return this._text;
      }
      
      public function set text(param1:String) : void
      {
         if(this._text != param1)
         {
            this._text = param1;
            this.dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      public function get title() : String
      {
         if(this._type == SOURCE_TYPE_MIC_RECORDING)
         {
            return UtilDict.toDisplay("go","Mic Recording");
         }
         return this._text;
      }
      
      public function get voice() : String
      {
         return this._voice;
      }
      
      public function set voice(param1:String) : void
      {
         this._voice = param1;
      }
      
      public function get speed() : Number
      {
         return this._speed;
      }
      
      public function set speed(param1:Number) : void
      {
         this._speed = param1;
      }
      
      public function get pitch() : Number
      {
         return this._pitch;
      }
      
      public function set pitch(param1:Number) : void
      {
         this._pitch = param1;
      }
      
      public function get hasZoom() : Boolean
      {
         return this._hasZoom;
      }
      
      public function set hasZoom(param1:Boolean) : void
      {
         this._hasZoom = param1;
      }
      
      public function convertToXml() : XML
      {
         return new XML(this.serialize());
      }
      
      public function serialize() : String
      {
         var _loc1_:* = "";
         _loc1_ = _loc1_ + "<ttsdata>";
         _loc1_ = _loc1_ + ("<type>" + UtilXmlInfo.cdata(this._type) + "</type>");
         if(this._text != null)
         {
            _loc1_ = _loc1_ + ("<text>" + UtilXmlInfo.cdata(this._text) + "</text>");
         }
         if(this._voice != null)
         {
            _loc1_ = _loc1_ + ("<voice>" + UtilXmlInfo.cdata(this._voice) + "</voice>");
         }
         _loc1_ = _loc1_ + "</ttsdata>";
         return _loc1_;
      }
      
      public function deserialize(param1:XML) : void
      {
         this.init();
         if(param1)
         {
            if(param1.type != null && param1.type.length() > 0)
            {
               this._type = param1.type[0];
            }
            if(param1.text != null && param1.text.length() > 0)
            {
               this._text = param1.text[0];
            }
            if(param1.voice != null && param1.voice.length() > 0)
            {
               this._voice = param1.voice[0];
            }
         }
      }
      
      private function init() : void
      {
         this._speed = 0;
         this._pitch = 0;
         this._type = "tts";
         this._hasZoom = false;
      }
   }
}
