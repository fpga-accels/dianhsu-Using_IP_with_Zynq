; ModuleID = 'C:/Users/dianhsu/Desktop/Using_IP_with_Zynq/mylab/relu_hls/relu/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: noinline
define void @apatb_relu_top_ir([128 x [128 x float]]* %din) local_unnamed_addr #0 {
entry:
  %malloccall = tail call i8* @malloc(i64 196608)
  %din_copy = bitcast i8* %malloccall to [3 x [128 x [128 x float]]]*
  %0 = bitcast [128 x [128 x float]]* %din to [3 x [128 x [128 x float]]]*
  call fastcc void @copy_in([3 x [128 x [128 x float]]]* %0, [3 x [128 x [128 x float]]]* %din_copy)
  %1 = getelementptr inbounds [3 x [128 x [128 x float]]], [3 x [128 x [128 x float]]]* %din_copy, i32 0, i32 0
  call void @apatb_relu_top_hw([128 x [128 x float]]* %1)
  call fastcc void @copy_out([3 x [128 x [128 x float]]]* %0, [3 x [128 x [128 x float]]]* %din_copy)
  tail call void @free(i8* %malloccall)
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_in([3 x [128 x [128 x float]]]* noalias readonly, [3 x [128 x [128 x float]]]* noalias) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a3a128a128f32([3 x [128 x [128 x float]]]* %1, [3 x [128 x [128 x float]]]* %0)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a3a128a128f32([3 x [128 x [128 x float]]]* noalias, [3 x [128 x [128 x float]]]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [3 x [128 x [128 x float]]]* %0, null
  %3 = icmp eq [3 x [128 x [128 x float]]]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop.split, %copy
  %for.loop.idx21 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop.split ]
  br label %for.loop2

for.loop2:                                        ; preds = %for.loop2.split, %for.loop
  %for.loop.idx320 = phi i64 [ 0, %for.loop ], [ %for.loop.idx3.next, %for.loop2.split ]
  br label %for.loop8

for.loop8:                                        ; preds = %for.loop8, %for.loop2
  %for.loop.idx919 = phi i64 [ 0, %for.loop2 ], [ %for.loop.idx9.next, %for.loop8 ]
  %dst.addr1115.gep17 = getelementptr [3 x [128 x [128 x float]]], [3 x [128 x [128 x float]]]* %0, i64 0, i64 %for.loop.idx21, i64 %for.loop.idx320, i64 %for.loop.idx919
  %5 = bitcast float* %dst.addr1115.gep17 to i8*
  %src.addr1216.gep18 = getelementptr [3 x [128 x [128 x float]]], [3 x [128 x [128 x float]]]* %1, i64 0, i64 %for.loop.idx21, i64 %for.loop.idx320, i64 %for.loop.idx919
  %6 = bitcast float* %src.addr1216.gep18 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 4, i1 false)
  %for.loop.idx9.next = add nuw nsw i64 %for.loop.idx919, 1
  %exitcond = icmp ne i64 %for.loop.idx9.next, 128
  br i1 %exitcond, label %for.loop8, label %for.loop2.split

for.loop2.split:                                  ; preds = %for.loop8
  %for.loop.idx3.next = add nuw nsw i64 %for.loop.idx320, 1
  %exitcond22 = icmp ne i64 %for.loop.idx3.next, 128
  br i1 %exitcond22, label %for.loop2, label %for.loop.split

for.loop.split:                                   ; preds = %for.loop2.split
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx21, 1
  %exitcond23 = icmp ne i64 %for.loop.idx.next, 3
  br i1 %exitcond23, label %for.loop, label %ret

ret:                                              ; preds = %for.loop.split, %entry
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #3

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_out([3 x [128 x [128 x float]]]* noalias, [3 x [128 x [128 x float]]]* noalias readonly) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a3a128a128f32([3 x [128 x [128 x float]]]* %0, [3 x [128 x [128 x float]]]* %1)
  ret void
}

declare void @free(i8*) local_unnamed_addr

declare void @apatb_relu_top_hw([128 x [128 x float]]*)

define void @relu_top_hw_stub_wrapper([128 x [128 x float]]*) #5 {
entry:
  %1 = bitcast [128 x [128 x float]]* %0 to [3 x [128 x [128 x float]]]*
  call void @copy_out([3 x [128 x [128 x float]]]* null, [3 x [128 x [128 x float]]]* %1)
  %2 = bitcast [3 x [128 x [128 x float]]]* %1 to [128 x [128 x float]]*
  call void @relu_top_hw_stub([128 x [128 x float]]* %2)
  call void @copy_in([3 x [128 x [128 x float]]]* null, [3 x [128 x [128 x float]]]* %1)
  ret void
}

declare void @relu_top_hw_stub([128 x [128 x float]]*)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
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
