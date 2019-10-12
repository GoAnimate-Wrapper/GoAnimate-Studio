package anifire.studio.commands
{
   import anifire.bubble.Bubble;
   import anifire.studio.core.Asset;
   import anifire.studio.core.BubbleAsset;
   
   public class ChangeBubblePaddingCommand extends AssetCommand
   {
       
      
      private var _newHorizontalPadding:int;
      
      private var _newVerticalPadding:int;
      
      private var _oldHorizontalPadding:int;
      
      private var _oldVerticalPadding:int;
      
      public function ChangeBubblePaddingCommand(param1:Asset, param2:Boolean = true)
      {
         super(param1,param2);
         this._oldHorizontalPadding = BubbleAsset(asset).bubble.horizontalPadding;
         this._oldVerticalPadding = BubbleAsset(asset).bubble.verticalPadding;
         _type = "ChangeBubblePaddingCommand";
      }
      
      override public function undo() : void
      {
         var _loc1_:BubbleAsset = this.asset as BubbleAsset;
         if(!_loc1_)
         {
            return;
         }
         var _loc2_:Bubble = _loc1_.bubble;
         _loc2_.horizontalPadding = this._oldHorizontalPadding;
         _loc2_.verticalPadding = this._oldVerticalPadding;
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:BubbleAsset = this.asset as BubbleAsset;
         if(!_loc1_)
         {
            return;
         }
         var _loc2_:Bubble = _loc1_.bubble;
         _loc2_.horizontalPadding = this._newHorizontalPadding;
         _loc2_.verticalPadding = this._newVerticalPadding;
         super.redo();
      }
      
      override public function execute() : void
      {
         super.execute();
         var _loc1_:BubbleAsset = this.asset as BubbleAsset;
         if(!_loc1_)
         {
            return;
         }
         var _loc2_:Bubble = _loc1_.bubble;
         _loc2_.horizontalPadding = this._newHorizontalPadding;
         _loc2_.verticalPadding = this._newVerticalPadding;
      }
      
      public function executeNow(param1:int, param2:int) : void
      {
         this._newHorizontalPadding = param1;
         this._newVerticalPadding = param2;
         this.execute();
      }
   }
}
