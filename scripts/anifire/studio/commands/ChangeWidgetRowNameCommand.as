package anifire.studio.commands
{
   import anifire.models.widget.WidgetPartModel;
   import anifire.studio.core.Widget;
   import anifire.studio.core.WidgetThumb;
   
   public class ChangeWidgetRowNameCommand extends ChangeWidgetCommand
   {
       
      
      private var _index:int;
      
      private var _newName:String;
      
      private var _oldName:String;
      
      private var _colorCommand:ChangeWidgetColorSetCommand;
      
      public function ChangeWidgetRowNameCommand(param1:Widget, param2:int, param3:String, param4:uint, param5:Boolean = true)
      {
         var _loc6_:Vector.<WidgetPartModel> = null;
         var _loc7_:Array = null;
         var _loc8_:Array = null;
         var _loc9_:int = 0;
         super(param1,param5);
         this._index = param2;
         this._newName = param3;
         if(param1)
         {
            _loc6_ = param1.dataRows;
            if(this._index >= 0 && this._index < _loc6_.length)
            {
               this._oldName = _loc6_[this._index].labelText;
            }
            if(param4 != uint.MAX_VALUE && param1.dataRowsLength > 1)
            {
               _loc7_ = param1.styleModel.colorSet;
               _loc8_ = new Array(WidgetThumb.MAX_DATA_ROWS);
               _loc9_ = 0;
               while(_loc9_ < WidgetThumb.MAX_DATA_ROWS)
               {
                  if(_loc9_ == param2)
                  {
                     _loc8_[_loc9_] = param4;
                  }
                  else
                  {
                     _loc8_[_loc9_] = _loc7_[_loc9_ % _loc7_.length];
                  }
                  _loc9_++;
               }
               this._colorCommand = new ChangeWidgetColorSetCommand(param1,_loc8_,false);
            }
         }
         _type = "ChangeWidgetRowNameCommand";
      }
      
      public function updateColorSet() : void
      {
      }
      
      override public function execute() : void
      {
         var _loc1_:Widget = null;
         var _loc2_:Vector.<WidgetPartModel> = null;
         if(this._newName != this._oldName || this._colorCommand)
         {
            super.execute();
            _loc1_ = this.asset as Widget;
            if(_loc1_)
            {
               _loc2_ = _loc1_.dataRows;
               if(this._index >= 0 && this._index < _loc2_.length)
               {
                  _loc2_[this._index].labelText = this._newName;
               }
               _loc1_.dataRows = _loc2_;
            }
            if(this._colorCommand)
            {
               this._colorCommand.execute();
            }
         }
      }
      
      override public function undo() : void
      {
         var _loc2_:Vector.<WidgetPartModel> = null;
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            _loc2_ = _loc1_.dataRows;
            if(this._index >= 0 && this._index < _loc2_.length)
            {
               _loc2_[this._index].labelText = this._oldName;
            }
            _loc1_.dataRows = _loc2_;
         }
         if(this._colorCommand)
         {
            this._colorCommand.undo();
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc2_:Vector.<WidgetPartModel> = null;
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            _loc2_ = _loc1_.dataRows;
            if(this._index >= 0 && this._index < _loc2_.length)
            {
               _loc2_[this._index].labelText = this._newName;
            }
            _loc1_.dataRows = _loc2_;
         }
         if(this._colorCommand)
         {
            this._colorCommand.redo();
         }
         super.redo();
      }
   }
}
