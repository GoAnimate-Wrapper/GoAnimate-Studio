package anifire.studio.commands
{
   import anifire.studio.assets.models.AssetCollectionShadow;
   import flash.geom.Point;
   
   public class MoveAssetCollectionShadowCommand extends SceneCommand
   {
       
      
      private var _target:AssetCollectionShadow;
      
      private var _fromPosition:Point;
      
      private var _fromRefPoint:Point;
      
      private var _toPosition:Point;
      
      private var _toRefPoint:Point;
      
      public function MoveAssetCollectionShadowCommand(param1:AssetCollectionShadow, param2:Boolean = true)
      {
         super(param2);
         _type = "MoveAssetCollectionShadowCommand";
         if(param1)
         {
            this._target = param1;
            this._fromPosition = new Point(param1.x,param1.y);
         }
      }
      
      override public function undo() : void
      {
         if(this._target)
         {
            this._toPosition = new Point(this._target.x,this._target.y);
            this._target.move(this._fromPosition.x,this._fromPosition.y);
            super.undo();
         }
      }
      
      override public function redo() : void
      {
         if(this._target)
         {
            this._target.move(this._toPosition.x,this._toPosition.y);
            super.undo();
         }
      }
   }
}
