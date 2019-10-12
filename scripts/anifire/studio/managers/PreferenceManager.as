package anifire.studio.managers
{
   public class PreferenceManager
   {
      
      private static var _instance:PreferenceManager;
       
      
      private var _preference:Object;
      
      public function PreferenceManager()
      {
         super();
      }
      
      public static function get instance() : PreferenceManager
      {
         if(!_instance)
         {
            _instance = new PreferenceManager();
         }
         return _instance;
      }
      
      public function set preference(param1:Object) : void
      {
         if(this._preference != param1)
         {
            this._preference = param1;
         }
      }
      
      public function moveFeaturedToTop(param1:Array, param2:String) : void
      {
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:String = null;
         var _loc7_:Boolean = false;
         var _loc8_:int = 0;
         if(param1)
         {
            _loc3_ = this.getPreference("category","favorite","template",param2) as Array;
            if(_loc3_)
            {
               _loc4_ = param1.length;
               _loc5_ = 0;
               while(_loc5_ < _loc4_)
               {
                  _loc6_ = param1[_loc4_ - _loc5_ - 1];
                  _loc7_ = false;
                  _loc8_ = _loc5_;
                  while(_loc8_ < _loc3_.length)
                  {
                     if(_loc6_ == _loc3_[_loc8_])
                     {
                        _loc3_.splice(_loc8_,1);
                        _loc3_.unshift(_loc6_);
                        _loc7_ = true;
                        break;
                     }
                     _loc8_++;
                  }
                  if(!_loc7_)
                  {
                     _loc3_.unshift(_loc6_);
                  }
                  _loc5_++;
               }
            }
         }
      }
      
      public function addFeatured(param1:String, param2:String, param3:String) : void
      {
         var _loc4_:Array = this.getPreference("category","featured",param1,param2) as Array;
         if(!_loc4_)
         {
            _loc4_ = new Array();
         }
         if(_loc4_.indexOf(param3) == -1)
         {
            _loc4_.push(param3);
            this._preference["category"]["featured"][param1][param2] = _loc4_;
         }
      }
      
      public function addFavorite(param1:String, param2:String, param3:String) : void
      {
         var _loc4_:Array = this.getPreference("category","favorite",param1,param2) as Array;
         if(!_loc4_)
         {
            _loc4_ = new Array();
         }
         _loc4_.push(param3);
         this._preference["category"]["favorite"][param1][param2] = _loc4_;
      }
      
      public function removeFavorite(param1:String, param2:String, param3:String) : void
      {
         var _loc4_:Array = this.getPreference("category","favorite",param1,param2) as Array;
         if(_loc4_)
         {
            _loc4_.splice(_loc4_.indexOf(param3),1);
            this._preference["category"]["favorite"][param1][param2] = _loc4_;
         }
      }
      
      public function getFavoriteCategories(param1:String, param2:String) : Array
      {
         return this.getPreference("category","favorite",param1,param2) as Array;
      }
      
      public function getFeaturedCategories(param1:String, param2:String) : Array
      {
         return this.getPreference("category","featured",param1,param2) as Array;
      }
      
      private function getPreference(... rest) : Object
      {
         var _loc5_:String = null;
         var _loc2_:Object = this._preference;
         var _loc3_:int = rest.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(!_loc2_)
            {
               return null;
            }
            _loc5_ = rest[_loc4_];
            _loc2_ = _loc2_[_loc5_];
            _loc4_++;
         }
         return _loc2_;
      }
   }
}
