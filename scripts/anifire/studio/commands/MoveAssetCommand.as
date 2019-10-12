package anifire.studio.commands
{
   import anifire.studio.assets.interfaces.IReferencePoint;
   import anifire.studio.core.Asset;
   import anifire.studio.interfaces.IMovable;
   import flash.geom.Point;
   
   public class MoveAssetCommand extends AssetCommand
   {
       
      
      private var _fromPosition:Point;
      
      private var _fromRefPoint:Point;
      
      private var _toPosition:Point;
      
      private var _toRefPoint:Point;
      
      public function MoveAssetCommand(param1:Asset, param2:Boolean = true)
      {
         super(param1,param2);
         _type = "MoveAssetCommand";
         var _loc3_:IMovable = param1 as IMovable;
         if(_loc3_)
         {
            this._fromPosition = new Point(_loc3_.x,_loc3_.y);
         }
         var _loc4_:IReferencePoint = param1 as IReferencePoint;
         if(_loc4_)
         {
            this._fromRefPoint = new Point(_loc4_.referenceX,_loc4_.referenceY);
         }
      }
      
      override public function undo() : void
      {
         var _loc1_:IMovable = null;
         var _loc2_:IReferencePoint = null;
         if(this.asset)
         {
            _loc1_ = this.asset as IMovable;
            if(_loc1_ && this._fromPosition)
            {
               this._toPosition = new Point(_loc1_.x,_loc1_.y);
               _loc1_.move(this._fromPosition.x,this._fromPosition.y);
            }
            _loc2_ = asset as IReferencePoint;
            if(_loc2_ && this._fromRefPoint)
            {
               this._toRefPoint = new Point(_loc2_.referenceX,_loc2_.referenceY);
               _loc2_.setReferencePoint(this._fromRefPoint.x,this._fromRefPoint.y);
            }
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:IMovable = null;
         var _loc2_:IReferencePoint = null;
         if(this.asset)
         {
            _loc1_ = this.asset as IMovable;
            if(_loc1_ && this._toPosition)
            {
               _loc1_.move(this._toPosition.x,this._toPosition.y);
            }
            _loc2_ = this.asset as IReferencePoint;
            if(_loc2_ && this._toRefPoint)
            {
               _loc2_.setReferencePoint(this._toRefPoint.x,this._toRefPoint.y);
            }
         }
         super.redo();
      }
   }
}
