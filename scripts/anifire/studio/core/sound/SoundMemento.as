package anifire.studio.core.sound
{
   import anifire.studio.core.AnimeSound;
   import anifire.studio.core.SoundThumb;
   
   public class SoundMemento
   {
       
      
      private var _startFrame:int;
      
      private var _totalFrame:int;
      
      private var _trimStartFrame:int;
      
      private var _trimEndFrame:int;
      
      private var _track:int;
      
      private var _volume:Number;
      
      private var _soundThumb:SoundThumb;
      
      private var _soundId:String;
      
      private var _sound:AnimeSound;
      
      public function SoundMemento()
      {
         super();
      }
      
      public function saveState(param1:AnimeSound) : void
      {
         this._soundThumb = param1.soundThumb;
         this._startFrame = param1.startFrame;
         this._totalFrame = param1.totalFrame;
         this._trimStartFrame = param1.trimStartFrame;
         this._trimEndFrame = param1.trimEndFrame;
         this._track = param1.trackNum;
         this._volume = param1.volume;
         this._soundId = param1.getID();
         this._sound = param1;
      }
      
      public function restoreState(param1:AnimeSound) : void
      {
         param1.soundThumb = this._soundThumb;
         param1.startFrame = this._startFrame;
         param1.totalFrame = this._totalFrame;
         param1.trimStartFrame = this._trimStartFrame;
         param1.trimEndFrame = this._trimEndFrame;
         param1.trackNum = this._track;
         param1.volume = this._volume;
      }
      
      public function get soundId() : String
      {
         return this._soundId;
      }
   }
}
