package
{
   import mx.resources.ResourceBundle;
   
   public class en_US$containers_properties extends ResourceBundle
   {
       
      
      public function en_US$containers_properties()
      {
         super("en_US","containers");
      }
      
      override protected function getContent() : Object
      {
         var _loc1_:Object = {
            "noColumnsFound":"No ConstraintColumns found.",
            "noRowsFound":"No ConstraintRows found.",
            "rowNotFound":"ConstraintRow \'{0}\' not found.",
            "columnNotFound":"ConstraintColumn \'{0}\' not found."
         };
         return _loc1_;
      }
   }
}
