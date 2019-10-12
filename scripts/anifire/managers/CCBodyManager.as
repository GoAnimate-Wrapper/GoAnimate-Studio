package anifire.managers
{
   import anifire.models.creator.CCBodyModel;
   
   public class CCBodyManager
   {
      
      private static var _instance:CCBodyManager;
       
      
      private var _models:Object;
      
      public function CCBodyManager()
      {
         super();
         this._models = {};
      }
      
      public static function get instance() : CCBodyManager
      {
         if(_instance == null)
         {
            _instance = new CCBodyManager();
         }
         return _instance;
      }
      
      public function getBodyModel(param1:String) : CCBodyModel
      {
         var _loc2_:CCBodyModel = this._models[param1];
         if(!_loc2_)
         {
            _loc2_ = new CCBodyModel(param1);
            this._models[param1] = _loc2_;
         }
         return _loc2_;
      }
   }
}
