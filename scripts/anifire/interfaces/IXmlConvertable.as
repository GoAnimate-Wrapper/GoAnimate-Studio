package anifire.interfaces
{
   public interface IXmlConvertable
   {
       
      
      function convertToXml() : XML;
      
      function convertFromXml(param1:XML) : Boolean;
   }
}
