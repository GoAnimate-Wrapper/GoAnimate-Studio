package anifire.studio.commands
{
   import anifire.studio.core.AnimeSound;
   import anifire.studio.core.Character;
   import anifire.studio.core.Console;
   import anifire.studio.managers.StudioSoundManager;
   
   public class RemoveLinkageCommand extends AssetCommand
   {
       
      
      private var _oldLinkages:Array;
      
      private var _soundId:String;
      
      public function RemoveLinkageCommand(param1:Character, param2:String = null, param3:Boolean = true)
      {
         super(param1,param3);
         _type = "RemoveLinkageCommand";
         this._soundId = param2;
      }
      
      override public function execute() : void
      {
         super.execute();
         this.removeLinkage();
      }
      
      override public function undo() : void
      {
         var _loc1_:Character = null;
         if(this._oldLinkages)
         {
            Console.getConsole().linkageController.addLinkages(this._oldLinkages);
            _loc1_ = this.asset as Character;
            if(_loc1_)
            {
               _loc1_.demoSpeech = true;
            }
         }
      }
      
      override public function redo() : void
      {
         this.removeLinkage();
      }
      
      private function removeLinkage() : void
      {
         var _loc2_:Array = null;
         var _loc3_:AnimeSound = null;
         var _loc4_:AnimeSound = null;
         var _loc5_:String = null;
         var _loc6_:uint = 0;
         var _loc7_:int = 0;
         var _loc1_:Character = this.asset as Character;
         if(!_loc1_)
         {
            return;
         }
         if(this._soundId)
         {
            _loc2_ = Console.getConsole().linkageController.getSoundIdByCharId(_loc1_.id);
            if(_loc2_)
            {
               _loc3_ = Console.getConsole().getSoundById(this._soundId);
               _loc3_.overlap = false;
               _loc6_ = _loc2_.length;
               _loc7_ = 0;
               while(_loc7_ < _loc6_)
               {
                  _loc5_ = _loc2_[_loc7_];
                  _loc4_ = Console.getConsole().getSoundById(_loc5_);
                  if(this._soundId != _loc5_ && _loc4_ && StudioSoundManager.isSoundCollision(_loc3_,_loc4_))
                  {
                     _loc4_.overlap = false;
                     break;
                  }
                  _loc7_++;
               }
            }
            this._oldLinkages = Console.getConsole().linkageController.deleteLinkageBySoundIdCharId(this._soundId,_loc1_.id);
            scene.updateAllCharacterDemoMouth();
         }
         else
         {
            this._oldLinkages = Console.getConsole().linkageController.deleteLinkage(_loc1_);
            _loc1_.demoSpeech = false;
         }
      }
   }
}
