package anifire.studio.commands
{
   import anifire.studio.assets.interfaces.IReferencePoint;
   import anifire.studio.core.Asset;
   import anifire.studio.interfaces.IAssetController;
   import anifire.studio.interfaces.IAssetView;
   import flash.geom.Point;
   
   public class MoveAssetReferenceCommand extends AssetCommand
   {
       
      
      private var _oldRef:Point;
      
      private var _newRef:Point;
      
      public function MoveAssetReferenceCommand(param1:Object)
      {
         var _loc2_:IAssetView = null;
         var _loc3_:Asset = null;
         var _loc4_:IReferencePoint = null;
         _type = "MoveAssetReferenceCommand";
         if(param1 is IAssetController)
         {
            _loc2_ = (param1 as IAssetController).view;
            if(_loc2_)
            {
               _loc3_ = _loc2_.asset;
               if(_loc3_)
               {
                  _loc4_ = _loc3_ as IReferencePoint;
                  if(_loc4_)
                  {
                     super(_loc3_);
                     this._oldRef = new Point(_loc4_.referenceX,_loc4_.referenceY);
                  }
               }
            }
         }
      }
      
      public function executeNow(param1:Number, param2:Number) : void
      {
         var _loc3_:IReferencePoint = null;
         if(this._oldRef)
         {
            if(this._oldRef.x != param1 || this._oldRef.y != param2)
            {
               super.execute();
               _loc3_ = this.asset as IReferencePoint;
               if(_loc3_)
               {
                  _loc3_.setReferencePoint(param1,param2);
               }
            }
         }
      }
      
      override public function undo() : void
      {
         var _loc1_:IReferencePoint = this.asset as IReferencePoint;
         if(_loc1_)
         {
            this._newRef = new Point(_loc1_.referenceX,_loc1_.referenceY);
            _loc1_.setReferencePoint(this._oldRef.x,this._oldRef.y);
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:IReferencePoint = this.asset as IReferencePoint;
         if(_loc1_)
         {
            _loc1_.setReferencePoint(this._newRef.x,this._newRef.y);
         }
         super.redo();
      }
   }
}
