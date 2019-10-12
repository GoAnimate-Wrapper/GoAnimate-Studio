package anifire.studio.commands
{
   import anifire.studio.core.Asset;
   import anifire.studio.core.FlowFrame;
   import anifire.studio.core.FlowFrameInnerImageGeometry;
   import anifire.studio.events.FlowFrameEvent;
   
   public class ChangeFlowFrameImageCommand extends AssetCommand
   {
       
      
      private var _newPropId:String;
      
      private var _oldPropId:String;
      
      private var _oldFrameWidth:Number;
      
      private var _oldGeometry:FlowFrameInnerImageGeometry;
      
      public function ChangeFlowFrameImageCommand(param1:Asset, param2:String, param3:Boolean = true)
      {
         super(param1,param3);
         _type = "ChangeFlowFrameImageCommand";
         this._newPropId = param2;
      }
      
      override public function execute() : void
      {
         var _loc1_:FlowFrame = this.asset as FlowFrame;
         if(!_loc1_)
         {
            return;
         }
         this._oldPropId = _loc1_.innerImageId;
         if(this._newPropId == this._oldPropId)
         {
            if(!this._newPropId)
            {
               _loc1_.innerImageHasBeenChanged = true;
               _loc1_.dispatchEvent(new FlowFrameEvent(FlowFrameEvent.IMAGE_CHANGE));
            }
            return;
         }
         super.execute();
         this._oldFrameWidth = _loc1_.width;
         this._oldGeometry = _loc1_.getInnerImageGeometry();
         _loc1_.innerImageId = this._newPropId;
      }
      
      override public function undo() : void
      {
         var _loc1_:FlowFrame = this.asset as FlowFrame;
         if(!_loc1_)
         {
            return;
         }
         _loc1_.autoFlowInnerImage = false;
         _loc1_.innerImageId = this._oldPropId;
         _loc1_.width = this._oldFrameWidth;
         _loc1_.updateInnerImageGeometry(this._oldGeometry);
         _loc1_.autoFlowInnerImage = true;
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:FlowFrame = this.asset as FlowFrame;
         if(!_loc1_)
         {
            return;
         }
         _loc1_.innerImageId = this._newPropId;
         super.redo();
      }
   }
}
