package anifire.studio.commands
{
   import anifire.studio.assets.commands.AlterCharacterTransitionsCommand;
   import anifire.studio.core.AnimeScene;
   import anifire.studio.core.AnimeSound;
   import anifire.studio.core.Console;
   import anifire.studio.managers.StudioSoundManager;
   
   public class AddSpeechCommand extends SceneCommand
   {
       
      
      private var _charId:String;
      
      private var _sound:AnimeSound;
      
      private var _autoZoom:Boolean = false;
      
      private var _autoActionChange:Boolean = false;
      
      private var _volume:Number = -1;
      
      private var _alterCharacterTransitionsCommand:AlterCharacterTransitionsCommand;
      
      private var _addSoundCommand:AddSoundCommand;
      
      private var _addSoundLinkageCommand:AddSoundLinkageCommand;
      
      private var _attachSoundCommand:AttachSoundCommand;
      
      private var _changeSceneDurationOptionCommand:ChangeSceneDurationOptionCommand;
      
      public function AddSpeechCommand(param1:AnimeSound, param2:String = null, param3:Boolean = false, param4:Boolean = false, param5:Number = -1, param6:Boolean = true)
      {
         super();
         this._charId = param2;
         this._sound = param1;
         this._autoZoom = param3;
         this._autoActionChange = param4;
         this._volume = param5;
         var _loc7_:AnimeScene = this.scene;
         this._addSoundCommand = new AddSoundCommand(param1,false);
         if(param2)
         {
            this._alterCharacterTransitionsCommand = new AlterCharacterTransitionsCommand(param2,false);
         }
         this._addSoundLinkageCommand = new AddSoundLinkageCommand(param1,param2,false);
         if(param6)
         {
            this._attachSoundCommand = new AttachSoundCommand(_loc7_,param1,false);
            this._changeSceneDurationOptionCommand = new ChangeSceneDurationOptionCommand(_loc7_,false,_loc7_.countMinimumDuration,_loc7_.countTransitionDuration,_loc7_.countActionDuration,_loc7_.countBubbleDuration,true);
         }
         _type = "AddSpeechCommand";
      }
      
      public function setUndoable(param1:Boolean) : void
      {
         _undoable = param1;
      }
      
      override public function execute() : void
      {
         var _loc2_:AnimeSound = null;
         var _loc3_:String = null;
         var _loc4_:uint = 0;
         var _loc5_:int = 0;
         super.execute();
         this._addSoundCommand.execute();
         this._addSoundLinkageCommand.execute();
         if(this._attachSoundCommand)
         {
            this._attachSoundCommand.execute();
         }
         if(this._alterCharacterTransitionsCommand)
         {
            this._alterCharacterTransitionsCommand.execute();
         }
         if(this._changeSceneDurationOptionCommand)
         {
            this._changeSceneDurationOptionCommand.execute();
         }
         var _loc1_:Array = Console.getConsole().linkageController.getSoundIdByCharId(this._charId);
         if(_loc1_)
         {
            _loc4_ = _loc1_.length;
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc3_ = _loc1_[_loc5_];
               _loc2_ = Console.getConsole().getSoundById(_loc3_);
               if(this._sound.id != _loc3_ && _loc2_ && StudioSoundManager.isSoundCollision(this._sound,_loc2_))
               {
                  this._sound.overlap = true;
                  break;
               }
               _loc5_++;
            }
         }
      }
      
      override public function undo() : void
      {
         if(this._changeSceneDurationOptionCommand)
         {
            this._changeSceneDurationOptionCommand.undo();
         }
         if(this._alterCharacterTransitionsCommand)
         {
            this._alterCharacterTransitionsCommand.undo();
         }
         if(this._attachSoundCommand)
         {
            this._attachSoundCommand.undo();
         }
         this._addSoundLinkageCommand.undo();
         this._addSoundCommand.undo();
         super.undo();
      }
      
      override public function redo() : void
      {
         this._sound.overlap = false;
         this._addSoundCommand.redo();
         this._addSoundLinkageCommand.redo();
         if(this._attachSoundCommand)
         {
            this._attachSoundCommand.redo();
         }
         if(this._alterCharacterTransitionsCommand)
         {
            this._alterCharacterTransitionsCommand.redo();
         }
         if(this._changeSceneDurationOptionCommand)
         {
            this._changeSceneDurationOptionCommand.redo();
         }
         super.redo();
      }
   }
}
