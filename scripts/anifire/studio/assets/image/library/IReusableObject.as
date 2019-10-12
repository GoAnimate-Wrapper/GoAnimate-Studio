package anifire.studio.assets.image.library
{
   public interface IReusableObject
   {
       
      
      function doBeforeReuse() : void;
      
      function releaseResource() : void;
   }
}
