package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.lf32;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_vorbis_book_decodev_add extends Machine
   {
       
      
      public function FSM_vorbis_book_decodev_add()
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
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:* = 0;
         var _loc11_:* = 0;
         var _loc12_:* = 0;
         var _loc13_:int = 0;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         FSM_vorbis_book_decodev_add.esp = FSM_vorbis_book_decodev_add.esp - 4;
         si32(FSM_vorbis_book_decodev_add.ebp,FSM_vorbis_book_decodev_add.esp);
         FSM_vorbis_book_decodev_add.ebp = FSM_vorbis_book_decodev_add.esp;
         FSM_vorbis_book_decodev_add.esp = FSM_vorbis_book_decodev_add.esp - 0;
         _loc1_ = li32(FSM_vorbis_book_decodev_add.ebp + 8);
         _loc2_ = li32(FSM_vorbis_book_decodev_add.ebp + 12);
         _loc3_ = int(li32(_loc1_ + 8));
         _loc4_ = li32(FSM_vorbis_book_decodev_add.ebp + 16);
         _loc5_ = li32(FSM_vorbis_book_decodev_add.ebp + 20);
         _loc6_ = _loc2_;
         if(_loc3_ <= 0)
         {
            addr109:
            _loc1_ = 0;
         }
         else
         {
            _loc3_ = int(li32(_loc1_));
            _loc7_ = _loc1_ + 16;
            _loc8_ = _loc1_;
            if(_loc3_ <= 8)
            {
               _loc6_ = 0;
               while(true)
               {
                  if(_loc6_ >= _loc5_)
                  {
                     addr108:
                     §§goto(addr109);
                  }
                  else
                  {
                     FSM_vorbis_book_decodev_add.esp = FSM_vorbis_book_decodev_add.esp - 8;
                     si32(_loc1_,FSM_vorbis_book_decodev_add.esp);
                     si32(_loc4_,FSM_vorbis_book_decodev_add.esp + 4);
                     FSM_vorbis_book_decodev_add.esp = FSM_vorbis_book_decodev_add.esp - 4;
                     FSM_vorbis_book_decodev_add.start();
                     _loc3_ = int(FSM_vorbis_book_decodev_add.eax);
                     FSM_vorbis_book_decodev_add.esp = FSM_vorbis_book_decodev_add.esp + 8;
                     if(_loc3_ != -1)
                     {
                        _loc9_ = li32(_loc7_);
                        _loc10_ = int(li32(_loc8_));
                        _loc3_ = int(_loc10_ * _loc3_);
                        if(_loc10_ <= 4)
                        {
                           if(_loc10_ <= 2)
                           {
                              if(_loc10_ != 1)
                              {
                                 if(_loc10_ != 2)
                                 {
                                    continue;
                                 }
                                 _loc10_ = 0;
                              }
                              else
                              {
                                 _loc10_ = 0;
                              }
                              addr810:
                              _loc3_ = int(_loc3_ + _loc10_);
                              _loc3_ = _loc3_ << 2;
                              _loc10_ = _loc6_ << 2;
                              _loc3_ = int(_loc9_ + _loc3_);
                              _loc9_ = _loc2_ + _loc10_;
                              _loc14_ = lf32(_loc9_);
                              _loc15_ = lf32(_loc3_);
                              _loc14_ = _loc14_ + _loc15_;
                              _loc14_ = _loc14_;
                              sf32(_loc14_,_loc9_);
                              _loc6_ = _loc6_ + 1;
                              continue;
                           }
                           if(_loc10_ != 3)
                           {
                              if(_loc10_ != 4)
                              {
                                 continue;
                              }
                              _loc10_ = 0;
                           }
                           else
                           {
                              _loc10_ = 0;
                           }
                           addr706:
                           _loc11_ = int(_loc3_ + _loc10_);
                           _loc11_ = _loc11_ << 2;
                           _loc12_ = _loc6_ << 2;
                           _loc11_ = int(_loc9_ + _loc11_);
                           _loc12_ = int(_loc2_ + _loc12_);
                           _loc14_ = lf32(_loc12_);
                           _loc15_ = lf32(_loc11_);
                           _loc14_ = _loc14_ + _loc15_;
                           _loc14_ = _loc14_;
                           sf32(_loc14_,_loc12_);
                           _loc10_ = int(_loc10_ + 1);
                           _loc6_ = _loc6_ + 1;
                           _loc11_ = int(_loc3_ + _loc10_);
                           _loc11_ = _loc11_ << 2;
                           _loc12_ = _loc6_ << 2;
                           _loc11_ = int(_loc9_ + _loc11_);
                           _loc12_ = int(_loc2_ + _loc12_);
                           _loc14_ = lf32(_loc12_);
                           _loc15_ = lf32(_loc11_);
                           _loc14_ = _loc14_ + _loc15_;
                           _loc14_ = _loc14_;
                           sf32(_loc14_,_loc12_);
                           _loc10_ = int(_loc10_ + 1);
                           _loc6_ = _loc6_ + 1;
                           §§goto(addr810);
                        }
                        else
                        {
                           if(_loc10_ <= 6)
                           {
                              if(_loc10_ != 5)
                              {
                                 if(_loc10_ != 6)
                                 {
                                    continue;
                                 }
                                 _loc10_ = 0;
                              }
                              else
                              {
                                 _loc10_ = 0;
                              }
                              addr602:
                              _loc11_ = int(_loc3_ + _loc10_);
                              _loc11_ = _loc11_ << 2;
                              _loc12_ = _loc6_ << 2;
                              _loc11_ = int(_loc9_ + _loc11_);
                              _loc12_ = int(_loc2_ + _loc12_);
                              _loc14_ = lf32(_loc12_);
                              _loc15_ = lf32(_loc11_);
                              _loc14_ = _loc14_ + _loc15_;
                              _loc14_ = _loc14_;
                              sf32(_loc14_,_loc12_);
                              _loc10_ = int(_loc10_ + 1);
                              _loc6_ = _loc6_ + 1;
                           }
                           else
                           {
                              if(_loc10_ != 8)
                              {
                                 if(_loc10_ == 7)
                                 {
                                    _loc10_ = 0;
                                 }
                                 else
                                 {
                                    continue;
                                 }
                              }
                              else
                              {
                                 _loc10_ = 1;
                                 _loc11_ = _loc6_ << 2;
                                 _loc12_ = _loc3_ << 2;
                                 _loc11_ = int(_loc2_ + _loc11_);
                                 _loc12_ = int(_loc9_ + _loc12_);
                                 _loc14_ = lf32(_loc11_);
                                 _loc15_ = lf32(_loc12_);
                                 _loc14_ = _loc14_ + _loc15_;
                                 _loc14_ = _loc14_;
                                 sf32(_loc14_,_loc11_);
                                 _loc6_ = _loc6_ + 1;
                              }
                              _loc11_ = int(_loc3_ + _loc10_);
                              _loc11_ = _loc11_ << 2;
                              _loc12_ = _loc6_ << 2;
                              _loc11_ = int(_loc9_ + _loc11_);
                              _loc12_ = int(_loc2_ + _loc12_);
                              _loc14_ = lf32(_loc12_);
                              _loc15_ = lf32(_loc11_);
                              _loc14_ = _loc14_ + _loc15_;
                              _loc14_ = _loc14_;
                              sf32(_loc14_,_loc12_);
                              _loc10_ = int(_loc10_ + 1);
                              _loc6_ = _loc6_ + 1;
                           }
                           _loc11_ = int(_loc3_ + _loc10_);
                           _loc11_ = _loc11_ << 2;
                           _loc12_ = _loc6_ << 2;
                           _loc11_ = int(_loc9_ + _loc11_);
                           _loc12_ = int(_loc2_ + _loc12_);
                           _loc14_ = lf32(_loc12_);
                           _loc15_ = lf32(_loc11_);
                           _loc14_ = _loc14_ + _loc15_;
                           _loc14_ = _loc14_;
                           sf32(_loc14_,_loc12_);
                           _loc10_ = int(_loc10_ + 1);
                           _loc6_ = _loc6_ + 1;
                           §§goto(addr602);
                        }
                        _loc11_ = int(_loc3_ + _loc10_);
                        _loc11_ = _loc11_ << 2;
                        _loc12_ = _loc6_ << 2;
                        _loc11_ = int(_loc9_ + _loc11_);
                        _loc12_ = int(_loc2_ + _loc12_);
                        _loc14_ = lf32(_loc12_);
                        _loc15_ = lf32(_loc11_);
                        _loc14_ = _loc14_ + _loc15_;
                        _loc14_ = _loc14_;
                        sf32(_loc14_,_loc12_);
                        _loc10_ = int(_loc10_ + 1);
                        _loc6_ = _loc6_ + 1;
                        §§goto(addr706);
                     }
                  }
               }
            }
            else
            {
               _loc2_ = 0;
               while(true)
               {
                  if(_loc2_ >= _loc5_)
                  {
                     §§goto(addr108);
                  }
                  else
                  {
                     FSM_vorbis_book_decodev_add.esp = FSM_vorbis_book_decodev_add.esp - 8;
                     si32(_loc1_,FSM_vorbis_book_decodev_add.esp);
                     si32(_loc4_,FSM_vorbis_book_decodev_add.esp + 4);
                     FSM_vorbis_book_decodev_add.esp = FSM_vorbis_book_decodev_add.esp - 4;
                     FSM_vorbis_book_decodev_add.start();
                     _loc3_ = int(FSM_vorbis_book_decodev_add.eax);
                     FSM_vorbis_book_decodev_add.esp = FSM_vorbis_book_decodev_add.esp + 8;
                     if(_loc3_ != -1)
                     {
                        _loc9_ = 0;
                        _loc10_ = int(li32(_loc8_));
                        _loc3_ = int(_loc3_ * _loc10_);
                        _loc10_ = int(li32(_loc7_));
                        _loc3_ = _loc3_ << 2;
                        _loc11_ = _loc2_ << 2;
                        _loc11_ = int(_loc6_ + _loc11_);
                        _loc3_ = int(_loc10_ + _loc3_);
                        _loc10_ = int(_loc9_);
                        while(true)
                        {
                           _loc12_ = int(li32(_loc8_));
                           if(_loc12_ <= _loc9_)
                           {
                              break;
                           }
                           _loc12_ = int(_loc3_ + _loc10_);
                           _loc13_ = _loc11_ + _loc10_;
                           _loc14_ = lf32(_loc13_);
                           _loc15_ = lf32(_loc12_);
                           _loc14_ = _loc14_ + _loc15_;
                           _loc14_ = _loc14_;
                           sf32(_loc14_,_loc13_);
                           _loc10_ = int(_loc10_ + 4);
                           _loc9_ = _loc9_ + 1;
                        }
                        _loc2_ = _loc2_ + _loc9_;
                        continue;
                     }
                  }
               }
            }
            _loc2_ = -1;
            _loc1_ = _loc2_;
         }
         FSM_vorbis_book_decodev_add.eax = _loc1_;
         FSM_vorbis_book_decodev_add.esp = FSM_vorbis_book_decodev_add.ebp;
         FSM_vorbis_book_decodev_add.ebp = li32(FSM_vorbis_book_decodev_add.esp);
         FSM_vorbis_book_decodev_add.esp = FSM_vorbis_book_decodev_add.esp + 4;
         FSM_vorbis_book_decodev_add.esp = FSM_vorbis_book_decodev_add.esp + 4;
      }
   }
}
