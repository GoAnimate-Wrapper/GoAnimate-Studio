package anifire.studio.commands
{
   import anifire.studio.assets.commands.AlterCharacterTransitionsCommand;
   import anifire.studio.core.AnimeSound;
   import anifire.studio.core.Character;
   
   public class AssignVoiceToCharacterCommand extends AssetCommand
   {
       
      
      private var _addlinkageCommand:AddSoundLinkageCommand;
      
      private var _alterCharacterTransitionsCommand:AlterCharacterTransitionsCommand;
      
      public function AssignVoiceToCharacterCommand(param1:AnimeSound, param2:Character, param3:Boolean = true)
      {
         super(param2,param3);
         _type = "AssignVoiceToCharacterCommand";
         this._addlinkageCommand = new AddSoundLinkageCommand(param1,param2.id,false);
         this._alterCharacterTransitionsCommand = new AlterCharacterTransitionsCommand(param2.id,false);
      }
      
      override public function execute() : void
      {
         super.execute();
         if(this._addlinkageCommand)
         {
            this._addlinkageCommand.execute();
         }
         if(this._alterCharacterTransitionsCommand)
         {
            this._alterCharacterTransitionsCommand.execute();
         }
      }
      
      override public function undo() : void
      {
         if(this._alterCharacterTransitionsCommand)
         {
            this._alterCharacterTransitionsCommand.undo();
         }
         if(this._addlinkageCommand)
         {
            this._addlinkageCommand.undo();
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         if(this._addlinkageCommand)
         {
            this._addlinkageCommand.redo();
         }
         if(this._alterCharacterTransitionsCommand)
         {
            this._alterCharacterTransitionsCommand.redo();
         }
         super.redo();
      }
   }
}
