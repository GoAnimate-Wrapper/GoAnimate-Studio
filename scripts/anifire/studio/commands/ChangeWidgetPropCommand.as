package anifire.studio.commands
{
   import anifire.studio.core.PropThumb;
   import anifire.studio.core.Widget;
   
   public class ChangeWidgetPropCommand extends ChangeWidgetCommand
   {
       
      
      private var _newPropId:String;
      
      private var _oldPropId:String;
      
      public function ChangeWidgetPropCommand(param1:Widget, param2:PropThumb, param3:Boolean = true)
      {
         super(param1,param3);
         _type = "ChangeWidgetPropCommand";
         this.initPropId(param2);
         this._oldPropId = param1.propId;
      }
      
      protected function initPropId(param1:PropThumb) : void
      {
         var _loc2_:String = null;
         if(param1.getStateNum() > 0 && param1.defaultState)
         {
            _loc2_ = param1.defaultState.getKey();
         }
         else
         {
            _loc2_ = param1.themeId + "." + param1.id;
         }
         this._newPropId = _loc2_;
      }
      
      override public function execute() : void
      {
         var _loc1_:Widget = null;
         if(this._newPropId != this._oldPropId)
         {
            super.execute();
            _loc1_ = this.asset as Widget;
            if(_loc1_)
            {
               _loc1_.propId = this._newPropId;
            }
         }
      }
      
      override public function undo() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            _loc1_.propId = this._oldPropId;
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            _loc1_.propId = this._newPropId;
         }
         super.redo();
      }
   }
}
