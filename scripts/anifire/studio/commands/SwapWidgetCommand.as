package anifire.studio.commands
{
   import anifire.studio.core.Asset;
   import anifire.studio.core.Widget;
   import anifire.studio.core.WidgetThumb;
   import anifire.studio.models.WidgetProxy;
   
   public class SwapWidgetCommand extends AssetCommand
   {
       
      
      protected var _oldWidgetXML:XML;
      
      protected var _newThumb:WidgetThumb;
      
      protected var _settings:WidgetProxy;
      
      public function SwapWidgetCommand(param1:Asset, param2:WidgetThumb, param3:WidgetProxy, param4:Boolean = true)
      {
         super(param1,param4);
         _type = "SwapWidgetCommand";
         this._newThumb = param2;
         this._settings = param3;
      }
      
      override public function execute() : void
      {
         super.execute();
         var _loc1_:Widget = asset as Widget;
         if(_loc1_)
         {
            this._oldWidgetXML = _loc1_.convertToXml();
            _loc1_.swapWithWidget(this._newThumb,this._settings);
         }
      }
      
      override public function undo() : void
      {
         super.undo();
         var _loc1_:Widget = asset as Widget;
         if(_loc1_)
         {
            _loc1_.undoSwap(this._oldWidgetXML);
         }
      }
      
      override public function redo() : void
      {
         super.redo();
         var _loc1_:Widget = asset as Widget;
         if(_loc1_)
         {
            _loc1_.swapWithWidget(this._newThumb,this._settings);
         }
      }
   }
}
