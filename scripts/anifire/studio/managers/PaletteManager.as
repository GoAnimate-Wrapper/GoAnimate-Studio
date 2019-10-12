package anifire.studio.managers
{
   import anifire.constant.ServerConstants;
   import anifire.constant.ThemeConstants;
   import anifire.managers.AppConfigManager;
   import anifire.studio.models.ColorPaletteItem;
   import flash.utils.Dictionary;
   import mx.collections.ArrayCollection;
   
   public class PaletteManager
   {
      
      public static const PALETTE_XML_NODE_NAME:String = "palette";
      
      public static const MAX_SWATCH:int = 36;
      
      public static var DEFAULT_WHITEBOARD_COLORS:Array = [3355443,1215535,538815,12522264,15550208];
      
      public static var DEFAULT_INFOGRAPHICS_COLORS:Array = [16514043,15329248,13947594,4674913,3556690,2437951,16347501,15946832];
      
      public static var DEFAULT_MAIN_COLORS:Array = [3355443,10066329,16514043,6723993,5618602,8370961,1405083,632273,6994134,14295073,16698673,2672321,3621967];
      
      private static var _instance:PaletteManager;
       
      
      private var _paletteItems:ArrayCollection;
      
      public function PaletteManager()
      {
         var _loc2_:Array = null;
         super();
         var _loc1_:String = AppConfigManager.instance.getValue(ServerConstants.FLASHVAR_DEFAULT_TRAYTHEME);
         switch(_loc1_)
         {
            case ThemeConstants.WHITEBOARD_THEME_ID:
               _loc2_ = DEFAULT_WHITEBOARD_COLORS;
               break;
            case ThemeConstants.INFOGRAPHICS_THEME_ID:
               _loc2_ = DEFAULT_INFOGRAPHICS_COLORS;
               break;
            default:
               _loc2_ = DEFAULT_MAIN_COLORS;
         }
         this._paletteItems = new ArrayCollection();
         var _loc3_:int = _loc2_.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            this._paletteItems.addItem(new ColorPaletteItem(_loc2_[_loc4_]));
            _loc4_++;
         }
         this._paletteItems.addItem(ColorPaletteItem.createAddColorButton());
      }
      
      public static function get instance() : PaletteManager
      {
         if(!_instance)
         {
            _instance = new PaletteManager();
         }
         return _instance;
      }
      
      public function get paletteItems() : ArrayCollection
      {
         return this._paletteItems;
      }
      
      protected function colorIndex(param1:uint) : int
      {
         var _loc4_:ColorPaletteItem = null;
         var _loc2_:int = this._paletteItems.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = this._paletteItems[_loc3_];
            if(_loc4_.color == param1)
            {
               return _loc3_;
            }
            _loc3_++;
         }
         return -1;
      }
      
      public function confirmColorAdd() : void
      {
         var _loc1_:ColorPaletteItem = this._paletteItems.getItemAt(this._paletteItems.length - 1) as ColorPaletteItem;
         if(this._paletteItems.length < MAX_SWATCH && !_loc1_.isAddColorButton)
         {
            this._paletteItems.addItem(ColorPaletteItem.createAddColorButton());
         }
      }
      
      public function removeColor(param1:uint) : void
      {
         var _loc2_:Number = this.colorIndex(param1);
         if(_loc2_ != -1)
         {
            this._paletteItems.removeItemAt(_loc2_);
         }
         var _loc3_:ColorPaletteItem = this._paletteItems.getItemAt(this._paletteItems.length - 1) as ColorPaletteItem;
         if(!_loc3_.isAddColorButton)
         {
            this._paletteItems.addItem(ColorPaletteItem.createAddColorButton());
         }
      }
      
      public function removeDuplicatedColors() : void
      {
         var _loc5_:ColorPaletteItem = null;
         var _loc1_:Dictionary = new Dictionary();
         var _loc2_:int = this._paletteItems.length;
         this._paletteItems.disableAutoUpdate();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc5_ = this._paletteItems.getItemAt(_loc3_) as ColorPaletteItem;
            if(!_loc5_.isAddColorButton)
            {
               if(!_loc1_[_loc5_.color])
               {
                  _loc1_[_loc5_.color] = true;
               }
               else
               {
                  this._paletteItems.removeItemAt(_loc3_);
                  _loc2_--;
                  _loc3_--;
               }
            }
            _loc3_++;
         }
         var _loc4_:ColorPaletteItem = this._paletteItems[this._paletteItems.length - 1];
         if(this._paletteItems.length < MAX_SWATCH && !_loc4_.isAddColorButton)
         {
            this._paletteItems.addItem(ColorPaletteItem.createAddColorButton());
         }
         this._paletteItems.enableAutoUpdate();
         _loc1_ = null;
      }
      
      public function getPaletteXml() : XML
      {
         var _loc4_:ColorPaletteItem = null;
         var _loc5_:String = null;
         var _loc1_:XML = new XML("<" + PALETTE_XML_NODE_NAME + "/>");
         var _loc2_:int = this._paletteItems.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = this._paletteItems[_loc3_];
            if(!_loc4_.isAddColorButton)
            {
               _loc5_ = _loc4_.color.toString(16);
               _loc1_.appendChild(<color value="{_loc5_}"/>);
            }
            _loc3_++;
         }
         return _loc1_;
      }
      
      public function deserializePaletteXml(param1:XML) : void
      {
         var _loc5_:String = null;
         var _loc6_:uint = 0;
         var _loc2_:XMLList = param1.color;
         var _loc3_:int = _loc2_.length();
         this._paletteItems.removeAll();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = _loc2_[_loc4_].@value;
            _loc6_ = parseInt(_loc5_,16);
            this._paletteItems.addItem(new ColorPaletteItem(_loc6_));
            _loc4_++;
         }
         if(this._paletteItems.length < MAX_SWATCH)
         {
            this._paletteItems.addItem(ColorPaletteItem.createAddColorButton());
         }
      }
   }
}
