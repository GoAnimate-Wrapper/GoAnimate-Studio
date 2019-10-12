package anifire.cc.model
{
   import anifire.cc.interfaces.ICcComponent;
   import anifire.cc.interfaces.ICcPairComponent;
   import anifire.component.CcActionLoader;
   import anifire.models.creator.CCCharActionComponentModel;
   import anifire.models.creator.CCCharacterActionModel;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   public class CcComponentModel extends EventDispatcher implements ICcComponent, ICcPairComponent
   {
       
      
      private var _themeId:String;
      
      private var _type:String;
      
      private var _url:String;
      
      private var _x:Number = 0;
      
      private var _y:Number = 0;
      
      private var _xscale:Number = 1;
      
      private var _yscale:Number = 1;
      
      private var _rotation:Number = 0;
      
      private var _offset:Number = 0;
      
      private var _id:String;
      
      private var _split:Boolean = true;
      
      private var _colors:Array;
      
      public function CcComponentModel()
      {
         this._colors = new Array();
         super();
      }
      
      public static function createModelByType(param1:String) : CcComponentModel
      {
         if(param1 == "mouth")
         {
            return new CcMouthModel();
         }
         return new CcComponentModel();
      }
      
      public function initByXml(param1:XML) : void
      {
         this._themeId = param1.@theme_id;
         this._type = param1.@type;
         this._x = Number(param1.@x);
         this._y = Number(param1.@y);
         this._xscale = Number(param1.@xscale);
         this._yscale = Number(param1.@yscale);
         this._rotation = Number(param1.@rotation);
         this._offset = Number(param1.@offset);
         if(param1.hasOwnProperty("@split") && String(param1.@split) == "N")
         {
            this._split = false;
         }
         if(param1.hasOwnProperty("@id"))
         {
            this._id = String(param1.@id);
         }
         this._url = CcActionLoader.getStoreUrl(param1.@theme_id + "/" + param1.@type + "/" + param1.@path + ".swf");
         var _loc2_:* = param1.@theme_id + "." + param1.@type + "." + param1.@path + ".swf";
         if(param1.hasOwnProperty("@file"))
         {
            this._url = CcActionLoader.getStoreUrl(param1.@theme_id + "/" + param1.@type + "/" + param1.@path + "/" + param1.@file);
         }
         else if(param1.@type == "freeaction" && param1.@path != "default")
         {
            this._url = CcActionLoader.getStoreUrl(param1.@theme_id + "/" + param1.@type + "/default/" + param1.@path + ".swf");
         }
         else
         {
            this._url = CcActionLoader.getStoreUrl(param1.@theme_id + "/" + param1.@type + "/" + param1.@path + "/" + "default.swf");
         }
      }
      
      public function initByCACam(param1:CCCharActionComponentModel) : void
      {
         this._themeId = param1.theme_id;
         this._type = param1.type;
         this._x = param1.x;
         this._y = param1.y;
         this._xscale = param1.xscale;
         this._yscale = param1.yscale;
         this._rotation = param1.rotation;
         this._offset = param1.offset;
         this._split = param1.split;
         if(param1.id)
         {
            this._id = param1.id;
         }
         if(param1.file)
         {
            this._url = CcActionLoader.getStoreUrl(param1.theme_id + "/" + param1.type + "/" + param1.folder + "/" + param1.file);
         }
         else if(param1.type == "freeaction" && param1.folder != "default")
         {
            this._url = CcActionLoader.getStoreUrl(param1.theme_id + "/" + param1.type + "/default/" + param1.folder + ".swf");
         }
         else
         {
            this._url = CcActionLoader.getStoreUrl(param1.path);
         }
      }
      
      public function initByCam(param1:CCCharacterActionModel, param2:String) : void
      {
         var _loc3_:CCCharActionComponentModel = param1.getComponentByType(param2) as CCCharActionComponentModel;
         this.initByCACam(_loc3_);
      }
      
      public function initProperties(param1:String, param2:String, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Boolean) : void
      {
         this._id = param1;
         this._type = param2;
         this._x = param3;
         this._y = param4;
         this._xscale = param5;
         this._yscale = param6;
         this._rotation = param7;
         this._offset = param8;
         this._split = param9;
      }
      
      public function initColors(param1:Array) : void
      {
         this._colors = param1;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get y() : Number
      {
         return this._y;
      }
      
      public function get xscale() : Number
      {
         return this._xscale;
      }
      
      public function get yscale() : Number
      {
         return this._yscale;
      }
      
      public function get rotation() : Number
      {
         return this._rotation;
      }
      
      public function get offset() : Number
      {
         return this._offset;
      }
      
      public function get split() : Boolean
      {
         return this._split;
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function get themeId() : String
      {
         return this._themeId;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get url() : String
      {
         return this._url;
      }
      
      public function get colors() : Array
      {
         return this._colors;
      }
      
      public function set x(param1:Number) : void
      {
         this._x = param1;
         this.dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function set y(param1:Number) : void
      {
         this._y = param1;
         this.dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function set xscale(param1:Number) : void
      {
         this._xscale = param1;
         this.dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function set yscale(param1:Number) : void
      {
         this._yscale = param1;
         this.dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function set rotation(param1:Number) : void
      {
         this._rotation = param1;
         this.dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function set split(param1:Boolean) : void
      {
         this._split = param1;
         this.dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function set offset(param1:Number) : void
      {
         this._offset = param1;
         this.dispatchEvent(new Event(Event.CHANGE));
      }
   }
}
