package anifire.studio.commands
{
   import anifire.studio.core.AnimeScene;
   import anifire.studio.core.AnimeSound;
   import anifire.studio.core.Console;
   
   public class RemoveSoundLinkageCommand extends AbstractSoundCommand
   {
       
      
      private var _linkages:Array;
      
      public function RemoveSoundLinkageCommand(param1:AnimeSound, param2:Boolean = true)
      {
         super(param1,param2);
         _type = "RemoveSoundLinkageCommand";
      }
      
      override public function execute() : void
      {
         super.execute();
         this.removeSoundLinkage();
      }
      
      override public function undo() : void
      {
         super.undo();
         if(this._linkages)
         {
            Console.getConsole().linkageController.addLinkages(this._linkages);
         }
         var _loc1_:AnimeScene = Console.getConsole().currentScene;
         if(_loc1_)
         {
            _loc1_.updateAllCharacterDemoMouth();
         }
      }
      
      override public function redo() : void
      {
         super.redo();
         this.removeSoundLinkage();
      }
      
      private function removeSoundLinkage() : void
      {
         this._linkages = Console.getConsole().linkageController.deleteLinkageById(_soundId);
         var _loc1_:AnimeScene = Console.getConsole().currentScene;
         if(_loc1_)
         {
            _loc1_.updateAllCharacterDemoMouth();
         }
      }
   }
}
