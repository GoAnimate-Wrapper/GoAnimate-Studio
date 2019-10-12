package anifire.studio.validators
{
   import anifire.util.UtilDict;
   import mx.utils.StringUtil;
   import mx.validators.ValidationResult;
   
   public class AssetTitleValidator extends BadWordsValidator
   {
       
      
      private var results:Array;
      
      public function AssetTitleValidator()
      {
         super();
      }
      
      override protected function doValidation(param1:Object) : Array
      {
         this.results = [];
         var _loc2_:String = String(param1);
         if(!_loc2_)
         {
            _loc2_ = "";
         }
         else
         {
            _loc2_ = StringUtil.trim(_loc2_);
         }
         if(_loc2_.length == 0)
         {
            this.results.push(new ValidationResult(true,null,"blank",UtilDict.toDisplay("go","Please input a title")));
            return this.results;
         }
         this.results = super.doValidation(_loc2_);
         return this.results;
      }
   }
}
