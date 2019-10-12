package anifire.studio.components
{
   import anifire.studio.skins.VoiceAssignedListSkin;
   import spark.components.List;
   
   public class VoiceAssignedList extends List
   {
       
      
      public function VoiceAssignedList()
      {
         super();
         setStyle("skinClass",VoiceAssignedListSkin);
      }
   }
}
