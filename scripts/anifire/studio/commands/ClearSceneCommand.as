package anifire.studio.commands
{
   import anifire.studio.core.AnimeScene;
   import anifire.studio.core.Character;
   import anifire.studio.core.Console;
   import anifire.studio.managers.SceneManager;
   
   public class ClearSceneCommand extends SceneCommand
   {
       
      
      private var _undoXML:XML;
      
      private var _removeLinkageCommand:CollectiveCommand;
      
      public function ClearSceneCommand(param1:AnimeScene, param2:Boolean = true)
      {
         super(param2,param1);
         _type = "ClearSceneCommand";
      }
      
      override public function execute() : void
      {
         var _loc2_:Character = null;
         var _loc3_:Array = null;
         var _loc6_:Number = NaN;
         var _loc7_:int = 0;
         super.execute();
         var _loc1_:AnimeScene = this.scene;
         this._undoXML = backupSceneData();
         this._removeLinkageCommand = new CollectiveCommand(false);
         var _loc4_:Number = _loc1_.characters.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = _loc1_.characters.getValueByIndex(_loc5_);
            if(_loc2_)
            {
               _loc3_ = Console.getConsole().linkageController.getSoundIdByAssetId(_loc1_.id,_loc2_.id);
               if(_loc3_)
               {
                  _loc6_ = _loc3_.length;
                  _loc7_ = 0;
                  while(_loc7_ < _loc6_)
                  {
                     this._removeLinkageCommand.addCommand(new RemoveLinkageCommand(_loc2_,_loc3_[_loc7_],false));
                     _loc7_++;
                  }
               }
            }
            _loc5_++;
         }
         this._removeLinkageCommand.execute();
         _loc1_.deSerialize(,true);
         SceneManager.addDefaultZoomEffect(_loc1_);
      }
      
      override public function undo() : void
      {
         var _loc1_:AnimeScene = this.scene;
         _loc1_.deSerialize(this._undoXML,true,true,false);
         if(this._removeLinkageCommand)
         {
            this._removeLinkageCommand.undo();
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:AnimeScene = this.scene;
         if(this._removeLinkageCommand)
         {
            this._removeLinkageCommand.redo();
         }
         _loc1_.deSerialize(,true);
         SceneManager.addDefaultZoomEffect(_loc1_);
         super.redo();
      }
   }
}
