package anifire.studio.core
{
   import anifire.constant.AnimeConstants;
   import anifire.errors.SerializeError;
   import anifire.studio.managers.SceneTransitionManager;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   public class GoTransition extends EventDispatcher
   {
      
      public static const XML_NODE_NAME:String = "trans";
       
      
      private var _id:String;
      
      private var _pack:String;
      
      private var _type:String;
      
      private var _direction:String;
      
      private var _ease:String;
      
      private var _duration:int = 12;
      
      private var _minTotalFrame:int = 6;
      
      private var _maxTotalFrame:int = 240;
      
      private var _scene:AnimeScene;
      
      private var _params:Array;
      
      public function GoTransition()
      {
         super();
      }
      
      public function get params() : Array
      {
         return this._params;
      }
      
      public function set params(param1:Array) : void
      {
         this._params = param1;
      }
      
      public function get scene() : AnimeScene
      {
         return this._scene;
      }
      
      public function set scene(param1:AnimeScene) : void
      {
         this._scene = param1;
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function set id(param1:String) : void
      {
         this._id = param1;
      }
      
      public function get pack() : String
      {
         return this._pack;
      }
      
      public function set pack(param1:String) : void
      {
         this._pack = param1;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
         this._minTotalFrame = SceneTransitionManager.getTransMinFrame(param1);
         this.duration = this.duration;
      }
      
      public function get direction() : String
      {
         return this._direction;
      }
      
      public function set direction(param1:String) : void
      {
         this._direction = param1;
      }
      
      public function get ease() : String
      {
         return this._ease;
      }
      
      public function set ease(param1:String) : void
      {
         this._ease = param1;
      }
      
      public function get duration() : int
      {
         return this._duration;
      }
      
      public function set duration(param1:int) : void
      {
         param1 = Math.round(param1 / AnimeConstants.SCENE_FRAME_INTERVAL) * AnimeConstants.SCENE_FRAME_INTERVAL;
         if(param1 < this._minTotalFrame)
         {
            param1 = this._minTotalFrame;
         }
         else if(param1 > this._maxTotalFrame)
         {
            param1 = this._maxTotalFrame;
         }
         if(this._duration != param1)
         {
            this._duration = param1;
            this.dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      public function convertToXml() : XML
      {
         var stype:String = null;
         var pString:String = null;
         var xml:XML = <trans/>;
         try
         {
            stype = this.pack + "." + this.type + "." + this.direction;
            if(this.params && this.params.length > 0)
            {
               pString = " param=\"" + this.params.join(",") + "\"";
            }
            else
            {
               pString = "";
            }
            xml.@id = this.id;
            xml.@index = this.scene.getNumberOfAssets();
            xml.appendChild(new XML("<fx dur=\"" + ({this.duration}) + "\" type=\"" + ({stype}) + "\" ease=\"" + ({this.ease}) + "\" " + pString + "/>"));
         }
         catch(e:Error)
         {
            xml = SerializeError.createErrorNode("Failed to serialize scene trans: " + this.id);
         }
         return xml;
      }
      
      public function serialize() : String
      {
         return this.convertToXml().toXMLString();
      }
      
      public function deserialize(param1:XML) : void
      {
         var _loc2_:String = param1.@id;
         var _loc3_:XML = param1.fx[0] as XML;
         var _loc4_:String = _loc3_.@type;
         var _loc5_:Array = _loc4_.split(".");
         this.pack = _loc5_[0];
         this.type = _loc5_[1];
         this.direction = _loc5_[2];
         this.ease = _loc3_.@ease;
         this.duration = _loc3_.@dur;
         if(_loc3_.@param.length() > 0)
         {
            this.params = String(_loc3_.@param).split(",");
         }
         if(this.type == "IrisCircle")
         {
            this.type = "Iris";
            this.params = new Array("5","CIRCLE");
         }
      }
      
      public function clone() : GoTransition
      {
         var _loc1_:GoTransition = new GoTransition();
         _loc1_.id = this.id;
         _loc1_.direction = this.direction;
         _loc1_.duration = this.duration;
         _loc1_.ease = this.ease;
         _loc1_.pack = this.pack;
         _loc1_.params = this.params.concat();
         _loc1_.scene = this.scene;
         _loc1_.type = this.type;
         return _loc1_;
      }
   }
}
