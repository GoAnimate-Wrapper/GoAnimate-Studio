package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.lf32;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_vorbis_lpc_predict extends Machine
   {
       
      
      public function FSM_vorbis_lpc_predict()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:* = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:* = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         FSM_vorbis_lpc_predict.esp = FSM_vorbis_lpc_predict.esp - 4;
         si32(FSM_vorbis_lpc_predict.ebp,FSM_vorbis_lpc_predict.esp);
         FSM_vorbis_lpc_predict.ebp = FSM_vorbis_lpc_predict.esp;
         FSM_vorbis_lpc_predict.esp = FSM_vorbis_lpc_predict.esp - 0;
         _loc1_ = li32(FSM_vorbis_lpc_predict.ebp + 16);
         _loc2_ = li32(FSM_vorbis_lpc_predict.ebp + 24);
         _loc3_ = int(_loc1_ + _loc2_);
         _loc4_ = FSM_vorbis_lpc_predict.esp;
         _loc3_ = _loc3_ << 2;
         _loc3_ = int(_loc4_ - _loc3_);
         FSM_vorbis_lpc_predict.esp = _loc3_;
         _loc4_ = li32(FSM_vorbis_lpc_predict.ebp + 20);
         _loc5_ = li32(FSM_vorbis_lpc_predict.ebp + 8);
         _loc6_ = li32(FSM_vorbis_lpc_predict.ebp + 12);
         if(_loc6_ != 0)
         {
            _loc7_ = 0;
            _loc8_ = _loc7_;
            while(_loc7_ < _loc1_)
            {
               _loc9_ = _loc6_ + _loc8_;
               _loc13_ = lf32(_loc9_);
               _loc9_ = _loc3_ + _loc8_;
               sf32(_loc13_,_loc9_);
               _loc8_ = _loc8_ + 4;
               _loc7_ = int(_loc7_ + 1);
            }
         }
         else
         {
            _loc6_ = 0;
            _loc7_ = int(_loc3_);
            while(true)
            {
               _loc8_ = _loc7_;
               _loc7_ = int(_loc6_);
               _loc6_ = _loc8_;
               if(_loc7_ >= _loc1_)
               {
                  break;
               }
               _loc9_ = 0;
               si32(_loc9_,_loc6_);
               _loc6_ = _loc8_ + 4;
               _loc8_ = _loc7_ + 1;
               _loc7_ = int(_loc6_);
               _loc6_ = _loc8_;
            }
         }
         _loc6_ = 0;
         _loc7_ = int(_loc6_);
         while(true)
         {
            _loc12_ = _loc7_;
            if(_loc6_ < _loc2_)
            {
               _loc13_ = 0;
               _loc7_ = _loc1_ << 2;
               _loc7_ = int(_loc5_ + _loc7_);
               _loc13_ = _loc13_;
               _loc9_ = 0;
               _loc8_ = _loc3_ + _loc12_;
               _loc7_ = int(_loc7_ + -4);
               while(true)
               {
                  _loc11_ = _loc7_;
                  _loc10_ = _loc8_;
                  _loc7_ = int(_loc10_);
                  _loc8_ = _loc11_;
                  if(_loc9_ >= _loc1_)
                  {
                     break;
                  }
                  _loc14_ = lf32(_loc7_);
                  _loc15_ = lf32(_loc8_);
                  _loc14_ = _loc14_ * _loc15_;
                  _loc14_ = _loc14_;
                  _loc14_ = _loc14_;
                  _loc13_ = _loc13_;
                  _loc13_ = _loc13_ - _loc14_;
                  _loc13_ = _loc13_;
                  _loc7_ = int(_loc11_ + -4);
                  _loc8_ = _loc10_ + 4;
                  _loc9_ = _loc9_ + 1;
               }
               sf32(_loc13_,_loc7_);
               _loc7_ = int(_loc4_ + _loc12_);
               sf32(_loc13_,_loc7_);
               _loc7_ = int(_loc12_ + 4);
               _loc6_ = _loc6_ + 1;
               continue;
            }
            break;
         }
         FSM_vorbis_lpc_predict.esp = FSM_vorbis_lpc_predict.ebp;
         FSM_vorbis_lpc_predict.ebp = li32(FSM_vorbis_lpc_predict.esp);
         FSM_vorbis_lpc_predict.esp = FSM_vorbis_lpc_predict.esp + 4;
         FSM_vorbis_lpc_predict.esp = FSM_vorbis_lpc_predict.esp + 4;
      }
   }
}
