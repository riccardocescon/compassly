// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ice_candidate_document_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ICECandidateDocumentModel {

@JsonKey(includeToJson: false) String get id; String get sdpMid; int get sdpMLineIndex; String get candidate;
/// Create a copy of ICECandidateDocumentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ICECandidateDocumentModelCopyWith<ICECandidateDocumentModel> get copyWith => _$ICECandidateDocumentModelCopyWithImpl<ICECandidateDocumentModel>(this as ICECandidateDocumentModel, _$identity);

  /// Serializes this ICECandidateDocumentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ICECandidateDocumentModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ICECandidateDocumentModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.sdpMid, _this.sdpMid) || other.sdpMid == _this.sdpMid)&&(identical(other.sdpMLineIndex, _this.sdpMLineIndex) || other.sdpMLineIndex == _this.sdpMLineIndex)&&(identical(other.candidate, _this.candidate) || other.candidate == _this.candidate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ICECandidateDocumentModel;
  return Object.hash(runtimeType,_this.id,_this.sdpMid,_this.sdpMLineIndex,_this.candidate);
}

@override
String toString() {
  final _this = this as ICECandidateDocumentModel;
  return 'ICECandidateDocumentModel(id: ${_this.id}, sdpMid: ${_this.sdpMid}, sdpMLineIndex: ${_this.sdpMLineIndex}, candidate: ${_this.candidate})';
}


}

/// @nodoc
abstract mixin class $ICECandidateDocumentModelCopyWith<$Res>  {
  factory $ICECandidateDocumentModelCopyWith(ICECandidateDocumentModel value, $Res Function(ICECandidateDocumentModel) _then) = _$ICECandidateDocumentModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeToJson: false) String id, String sdpMid, int sdpMLineIndex, String candidate
});




}
/// @nodoc
class _$ICECandidateDocumentModelCopyWithImpl<$Res>
    implements $ICECandidateDocumentModelCopyWith<$Res> {
  _$ICECandidateDocumentModelCopyWithImpl(this._self, this._then);

  final ICECandidateDocumentModel _self;
  final $Res Function(ICECandidateDocumentModel) _then;

/// Create a copy of ICECandidateDocumentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sdpMid = null,Object? sdpMLineIndex = null,Object? candidate = null,}) {
  return _then(ICECandidateDocumentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sdpMid: null == sdpMid ? _self.sdpMid : sdpMid // ignore: cast_nullable_to_non_nullable
as String,sdpMLineIndex: null == sdpMLineIndex ? _self.sdpMLineIndex : sdpMLineIndex // ignore: cast_nullable_to_non_nullable
as int,candidate: null == candidate ? _self.candidate : candidate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ICECandidateDocumentModel].
extension ICECandidateDocumentModelPatterns on ICECandidateDocumentModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ICECandidateDocumentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ICECandidateDocumentModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ICECandidateDocumentModel value)  $default,){
final _that = this;
switch (_that) {
case _ICECandidateDocumentModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ICECandidateDocumentModel value)?  $default,){
final _that = this;
switch (_that) {
case _ICECandidateDocumentModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeToJson: false)  String id,  String sdpMid,  int sdpMLineIndex,  String candidate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ICECandidateDocumentModel() when $default != null:
return $default(_that.id,_that.sdpMid,_that.sdpMLineIndex,_that.candidate);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeToJson: false)  String id,  String sdpMid,  int sdpMLineIndex,  String candidate)  $default,) {final _that = this;
switch (_that) {
case _ICECandidateDocumentModel():
return $default(_that.id,_that.sdpMid,_that.sdpMLineIndex,_that.candidate);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeToJson: false)  String id,  String sdpMid,  int sdpMLineIndex,  String candidate)?  $default,) {final _that = this;
switch (_that) {
case _ICECandidateDocumentModel() when $default != null:
return $default(_that.id,_that.sdpMid,_that.sdpMLineIndex,_that.candidate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ICECandidateDocumentModel implements ICECandidateDocumentModel {
  const _ICECandidateDocumentModel({@JsonKey(includeToJson: false) required this.id, required this.sdpMid, required this.sdpMLineIndex, required this.candidate});
  factory _ICECandidateDocumentModel.fromJson(Map<String, dynamic> json) => _$ICECandidateDocumentModelFromJson(json);

@override@JsonKey(includeToJson: false) final  String id;
@override final  String sdpMid;
@override final  int sdpMLineIndex;
@override final  String candidate;

/// Create a copy of ICECandidateDocumentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ICECandidateDocumentModelCopyWith<_ICECandidateDocumentModel> get copyWith => __$ICECandidateDocumentModelCopyWithImpl<_ICECandidateDocumentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ICECandidateDocumentModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ICECandidateDocumentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.sdpMid, sdpMid) || other.sdpMid == sdpMid)&&(identical(other.sdpMLineIndex, sdpMLineIndex) || other.sdpMLineIndex == sdpMLineIndex)&&(identical(other.candidate, candidate) || other.candidate == candidate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,sdpMid,sdpMLineIndex,candidate);
}

@override
String toString() {
    return 'ICECandidateDocumentModel(id: $id, sdpMid: $sdpMid, sdpMLineIndex: $sdpMLineIndex, candidate: $candidate)';
}


}

/// @nodoc
abstract mixin class _$ICECandidateDocumentModelCopyWith<$Res> implements $ICECandidateDocumentModelCopyWith<$Res> {
  factory _$ICECandidateDocumentModelCopyWith(_ICECandidateDocumentModel value, $Res Function(_ICECandidateDocumentModel) _then) = __$ICECandidateDocumentModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeToJson: false) String id, String sdpMid, int sdpMLineIndex, String candidate
});




}
/// @nodoc
class __$ICECandidateDocumentModelCopyWithImpl<$Res>
    implements _$ICECandidateDocumentModelCopyWith<$Res> {
  __$ICECandidateDocumentModelCopyWithImpl(this._self, this._then);

  final _ICECandidateDocumentModel _self;
  final $Res Function(_ICECandidateDocumentModel) _then;

/// Create a copy of ICECandidateDocumentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sdpMid = null,Object? sdpMLineIndex = null,Object? candidate = null,}) {
  return _then(_ICECandidateDocumentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sdpMid: null == sdpMid ? _self.sdpMid : sdpMid // ignore: cast_nullable_to_non_nullable
as String,sdpMLineIndex: null == sdpMLineIndex ? _self.sdpMLineIndex : sdpMLineIndex // ignore: cast_nullable_to_non_nullable
as int,candidate: null == candidate ? _self.candidate : candidate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
