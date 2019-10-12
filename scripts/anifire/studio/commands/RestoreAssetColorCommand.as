package anifire.studio.commands
{
   import anifire.studio.core.Asset;
   import anifire.studio.interfaces.IColorable;
   import anifire.util.UtilHashSelectedColor;
   
   public class RestoreAssetColorCommand extends AssetCommand
   {
       
      
      private var _oldCustomColorSet:UtilHashSelectedColor;
      
      public function RestoreAssetColorCommand(param1:IColorable)
      {
         if(param1 is Asset)
         {
            super(param1 as Asset);
         }
         if(param1 && param1.customColor)
         {
            this._oldCustomColorSet = param1.customColor.clone();
         }
         _type = "RestoreAssetColorCommand";
      }
      
      override public function execute() : void
      {
         super.execute();
         var _loc1_:IColorable = this.asset as IColorable;
         if(_loc1_)
         {
            _loc1_.restoreColor();
         }
      }
      
      override public function undo() : void
      {
         var _loc1_:Asset = this.asset as Asset;
         if(_loc1_ && this._oldCustomColorSet)
         {
            _loc1_.customColor = this._oldCustomColorSet.clone();
            _loc1_.updateColor();
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:IColorable = this.asset as IColorable;
         if(_loc1_)
         {
            _loc1_.restoreColor();
         }
         super.redo();
      }
   }
}
