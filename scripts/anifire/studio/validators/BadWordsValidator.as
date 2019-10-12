package anifire.studio.validators
{
   import anifire.constant.AnimeConstants;
   import anifire.studio.core.Console;
   import anifire.util.BadwordFilter;
   import anifire.util.UtilDict;
   import mx.validators.ValidationResult;
   import mx.validators.Validator;
   
   public class BadWordsValidator extends Validator
   {
       
      
      private var results:Array;
      
      public function BadWordsValidator()
      {
         super();
      }
      
      override protected function doValidation(param1:Object) : Array
      {
         var _loc2_:String = String(param1);
         this.results = [];
         var _loc3_:BadwordFilter = new BadwordFilter(Console.getConsole().getBadTerms(),null,Console.getConsole().getWhiteTerms());
         if(_loc3_.containsBadword(_loc2_))
         {
            this.results.push(new ValidationResult(true,null,"badWord",UtilDict.toDisplay("go",AnimeConstants.ERR_BAD)));
            return this.results;
         }
         return this.results;
      }
   }
}
