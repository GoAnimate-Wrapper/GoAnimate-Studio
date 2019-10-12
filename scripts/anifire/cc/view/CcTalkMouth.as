package anifire.cc.view
{
   import anifire.cc.model.CcMouthModel;
   import anifire.component.CcComponentLoader;
   
   public class CcTalkMouth extends CcComponent
   {
       
      
      public function CcTalkMouth()
      {
         super();
      }
      
      override protected function getComponentLoader() : CcComponentLoader
      {
         var _loc1_:CcComponentLoader = null;
         var _loc2_:String = null;
         if(this.model)
         {
            _loc2_ = this.model.url;
            if(this.model is CcMouthModel)
            {
               _loc2_ = CcMouthModel(this.model).talkMouthUrl;
            }
            _loc1_ = CcComponentLoader.getComponentLoader(_loc2_,_loc2_);
         }
         return _loc1_;
      }
   }
}
