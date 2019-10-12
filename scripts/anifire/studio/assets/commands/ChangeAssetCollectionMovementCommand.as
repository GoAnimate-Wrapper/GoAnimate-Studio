package anifire.studio.assets.commands
{
   import anifire.assets.transition.AssetTransitionConstants;
   import anifire.interfaces.IIterator;
   import anifire.studio.assets.views.AssetViewCollection;
   import anifire.studio.commands.CollectiveCommand;
   import anifire.studio.commands.ICommand;
   import anifire.studio.core.MotionData;
   import anifire.studio.interfaces.IAssetView;
   import anifire.studio.interfaces.IMovable;
   import anifire.util.UtilMath;
   import flash.geom.Point;
   
   public class ChangeAssetCollectionMovementCommand extends CollectiveCommand
   {
       
      
      public function ChangeAssetCollectionMovementCommand(param1:AssetViewCollection, param2:MotionData, param3:Number = 1)
      {
         var _loc4_:IIterator = null;
         var _loc5_:IAssetView = null;
         var _loc6_:ICommand = null;
         var _loc7_:Boolean = false;
         var _loc8_:MotionData = null;
         var _loc9_:IMovable = null;
         var _loc10_:Point = null;
         var _loc11_:Point = null;
         super();
         _type = "ChangeAssetCollectionMovementCommand";
         if(param2 && param1)
         {
            _loc4_ = param1.iterator();
            _loc7_ = true;
            _loc10_ = new Point();
            while(_loc4_.hasNext)
            {
               _loc5_ = _loc4_.next as IAssetView;
               if(_loc5_ && _loc5_.asset is IMovable)
               {
                  _loc9_ = _loc5_.asset as IMovable;
                  _loc8_ = param2.clone();
                  _loc10_.x = _loc9_.x - param2.startX;
                  _loc10_.y = _loc9_.y - param2.startY;
                  _loc8_.translatePath(_loc10_.x,_loc10_.y);
                  _loc11_ = UtilMath.scalePoint(new Point(_loc8_.endX,_loc8_.endY),param3,param3,new Point(param2.endX,param2.endY));
                  _loc8_.moveEndPoint(_loc11_.x,_loc11_.y);
                  _loc6_ = new ChangeAssetMovementCommand(_loc5_.asset,_loc8_,false,!!_loc7_?uint(AssetTransitionConstants.TIMING_AFTER_PREVIOUS):uint(AssetTransitionConstants.TIMING_WITH_PREVIOUS),param3);
                  this.addCommand(_loc6_);
                  _loc7_ = false;
               }
            }
         }
      }
   }
}
