package anifire.studio.commands
{
   import anifire.core.AssetLinkage;
   import anifire.studio.core.AnimeSound;
   import anifire.studio.core.Character;
   import anifire.studio.core.Console;
   
   public class AddSoundLinkageCommand extends AbstractSoundCommand
   {
       
      
      private var _charId:String;
      
      private var _linkages:Array;
      
      public function AddSoundLinkageCommand(param1:AnimeSound, param2:String, param3:Boolean = true)
      {
         super(param1,param3);
         this._charId = param2;
         _type = "AddSoundLinkageCommand";
      }
      
      override public function execute() : void
      {
         super.execute();
         this.addLinkage();
      }
      
      override public function undo() : void
      {
         var _loc1_:Character = null;
         super.undo();
         if(_soundId)
         {
            this._linkages = Console.getConsole().linkageController.deleteLinkageBySoundIdCharId(_soundId,this._charId);
            _loc1_ = Console.getConsole().currentScene.getCharacterById(this._charId);
            if(_loc1_)
            {
               _loc1_.demoSpeech = false;
            }
         }
      }
      
      override public function redo() : void
      {
         var _loc1_:Character = null;
         super.redo();
         if(this._linkages)
         {
            Console.getConsole().linkageController.addLinkages(this._linkages);
            _loc1_ = Console.getConsole().currentScene.getCharacterById(this._charId);
            if(_loc1_)
            {
               _loc1_.demoSpeech = true;
            }
         }
      }
      
      private function addLinkage() : void
      {
         var _loc1_:AssetLinkage = null;
         var _loc2_:Character = null;
         if(_soundId && this._charId)
         {
            _loc1_ = new AssetLinkage();
            _loc1_.addLinkage(_soundId);
            _loc1_.addLinkage(AssetLinkage.LINK + this._charId);
            Console.getConsole().linkageController.addLinkage(_loc1_);
            _loc2_ = Console.getConsole().currentScene.getCharacterById(this._charId);
            if(_loc2_)
            {
               _loc2_.demoSpeech = true;
            }
         }
      }
   }
}
