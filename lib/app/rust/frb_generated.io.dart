// This file is automatically generated, so please do not edit it.
// @generated by `flutter_rust_bridge`@ 2.6.0.

// ignore_for_file: unused_import, unused_element, unnecessary_import, duplicate_ignore, invalid_use_of_internal_member, annotate_overrides, non_constant_identifier_names, curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables, unused_field

import 'api/lan_mouse_server.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:ffi' as ffi;
import 'frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated_io.dart';

abstract class RustLibApiImplPlatform extends BaseApiImpl<RustLibWire> {
  RustLibApiImplPlatform({
    required super.handler,
    required super.wire,
    required super.generalizedFrbRustBinding,
    required super.portManager,
  });

  CrossPlatformFinalizerArg
      get rust_arc_decrement_strong_count_ReceiverWrapperPtr => wire
          ._rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerReceiverWrapperPtr;

  CrossPlatformFinalizerArg
      get rust_arc_decrement_strong_count_SenderWrapperPtr => wire
          ._rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSenderWrapperPtr;

  @protected
  AnyhowException dco_decode_AnyhowException(dynamic raw);

  @protected
  ReceiverWrapper
      dco_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerReceiverWrapper(
          dynamic raw);

  @protected
  SenderWrapper
      dco_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSenderWrapper(
          dynamic raw);

  @protected
  SenderWrapper
      dco_decode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSenderWrapper(
          dynamic raw);

  @protected
  ReceiverWrapper
      dco_decode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerReceiverWrapper(
          dynamic raw);

  @protected
  SenderWrapper
      dco_decode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSenderWrapper(
          dynamic raw);

  @protected
  RustStreamSink<Uint8List> dco_decode_StreamSink_list_prim_u_8_strict_Sse(
      dynamic raw);

  @protected
  String dco_decode_String(dynamic raw);

  @protected
  List<int> dco_decode_list_prim_u_8_loose(dynamic raw);

  @protected
  Uint8List dco_decode_list_prim_u_8_strict(dynamic raw);

  @protected
  String? dco_decode_opt_String(dynamic raw);

  @protected
  (
    SenderWrapper,
    ReceiverWrapper
  ) dco_decode_record_auto_owned_rust_opaque_flutter_rust_bridgefor_generated_rust_auto_opaque_inner_sender_wrapper_auto_owned_rust_opaque_flutter_rust_bridgefor_generated_rust_auto_opaque_inner_receiver_wrapper(
      dynamic raw);

  @protected
  int dco_decode_u_16(dynamic raw);

  @protected
  int dco_decode_u_8(dynamic raw);

  @protected
  void dco_decode_unit(dynamic raw);

  @protected
  BigInt dco_decode_usize(dynamic raw);

  @protected
  AnyhowException sse_decode_AnyhowException(SseDeserializer deserializer);

  @protected
  ReceiverWrapper
      sse_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerReceiverWrapper(
          SseDeserializer deserializer);

  @protected
  SenderWrapper
      sse_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSenderWrapper(
          SseDeserializer deserializer);

  @protected
  SenderWrapper
      sse_decode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSenderWrapper(
          SseDeserializer deserializer);

  @protected
  ReceiverWrapper
      sse_decode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerReceiverWrapper(
          SseDeserializer deserializer);

  @protected
  SenderWrapper
      sse_decode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSenderWrapper(
          SseDeserializer deserializer);

  @protected
  RustStreamSink<Uint8List> sse_decode_StreamSink_list_prim_u_8_strict_Sse(
      SseDeserializer deserializer);

  @protected
  String sse_decode_String(SseDeserializer deserializer);

  @protected
  List<int> sse_decode_list_prim_u_8_loose(SseDeserializer deserializer);

  @protected
  Uint8List sse_decode_list_prim_u_8_strict(SseDeserializer deserializer);

  @protected
  String? sse_decode_opt_String(SseDeserializer deserializer);

  @protected
  (
    SenderWrapper,
    ReceiverWrapper
  ) sse_decode_record_auto_owned_rust_opaque_flutter_rust_bridgefor_generated_rust_auto_opaque_inner_sender_wrapper_auto_owned_rust_opaque_flutter_rust_bridgefor_generated_rust_auto_opaque_inner_receiver_wrapper(
      SseDeserializer deserializer);

  @protected
  int sse_decode_u_16(SseDeserializer deserializer);

  @protected
  int sse_decode_u_8(SseDeserializer deserializer);

  @protected
  void sse_decode_unit(SseDeserializer deserializer);

  @protected
  BigInt sse_decode_usize(SseDeserializer deserializer);

  @protected
  int sse_decode_i_32(SseDeserializer deserializer);

  @protected
  bool sse_decode_bool(SseDeserializer deserializer);

  @protected
  void sse_encode_AnyhowException(
      AnyhowException self, SseSerializer serializer);

  @protected
  void
      sse_encode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerReceiverWrapper(
          ReceiverWrapper self, SseSerializer serializer);

  @protected
  void
      sse_encode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSenderWrapper(
          SenderWrapper self, SseSerializer serializer);

  @protected
  void
      sse_encode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSenderWrapper(
          SenderWrapper self, SseSerializer serializer);

  @protected
  void
      sse_encode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerReceiverWrapper(
          ReceiverWrapper self, SseSerializer serializer);

  @protected
  void
      sse_encode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSenderWrapper(
          SenderWrapper self, SseSerializer serializer);

  @protected
  void sse_encode_StreamSink_list_prim_u_8_strict_Sse(
      RustStreamSink<Uint8List> self, SseSerializer serializer);

  @protected
  void sse_encode_String(String self, SseSerializer serializer);

  @protected
  void sse_encode_list_prim_u_8_loose(List<int> self, SseSerializer serializer);

  @protected
  void sse_encode_list_prim_u_8_strict(
      Uint8List self, SseSerializer serializer);

  @protected
  void sse_encode_opt_String(String? self, SseSerializer serializer);

  @protected
  void
      sse_encode_record_auto_owned_rust_opaque_flutter_rust_bridgefor_generated_rust_auto_opaque_inner_sender_wrapper_auto_owned_rust_opaque_flutter_rust_bridgefor_generated_rust_auto_opaque_inner_receiver_wrapper(
          (SenderWrapper, ReceiverWrapper) self, SseSerializer serializer);

  @protected
  void sse_encode_u_16(int self, SseSerializer serializer);

  @protected
  void sse_encode_u_8(int self, SseSerializer serializer);

  @protected
  void sse_encode_unit(void self, SseSerializer serializer);

  @protected
  void sse_encode_usize(BigInt self, SseSerializer serializer);

  @protected
  void sse_encode_i_32(int self, SseSerializer serializer);

  @protected
  void sse_encode_bool(bool self, SseSerializer serializer);
}

// Section: wire_class

class RustLibWire implements BaseWire {
  factory RustLibWire.fromExternalLibrary(ExternalLibrary lib) =>
      RustLibWire(lib.ffiDynamicLibrary);

  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  RustLibWire(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  void
      rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerReceiverWrapper(
    ffi.Pointer<ffi.Void> ptr,
  ) {
    return _rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerReceiverWrapper(
      ptr,
    );
  }

  late final _rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerReceiverWrapperPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
          'frbgen_lan_mouse_mobile_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerReceiverWrapper');
  late final _rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerReceiverWrapper =
      _rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerReceiverWrapperPtr
          .asFunction<void Function(ffi.Pointer<ffi.Void>)>();

  void
      rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerReceiverWrapper(
    ffi.Pointer<ffi.Void> ptr,
  ) {
    return _rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerReceiverWrapper(
      ptr,
    );
  }

  late final _rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerReceiverWrapperPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
          'frbgen_lan_mouse_mobile_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerReceiverWrapper');
  late final _rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerReceiverWrapper =
      _rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerReceiverWrapperPtr
          .asFunction<void Function(ffi.Pointer<ffi.Void>)>();

  void
      rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSenderWrapper(
    ffi.Pointer<ffi.Void> ptr,
  ) {
    return _rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSenderWrapper(
      ptr,
    );
  }

  late final _rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSenderWrapperPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
          'frbgen_lan_mouse_mobile_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSenderWrapper');
  late final _rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSenderWrapper =
      _rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSenderWrapperPtr
          .asFunction<void Function(ffi.Pointer<ffi.Void>)>();

  void
      rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSenderWrapper(
    ffi.Pointer<ffi.Void> ptr,
  ) {
    return _rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSenderWrapper(
      ptr,
    );
  }

  late final _rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSenderWrapperPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
          'frbgen_lan_mouse_mobile_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSenderWrapper');
  late final _rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSenderWrapper =
      _rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSenderWrapperPtr
          .asFunction<void Function(ffi.Pointer<ffi.Void>)>();
}
