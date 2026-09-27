// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_description_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionDescriptionModel {

 String get sdp; String get type;
/// Create a copy of SessionDescriptionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionDescriptionModelCopyWith<SessionDescriptionModel> get copyWith => _$SessionDescriptionModelCopyWithImpl<SessionDescriptionModel>(this as SessionDescriptionModel, _$identity);

  /// Serializes this SessionDescriptionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SessionDescriptionModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionDescriptionModel&&(identical(other.sdp, _this.sdp) || other.sdp == _this.sdp)&&(identical(other.type, _this.type) || other.type == _this.type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SessionDescriptionModel;
  return Object.hash(runtimeType,_this.sdp,_this.type);
}

@override
String toString() {
  final _this = this as SessionDescriptionModel;
  return 'SessionDescriptionModel(sdp: ${_this.sdp}, type: ${_this.type})';
}


}

/// @nodoc
abstract mixin class $SessionDescriptionModelCopyWith<$Res>  {
  factory $SessionDescriptionModelCopyWith(SessionDescriptionModel value, $Res Function(SessionDescriptionModel) _then) = _$SessionDescriptionModelCopyWithImpl;
@useResult
$Res call({
 String sdp, String type
});




}
/// @nodoc
class _$SessionDescriptionModelCopyWithImpl<$Res>
    implements $SessionDescriptionModelCopyWith<$Res> {
  _$SessionDescriptionModelCopyWithImpl(this._self, this._then);

  final SessionDescriptionModel _self;
  final $Res Function(SessionDescriptionModel) _then;

/// Create a copy of SessionDescriptionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sdp = null,Object? type = null,}) {
  return _then(SessionDescriptionModel(
sdp: null == sdp ? _self.sdp : sdp // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionDescriptionModel].
extension SessionDescriptionModelPatterns on SessionDescriptionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionDescriptionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionDescriptionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionDescriptionModel value)  $default,){
final _that = this;
switch (_that) {
case _SessionDescriptionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionDescriptionModel value)?  $default,){
final _that = this;
switch (_that) {
case _SessionDescriptionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String sdp,  String type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionDescriptionModel() when $default != null:
return $default(_that.sdp,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String sdp,  String type)  $default,) {final _that = this;
switch (_that) {
case _SessionDescriptionModel():
return $default(_that.sdp,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String sdp,  String type)?  $default,) {final _that = this;
switch (_that) {
case _SessionDescriptionModel() when $default != null:
return $default(_that.sdp,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionDescriptionModel extends SessionDescriptionModel {
  const _SessionDescriptionModel({required this.sdp, required this.type}): super._();
  factory _SessionDescriptionModel.fromJson(Map<String, dynamic> json) => _$SessionDescriptionModelFromJson(json);

@override final  String sdp;
@override final  String type;

/// Create a copy of SessionDescriptionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionDescriptionModelCopyWith<_SessionDescriptionModel> get copyWith => __$SessionDescriptionModelCopyWithImpl<_SessionDescriptionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionDescriptionModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionDescriptionModel&&(identical(other.sdp, sdp) || other.sdp == sdp)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,sdp,type);
}

@override
String toString() {
    return 'SessionDescriptionModel(sdp: $sdp, type: $type)';
}


}

/// @nodoc
abstract mixin class _$SessionDescriptionModelCopyWith<$Res> implements $SessionDescriptionModelCopyWith<$Res> {
  factory _$SessionDescriptionModelCopyWith(_SessionDescriptionModel value, $Res Function(_SessionDescriptionModel) _then) = __$SessionDescriptionModelCopyWithImpl;
@override @useResult
$Res call({
 String sdp, String type
});




}
/// @nodoc
class __$SessionDescriptionModelCopyWithImpl<$Res>
    implements _$SessionDescriptionModelCopyWith<$Res> {
  __$SessionDescriptionModelCopyWithImpl(this._self, this._then);

  final _SessionDescriptionModel _self;
  final $Res Function(_SessionDescriptionModel) _then;

/// Create a copy of SessionDescriptionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sdp = null,Object? type = null,}) {
  return _then(_SessionDescriptionModel(
sdp: null == sdp ? _self.sdp : sdp // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
