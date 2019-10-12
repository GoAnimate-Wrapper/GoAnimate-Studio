package anifire.studio.commands
{
   import anifire.studio.assets.commands.AlterCharacterTransitionsCommand;
   import anifire.studio.core.AnimeScene;
   import anifire.studio.core.AnimeSound;
   import anifire.studio.core.Character;
   import anifire.studio.core.Console;
   import anifire.studio.core.LinkageController;
   
   public class AttachVoiceToScene extends SceneCommand
   {
       
      
      private var _attachSoundCommand:AttachSoundCommand;
      
      private var _alterCharacterTransitionsCommand:CollectiveCommand;
      
      public function AttachVoiceToScene(param1:AnimeScene, param2:AnimeSound, param3:Boolean = true)
      {
         var _loc4_:LinkageController = null;
         var _loc5_:Array = null;
         var _loc6_:Character = null;
         var _loc7_:uint = 0;
         var _loc8_:int = 0;
         super(param3,param1);
         _type = "AttachVoiceToScene";
         if(param2)
         {
            this._attachSoundCommand = new AttachSoundCommand(param1,param2,false);
            _loc4_ = Console.getConsole().linkageController;
            _loc5_ = _loc4_.getCharIdBySoundId(param2.id);
            if(_loc5_ && _loc5_.length > 0)
            {
               this._alterCharacterTransitionsCommand = new CollectiveCommand(false);
               _loc7_ = _loc5_.length;
               while(_loc8_ < _loc7_)
               {
                  _loc6_ = param1.getCharacterById(String(_loc5_[_loc8_]));
                  if(_loc6_)
                  {
                     this._alterCharacterTransitionsCommand.addCommand(new AlterCharacterTransitionsCommand(_loc6_.id,false));
                  }
                  _loc8_++;
               }
            }
         }
      }
      
      override public function execute() : void
      {
         super.execute();
         if(this._attachSoundCommand)
         {
            this._attachSoundCommand.execute();
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
         if(this._attachSoundCommand)
         {
            this._attachSoundCommand.undo();
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         if(this._attachSoundCommand)
         {
            this._attachSoundCommand.redo();
         }
         if(this._alterCharacterTransitionsCommand)
         {
            this._alterCharacterTransitionsCommand.redo();
         }
         super.redo();
      }
   }
}
