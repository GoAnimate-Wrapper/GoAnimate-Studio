package anifire.studio.models
{
   import anifire.studio.components.PropThumbRenderer;
   import mx.core.ClassFactory;
   
   public class SearchPropCollection extends SearchCollection
   {
       
      
      public function SearchPropCollection(param1:String, param2:Array = null)
      {
         super(param1,param2);
         itemRenderer = new ClassFactory(PropThumbRenderer);
      }
      
      override public function reset() : void
      {
         super.reset();
         filterFunction = null;
         refresh();
      }
   }
}
