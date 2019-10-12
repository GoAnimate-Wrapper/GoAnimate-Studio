package anifire.studio.commands
{
   import anifire.studio.core.Asset;
   import anifire.studio.core.BubbleAsset;
   import anifire.studio.interfaces.IMotion;
   
   public class UpdateBubbleTextCommand extends AssetCommand
   {
       
      
      private var _newText:String;
      
      private var _oldText:String;
      
      private var _switchFontCommand:ChangeBubbleFontCommand;
      
      private var _shadowCommand:UpdateBubbleTextCommand;
      
      public function UpdateBubbleTextCommand(param1:Asset, param2:String, param3:Boolean = true)
      {
         super(param1,param3);
         _type = "UpdateBubbleTextCommand";
         this._oldText = param2;
         if(param1 is IMotion && (param1 as IMotion).shadow is Asset)
         {
            this._shadowCommand = new UpdateBubbleTextCommand((param1 as IMotion).shadow as Asset,param2,false);
         }
      }
      
      override public function execute() : void
      {
         var _loc1_:BubbleAsset = this.asset as BubbleAsset;
         if(!_loc1_)
         {
            return;
         }
         this._newText = _loc1_.text;
         if(this._newText != this._oldText)
         {
            super.execute();
            if(this._shadowCommand)
            {
               this._shadowCommand.execute();
            }
         }
      }
      
      override public function undo() : void
      {
         var _loc1_:BubbleAsset = this.asset as BubbleAsset;
         if(!_loc1_)
         {
            return;
         }
         if(this._shadowCommand)
         {
            this._shadowCommand.undo();
         }
         _loc1_.text = this._oldText;
         _loc1_.bubble.backupText = this._oldText;
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:BubbleAsset = this.asset as BubbleAsset;
         if(!_loc1_)
         {
            return;
         }
         _loc1_.text = this._newText;
         _loc1_.bubble.backupText = this._newText;
         if(this._shadowCommand)
         {
            this._shadowCommand.redo();
         }
         super.redo();
      }
   }
}
