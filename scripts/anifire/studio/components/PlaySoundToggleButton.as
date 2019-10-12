package anifire.studio.components
{
   import anifire.event.CoreEvent;
   import anifire.studio.core.AnimeSound;
   import anifire.studio.core.SoundThumb;
   import anifire.studio.core.sound.ISoundable;
   import anifire.studio.core.sound.SoundEvent;
   import anifire.studio.managers.SoundPlaybackManager;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import mx.core.IFlexModuleFactory;
   import spark.components.ToggleButton;
   
   public class PlaySoundToggleButton extends ToggleButton
   {
       
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _sound:ISoundable;
      
      private var _soundThumb:SoundThumb;
      
      private var _animeSound:AnimeSound;
      
      private var _volume:Number = 1;
      
      public function PlaySoundToggleButton()
      {
         super();
         this.buttonMode = true;
         this.addEventListener("click",this.___PlaySoundToggleButton_ToggleButton1_click);
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      public function set volume(param1:Number) : void
      {
         this._volume = param1;
      }
      
      public function set animeSound(param1:AnimeSound) : void
      {
         this._animeSound = param1;
         if(this._animeSound && this._animeSound.soundThumb)
         {
            this.sound#1 = this._animeSound.soundThumb.sound#1;
         }
         else
         {
            this.sound#1 = null;
         }
      }
      
      public function set soundThumb(param1:SoundThumb) : void
      {
         if(this._soundThumb)
         {
            this._soundThumb.removeEventListener(CoreEvent.LOAD_THUMB_COMPLETE,this.onSoundThumbLoaded);
         }
         this._soundThumb = param1;
         if(this._soundThumb)
         {
            this.sound#1 = this._soundThumb.sound#1;
            this._soundThumb.addEventListener(CoreEvent.LOAD_THUMB_COMPLETE,this.onSoundThumbLoaded);
         }
         else
         {
            this.sound#1 = null;
         }
      }
      
      private function onSoundThumbLoaded(param1:Event) : void
      {
         if(this._soundThumb)
         {
            this.sound#1 = this._soundThumb.sound#1;
         }
      }
      
      public function set sound#1(param1:ISoundable) : void
      {
         if(this._sound != param1)
         {
            if(this._sound)
            {
               this._sound.removeEventListener(SoundEvent.STOPPED,this.onSoundStopped);
               this._sound.removeEventListener(SoundEvent.PLAYED,this.onSoundPlayed);
            }
            this._sound = param1;
            if(this._sound)
            {
               this.selected = this._sound.isPlaying;
               this._sound.addEventListener(SoundEvent.STOPPED,this.onSoundStopped);
               this._sound.addEventListener(SoundEvent.PLAYED,this.onSoundPlayed);
            }
         }
      }
      
      private function onSoundPlayed(param1:Event) : void
      {
         this.selected = true;
      }
      
      private function onSoundStopped(param1:Event) : void
      {
         this.selected = false;
      }
      
      public function stopSound() : void
      {
         if(this._animeSound)
         {
            this._animeSound.stopSound();
         }
         else if(this._soundThumb)
         {
            SoundPlaybackManager.stop();
         }
         else if(this._sound)
         {
            this._sound.stop();
         }
      }
      
      private function onClick() : void
      {
         if(this._animeSound)
         {
            if(this.selected)
            {
               this._animeSound.volume = this._volume;
               this._animeSound.previewSound();
            }
            else
            {
               this._animeSound.stopSound();
            }
         }
         else if(this._soundThumb)
         {
            if(this.selected)
            {
               SoundPlaybackManager.playSoundThumb(this._soundThumb,0,null,this._volume,-1,0,0,0,0,false);
            }
            else
            {
               SoundPlaybackManager.stop();
            }
         }
         else if(this._sound)
         {
            if(this.selected)
            {
               this._sound.play(0,null,this._volume,-1,0,0,0,0,false);
            }
            else
            {
               this._sound.stop();
            }
         }
      }
      
      public function ___PlaySoundToggleButton_ToggleButton1_click(param1:MouseEvent) : void
      {
         this.onClick();
      }
   }
}
