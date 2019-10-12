package anifire.studio.assets.models
{
   public class AssetRotation
   {
       
      
      private var _rotation:Number = 0;
      
      private var _enabled:Boolean = true;
      
      public function AssetRotation()
      {
         super();
      }
      
      public function get rotation() : Number
      {
         return this._rotation;
      }
      
      public function set rotation(param1:Number) : void
      {
         if(this._rotation != param1)
         {
            param1 = param1 % 360;
            if(param1 > 180)
            {
               param1 = param1 - 360;
            }
            else if(param1 <= -180)
            {
               param1 = param1 + 360;
            }
            this._rotation = param1;
         }
      }
      
      public function get enabled() : Boolean
      {
         return this._enabled;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         this._enabled = param1;
      }
   }
}
