package anifire.studio.models
{
   import spark.collections.Sort;
   import spark.collections.SortField;
   
   public class ActionCollection extends ProductCollection
   {
       
      
      public function ActionCollection(param1:String, param2:Array = null)
      {
         super(param1,param2);
         _productSort = new Sort();
         _productSort.fields = [new SortField("name")];
      }
   }
}
