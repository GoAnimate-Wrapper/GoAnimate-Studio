package anifire.studio.components
{
   import anifire.studio.skins.VoiceAtBackgroundListSkin;
   import spark.components.List;
   
   public class VoiceAtBackgroundList extends List
   {
       
      
      public function VoiceAtBackgroundList()
      {
         super();
         setStyle("skinClass",VoiceAtBackgroundListSkin);
      }
   }
}
