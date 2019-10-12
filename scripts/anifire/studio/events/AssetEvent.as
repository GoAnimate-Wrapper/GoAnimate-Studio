package anifire.studio.events
{
   import anifire.studio.core.Asset;
   import flash.events.Event;
   
   public class AssetEvent extends Event
   {
      
      public static const MOUSE_DOWN_ASSET:String = "mouseDownAsset";
      
      public static const MOUSE_UP_ASSET:String = "mouseUpAsset";
      
      public static const ROLL_OVER_ASSET:String = "rollOverAsset";
      
      public static const ROLL_OUT_ASSET:String = "rollOutAsset";
      
      public static const COLOR_CHANGE:String = "colorChange";
      
      public static const ACTION_CHANGE:String = "actionChange";
      
      public static const CHARACTER_SWAP_START:String = "characterSwapStart";
      
      public static const CHARACTER_SWAP_COMPLETE:String = "characterSwapComplete";
      
      public static const STATE_CHANGE:String = "stateChange";
      
      public static const ASSET_MOVED:String = "ASSET_MOVED";
      
      public static const REFERENCE_POINT_CHANGED:String = "REFERENCE_CHANGED";
      
      public static const ASSET_RESIZED:String = "ASSET_RESIZED";
      
      public static const ASSET_ROTATED:String = "ASSET_ROTATED";
      
      public static const ASSET_HFLIPPED:String = "ASSET_HFLIPPED";
      
      public static const ASSET_VFLIPPED:String = "ASSET_VFLIPPED";
      
      public static const MOTION_CHANGE:String = "MOTION_CHANGE";
      
      public static const CAMERA_GUIDE_CHANGED:String = "CAMERA_GUIDE_CHANGE";
      
      public static const ASSET_TIMING_CHANGE:String = "ASSET_TIMING_CHANGE";
      
      public static const SHADOW_MOVE_START:String = "shadowMoveStart";
      
      public static const SHADOW_MOVED:String = "shadowMoved";
      
      public static const EYE_CHANGE:String = "eyeChange";
      
      public static const BASE_VISIBILITY_CHANGE:String = "baseVisibilityChange";
       
      
      private var _asset:Asset;
      
      private var _shiftKey:Boolean;
      
      public function AssetEvent(param1:String, param2:Asset = null, param3:Boolean = false, param4:Boolean = true, param5:Boolean = false)
      {
         super(param1,param4,param5);
         this._asset = param2;
         this._shiftKey = param3;
      }
      
      public function get asset() : Asset
      {
         return this._asset;
      }
      
      public function get shiftKey() : Boolean
      {
         return this._shiftKey;
      }
      
      override public function clone() : Event
      {
         return new AssetEvent(type,this._asset);
      }
   }
}
