package anifire.studio.models
{
   import spark.collections.Sort;
   import spark.collections.SortField;
   
   public class SoundCollection extends ProductCollection
   {
       
      
      public function SoundCollection(param1:String, param2:Boolean = true)
      {
         super(param1,source);
         if(param2)
         {
            _productSort = new Sort();
            _productSort.fields = [new SortField("name")];
         }
      }
   }
}
