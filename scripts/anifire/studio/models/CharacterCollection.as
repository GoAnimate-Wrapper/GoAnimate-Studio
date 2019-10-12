package anifire.studio.models
{
   public class CharacterCollection extends ProductCollection
   {
       
      
      public function CharacterCollection(param1:String)
      {
         super(param1);
      }
      
      override public function get isProperCollection() : Boolean
      {
         var _loc1_:ThumbModel = null;
         if(length > 1)
         {
            return true;
         }
         if(length == 1)
         {
            _loc1_ = getItemAt(0) as ThumbModel;
            return !_loc1_.isPlaceHolder;
         }
         return false;
      }
   }
}
