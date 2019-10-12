package anifire.models.widget
{
   import flash.events.EventDispatcher;
   
   public class WidgetPartModel extends EventDispatcher
   {
      
      private static const MAX_RANDOM_VALUE:Number = 100;
       
      
      public var labelText:String;
      
      public var values:Vector.<Number>;
      
      public var rawValues:Vector.<String>;
      
      public var extraData;
      
      public function WidgetPartModel()
      {
         super();
         this.init();
      }
      
      protected function init() : void
      {
         this.rawValues = new Vector.<String>();
         this.values = new Vector.<Number>();
         var _loc1_:Number = Math.round(Math.random() * MAX_RANDOM_VALUE);
         this.addRange(String(_loc1_),_loc1_);
      }
      
      public function get rawValue() : String
      {
         return this.rawValues[0];
      }
      
      public function set rawValue(param1:String) : void
      {
         this.rawValues[0] = param1;
      }
      
      public function getRawValueByRange(param1:int) : String
      {
         return this.rawValues[param1];
      }
      
      public function get value() : Number
      {
         return this.values[0];
      }
      
      public function set value(param1:Number) : void
      {
         this.values[0] = param1;
      }
      
      public function getValueByRange(param1:int) : Number
      {
         return this.values[param1];
      }
      
      public function addRangeAt(param1:int, param2:String, param3:Number) : void
      {
         if(param1 >= 0 && param1 <= this.values.length)
         {
            this.rawValues.splice(param1,0,param2);
            this.values.splice(param1,0,param3);
         }
      }
      
      public function addRange(param1:String, param2:Number) : void
      {
         var _loc3_:int = !!this.values?int(this.values.length):0;
         this.addRangeAt(_loc3_,param1,param2);
      }
      
      public function removeRangeAt(param1:int) : String
      {
         var _loc2_:Vector.<String> = null;
         if(param1 >= 0 && param1 < this.rawValues.length)
         {
            _loc2_ = this.rawValues.splice(param1,1);
            this.values.splice(param1,1);
            return _loc2_[0];
         }
         return null;
      }
      
      public function get numRanges() : Number
      {
         return !!this.rawValues?Number(this.rawValues.length):Number(0);
      }
      
      public function readFromXml(param1:XMLList) : void
      {
         var _loc4_:String = null;
         this.labelText = String(param1[0]);
         var _loc2_:int = param1.length();
         this.rawValues.length = 0;
         this.values.length = 0;
         var _loc3_:int = 1;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1[_loc3_];
            this.rawValues.push(_loc4_);
            this.values.push(Number(_loc4_));
            _loc3_++;
         }
      }
      
      public function writeToXml() : XML
      {
         var _loc5_:String = null;
         var _loc1_:XML = <row/>;
         var _loc2_:XML = <cell>{this.labelText}</cell>;
         _loc1_.appendChild(_loc2_);
         var _loc3_:int = this.rawValues.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = this.rawValues[_loc4_];
            _loc2_ = <cell>{_loc5_}</cell>;
            _loc1_.appendChild(_loc2_);
            _loc4_++;
         }
         return _loc1_;
      }
      
      public function clone() : WidgetPartModel
      {
         var _loc1_:WidgetPartModel = new WidgetPartModel();
         _loc1_.labelText = this.labelText;
         _loc1_.values = !!this.values?this.values.concat():null;
         _loc1_.rawValues = !!this.rawValues?this.rawValues.concat():null;
         _loc1_.extraData = this.extraData;
         return _loc1_;
      }
   }
}
