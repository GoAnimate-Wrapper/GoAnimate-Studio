package anifire.studio.commands
{
   import anifire.studio.core.AnimeSound;
   import anifire.studio.core.Console;
   import anifire.studio.managers.StudioSoundManager;
   
   public class SplitSoundCommand extends AbstractSoundCommand
   {
       
      
      private var _frameToSplit:int;
      
      private var _oldTotalFrame:int;
      
      private var _trimSoundCommand:TrimSoundCommand;
      
      private var _addSoundCommand:AddSoundCommand;
      
      private var _addlinkageCommand:CollectiveCommand;
      
      private var _changeFadingCommand:ChangeSoundFadingCommand;
      
      private var _removeFadingCommand:RemoveSoundFadingCommand;
      
      private var _changeVolumeCommand:ChangeVolumeCommand;
      
      public function SplitSoundCommand(param1:AnimeSound, param2:int, param3:Boolean = true)
      {
         super(param1,param3);
         this._frameToSplit = param2;
         _type = "SplitSoundCommand";
      }
      
      override public function execute() : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         if(!_sound)
         {
            return;
         }
         super.execute();
         this._frameToSplit = StudioSoundManager.validateTotalFrame(this._frameToSplit - 1) + 1;
         var _loc1_:int = _sound.totalFrame;
         var _loc2_:AnimeSound = _sound.clone();
         if(_sound.hasFading)
         {
            _loc5_ = _sound.getVolumeAt(this._frameToSplit);
            _loc6_ = _sound.totalFrame - _sound.fadeOutDuration + 1;
            _loc7_ = _sound.fadeInDuration;
            _loc8_ = _sound.fadeOutDuration;
            _loc9_ = _sound.fadeInVolume;
            _loc10_ = _sound.fadeOutVolume;
            _loc11_ = _sound.volume;
            if(this._frameToSplit <= _sound.fadeInDuration)
            {
               _loc2_.fadeInDuration = _loc7_ - this._frameToSplit + 1;
               _loc2_.fadeInVolume = _loc5_;
               _loc7_ = this._frameToSplit - 1;
               _loc8_ = 0;
               _loc11_ = _loc5_;
            }
            else if(this._frameToSplit >= _loc6_)
            {
               _loc2_.fadeInDuration = 0;
               _loc2_.fadeOutDuration = _sound.totalFrame - this._frameToSplit + 1;
               _loc2_.volume = _loc5_;
               _loc8_ = this._frameToSplit - _loc6_;
               _loc10_ = _loc5_;
            }
            else
            {
               _loc8_ = 0;
               _loc2_.fadeInDuration = 0;
            }
            if((_loc2_.fadeInDuration == 0 || _loc2_.fadeInVolume == _loc2_.volume) && (_loc2_.fadeOutDuration == 0 || _loc2_.fadeOutVolume == _loc2_.volume))
            {
               _loc2_.removeFading();
            }
            this._changeVolumeCommand = new ChangeVolumeCommand(_sound,_loc11_,false);
            this._changeVolumeCommand.execute();
            if((_loc7_ == 0 || _loc9_ == _sound.volume) && (_loc8_ == 0 || _loc10_ == _sound.volume))
            {
               this._removeFadingCommand = new RemoveSoundFadingCommand(_sound,false);
            }
            else
            {
               this._changeFadingCommand = new ChangeSoundFadingCommand(_sound,_loc7_,_loc8_,_loc9_,_loc10_,false);
            }
         }
         this._oldTotalFrame = _sound.totalFrame;
         _sound.totalFrame = this._frameToSplit - 1;
         this._trimSoundCommand = new TrimSoundCommand(_sound,_sound.trimStartFrame,_sound.trimStartFrame + _sound.totalFrame - 1,false);
         this._trimSoundCommand.execute();
         _loc2_.totalFrame = _loc1_ - _sound.totalFrame;
         _loc2_.startFrame = _sound.endFrame + 1;
         var _loc3_:TrimSoundCommand = new TrimSoundCommand(_loc2_,_sound.trimStartFrame + _sound.totalFrame,_sound.trimStartFrame + _sound.totalFrame + _loc2_.totalFrame,false);
         _loc3_.execute();
         this._addSoundCommand = new AddSoundCommand(_loc2_,false);
         this._addSoundCommand.execute();
         var _loc4_:Array = Console.getConsole().linkageController.getCharIdBySoundId(_soundId);
         if(_loc4_ && _loc4_.length > 0)
         {
            this._addlinkageCommand = new CollectiveCommand(false);
            _loc12_ = _loc4_.length;
            _loc13_ = 0;
            while(_loc13_ < _loc12_)
            {
               this._addlinkageCommand.addCommand(new AddSoundLinkageCommand(_loc2_,String(_loc4_[_loc13_]),false));
               _loc13_++;
            }
            this._addlinkageCommand.execute();
         }
         if(this._changeFadingCommand)
         {
            this._changeFadingCommand.execute();
         }
         else if(this._removeFadingCommand)
         {
            this._removeFadingCommand.execute();
         }
      }
      
      override public function undo() : void
      {
         super.undo();
         if(this._changeFadingCommand)
         {
            this._changeFadingCommand.undo();
         }
         else if(this._removeFadingCommand)
         {
            this._removeFadingCommand.undo();
         }
         if(this._addlinkageCommand)
         {
            this._addlinkageCommand.undo();
         }
         if(this._addSoundCommand)
         {
            this._addSoundCommand.undo();
         }
         if(this._trimSoundCommand)
         {
            this._trimSoundCommand.undo();
         }
         _sound.totalFrame = this._oldTotalFrame;
         if(this._changeVolumeCommand)
         {
            this._changeVolumeCommand.undo();
         }
      }
      
      override public function redo() : void
      {
         super.redo();
         if(this._changeVolumeCommand)
         {
            this._changeVolumeCommand.redo();
         }
         _sound.totalFrame = this._frameToSplit - 1;
         if(this._trimSoundCommand)
         {
            this._trimSoundCommand.redo();
         }
         if(this._addSoundCommand)
         {
            this._addSoundCommand.redo();
         }
         if(this._addlinkageCommand)
         {
            this._addlinkageCommand.redo();
         }
         if(this._changeFadingCommand)
         {
            this._changeFadingCommand.redo();
         }
         else if(this._removeFadingCommand)
         {
            this._removeFadingCommand.redo();
         }
      }
   }
}
