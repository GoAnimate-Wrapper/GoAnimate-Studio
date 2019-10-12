package anifire.studio.components
{
   import anifire.studio.skins.DialogListSkin;
   import spark.components.List;
   
   public class DialogList extends List
   {
       
      
      public function DialogList()
      {
         super();
         setStyle("skinClass",DialogListSkin);
      }
   }
}
