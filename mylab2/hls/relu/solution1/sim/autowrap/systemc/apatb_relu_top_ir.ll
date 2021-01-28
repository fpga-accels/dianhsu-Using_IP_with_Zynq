; ModuleID = 'C:/Users/dianhsu/Desktop/Using_IP_with_Zynq/mylab2/hls/relu/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: argmemonly noinline
define void @apatb_relu_top_ir([8 x float]* %din, [8 x float]* %dout, i32* %positive, i32* %negative) local_unnamed_addr #0 {
entry:
  %din_copy = alloca [8 x [8 x float]], align 512
  %dout_copy = alloca [8 x [8 x float]], align 512
  %positive_copy = alloca i32, align 512
  %negative_copy = alloca i32, align 512
  %0 = bitcast [8 x float]* %din to [8 x [8 x float]]*
  %1 = bitcast [8 x float]* %dout to [8 x [8 x float]]*
  call fastcc void @copy_in([8 x [8 x float]]* %0, [8 x [8 x float]]* nonnull align 512 %din_copy, [8 x [8 x float]]* %1, [8 x [8 x float]]* nonnull align 512 %dout_copy, i32* %positive, i32* nonnull align 512 %positive_copy, i32* %negative, i32* nonnull align 512 %negative_copy)
  %2 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]]* %din_copy, i32 0, i32 0
  %3 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]]* %dout_copy, i32 0, i32 0
  call void @apatb_relu_top_hw([8 x float]* %2, [8 x float]* %3, i32* %positive_copy, i32* %negative_copy)
  call fastcc void @copy_out([8 x [8 x float]]* %0, [8 x [8 x float]]* nonnull align 512 %din_copy, [8 x [8 x float]]* %1, [8 x [8 x float]]* nonnull align 512 %dout_copy, i32* %positive, i32* nonnull align 512 %positive_copy, i32* %negative, i32* nonnull align 512 %negative_copy)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_in([8 x [8 x float]]* readonly, [8 x [8 x float]]* noalias align 512, [8 x [8 x float]]* readonly, [8 x [8 x float]]* noalias align 512, i32* readonly, i32* noalias align 512, i32* readonly, i32* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a8a8f32([8 x [8 x float]]* align 512 %1, [8 x [8 x float]]* %0)
  call fastcc void @onebyonecpy_hls.p0a8a8f32([8 x [8 x float]]* align 512 %3, [8 x [8 x float]]* %2)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %5, i32* %4)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %7, i32* %6)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a8a8f32([8 x [8 x float]]* noalias align 512, [8 x [8 x float]]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [8 x [8 x float]]* %0, null
  %3 = icmp eq [8 x [8 x float]]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop.split, %copy
  %for.loop.idx12 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop.split ]
  br label %for.loop2

for.loop2:                                        ; preds = %for.loop2, %for.loop
  %for.loop.idx311 = phi i64 [ 0, %for.loop ], [ %for.loop.idx3.next, %for.loop2 ]
  %dst.addr57.gep9 = getelementptr [8 x [8 x float]], [8 x [8 x float]]* %0, i64 0, i64 %for.loop.idx12, i64 %for.loop.idx311
  %5 = bitcast float* %dst.addr57.gep9 to i8*
  %src.addr68.gep10 = getelementptr [8 x [8 x float]], [8 x [8 x float]]* %1, i64 0, i64 %for.loop.idx12, i64 %for.loop.idx311
  %6 = bitcast float* %src.addr68.gep10 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 4, i1 false)
  %for.loop.idx3.next = add nuw nsw i64 %for.loop.idx311, 1
  %exitcond = icmp ne i64 %for.loop.idx3.next, 8
  br i1 %exitcond, label %for.loop2, label %for.loop.split

for.loop.split:                                   ; preds = %for.loop2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx12, 1
  %exitcond13 = icmp ne i64 %for.loop.idx.next, 8
  br i1 %exitcond13, label %for.loop, label %ret

ret:                                              ; preds = %for.loop.split, %entry
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #3

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0i32(i32* noalias align 512, i32* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq i32* %0, null
  %3 = icmp eq i32* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %5 = bitcast i32* %0 to i8*
  %6 = bitcast i32* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 4, i1 false)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_out([8 x [8 x float]]*, [8 x [8 x float]]* noalias readonly align 512, [8 x [8 x float]]*, [8 x [8 x float]]* noalias readonly align 512, i32*, i32* noalias readonly align 512, i32*, i32* noalias readonly align 512) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a8a8f32([8 x [8 x float]]* %0, [8 x [8 x float]]* align 512 %1)
  call fastcc void @onebyonecpy_hls.p0a8a8f32([8 x [8 x float]]* %2, [8 x [8 x float]]* align 512 %3)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %4, i32* align 512 %5)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %6, i32* align 512 %7)
  ret void
}

declare void @apatb_relu_top_hw([8 x float]*, [8 x float]*, i32*, i32*)

define void @relu_top_hw_stub_wrapper([8 x float]*, [8 x float]*, i32*, i32*) #5 {
entry:
  %4 = bitcast [8 x float]* %0 to [8 x [8 x float]]*
  %5 = bitcast [8 x float]* %1 to [8 x [8 x float]]*
  call void @copy_out([8 x [8 x float]]* null, [8 x [8 x float]]* %4, [8 x [8 x float]]* null, [8 x [8 x float]]* %5, i32* null, i32* %2, i32* null, i32* %3)
  %6 = bitcast [8 x [8 x float]]* %4 to [8 x float]*
  %7 = bitcast [8 x [8 x float]]* %5 to [8 x float]*
  call void @relu_top_hw_stub([8 x float]* %6, [8 x float]* %7, i32* %2, i32* %3)
  call void @copy_in([8 x [8 x float]]* null, [8 x [8 x float]]* %4, [8 x [8 x float]]* null, [8 x [8 x float]]* %5, i32* null, i32* %2, i32* null, i32* %3)
  ret void
}

declare void @relu_top_hw_stub([8 x float]*, [8 x float]*, i32*, i32*)

attributes #0 = { argmemonly noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { argmemonly noinline "fpga.wrapper.func"="copyout" }
attributes #5 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
