// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_document_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionDocumentModel {

@JsonKey(includeToJson: false) String get id; SessionDescriptionModel? get offer; SessionDescriptionModel? get answer;
/// Create a copy of SessionDocumentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionDocumentModelCopyWith<SessionDocumentModel> get copyWith => _$SessionDocumentModelCopyWithImpl<SessionDocumentModel>(this as SessionDocumentModel, _$identity);

  /// Serializes this SessionDocumentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SessionDocumentModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionDocumentModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.offer, _this.offer) || other.offer == _this.offer)&&(identical(other.answer, _this.answer) || other.answer == _this.answer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SessionDocumentModel;
  return Object.hash(runtimeType,_this.id,_this.offer,_this.answer);
}

@override
String toString() {
  final _this = this as SessionDocumentModel;
  return 'SessionDocumentModel(id: ${_this.id}, offer: ${_this.offer}, answer: ${_this.answer})';
}


}

/// @nodoc
abstract mixin class $SessionDocumentModelCopyWith<$Res>  {
  factory $SessionDocumentModelCopyWith(SessionDocumentModel value, $Res Function(SessionDocumentModel) _then) = _$SessionDocumentModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeToJson: false) String id, SessionDescriptionModel? offer, SessionDescriptionModel? answer
});


$SessionDescriptionModelCopyWith<$Res>? get offer;$SessionDescriptionModelCopyWith<$Res>? get answer;

}
/// @nodoc
class _$SessionDocumentModelCopyWithImpl<$Res>
    implements $SessionDocumentModelCopyWith<$Res> {
  _$SessionDocumentModelCopyWithImpl(this._self, this._then);

  final SessionDocumentModel _self;
  final $Res Function(SessionDocumentModel) _then;

/// Create a copy of SessionDocumentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? offer = freezed,Object? answer = freezed,}) {
  return _then(SessionDocumentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,offer: freezed == offer ? _self.offer : offer // ignore: cast_nullable_to_non_nullable
as SessionDescriptionModel?,answer: freezed == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as SessionDescriptionModel?,
  ));
}
/// Create a copy of SessionDocumentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionDescriptionModelCopyWith<$Res>? get offer {
    if (_self.offer == null) {
    return null;
  }

  return $SessionDescriptionModelCopyWith<$Res>(_self.offer!, (value) {
    return _then(_self.copyWith(offer: value));
  });
}/// Create a copy of SessionDocumentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionDescriptionModelCopyWith<$Res>? get answer {
    if (_self.answer == null) {
    return null;
  }

  return $SessionDescriptionModelCopyWith<$Res>(_self.answer!, (value) {
    return _then(_self.copyWith(answer: value));
  });
}
}


/// Adds pattern-matching-related methods to [SessionDocumentModel].
extension SessionDocumentModelPatterns on SessionDocumentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionDocumentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionDocumentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionDocumentModel value)  $default,){
final _that = this;
switch (_that) {
case _SessionDocumentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionDocumentModel value)?  $default,){
final _that = this;
switch (_that) {
case _SessionDocumentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeToJson: false)  String id,  SessionDescriptionModel? offer,  SessionDescriptionModel? answer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionDocumentModel() when $default != null:
return $default(_that.id,_that.offer,_that.answer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeToJson: false)  String id,  SessionDescriptionModel? offer,  SessionDescriptionModel? answer)  $default,) {final _that = this;
switch (_that) {
case _SessionDocumentModel():
return $default(_that.id,_that.offer,_that.answer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeToJson: false)  String id,  SessionDescriptionModel? offer,  SessionDescriptionModel? answer)?  $default,) {final _that = this;
switch (_that) {
case _SessionDocumentModel() when $default != null:
return $default(_that.id,_that.offer,_that.answer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionDocumentModel implements SessionDocumentModel {
  const _SessionDocumentModel({@JsonKey(includeToJson: false) required this.id, this.offer, this.answer});
  factory _SessionDocumentModel.fromJson(Map<String, dynamic> json) => _$SessionDocumentModelFromJson(json);

@override@JsonKey(includeToJson: false) final  String id;
@override final  SessionDescriptionModel? offer;
@override final  SessionDescriptionModel? answer;

/// Create a copy of SessionDocumentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionDocumentModelCopyWith<_SessionDocumentModel> get copyWith => __$SessionDocumentModelCopyWithImpl<_SessionDocumentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionDocumentModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionDocumentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.offer, offer) || other.offer == offer)&&(identical(other.answer, answer) || other.answer == answer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,offer,answer);
}

@override
String toString() {
    return 'SessionDocumentModel(id: $id, offer: $offer, answer: $answer)';
}


}

/// @nodoc
abstract mixin class _$SessionDocumentModelCopyWith<$Res> implements $SessionDocumentModelCopyWith<$Res> {
  factory _$SessionDocumentModelCopyWith(_SessionDocumentModel value, $Res Function(_SessionDocumentModel) _then) = __$SessionDocumentModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeToJson: false) String id, SessionDescriptionModel? offer, SessionDescriptionModel? answer
});


@override $SessionDescriptionModelCopyWith<$Res>? get offer;@override $SessionDescriptionModelCopyWith<$Res>? get answer;

}
/// @nodoc
class __$SessionDocumentModelCopyWithImpl<$Res>
    implements _$SessionDocumentModelCopyWith<$Res> {
  __$SessionDocumentModelCopyWithImpl(this._self, this._then);

  final _SessionDocumentModel _self;
  final $Res Function(_SessionDocumentModel) _then;

/// Create a copy of SessionDocumentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? offer = freezed,Object? answer = freezed,}) {
  return _then(_SessionDocumentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,offer: freezed == offer ? _self.offer : offer // ignore: cast_nullable_to_non_nullable
as SessionDescriptionModel?,answer: freezed == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as SessionDescriptionModel?,
  ));
}

/// Create a copy of SessionDocumentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionDescriptionModelCopyWith<$Res>? get offer {
    if (_self.offer == null) {
    return null;
  }

  return $SessionDescriptionModelCopyWith<$Res>(_self.offer!, (value) {
    return _then(_self.copyWith(offer: value));
  });
}/// Create a copy of SessionDocumentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionDescriptionModelCopyWith<$Res>? get answer {
    if (_self.answer == null) {
    return null;
  }

  return $SessionDescriptionModelCopyWith<$Res>(_self.answer!, (value) {
    return _then(_self.copyWith(answer: value));
  });
}
}

// dart format on
