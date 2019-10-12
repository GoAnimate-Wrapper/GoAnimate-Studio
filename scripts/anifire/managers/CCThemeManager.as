package anifire.managers
{
   import anifire.models.creator.CCThemeModel;
   
   public class CCThemeManager
   {
      
      private static var _instance:CCThemeManager;
       
      
      private var _models:Object;
      
      public function CCThemeManager()
      {
         super();
         this._models = {};
      }
      
      public static function get instance() : CCThemeManager
      {
         if(_instance == null)
         {
            _instance = new CCThemeManager();
         }
         return _instance;
      }
      
      public function getThemeModel(param1:String) : CCThemeModel
      {
         var _loc2_:CCThemeModel = this._models[param1];
         if(!_loc2_)
         {
            _loc2_ = new CCThemeModel(param1);
            this._models[param1] = _loc2_;
         }
         return _loc2_;
      }
   }
}
