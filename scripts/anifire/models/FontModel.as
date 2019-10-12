package anifire.models
{
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.events.PropertyChangeEvent;
   
   public class FontModel implements IEventDispatcher
   {
      
      public static const RESULT_ASSETID:String = "id";
      
      public static const RESULT_TITLE:String = "title";
      
      public static const RESULT_TAGS:String = "tags";
      
      public static const RESULT_PUBLISHED:String = "published";
      
      public static const RESULT_FONT_PATH:String = "fontPath";
      
      public static const RESULT_FONT_CFF_PATH:String = "fontCffPath";
      
      public static const RESULT_TRAY_IMAGE_PATH:String = "trayImage";
      
      public static const RESULT_LIST_IMAGE_PATH:String = "listImage";
      
      public static const RESULT_ENCRYPTED_ASSET_ID:String = "enc_asset_id";
      
      public static const DEFAULT_FONT_SORT_ORDER_ARIAL:Number = 2;
      
      public static const DEFAULT_FONT_SORT_ORDER_NOTO:Number = 1;
       
      
      private var _102727412label:String;
      
      private var _111972721value:String;
      
      private var _100313435image:Class;
      
      private var _859610604imageUrl:String;
      
      private var _896505829source:String;
      
      private var _1609594047enabled:Boolean;
      
      private var _1847399770isDefaultFont:Boolean;
      
      private var _1981268992defaultFontSortOrder:Number;
      
      private var _3355id:String;
      
      private var _2074885617encAssetId:String;
      
      private var _3552281tags:String;
      
      private var _1447404014published:Boolean;
      
      private var _980622264fontPathURI:String;
      
      private var _916145453fontCffPathURI:String;
      
      private var _1059102567trayImageURI:String;
      
      private var _224195791listImageURI:String;
      
      private var _413009079listBitmapData:BitmapData;
      
      private var _221780274cffValue:String;
      
      private var _bindingEventDispatcher:EventDispatcher;
      
      public function FontModel(param1:String, param2:String, param3:String, param4:String, param5:Class = null, param6:Boolean = true, param7:Boolean = false, param8:int = 0)
      {
         this._bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
         super();
         this.label = param1;
         this.value = param2;
         this.cffValue = param3 == ""?param2:param3;
         this.source = param4;
         this.image = param5;
         this.enabled = param6;
         this.isDefaultFont = param7;
         this.defaultFontSortOrder = param8;
      }
      
      public function get imageSource() : Object
      {
         if(this.listBitmapData)
         {
            return this.listBitmapData;
         }
         if(this.imageUrl)
         {
            return this.imageUrl;
         }
         return this.image;
      }
      
      public function serialize() : Object
      {
         var _loc1_:Object = {};
         _loc1_[RESULT_ASSETID] = this.id;
         _loc1_[RESULT_FONT_CFF_PATH] = this.fontCffPathURI;
         _loc1_[RESULT_FONT_PATH] = this.fontPathURI;
         _loc1_[RESULT_LIST_IMAGE_PATH] = this.listImageURI;
         _loc1_[RESULT_PUBLISHED] = !!this.published?"1":"0";
         _loc1_[RESULT_TAGS] = this.tags;
         _loc1_[RESULT_TITLE] = this.label;
         _loc1_[RESULT_TRAY_IMAGE_PATH] = this.trayImageURI;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get label() : String
      {
         return this._102727412label;
      }
      
      public function set label(param1:String) : void
      {
         var _loc2_:Object = this._102727412label;
         if(_loc2_ !== param1)
         {
            this._102727412label = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"label",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get value() : String
      {
         return this._111972721value;
      }
      
      public function set value(param1:String) : void
      {
         var _loc2_:Object = this._111972721value;
         if(_loc2_ !== param1)
         {
            this._111972721value = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"value",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get image() : Class
      {
         return this._100313435image;
      }
      
      public function set image(param1:Class) : void
      {
         var _loc2_:Object = this._100313435image;
         if(_loc2_ !== param1)
         {
            this._100313435image = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"image",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get imageUrl() : String
      {
         return this._859610604imageUrl;
      }
      
      public function set imageUrl(param1:String) : void
      {
         var _loc2_:Object = this._859610604imageUrl;
         if(_loc2_ !== param1)
         {
            this._859610604imageUrl = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageUrl",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get source() : String
      {
         return this._896505829source;
      }
      
      public function set source(param1:String) : void
      {
         var _loc2_:Object = this._896505829source;
         if(_loc2_ !== param1)
         {
            this._896505829source = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"source",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get enabled() : Boolean
      {
         return this._1609594047enabled;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         var _loc2_:Object = this._1609594047enabled;
         if(_loc2_ !== param1)
         {
            this._1609594047enabled = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"enabled",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get isDefaultFont() : Boolean
      {
         return this._1847399770isDefaultFont;
      }
      
      public function set isDefaultFont(param1:Boolean) : void
      {
         var _loc2_:Object = this._1847399770isDefaultFont;
         if(_loc2_ !== param1)
         {
            this._1847399770isDefaultFont = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"isDefaultFont",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get defaultFontSortOrder() : Number
      {
         return this._1981268992defaultFontSortOrder;
      }
      
      public function set defaultFontSortOrder(param1:Number) : void
      {
         var _loc2_:Object = this._1981268992defaultFontSortOrder;
         if(_loc2_ !== param1)
         {
            this._1981268992defaultFontSortOrder = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"defaultFontSortOrder",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get id() : String
      {
         return this._3355id;
      }
      
      public function set id(param1:String) : void
      {
         var _loc2_:Object = this._3355id;
         if(_loc2_ !== param1)
         {
            this._3355id = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"id",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get encAssetId() : String
      {
         return this._2074885617encAssetId;
      }
      
      public function set encAssetId(param1:String) : void
      {
         var _loc2_:Object = this._2074885617encAssetId;
         if(_loc2_ !== param1)
         {
            this._2074885617encAssetId = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"encAssetId",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tags() : String
      {
         return this._3552281tags;
      }
      
      public function set tags(param1:String) : void
      {
         var _loc2_:Object = this._3552281tags;
         if(_loc2_ !== param1)
         {
            this._3552281tags = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tags",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get published() : Boolean
      {
         return this._1447404014published;
      }
      
      public function set published(param1:Boolean) : void
      {
         var _loc2_:Object = this._1447404014published;
         if(_loc2_ !== param1)
         {
            this._1447404014published = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"published",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fontPathURI() : String
      {
         return this._980622264fontPathURI;
      }
      
      public function set fontPathURI(param1:String) : void
      {
         var _loc2_:Object = this._980622264fontPathURI;
         if(_loc2_ !== param1)
         {
            this._980622264fontPathURI = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fontPathURI",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fontCffPathURI() : String
      {
         return this._916145453fontCffPathURI;
      }
      
      public function set fontCffPathURI(param1:String) : void
      {
         var _loc2_:Object = this._916145453fontCffPathURI;
         if(_loc2_ !== param1)
         {
            this._916145453fontCffPathURI = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fontCffPathURI",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get trayImageURI() : String
      {
         return this._1059102567trayImageURI;
      }
      
      public function set trayImageURI(param1:String) : void
      {
         var _loc2_:Object = this._1059102567trayImageURI;
         if(_loc2_ !== param1)
         {
            this._1059102567trayImageURI = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"trayImageURI",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get listImageURI() : String
      {
         return this._224195791listImageURI;
      }
      
      public function set listImageURI(param1:String) : void
      {
         var _loc2_:Object = this._224195791listImageURI;
         if(_loc2_ !== param1)
         {
            this._224195791listImageURI = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"listImageURI",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get listBitmapData() : BitmapData
      {
         return this._413009079listBitmapData;
      }
      
      public function set listBitmapData(param1:BitmapData) : void
      {
         var _loc2_:Object = this._413009079listBitmapData;
         if(_loc2_ !== param1)
         {
            this._413009079listBitmapData = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"listBitmapData",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get cffValue() : String
      {
         return this._221780274cffValue;
      }
      
      public function set cffValue(param1:String) : void
      {
         var _loc2_:Object = this._221780274cffValue;
         if(_loc2_ !== param1)
         {
            this._221780274cffValue = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cffValue",_loc2_,param1));
            }
         }
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this._bindingEventDispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return this._bindingEventDispatcher.dispatchEvent(param1);
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.hasEventListener(param1);
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         this._bindingEventDispatcher.removeEventListener(param1,param2,param3);
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.willTrigger(param1);
      }
   }
}
