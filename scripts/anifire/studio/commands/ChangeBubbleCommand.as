package anifire.studio.commands
{
   import anifire.studio.core.Asset;
   import anifire.studio.core.BubbleAsset;
   import anifire.studio.interfaces.IMotion;
   import anifire.util.UtilErrorLogger;
   import anifire.util.UtilString;
   
   public class ChangeBubbleCommand extends AssetCommand
   {
       
      
      private var _undoXML:XML;
      
      private var _redoXML:XML;
      
      private var _shadowCommand:ICommand;
      
      public function ChangeBubbleCommand(param1:Asset, param2:Boolean = true)
      {
         super(param1,param2);
         _type = "ChangeBubbleCommand";
         var _loc3_:BubbleAsset = this.asset as BubbleAsset;
         if(_loc3_)
         {
            this._undoXML = _loc3_.bubble.serialize();
         }
         if(param1 is IMotion && (param1 as IMotion).shadow is Asset)
         {
            this._shadowCommand = new ChangeBubbleCommand((param1 as IMotion).shadow as Asset,false);
         }
      }
      
      override public function undo() : void
      {
         var asset:BubbleAsset = this.asset as BubbleAsset;
         if(asset)
         {
            try
            {
               this._redoXML = asset.bubble.serialize();
               asset.bubble.deSerialize(this._undoXML);
               if(UtilString.trim(asset.bubble.text," ") == "")
               {
                  asset.bubble.bubbleText = asset.getPromptText();
                  asset.bubble.redraw();
               }
            }
            catch(e:Error)
            {
               UtilErrorLogger.getInstance().appendCustomError("ChangeBubbleCommand:undo",e);
            }
            if(this._shadowCommand)
            {
               this._shadowCommand.undo();
            }
            super.undo();
         }
      }
      
      override public function redo() : void
      {
         var asset:BubbleAsset = this.asset as BubbleAsset;
         if(asset)
         {
            try
            {
               asset.bubble.deSerialize(this._redoXML);
               if(UtilString.trim(asset.bubble.text," ") == "")
               {
                  asset.bubble.bubbleText = asset.getPromptText();
                  asset.bubble.redraw();
               }
            }
            catch(e:Error)
            {
               UtilErrorLogger.getInstance().appendCustomError("ChangeBubbleCommand:undo",e);
            }
            if(this._shadowCommand)
            {
               this._shadowCommand.redo();
            }
            super.redo();
         }
      }
   }
}
