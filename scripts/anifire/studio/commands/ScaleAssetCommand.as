package anifire.studio.commands
{
   import anifire.studio.core.Asset;
   import anifire.studio.interfaces.IScalable;
   import flash.geom.Point;
   
   public class ScaleAssetCommand extends AssetCommand
   {
       
      
      private var _oldScale:Point;
      
      private var _newScale:Point;
      
      public function ScaleAssetCommand(param1:Asset, param2:Boolean = true)
      {
         super(param1,param2);
         _type = "ScaleAssetCommand";
         if(this.asset is IScalable)
         {
            this._oldScale = new Point((this.asset as IScalable).scaleX,(this.asset as IScalable).scaleY);
         }
      }
      
      override public function undo() : void
      {
         if(this.asset is IScalable)
         {
            this._newScale = new Point((this.asset as IScalable).scaleX,(this.asset as IScalable).scaleY);
            (this.asset as IScalable).scaleX = this._oldScale.x;
            (this.asset as IScalable).scaleY = this._oldScale.y;
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         if(this.asset is IScalable)
         {
            (this.asset as IScalable).scaleX = this._newScale.x;
            (this.asset as IScalable).scaleY = this._newScale.y;
         }
         super.redo();
      }
   }
}
