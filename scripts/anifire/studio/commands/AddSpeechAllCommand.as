package anifire.studio.commands
{
   import anifire.studio.core.AnimeScene;
   import anifire.studio.core.AnimeSound;
   import anifire.studio.core.Character;
   import anifire.studio.core.Console;
   
   public class AddSpeechAllCommand extends CrossSceneCollectiveCommand
   {
       
      
      public function AddSpeechAllCommand(param1:AnimeSound, param2:String)
      {
         var _loc5_:AnimeScene = null;
         var _loc6_:Character = null;
         var _loc7_:AddSpeechCommand = null;
         _type = "AddSpeechAllCommand";
         super();
         var _loc3_:Number = Console.getConsole().scenes.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = Console.getConsole().getScene(_loc4_);
            if(_loc5_ && param2)
            {
               _loc6_ = _loc5_.getCharacterById(param2);
               if(_loc6_)
               {
                  _loc7_ = new AddSpeechCommand(param1,param2);
                  _loc7_.setUndoable(false);
                  addCommand(_loc7_);
               }
            }
            _loc4_++;
         }
      }
   }
}
