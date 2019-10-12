package anifire.studio.managers
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   public class ColorManager extends EventDispatcher
   {
      
      public static const SCENE_COLOR_PART_ID:String = "Color_A";
      
      private static var __instance:ColorManager;
       
      
      private var _colorMapping:Object;
      
      private var _locked:Boolean;
      
      public function ColorManager()
      {
         super();
         this.clearMapping();
      }
      
      public static function get instance() : ColorManager
      {
         if(!__instance)
         {
            __instance = new ColorManager();
         }
         return __instance;
      }
      
      public function lock() : void
      {
         this._locked = true;
      }
      
      public function unlock() : void
      {
         this._locked = false;
      }
      
      public function get colorMapping() : Object
      {
         return this._colorMapping;
      }
      
      public function hasColorKey(param1:String) : Boolean
      {
         return this._colorMapping[param1] != null;
      }
      
      public function getColorByKey(param1:String) : uint
      {
         return this._colorMapping[param1];
      }
      
      private function clearMapping() : void
      {
         this._colorMapping = {};
         this._colorMapping["Color_A"] = 6994134;
         this._colorMapping["Color_B"] = 16698673;
         this._colorMapping["Color_C"] = 14295073;
         this._colorMapping["Color_D"] = 8370961;
         this._colorMapping["Color_E"] = 15537243;
      }
      
      public function getSceneColor() : uint
      {
         return this._colorMapping[SCENE_COLOR_PART_ID];
      }
      
      public function updateColorValue(param1:String, param2:uint) : void
      {
         if(!this._locked)
         {
            this._colorMapping[param1] = param2;
            dispatchEvent(new Event(Event.CHANGE));
         }
      }
   }
}
