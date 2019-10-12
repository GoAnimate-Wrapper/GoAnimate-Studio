package anifire.studio.commands
{
   import anifire.interfaces.IIterator;
   import anifire.studio.assets.views.AssetViewCollection;
   import anifire.studio.core.Console;
   import anifire.studio.interfaces.IAssetView;
   
   public class MoveAssetCollectionCommand extends CollectiveCommand
   {
       
      
      public function MoveAssetCollectionCommand(param1:AssetViewCollection, param2:Boolean = true)
      {
         var _loc3_:IAssetView = null;
         var _loc4_:IIterator = null;
         super(param2);
         _type = "MoveAssetCollectionCommand";
         if(param1)
         {
            _loc4_ = param1.iterator();
            while(_loc4_.hasNext)
            {
               _loc3_ = IAssetView(_loc4_.next);
               this.addCommand(new MoveAssetCommand(_loc3_.asset,false));
            }
         }
      }
      
      override public function undo() : void
      {
         super.undo();
         this.updateConsole();
      }
      
      override public function redo() : void
      {
         super.redo();
         this.updateConsole();
      }
      
      protected function updateConsole() : void
      {
         var _loc1_:Console = Console.getConsole();
         _loc1_.sceneEditor.updateControl();
         _loc1_.sceneEditor.showControl();
         _loc1_.changed = true;
      }
   }
}
