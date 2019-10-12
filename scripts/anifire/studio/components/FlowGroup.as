package anifire.studio.components
{
   import anifire.studio.layouts.FlowLayout;
   import spark.components.Group;
   
   public class FlowGroup extends Group
   {
       
      
      public function FlowGroup()
      {
         super();
         super.layout = new FlowLayout();
         minHeight = 0;
      }
   }
}
