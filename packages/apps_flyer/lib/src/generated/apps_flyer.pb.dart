//
//  Generated code. Do not modify.
//  source: apps_flyer.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ModelAppFlyer extends $pb.GeneratedMessage {
  factory ModelAppFlyer({
    $core.Map<$core.String, $core.String>? values,
  }) {
    final $result = create();
    if (values != null) {
      $result.values.addAll(values);
    }
    return $result;
  }
  ModelAppFlyer._() : super();
  factory ModelAppFlyer.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ModelAppFlyer.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ModelAppFlyer', createEmptyInstance: create)
    ..m<$core.String, $core.String>(4, _omitFieldNames ? '' : 'values', entryClassName: 'ModelAppFlyer.ValuesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ModelAppFlyer clone() => ModelAppFlyer()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ModelAppFlyer copyWith(void Function(ModelAppFlyer) updates) => super.copyWith((message) => updates(message as ModelAppFlyer)) as ModelAppFlyer;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ModelAppFlyer create() => ModelAppFlyer._();
  ModelAppFlyer createEmptyInstance() => create();
  static $pb.PbList<ModelAppFlyer> createRepeated() => $pb.PbList<ModelAppFlyer>();
  @$core.pragma('dart2js:noInline')
  static ModelAppFlyer getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ModelAppFlyer>(create);
  static ModelAppFlyer? _defaultInstance;

  @$pb.TagNumber(4)
  $core.Map<$core.String, $core.String> get values => $_getMap(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
