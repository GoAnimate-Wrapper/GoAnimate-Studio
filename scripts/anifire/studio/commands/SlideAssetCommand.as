package anifire.studio.commands
{
   import anifire.studio.core.Asset;
   import anifire.studio.interfaces.ISlidable;
   
   public class SlideAssetCommand extends AssetCommand
   {
       
      
      protected var _fromState:Boolean;
      
      protected var _toState:Boolean;
      
      public function SlideAssetCommand(param1:Asset, param2:Boolean, param3:Boolean = true)
      {
         super(param1,param3);
         _type = "SlideAssetCommand";
         this._toState = param2;
      }
      
      override public function execute() : void
      {
         var _loc1_:ISlidable = asset as ISlidable;
         if(_loc1_)
         {
            this._fromState = _loc1_.isSliding;
            if(this._toState)
            {
               _loc1_.startSlideMotion();
            }
            else
            {
               _loc1_.removeSlideMotion();
            }
            super.execute();
         }
      }
      
      override public function undo() : void
      {
         var _loc1_:ISlidable = asset as ISlidable;
         if(_loc1_)
         {
            if(this._fromState)
            {
               _loc1_.startSlideMotion();
            }
            else
            {
               _loc1_.removeSlideMotion();
            }
            super.undo();
         }
      }
      
      override public function redo() : void
      {
         var _loc1_:ISlidable = asset as ISlidable;
         if(_loc1_)
         {
            if(this._toState)
            {
               _loc1_.startSlideMotion();
            }
            else
            {
               _loc1_.removeSlideMotion();
            }
            super.redo();
         }
      }
   }
}
