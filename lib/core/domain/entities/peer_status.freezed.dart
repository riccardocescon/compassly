// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'peer_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PeerStatus {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PeerStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PeerStatus()';
}


}

/// @nodoc
class $PeerStatusCopyWith<$Res>  {
$PeerStatusCopyWith(PeerStatus _, $Res Function(PeerStatus) __);
}


/// Adds pattern-matching-related methods to [PeerStatus].
extension PeerStatusPatterns on PeerStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PeerConnecting value)?  connecting,TResult Function( PeerConnected value)?  connected,TResult Function( PeerFailed value)?  failed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PeerConnecting() when connecting != null:
return connecting(_that);case PeerConnected() when connected != null:
return connected(_that);case PeerFailed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PeerConnecting value)  connecting,required TResult Function( PeerConnected value)  connected,required TResult Function( PeerFailed value)  failed,}){
final _that = this;
switch (_that) {
case PeerConnecting():
return connecting(_that);case PeerConnected():
return connected(_that);case PeerFailed():
return failed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PeerConnecting value)?  connecting,TResult? Function( PeerConnected value)?  connected,TResult? Function( PeerFailed value)?  failed,}){
final _that = this;
switch (_that) {
case PeerConnecting() when connecting != null:
return connecting(_that);case PeerConnected() when connected != null:
return connected(_that);case PeerFailed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  connecting,TResult Function()?  connected,TResult Function( Failure failure)?  failed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PeerConnecting() when connecting != null:
return connecting();case PeerConnected() when connected != null:
return connected();case PeerFailed() when failed != null:
return failed(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  connecting,required TResult Function()  connected,required TResult Function( Failure failure)  failed,}) {final _that = this;
switch (_that) {
case PeerConnecting():
return connecting();case PeerConnected():
return connected();case PeerFailed():
return failed(_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  connecting,TResult? Function()?  connected,TResult? Function( Failure failure)?  failed,}) {final _that = this;
switch (_that) {
case PeerConnecting() when connecting != null:
return connecting();case PeerConnected() when connected != null:
return connected();case PeerFailed() when failed != null:
return failed(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class PeerConnecting implements PeerStatus {
  const PeerConnecting();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PeerConnecting);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PeerStatus.connecting()';
}


}




/// @nodoc


class PeerConnected implements PeerStatus {
  const PeerConnected();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PeerConnected);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PeerStatus.connected()';
}


}




/// @nodoc


class PeerFailed implements PeerStatus {
  const PeerFailed({required this.failure});
  

 final  Failure failure;

/// Create a copy of PeerStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PeerFailedCopyWith<PeerFailed> get copyWith => _$PeerFailedCopyWithImpl<PeerFailed>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PeerFailed&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode {
    return Object.hash(runtimeType,failure);
}

@override
String toString() {
    return 'PeerStatus.failed(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $PeerFailedCopyWith<$Res> implements $PeerStatusCopyWith<$Res> {
  factory $PeerFailedCopyWith(PeerFailed value, $Res Function(PeerFailed) _then) = _$PeerFailedCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$PeerFailedCopyWithImpl<$Res>
    implements $PeerFailedCopyWith<$Res> {
  _$PeerFailedCopyWithImpl(this._self, this._then);

  final PeerFailed _self;
  final $Res Function(PeerFailed) _then;

/// Create a copy of PeerStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(PeerFailed(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
