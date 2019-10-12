package anifire.studio.components
{
   import anifire.studio.skins.WidgetFormItemSkin;
   import spark.components.FormItem;
   
   public class WidgetFormItem extends FormItem
   {
       
      
      public function WidgetFormItem()
      {
         super();
         setStyle("skinClass",WidgetFormItemSkin);
      }
   }
}
