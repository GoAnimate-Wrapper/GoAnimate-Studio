package anifire.component
{
   import anifire.util.UtilHashArray;
   import anifire.util.UtilPlain;
   import flash.display.FrameLabel;
   
   public class ActionSequence
   {
       
      
      private const DEFAULT_SUBACTION_DURATION:Number = 50;
      
      private var _sequence:Array;
      
      private var _subActionIndex:UtilHashArray;
      
      private var _sequenceIndex:UtilHashArray;
      
      private var _subActionDuration:Array;
      
      private var _subActionStartFrame:Array;
      
      private var _index:Number = 0;
      
      public function ActionSequence()
      {
         super();
      }
      
      public function get sequence() : Array
      {
         return !!this._sequence?this._sequence.concat():null;
      }
      
      public function set sequence(param1:Array) : void
      {
         this._sequence = param1;
         this._index = 0;
         this.resetSequenceIndex();
      }
      
      public function init(param1:Array) : void
      {
         if(param1 && param1.length > 0)
         {
            this.sequence = param1;
         }
      }
      
      public function set memento(param1:ActionSequenceMemento) : void
      {
         if(param1)
         {
            this._subActionIndex = param1.vars[1];
            this._sequenceIndex = param1.vars[2];
            this._subActionDuration = param1.vars[3];
            this._subActionStartFrame = param1.vars[4];
            this.sequence = param1.vars[0];
         }
      }
      
      public function get memento() : ActionSequenceMemento
      {
         return new ActionSequenceMemento(this._sequence,this._subActionIndex,this._sequenceIndex,this._subActionDuration,this._subActionStartFrame);
      }
      
      public function clone() : ActionSequence
      {
         var _loc1_:ActionSequence = new ActionSequence();
         _loc1_.memento = this.memento;
         return _loc1_;
      }
      
      public function randomize() : void
      {
         if(this._sequence)
         {
            UtilPlain.randomizeArray(this._sequence);
            this.sequence = this._sequence;
         }
      }
      
      public function serialize() : String
      {
         return !!this._sequence?"seq=\"" + this._sequence.toString() + "\"":"";
      }
      
      public function toString() : String
      {
         return !!this._sequence?this._sequence.toString():"";
      }
      
      public function getNextSubActionStartFrame(param1:Number) : Number
      {
         var _loc2_:Number = NaN;
         if(this._sequence && this._sequence.length > 0)
         {
            this._index++;
            if(this._index >= this._sequence.length)
            {
               this._index = 0;
            }
            _loc2_ = this._sequence[this._index];
            if(this._subActionStartFrame)
            {
               if(_loc2_ < this._subActionStartFrame.length)
               {
                  return this._subActionStartFrame[_loc2_];
               }
               return 1;
            }
            return this.DEFAULT_SUBACTION_DURATION * _loc2_ + 1;
         }
         return 1;
      }
      
      private function getSubActionIndex(param1:Number) : Number
      {
         if(this._subActionIndex)
         {
            if(param1 > this._subActionIndex.length)
            {
               param1 = param1 % this._subActionIndex.length;
            }
            return this._subActionIndex.getValueByKey(String(param1));
         }
         return Math.floor((param1 - 1) / this.DEFAULT_SUBACTION_DURATION);
      }
      
      private function getSequenceIndex(param1:Number) : Number
      {
         if(this._sequenceIndex)
         {
            if(param1 >= this._sequenceIndex.length)
            {
               param1 = param1 % this._sequenceIndex.length + 1;
            }
            return this._sequenceIndex.getValueByKey(String(param1)).index;
         }
         return Math.floor((param1 - 1) / this.DEFAULT_SUBACTION_DURATION);
      }
      
      private function getSubActionDuration(param1:Number) : Number
      {
         var _loc2_:Number = this.getSubActionIndex(param1);
         if(this._subActionDuration)
         {
            return this._subActionDuration[_loc2_];
         }
         return this.DEFAULT_SUBACTION_DURATION;
      }
      
      private function getSubActionStartFrame(param1:Number) : Number
      {
         var _loc2_:Number = this.getSubActionIndex(param1);
         if(this._subActionStartFrame)
         {
            return this._subActionStartFrame[_loc2_];
         }
         return this.DEFAULT_SUBACTION_DURATION * _loc2_ + 1;
      }
      
      public function shouldChangeSubAction(param1:Number) : Boolean
      {
         if(param1 >= this.getSubActionStartFrame(param1) + this.getSubActionDuration(param1) - 1)
         {
            return true;
         }
         if(this._sequence && this.getSubActionIndex(param1) != this._sequence[this._index])
         {
         }
         return false;
      }
      
      public function initByFrameLabels(param1:Array, param2:int) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(param1 && param1.length > 0)
         {
            this._subActionIndex = new UtilHashArray();
            this._subActionStartFrame = new Array();
            this._subActionDuration = new Array();
            _loc3_ = 0;
            while(_loc3_ < param1.length)
            {
               this._subActionStartFrame.push(FrameLabel(param1[_loc3_]).frame);
               if(_loc3_ == param1.length - 1)
               {
                  this._subActionDuration.push(param2 - FrameLabel(param1[_loc3_]).frame + 1);
               }
               else
               {
                  this._subActionDuration.push(FrameLabel(param1[_loc3_ + 1]).frame - FrameLabel(param1[_loc3_]).frame);
               }
               _loc4_ = 0;
               while(_loc4_ < this._subActionDuration[_loc3_])
               {
                  this._subActionIndex.push(String(this._subActionStartFrame[_loc3_] + _loc4_),_loc3_);
                  _loc4_++;
               }
               _loc3_++;
            }
            this.resetSequenceIndex();
         }
      }
      
      private function resetSequenceIndex() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(this._sequence && this._sequence.length > 0 && this._subActionDuration)
         {
            this._sequenceIndex = new UtilHashArray();
            _loc1_ = 1;
            _loc2_ = 0;
            while(_loc2_ < this._sequence.length)
            {
               _loc3_ = 0;
               while(_loc3_ < this._subActionDuration[this._sequence[_loc2_]])
               {
                  this._sequenceIndex.push(String(_loc1_),{
                     "index":_loc2_,
                     "frameOffset":_loc3_
                  });
                  _loc1_++;
                  _loc3_++;
               }
               _loc2_++;
            }
         }
      }
      
      public function behaviourToClipFrame(param1:Number) : Number
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(this._sequence && this._sequence.length > 0)
         {
            _loc2_ = 0;
            if(this._sequenceIndex)
            {
               if(param1 >= this._sequenceIndex.length)
               {
                  param1 = param1 % this._sequenceIndex.length + 1;
               }
               _loc2_ = this._sequenceIndex.getValueByKey(String(param1)).frameOffset;
            }
            this._index = this.getSequenceIndex(param1);
            _loc3_ = this._sequence[this._index];
            if(this._subActionStartFrame)
            {
               return this._subActionStartFrame[_loc3_] + _loc2_;
            }
            return this.DEFAULT_SUBACTION_DURATION * _loc3_ + 1 + _loc2_;
         }
         return param1;
      }
   }
}
