package anifire.studio.models
{
   import anifire.bubble.Bubble;
   import anifire.managers.FontVariantManager;
   import anifire.studio.core.AnimeScene;
   import anifire.studio.core.BubbleAsset;
   import anifire.studio.managers.TextComponentManager;
   import anifire.util.FontManager;
   
   public class TextComponentData
   {
       
      
      private var _copies:Array;
      
      public function TextComponentData()
      {
         super();
         this._copies = [];
         this._copies[TextComponentManager.COMPONENT_ROLE_TITLE] = new Vector.<String>();
         this._copies[TextComponentManager.COMPONENT_ROLE_SUBTITLE] = new Vector.<String>();
         this._copies[TextComponentManager.COMPONENT_ROLE_QUOTE] = new Vector.<String>();
         this._copies[TextComponentManager.COMPONENT_ROLE_BODY_TEXT] = new Vector.<String>();
         this._copies[TextComponentManager.COMPONENT_ROLE_CAPTION] = new Vector.<String>();
      }
      
      public function saveTextCopies(param1:AnimeScene) : void
      {
         var _loc3_:* = null;
         if(!param1 || !param1.bubbles)
         {
            return;
         }
         var _loc2_:Object = this.getBubblesFromTextComponent(param1);
         for(_loc3_ in this._copies)
         {
            this.saveTextCopiesForEachType(this._copies[_loc3_],_loc2_[_loc3_]);
         }
      }
      
      private function getBubblesFromTextComponent(param1:AnimeScene) : Object
      {
         var _loc2_:int = 0;
         var _loc4_:BubbleAsset = null;
         var _loc6_:* = null;
         var _loc3_:int = param1.bubbles.length;
         var _loc5_:Object = {};
         _loc5_[TextComponentManager.COMPONENT_ROLE_TITLE] = new Vector.<BubbleAsset>();
         _loc5_[TextComponentManager.COMPONENT_ROLE_SUBTITLE] = new Vector.<BubbleAsset>();
         _loc5_[TextComponentManager.COMPONENT_ROLE_QUOTE] = new Vector.<BubbleAsset>();
         _loc5_[TextComponentManager.COMPONENT_ROLE_BODY_TEXT] = new Vector.<BubbleAsset>();
         _loc5_[TextComponentManager.COMPONENT_ROLE_CAPTION] = new Vector.<BubbleAsset>();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = param1.bubbles.getValueByIndex(_loc2_) as BubbleAsset;
            if(_loc4_ && _loc4_.componentRole && _loc5_[_loc4_.componentRole])
            {
               _loc5_[_loc4_.componentRole].push(_loc4_);
            }
            _loc2_++;
         }
         for(_loc6_ in _loc5_)
         {
            _loc5_[_loc6_] = Vector.<BubbleAsset>(_loc5_[_loc6_]).sort(this.compareBubbleAsset);
         }
         return _loc5_;
      }
      
      private function compareBubbleAsset(param1:BubbleAsset, param2:BubbleAsset) : Number
      {
         if(!param1 || !param2)
         {
            return 0;
         }
         var _loc3_:Number = 20;
         if(Math.abs(param1.x - param2.x) < _loc3_)
         {
            if(Math.abs(param1.y - param2.y) > _loc3_)
            {
               return param1.y < param2.y?Number(-1):Number(1);
            }
            return 0;
         }
         return param1.x < param2.x?Number(-1):Number(1);
      }
      
      private function saveTextCopiesForEachType(param1:Vector.<String>, param2:Vector.<BubbleAsset>) : void
      {
         var _loc3_:int = 0;
         if(!param1 || !param2)
         {
            return;
         }
         var _loc4_:int = param2.length;
         var _loc5_:int = param1.length;
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            if(_loc3_ >= _loc5_)
            {
               param1.push(param2[_loc3_].text);
            }
            else
            {
               param1[_loc3_] = param2[_loc3_].text;
            }
            _loc3_++;
         }
      }
      
      public function loadTextCopies(param1:AnimeScene) : void
      {
         var _loc3_:* = null;
         if(!param1)
         {
            return;
         }
         var _loc2_:Object = this.getBubblesFromTextComponent(param1);
         for(_loc3_ in this._copies)
         {
            this.loadTextCopiesForEachType(this._copies[_loc3_],_loc2_[_loc3_]);
         }
      }
      
      private function loadTextCopiesForEachType(param1:Vector.<String>, param2:Vector.<BubbleAsset>) : void
      {
         var _loc3_:int = 0;
         var _loc6_:BubbleAsset = null;
         var _loc7_:String = null;
         var _loc8_:Bubble = null;
         if(!param1 || !param2)
         {
            return;
         }
         var _loc4_:int = param2.length;
         var _loc5_:int = param1.length;
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            if(_loc3_ < _loc5_)
            {
               _loc6_ = param2[_loc3_];
               _loc7_ = param1[_loc3_];
               _loc6_.text = _loc7_;
               _loc8_ = _loc6_.bubble;
               if(_loc8_)
               {
                  _loc8_.backupText = _loc7_;
                  if(!_loc8_.checkCharacterSupport(_loc7_))
                  {
                     _loc6_.textFont = FontVariantManager.instance.lookupFontLanguageVariant(FontManager.FONT_NAME_NOTO,_loc7_);
                  }
               }
               _loc3_++;
               continue;
            }
            break;
         }
      }
      
      public function clone() : TextComponentData
      {
         var _loc2_:* = null;
         var _loc1_:TextComponentData = new TextComponentData();
         _loc1_._copies = [];
         for(_loc2_ in this._copies)
         {
            _loc1_._copies[_loc2_] = this._copies[_loc2_].concat();
         }
         return _loc1_;
      }
   }
}
