package anifire.studio.commands
{
   import anifire.studio.core.Asset;
   import anifire.studio.core.Prop;
   import anifire.studio.core.PropThumb;
   
   public class SwapPropCommand extends AssetCommand
   {
       
      
      protected var _oldThumb:PropThumb;
      
      protected var _newThumb:PropThumb;
      
      public function SwapPropCommand(param1:Asset, param2:PropThumb, param3:Boolean = true)
      {
         super(param1,param3);
         _type = "SwapPropCommand";
         this._newThumb = param2;
      }
      
      override public function execute() : void
      {
         super.execute();
         var _loc1_:Prop = asset as Prop;
         if(_loc1_)
         {
            this._oldThumb = PropThumb(_loc1_.thumb);
            _loc1_.swapWithThumb(this._newThumb);
         }
      }
      
      override public function undo() : void
      {
         super.undo();
         var _loc1_:Prop = asset as Prop;
         if(_loc1_)
         {
            _loc1_.swapWithThumb(this._oldThumb);
         }
      }
      
      override public function redo() : void
      {
         super.redo();
         var _loc1_:Prop = asset as Prop;
         if(_loc1_)
         {
            _loc1_.swapWithThumb(this._newThumb);
         }
      }
   }
}
