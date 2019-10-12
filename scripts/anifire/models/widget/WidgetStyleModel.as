package anifire.models.widget
{
   import anifire.event.WidgetEvent;
   import flash.events.EventDispatcher;
   
   public class WidgetStyleModel extends EventDispatcher
   {
      
      public static const NO_COLOR:uint = uint.MAX_VALUE;
      
      public static const DEFAULT_FONT_NAME:String = "Oswald";
      
      public static const DEFAULT_COLOR:uint = 2498593;
      
      public static const DEFAULT_LINE_COLOR:uint = 7701911;
      
      public static const DEFAULT_PART_LABEL_SIZE:int = 10;
      
      public static const DEFAULT_VALUE_LABEL_SIZE:int = 10;
      
      public static const DEFAULT_TITLE_LABEL_SIZE:int = 20;
      
      public static const DEFAULT_TITLE_POSITION:String = "default";
      
      public static const DEFAULT_COLOR_SET:Array = [14863141,11366429,15721093,4360343,3967603,8567752,8111791,14452600,12470066,13477756];
       
      
      protected var _properties:Object;
      
      protected var _propertiesInvalidateFlag:Boolean;
      
      protected var _colorSet:Array;
      
      protected var _font:String;
      
      protected var _color:uint;
      
      protected var _lineColor:uint;
      
      protected var _titleColor:uint;
      
      protected var _titleSize:int;
      
      protected var _titleBold:Boolean;
      
      protected var _titlePosition:String;
      
      protected var _dataColor:uint;
      
      protected var _dataSize:int;
      
      protected var _dataBold:Boolean;
      
      protected var _valueColor:uint;
      
      protected var _valueSize:int;
      
      protected var _valueBold:Boolean;
      
      public function WidgetStyleModel()
      {
         super();
         this.init();
      }
      
      public function get properties() : Object
      {
         return this._properties;
      }
      
      public function clearProperties() : void
      {
         this._properties = {};
         this._dataSize = DEFAULT_PART_LABEL_SIZE;
         this._valueSize = DEFAULT_VALUE_LABEL_SIZE;
         this._titleSize = DEFAULT_TITLE_LABEL_SIZE;
         this._titlePosition = DEFAULT_TITLE_POSITION;
         this._titleBold = true;
      }
      
      public function setProperty(param1:String, param2:*) : void
      {
         this._properties[param1] = param2;
         this._propertiesInvalidateFlag = true;
      }
      
      public function getProperty(param1:String) : *
      {
         return this._properties[param1];
      }
      
      public function getNumericProperty(param1:String) : Number
      {
         var _loc2_:Number = this._properties[param1];
         if(isNaN(_loc2_))
         {
            return 0;
         }
         return _loc2_;
      }
      
      public function getBooleanProperty(param1:String) : Boolean
      {
         return this._properties[param1] == "Y";
      }
      
      public function get colorSet() : Array
      {
         return this._colorSet;
      }
      
      public function set colorSet(param1:Array) : void
      {
         this._colorSet = param1;
         this.notifyChange();
      }
      
      public function get font() : String
      {
         return this._font;
      }
      
      public function set font(param1:String) : void
      {
         if(this._font != param1)
         {
            this._font = param1;
            this._propertiesInvalidateFlag = true;
         }
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function set color(param1:uint) : void
      {
         if(this._color != param1)
         {
            this._color = param1;
         }
      }
      
      public function get lineColor() : uint
      {
         return this._lineColor;
      }
      
      public function set lineColor(param1:uint) : void
      {
         if(this._lineColor != param1)
         {
            this._lineColor = param1;
         }
      }
      
      public function get titleColor() : uint
      {
         if(this._titleColor == NO_COLOR)
         {
            return this._color;
         }
         return this._titleColor;
      }
      
      public function set titleColor(param1:uint) : void
      {
         if(this._titleColor != param1)
         {
            this._titleColor = param1;
         }
      }
      
      public function get titleSize() : int
      {
         return this._titleSize;
      }
      
      public function set titleSize(param1:int) : void
      {
         if(this._titleSize != param1)
         {
            this._titleSize = param1;
         }
      }
      
      public function get titleBold() : Boolean
      {
         return this._titleBold;
      }
      
      public function set titleBold(param1:Boolean) : void
      {
         if(this._titleBold != param1)
         {
            this._titleBold = param1;
         }
      }
      
      public function get titlePosition() : String
      {
         return this._titlePosition;
      }
      
      public function set titlePosition(param1:String) : void
      {
         if(this._titlePosition != param1)
         {
            this._titlePosition = param1;
         }
      }
      
      public function get dataColor() : uint
      {
         if(this._dataColor == NO_COLOR)
         {
            return this._color;
         }
         return this._dataColor;
      }
      
      public function set dataColor(param1:uint) : void
      {
         if(this._dataColor != param1)
         {
            this._dataColor = param1;
         }
      }
      
      public function get dataSize() : int
      {
         return this._dataSize;
      }
      
      public function set dataSize(param1:int) : void
      {
         if(this._dataSize != param1)
         {
            this._dataSize = param1;
         }
      }
      
      public function get dataBold() : Boolean
      {
         return this._dataBold;
      }
      
      public function set dataBold(param1:Boolean) : void
      {
         if(this._dataBold != param1)
         {
            this._dataBold = param1;
         }
      }
      
      public function get valueColor() : uint
      {
         if(this._valueColor == NO_COLOR)
         {
            return this._color;
         }
         return this._valueColor;
      }
      
      public function set valueColor(param1:uint) : void
      {
         if(this._valueColor != param1)
         {
            this._valueColor = param1;
         }
      }
      
      public function get valueSize() : int
      {
         return this._valueSize;
      }
      
      public function set valueSize(param1:int) : void
      {
         if(this._valueSize != param1)
         {
            this._valueSize = param1;
         }
      }
      
      public function get valueBold() : Boolean
      {
         return this._valueBold;
      }
      
      public function set valueBold(param1:Boolean) : void
      {
         if(this._valueBold != param1)
         {
            this._valueBold = param1;
         }
      }
      
      public function getColorByIndex(param1:int) : uint
      {
         param1 = param1 % this.colorSet.length;
         return this.colorSet[param1];
      }
      
      protected function init() : void
      {
         this._font = DEFAULT_FONT_NAME;
         this._colorSet = DEFAULT_COLOR_SET;
         this._color = DEFAULT_COLOR;
         this._lineColor = DEFAULT_LINE_COLOR;
         this._dataColor = NO_COLOR;
         this._valueColor = NO_COLOR;
         this._titleColor = NO_COLOR;
         this.clearProperties();
      }
      
      public function clone() : WidgetStyleModel
      {
         var _loc2_:* = null;
         var _loc1_:WidgetStyleModel = new WidgetStyleModel();
         _loc1_.colorSet = this._colorSet.concat();
         _loc1_.font = this._font;
         _loc1_.color = this._color;
         _loc1_.lineColor = this._lineColor;
         _loc1_.titlePosition = this._titlePosition;
         _loc1_.titleColor = this._titleColor;
         _loc1_.titleSize = this._titleSize;
         _loc1_.titleBold = this._titleBold;
         _loc1_.valueColor = this._valueColor;
         _loc1_.valueSize = this._valueSize;
         _loc1_.valueBold = this._valueBold;
         _loc1_.dataColor = this._dataColor;
         _loc1_.dataSize = this._dataSize;
         _loc1_.dataBold = this._dataBold;
         for(_loc2_ in this._properties)
         {
            _loc1_.setProperty(_loc2_,this._properties[_loc2_]);
         }
         return _loc1_;
      }
      
      public function notifyChange() : void
      {
         var _loc1_:String = !!this._propertiesInvalidateFlag?WidgetEvent.WIDGET_PROPERTY_CHANGE:WidgetEvent.WIDGET_STYLE_CHANGE;
         this._propertiesInvalidateFlag = false;
         dispatchEvent(new WidgetEvent(_loc1_));
      }
      
      public function deserialize(param1:XML) : void
      {
         var _loc3_:String = null;
         var _loc7_:XML = null;
         var _loc8_:String = null;
         if(param1.hasOwnProperty("@font"))
         {
            this._font = param1.@font;
         }
         if(param1.hasOwnProperty("@color"))
         {
            this._color = uint(param1.@color);
         }
         else
         {
            this._color = DEFAULT_COLOR;
         }
         if(param1.hasOwnProperty("@lineColor"))
         {
            this._lineColor = uint(param1.@lineColor);
         }
         else
         {
            this._lineColor = DEFAULT_LINE_COLOR;
         }
         if(param1.hasOwnProperty("@titlePosition"))
         {
            this._titlePosition = param1.@titlePosition;
         }
         if(param1.hasOwnProperty("@titleSize"))
         {
            this._titleSize = param1.@titleSize;
         }
         if(param1.hasOwnProperty("@titleColor"))
         {
            this._titleColor = param1.@titleColor;
         }
         if(param1.hasOwnProperty("@titleBold"))
         {
            this._titleBold = String(param1.@titleBold) != "N";
         }
         if(param1.hasOwnProperty("@valueSize"))
         {
            this._valueSize = param1.@valueSize;
         }
         if(param1.hasOwnProperty("@valueColor"))
         {
            this._valueColor = param1.@valueColor;
         }
         if(param1.hasOwnProperty("@valueBold"))
         {
            this._valueBold = String(param1.@valueBold) == "Y";
         }
         if(param1.hasOwnProperty("@dataSize"))
         {
            this._dataSize = param1.@dataSize;
         }
         if(param1.hasOwnProperty("@dataColor"))
         {
            this._dataColor = param1.@dataColor;
         }
         if(param1.hasOwnProperty("@dataBold"))
         {
            this._dataBold = String(param1.@dataBold) == "Y";
         }
         var _loc2_:Array = [];
         var _loc4_:XMLList = param1.children();
         var _loc5_:int = _loc4_.length();
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc7_ = _loc4_[_loc6_];
            _loc8_ = _loc7_.localName() as String;
            switch(_loc8_)
            {
               case "color":
                  _loc2_.push(uint(_loc7_.toString()));
                  break;
               case "p":
                  _loc3_ = _loc7_.@name;
                  this.setProperty(_loc3_,_loc7_.toString());
            }
            _loc6_++;
         }
         this._colorSet = _loc2_;
         this.notifyChange();
      }
      
      public function convertToXml() : XML
      {
         var _loc2_:XML = null;
         var _loc3_:int = 0;
         var _loc4_:XML = null;
         var _loc5_:* = null;
         var _loc1_:XML = <style/>;
         if(this._font)
         {
            _loc1_.@font = this._font;
         }
         if(this._color != NO_COLOR)
         {
            _loc1_.@color = this._color;
         }
         if(this._lineColor != NO_COLOR)
         {
            _loc1_.@lineColor = this._lineColor;
         }
         if(this._titlePosition)
         {
            _loc1_.@titlePosition = this._titlePosition;
         }
         if(this._titleSize)
         {
            _loc1_.@titleSize = this._titleSize;
         }
         if(this._titleColor)
         {
            _loc1_.@titleColor = this._titleColor;
         }
         if(!this._titleBold)
         {
            _loc1_.@titleBold = "N";
         }
         if(this._valueSize)
         {
            _loc1_.@valueSize = this._valueSize;
         }
         if(this._valueColor)
         {
            _loc1_.@valueColor = this._valueColor;
         }
         if(this._valueBold)
         {
            _loc1_.@valueBold = "Y";
         }
         if(this._dataSize)
         {
            _loc1_.@dataSize = this._dataSize;
         }
         if(this._dataColor)
         {
            _loc1_.@dataColor = this._dataColor;
         }
         if(this._dataBold)
         {
            _loc1_.@dataBold = "Y";
         }
         if(this._colorSet)
         {
            _loc3_ = 0;
            while(_loc3_ < this._colorSet.length)
            {
               _loc2_ = <color>{this._colorSet[_loc3_]}</color>;
               _loc1_.appendChild(_loc2_);
               _loc3_++;
            }
         }
         if(this._properties)
         {
            for(_loc5_ in this._properties)
            {
               _loc4_ = <p>{this._properties[_loc5_]}</p>;
               _loc4_.@name = _loc5_;
               _loc1_.appendChild(_loc4_);
            }
         }
         return _loc1_;
      }
   }
}
