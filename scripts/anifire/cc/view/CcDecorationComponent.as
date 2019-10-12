package anifire.cc.view
{
   public class CcDecorationComponent extends CcComponent
   {
       
      
      public function CcDecorationComponent()
      {
         super();
      }
      
      override protected function setProperties() : void
      {
         super.setProperties();
         if(loader && this.model && this.model.id)
         {
            loader.name = this.model.id;
         }
      }
   }
}
