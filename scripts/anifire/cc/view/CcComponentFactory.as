package anifire.cc.view
{
   import anifire.constant.CcLibConstant;
   
   public class CcComponentFactory
   {
       
      
      public function CcComponentFactory()
      {
         super();
      }
      
      public static function create(param1:String) : CcComponent
      {
         var _loc2_:CcComponent = null;
         if(param1)
         {
            if(param1 == CcLibConstant.COMPONENT_TYPE_EYEBROW || param1 == CcLibConstant.COMPONENT_TYPE_GLASSES)
            {
               _loc2_ = new CcPairComponent();
            }
            else if(param1 == CcLibConstant.COMPONENT_TYPE_EYEBROW + "Left" || param1 == CcLibConstant.COMPONENT_TYPE_GLASSES + "Left")
            {
               _loc2_ = new CcPairComponent();
            }
            else if(param1 == CcLibConstant.COMPONENT_TYPE_EYEBROW + "Right" || param1 == CcLibConstant.COMPONENT_TYPE_GLASSES + "Right")
            {
               _loc2_ = new CcPairComponent();
            }
            else if(param1 == CcLibConstant.COMPONENT_TYPE_HAIR)
            {
               _loc2_ = new CcHairComponent();
            }
            else if(param1 == CcLibConstant.COMPONENT_TYPE_FRONT_HAIR || param1 == CcLibConstant.COMPONENT_TYPE_BACK_HAIR)
            {
               _loc2_ = new CcHairComponent();
            }
            else if(param1 == CcLibConstant.COMPONENT_TYPE_FACIAL_DECORATION)
            {
               _loc2_ = new CcDecorationComponent();
            }
            else if(param1 == CcLibConstant.COMPONENT_TYPE_EYE)
            {
               _loc2_ = new CcEyeComponent();
            }
            else if(param1 == CcLibConstant.COMPONENT_TYPE_EYE + "Left" || param1 == CcLibConstant.COMPONENT_TYPE_EYE + "Right")
            {
               _loc2_ = new CcEyeComponent();
            }
            else if(param1 == CcLibConstant.COMPONENT_TYPE_MOUTH)
            {
               _loc2_ = new CcMouthComponent();
            }
            else
            {
               _loc2_ = new CcComponent();
            }
         }
         if(_loc2_)
         {
            _loc2_.name = param1;
         }
         return _loc2_;
      }
   }
}
