// This file is automatically generated, so please do not edit it.
// @generated by `flutter_rust_bridge`@ 2.6.0.

// ignore_for_file: unused_import, unused_element, unnecessary_import, duplicate_ignore, invalid_use_of_internal_member, annotate_overrides, non_constant_identifier_names, curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables, unused_field

import 'api/lan_mouse_server.dart';
import 'dart:async';
import 'dart:convert';
import 'frb_generated.dart';
import 'frb_generated.io.dart'
    if (dart.library.js_interop) 'frb_generated.web.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

/// Main entrypoint of the Rust API
class RustLib extends BaseEntrypoint<RustLibApi, RustLibApiImpl, RustLibWire> {
  @internal
  static final instance = RustLib._();

  RustLib._();

  /// Initialize flutter_rust_bridge
  static Future<void> init({
    RustLibApi? api,
    BaseHandler? handler,
    ExternalLibrary? externalLibrary,
  }) async {
    await instance.initImpl(
      api: api,
      handler: handler,
      externalLibrary: externalLibrary,
    );
  }

  /// Initialize flutter_rust_bridge in mock mode.
  /// No libraries for FFI are loaded.
  static void initMock({
    required RustLibApi api,
  }) {
    instance.initMockImpl(
      api: api,
    );
  }

  /// Dispose flutter_rust_bridge
  ///
  /// The call to this function is optional, since flutter_rust_bridge (and everything else)
  /// is automatically disposed when the app stops.
  static void dispose() => instance.disposeImpl();

  @override
  ApiImplConstructor<RustLibApiImpl, RustLibWire> get apiImplConstructor =>
      RustLibApiImpl.new;

  @override
  WireConstructor<RustLibWire> get wireConstructor =>
      RustLibWire.fromExternalLibrary;

  @override
  Future<void> executeRustInitializers() async {
    await api.crateApiLanMouseServerInitApp();
  }

  @override
  ExternalLibraryLoaderConfig get defaultExternalLibraryLoaderConfig =>
      kDefaultExternalLibraryLoaderConfig;

  @override
  String get codegenVersion => '2.6.0';

  @override
  int get rustContentHash => -1167507244;

  static const kDefaultExternalLibraryLoaderConfig =
      ExternalLibraryLoaderConfig(
    stem: 'rust_lib_lan_mouse_mobile',
    ioDirectory: 'rust/target/release/',
    webPrefix: 'pkg/',
  );
}

abstract class RustLibApi extends BaseApi {
  Future<void> crateApiLanMouseServerSenderWrapperSend(
      {required SenderWrapper that, required List<int> data});

  Stream<Uint8List> crateApiLanMouseServerConnect(
      {required String basePath,
      required String ipAddr,
      required int port,
      required String targetAddr,
      required int targetPort,
      required ReceiverWrapper rx});

  Future<(SenderWrapper, ReceiverWrapper)>
      crateApiLanMouseServerCreateChannel();

  Future<String?> crateApiLanMouseServerGetFingerprint({required String path});

  Future<void> crateApiLanMouseServerInitApp();

  RustArcIncrementStrongCountFnType
      get rust_arc_increment_strong_count_ReceiverWrapper;

  RustArcDecrementStrongCountFnType
      get rust_arc_decrement_strong_count_ReceiverWrapper;

  CrossPlatformFinalizerArg
      get rust_arc_decrement_strong_count_ReceiverWrapperPtr;

  RustArcIncrementStrongCountFnType
      get rust_arc_increment_strong_count_SenderWrapper;

  RustArcDecrementStrongCountFnType
      get rust_arc_decrement_strong_count_SenderWrapper;

  CrossPlatformFinalizerArg
      get rust_arc_decrement_strong_count_SenderWrapperPtr;
}

class RustLibApiImpl extends RustLibApiImplPlatform implements RustLibApi {
  RustLibApiImpl({
    required super.handler,
    required super.wire,
    required super.generalizedFrbRustBinding,
    required super.portManager,
  });

  @override
  Future<void> crateApiLanMouseServerSenderWrapperSend(
      {required SenderWrapper that, required List<int> data}) {
    return handler.executeNormal(NormalTask(
      callFfi: (port_) {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        sse_encode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSenderWrapper(
            that, serializer);
        sse_encode_list_prim_u_8_loose(data, serializer);
        pdeCallFfi(generalizedFrbRustBinding, serializer,
            funcId: 1, port: port_);
      },
      codec: SseCodec(
        decodeSuccessData: sse_decode_unit,
        decodeErrorData: null,
      ),
      constMeta: kCrateApiLanMouseServerSenderWrapperSendConstMeta,
      argValues: [that, data],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiLanMouseServerSenderWrapperSendConstMeta =>
      const TaskConstMeta(
        debugName: "SenderWrapper_send",
        argNames: ["that", "data"],
      );

  @override
  Stream<Uint8List> crateApiLanMouseServerConnect(
      {required String basePath,
      required String ipAddr,
      required int port,
      required String targetAddr,
      required int targetPort,
      required ReceiverWrapper rx}) {
    final sink = RustStreamSink<Uint8List>();
    unawaited(handler.executeNormal(NormalTask(
      callFfi: (port_) {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        sse_encode_String(basePath, serializer);
        sse_encode_String(ipAddr, serializer);
        sse_encode_u_16(port, serializer);
        sse_encode_String(targetAddr, serializer);
        sse_encode_u_16(targetPort, serializer);
        sse_encode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerReceiverWrapper(
            rx, serializer);
        sse_encode_StreamSink_list_prim_u_8_strict_Sse(sink, serializer);
        pdeCallFfi(generalizedFrbRustBinding, serializer,
            funcId: 2, port: port_);
      },
      codec: SseCodec(
        decodeSuccessData: sse_decode_unit,
        decodeErrorData: null,
      ),
      constMeta: kCrateApiLanMouseServerConnectConstMeta,
      argValues: [basePath, ipAddr, port, targetAddr, targetPort, rx, sink],
      apiImpl: this,
    )));
    return sink.stream;
  }

  TaskConstMeta get kCrateApiLanMouseServerConnectConstMeta =>
      const TaskConstMeta(
        debugName: "connect",
        argNames: [
          "basePath",
          "ipAddr",
          "port",
          "targetAddr",
          "targetPort",
          "rx",
          "sink"
        ],
      );

  @override
  Future<(SenderWrapper, ReceiverWrapper)>
      crateApiLanMouseServerCreateChannel() {
    return handler.executeNormal(NormalTask(
      callFfi: (port_) {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        pdeCallFfi(generalizedFrbRustBinding, serializer,
            funcId: 3, port: port_);
      },
      codec: SseCodec(
        decodeSuccessData:
            sse_decode_record_auto_owned_rust_opaque_flutter_rust_bridgefor_generated_rust_auto_opaque_inner_sender_wrapper_auto_owned_rust_opaque_flutter_rust_bridgefor_generated_rust_auto_opaque_inner_receiver_wrapper,
        decodeErrorData: null,
      ),
      constMeta: kCrateApiLanMouseServerCreateChannelConstMeta,
      argValues: [],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiLanMouseServerCreateChannelConstMeta =>
      const TaskConstMeta(
        debugName: "create_channel",
        argNames: [],
      );

  @override
  Future<String?> crateApiLanMouseServerGetFingerprint({required String path}) {
    return handler.executeNormal(NormalTask(
      callFfi: (port_) {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        sse_encode_String(path, serializer);
        pdeCallFfi(generalizedFrbRustBinding, serializer,
            funcId: 4, port: port_);
      },
      codec: SseCodec(
        decodeSuccessData: sse_decode_opt_String,
        decodeErrorData: null,
      ),
      constMeta: kCrateApiLanMouseServerGetFingerprintConstMeta,
      argValues: [path],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiLanMouseServerGetFingerprintConstMeta =>
      const TaskConstMeta(
        debugName: "get_fingerprint",
        argNames: ["path"],
      );

  @override
  Future<void> crateApiLanMouseServerInitApp() {
    return handler.executeNormal(NormalTask(
      callFfi: (port_) {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        pdeCallFfi(generalizedFrbRustBinding, serializer,
            funcId: 5, port: port_);
      },
      codec: SseCodec(
        decodeSuccessData: sse_decode_unit,
        decodeErrorData: null,
      ),
      constMeta: kCrateApiLanMouseServerInitAppConstMeta,
      argValues: [],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiLanMouseServerInitAppConstMeta =>
      const TaskConstMeta(
        debugName: "init_app",
        argNames: [],
      );

  RustArcIncrementStrongCountFnType
      get rust_arc_increment_strong_count_ReceiverWrapper => wire
          .rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerReceiverWrapper;

  RustArcDecrementStrongCountFnType
      get rust_arc_decrement_strong_count_ReceiverWrapper => wire
          .rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerReceiverWrapper;

  RustArcIncrementStrongCountFnType
      get rust_arc_increment_strong_count_SenderWrapper => wire
          .rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSenderWrapper;

  RustArcDecrementStrongCountFnType
      get rust_arc_decrement_strong_count_SenderWrapper => wire
          .rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSenderWrapper;

  @protected
  AnyhowException dco_decode_AnyhowException(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return AnyhowException(raw as String);
  }

  @protected
  ReceiverWrapper
      dco_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerReceiverWrapper(
          dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return ReceiverWrapperImpl.frbInternalDcoDecode(raw as List<dynamic>);
  }

  @protected
  SenderWrapper
      dco_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSenderWrapper(
          dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return SenderWrapperImpl.frbInternalDcoDecode(raw as List<dynamic>);
  }

  @protected
  SenderWrapper
      dco_decode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSenderWrapper(
          dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return SenderWrapperImpl.frbInternalDcoDecode(raw as List<dynamic>);
  }

  @protected
  ReceiverWrapper
      dco_decode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerReceiverWrapper(
          dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return ReceiverWrapperImpl.frbInternalDcoDecode(raw as List<dynamic>);
  }

  @protected
  SenderWrapper
      dco_decode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSenderWrapper(
          dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return SenderWrapperImpl.frbInternalDcoDecode(raw as List<dynamic>);
  }

  @protected
  RustStreamSink<Uint8List> dco_decode_StreamSink_list_prim_u_8_strict_Sse(
      dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    throw UnimplementedError();
  }

  @protected
  String dco_decode_String(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as String;
  }

  @protected
  List<int> dco_decode_list_prim_u_8_loose(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as List<int>;
  }

  @protected
  Uint8List dco_decode_list_prim_u_8_strict(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as Uint8List;
  }

  @protected
  String? dco_decode_opt_String(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw == null ? null : dco_decode_String(raw);
  }

  @protected
  (
    SenderWrapper,
    ReceiverWrapper
  ) dco_decode_record_auto_owned_rust_opaque_flutter_rust_bridgefor_generated_rust_auto_opaque_inner_sender_wrapper_auto_owned_rust_opaque_flutter_rust_bridgefor_generated_rust_auto_opaque_inner_receiver_wrapper(
      dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    final arr = raw as List<dynamic>;
    if (arr.length != 2) {
      throw Exception('Expected 2 elements, got ${arr.length}');
    }
    return (
      dco_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSenderWrapper(
          arr[0]),
      dco_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerReceiverWrapper(
          arr[1]),
    );
  }

  @protected
  int dco_decode_u_16(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as int;
  }

  @protected
  int dco_decode_u_8(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as int;
  }

  @protected
  void dco_decode_unit(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return;
  }

  @protected
  BigInt dco_decode_usize(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return dcoDecodeU64(raw);
  }

  @protected
  AnyhowException sse_decode_AnyhowException(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var inner = sse_decode_String(deserializer);
    return AnyhowException(inner);
  }

  @protected
  ReceiverWrapper
      sse_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerReceiverWrapper(
          SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return ReceiverWrapperImpl.frbInternalSseDecode(
        sse_decode_usize(deserializer), sse_decode_i_32(deserializer));
  }

  @protected
  SenderWrapper
      sse_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSenderWrapper(
          SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return SenderWrapperImpl.frbInternalSseDecode(
        sse_decode_usize(deserializer), sse_decode_i_32(deserializer));
  }

  @protected
  SenderWrapper
      sse_decode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSenderWrapper(
          SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return SenderWrapperImpl.frbInternalSseDecode(
        sse_decode_usize(deserializer), sse_decode_i_32(deserializer));
  }

  @protected
  ReceiverWrapper
      sse_decode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerReceiverWrapper(
          SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return ReceiverWrapperImpl.frbInternalSseDecode(
        sse_decode_usize(deserializer), sse_decode_i_32(deserializer));
  }

  @protected
  SenderWrapper
      sse_decode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSenderWrapper(
          SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return SenderWrapperImpl.frbInternalSseDecode(
        sse_decode_usize(deserializer), sse_decode_i_32(deserializer));
  }

  @protected
  RustStreamSink<Uint8List> sse_decode_StreamSink_list_prim_u_8_strict_Sse(
      SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    throw UnimplementedError('Unreachable ()');
  }

  @protected
  String sse_decode_String(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var inner = sse_decode_list_prim_u_8_strict(deserializer);
    return utf8.decoder.convert(inner);
  }

  @protected
  List<int> sse_decode_list_prim_u_8_loose(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var len_ = sse_decode_i_32(deserializer);
    return deserializer.buffer.getUint8List(len_);
  }

  @protected
  Uint8List sse_decode_list_prim_u_8_strict(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var len_ = sse_decode_i_32(deserializer);
    return deserializer.buffer.getUint8List(len_);
  }

  @protected
  String? sse_decode_opt_String(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs

    if (sse_decode_bool(deserializer)) {
      return (sse_decode_String(deserializer));
    } else {
      return null;
    }
  }

  @protected
  (
    SenderWrapper,
    ReceiverWrapper
  ) sse_decode_record_auto_owned_rust_opaque_flutter_rust_bridgefor_generated_rust_auto_opaque_inner_sender_wrapper_auto_owned_rust_opaque_flutter_rust_bridgefor_generated_rust_auto_opaque_inner_receiver_wrapper(
      SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var var_field0 =
        sse_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSenderWrapper(
            deserializer);
    var var_field1 =
        sse_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerReceiverWrapper(
            deserializer);
    return (var_field0, var_field1);
  }

  @protected
  int sse_decode_u_16(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getUint16();
  }

  @protected
  int sse_decode_u_8(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getUint8();
  }

  @protected
  void sse_decode_unit(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
  }

  @protected
  BigInt sse_decode_usize(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getBigUint64();
  }

  @protected
  int sse_decode_i_32(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getInt32();
  }

  @protected
  bool sse_decode_bool(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getUint8() != 0;
  }

  @protected
  void sse_encode_AnyhowException(
      AnyhowException self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_String(self.message, serializer);
  }

  @protected
  void
      sse_encode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerReceiverWrapper(
          ReceiverWrapper self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_usize(
        (self as ReceiverWrapperImpl).frbInternalSseEncode(move: true),
        serializer);
  }

  @protected
  void
      sse_encode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSenderWrapper(
          SenderWrapper self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_usize(
        (self as SenderWrapperImpl).frbInternalSseEncode(move: true),
        serializer);
  }

  @protected
  void
      sse_encode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSenderWrapper(
          SenderWrapper self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_usize(
        (self as SenderWrapperImpl).frbInternalSseEncode(move: false),
        serializer);
  }

  @protected
  void
      sse_encode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerReceiverWrapper(
          ReceiverWrapper self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_usize(
        (self as ReceiverWrapperImpl).frbInternalSseEncode(move: null),
        serializer);
  }

  @protected
  void
      sse_encode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSenderWrapper(
          SenderWrapper self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_usize(
        (self as SenderWrapperImpl).frbInternalSseEncode(move: null),
        serializer);
  }

  @protected
  void sse_encode_StreamSink_list_prim_u_8_strict_Sse(
      RustStreamSink<Uint8List> self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_String(
        self.setupAndSerialize(
            codec: SseCodec(
          decodeSuccessData: sse_decode_list_prim_u_8_strict,
          decodeErrorData: sse_decode_AnyhowException,
        )),
        serializer);
  }

  @protected
  void sse_encode_String(String self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_list_prim_u_8_strict(utf8.encoder.convert(self), serializer);
  }

  @protected
  void sse_encode_list_prim_u_8_loose(
      List<int> self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_i_32(self.length, serializer);
    serializer.buffer
        .putUint8List(self is Uint8List ? self : Uint8List.fromList(self));
  }

  @protected
  void sse_encode_list_prim_u_8_strict(
      Uint8List self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_i_32(self.length, serializer);
    serializer.buffer.putUint8List(self);
  }

  @protected
  void sse_encode_opt_String(String? self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs

    sse_encode_bool(self != null, serializer);
    if (self != null) {
      sse_encode_String(self, serializer);
    }
  }

  @protected
  void
      sse_encode_record_auto_owned_rust_opaque_flutter_rust_bridgefor_generated_rust_auto_opaque_inner_sender_wrapper_auto_owned_rust_opaque_flutter_rust_bridgefor_generated_rust_auto_opaque_inner_receiver_wrapper(
          (SenderWrapper, ReceiverWrapper) self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSenderWrapper(
        self.$1, serializer);
    sse_encode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerReceiverWrapper(
        self.$2, serializer);
  }

  @protected
  void sse_encode_u_16(int self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putUint16(self);
  }

  @protected
  void sse_encode_u_8(int self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putUint8(self);
  }

  @protected
  void sse_encode_unit(void self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
  }

  @protected
  void sse_encode_usize(BigInt self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putBigUint64(self);
  }

  @protected
  void sse_encode_i_32(int self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putInt32(self);
  }

  @protected
  void sse_encode_bool(bool self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putUint8(self ? 1 : 0);
  }
}

@sealed
class ReceiverWrapperImpl extends RustOpaque implements ReceiverWrapper {
  // Not to be used by end users
  ReceiverWrapperImpl.frbInternalDcoDecode(List<dynamic> wire)
      : super.frbInternalDcoDecode(wire, _kStaticData);

  // Not to be used by end users
  ReceiverWrapperImpl.frbInternalSseDecode(BigInt ptr, int externalSizeOnNative)
      : super.frbInternalSseDecode(ptr, externalSizeOnNative, _kStaticData);

  static final _kStaticData = RustArcStaticData(
    rustArcIncrementStrongCount:
        RustLib.instance.api.rust_arc_increment_strong_count_ReceiverWrapper,
    rustArcDecrementStrongCount:
        RustLib.instance.api.rust_arc_decrement_strong_count_ReceiverWrapper,
    rustArcDecrementStrongCountPtr:
        RustLib.instance.api.rust_arc_decrement_strong_count_ReceiverWrapperPtr,
  );
}

@sealed
class SenderWrapperImpl extends RustOpaque implements SenderWrapper {
  // Not to be used by end users
  SenderWrapperImpl.frbInternalDcoDecode(List<dynamic> wire)
      : super.frbInternalDcoDecode(wire, _kStaticData);

  // Not to be used by end users
  SenderWrapperImpl.frbInternalSseDecode(BigInt ptr, int externalSizeOnNative)
      : super.frbInternalSseDecode(ptr, externalSizeOnNative, _kStaticData);

  static final _kStaticData = RustArcStaticData(
    rustArcIncrementStrongCount:
        RustLib.instance.api.rust_arc_increment_strong_count_SenderWrapper,
    rustArcDecrementStrongCount:
        RustLib.instance.api.rust_arc_decrement_strong_count_SenderWrapper,
    rustArcDecrementStrongCountPtr:
        RustLib.instance.api.rust_arc_decrement_strong_count_SenderWrapperPtr,
  );

  Future<void> send({required List<int> data}) => RustLib.instance.api
      .crateApiLanMouseServerSenderWrapperSend(that: this, data: data);
}
