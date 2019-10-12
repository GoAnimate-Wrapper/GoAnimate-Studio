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
   
   public class ChangeCharacterCollectionMovementCommand extends CollectiveCommand
   {
       
      
      public function ChangeCharacterCollectionMovementCommand(param1:AssetViewCollection, param2:MotionData, param3:Number = 1, param4:Boolean = false)
      {
         var _loc5_:IIterator = null;
         var _loc6_:IAssetView = null;
         var _loc7_:ICommand = null;
         var _loc8_:Boolean = false;
         var _loc9_:MotionData = null;
         var _loc10_:IMovable = null;
         var _loc11_:Point = null;
         var _loc12_:Point = null;
         super();
         _type = "ChangeCharacterCollectionMovementCommand";
         if(param2 && param1)
         {
            _loc5_ = param1.iterator();
            _loc8_ = true;
            _loc11_ = new Point();
            while(_loc5_.hasNext)
            {
               _loc6_ = _loc5_.next as IAssetView;
               if(_loc6_ && _loc6_.asset is IMovable)
               {
                  _loc10_ = _loc6_.asset as IMovable;
                  _loc9_ = param2.clone();
                  _loc11_.x = _loc10_.x - param2.startX;
                  _loc11_.y = _loc10_.y - param2.startY;
                  _loc9_.translatePath(_loc11_.x,_loc11_.y);
                  _loc12_ = UtilMath.scalePoint(new Point(_loc9_.endX,_loc9_.endY),param3,param3,new Point(param2.endX,param2.endY));
                  _loc9_.moveEndPoint(_loc12_.x,_loc12_.y);
                  _loc7_ = new ChangeCharacterMovementCommand(_loc6_.asset,_loc9_,false,!!_loc8_?uint(AssetTransitionConstants.TIMING_AFTER_PREVIOUS):uint(AssetTransitionConstants.TIMING_WITH_PREVIOUS),param3,param4,AssetTransitionConstants.TIMING_WHOLE_SCENE);
                  this.addCommand(_loc7_);
                  _loc8_ = false;
               }
            }
         }
      }
   }
}
