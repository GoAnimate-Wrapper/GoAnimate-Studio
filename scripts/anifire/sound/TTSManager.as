package anifire.sound
{
	import anifire.constant.AnimeConstants;
	import anifire.constant.ServerConstants;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	
	public class TTSManager
	{
		 
		
		public function TTSManager()
		{
			super();
		}
		
		public static function isSoundRebuildable(param1:String) : Boolean
		{
			switch(param1)
			{
				case AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_TTS:
				case "free_tts":
					return true;
				default:
					return false;
			}
		}
		
		public static function getRequestOfTextToSpeech(param1:String, param2:String = "") : URLRequest
		{
			var _loc3_:URLRequest = new URLRequest(ServerConstants.ACTION_TEXT_TO_SPEECH);
			var _loc4_:URLVariables = new URLVariables();
			_loc4_["text"] = param1;
			_loc4_["voice"] = param2;
			_loc3_.data = _loc4_;
			_loc3_.method = URLRequestMethod.POST;
			return _loc3_;
		}
	}
}
