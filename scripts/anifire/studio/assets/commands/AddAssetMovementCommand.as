package anifire.studio.assets.commands
{
   import anifire.studio.assets.models.AssetTransition;
   import anifire.studio.commands.AssetCommand;
   import anifire.studio.commands.SlideAssetCommand;
   import anifire.studio.core.Asset;
   
   public class AddAssetMovementCommand extends AssetCommand
   {
       
      
      private var _addSlideCommand:SlideAssetCommand;
      
      private var _addTransitionCommand:AddTransitionCommand;
      
      public function AddAssetMovementCommand(param1:Asset, param2:AssetTransition, param3:Boolean = true)
      {
         super(param1,param3);
         _type = "AddAssetMovementCommand";
         if(param1 && param2)
         {
            this._addSlideCommand = new SlideAssetCommand(param1,true,false);
            this._addTransitionCommand = new AddTransitionCommand(param2,false);
         }
      }
      
      override public function execute() : void
      {
         super.execute();
         if(this._addSlideCommand)
         {
            this._addSlideCommand.execute();
         }
         if(this._addTransitionCommand)
         {
            this._addTransitionCommand.execute();
         }
      }
      
      override public function undo() : void
      {
         if(this._addTransitionCommand)
         {
            this._addTransitionCommand.undo();
         }
         if(this._addSlideCommand)
         {
            this._addSlideCommand.undo();
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         if(this._addSlideCommand)
         {
            this._addSlideCommand.redo();
         }
         if(this._addTransitionCommand)
         {
            this._addTransitionCommand.redo();
         }
         super.redo();
      }
   }
}
