// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connection_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConnectionEvent {

 String get roomCode; MemberChange get change;
/// Create a copy of ConnectionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectionEventCopyWith<ConnectionEvent> get copyWith => _$ConnectionEventCopyWithImpl<ConnectionEvent>(this as ConnectionEvent, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ConnectionEvent;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionEvent&&(identical(other.roomCode, _this.roomCode) || other.roomCode == _this.roomCode)&&(identical(other.change, _this.change) || other.change == _this.change));
}


@override
int get hashCode {
  final _this = this as ConnectionEvent;
  return Object.hash(runtimeType,_this.roomCode,_this.change);
}

@override
String toString() {
  final _this = this as ConnectionEvent;
  return 'ConnectionEvent(roomCode: ${_this.roomCode}, change: ${_this.change})';
}


}

/// @nodoc
abstract mixin class $ConnectionEventCopyWith<$Res>  {
  factory $ConnectionEventCopyWith(ConnectionEvent value, $Res Function(ConnectionEvent) _then) = _$ConnectionEventCopyWithImpl;
@useResult
$Res call({
 String roomCode, MemberChange change
});


$MemberChangeCopyWith<$Res> get change;

}
/// @nodoc
class _$ConnectionEventCopyWithImpl<$Res>
    implements $ConnectionEventCopyWith<$Res> {
  _$ConnectionEventCopyWithImpl(this._self, this._then);

  final ConnectionEvent _self;
  final $Res Function(ConnectionEvent) _then;

/// Create a copy of ConnectionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? roomCode = null,Object? change = null,}) {
  return _then(ConnectionEvent.memberChanged(
roomCode: null == roomCode ? _self.roomCode : roomCode // ignore: cast_nullable_to_non_nullable
as String,change: null == change ? _self.change : change // ignore: cast_nullable_to_non_nullable
as MemberChange,
  ));
}
/// Create a copy of ConnectionEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MemberChangeCopyWith<$Res> get change {
  
  return $MemberChangeCopyWith<$Res>(_self.change, (value) {
    return _then(_self.copyWith(change: value));
  });
}
}


/// Adds pattern-matching-related methods to [ConnectionEvent].
extension ConnectionEventPatterns on ConnectionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _MemberChanged value)?  memberChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MemberChanged() when memberChanged != null:
return memberChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _MemberChanged value)  memberChanged,}){
final _that = this;
switch (_that) {
case _MemberChanged():
return memberChanged(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _MemberChanged value)?  memberChanged,}){
final _that = this;
switch (_that) {
case _MemberChanged() when memberChanged != null:
return memberChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String roomCode,  MemberChange change)?  memberChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MemberChanged() when memberChanged != null:
return memberChanged(_that.roomCode,_that.change);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String roomCode,  MemberChange change)  memberChanged,}) {final _that = this;
switch (_that) {
case _MemberChanged():
return memberChanged(_that.roomCode,_that.change);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String roomCode,  MemberChange change)?  memberChanged,}) {final _that = this;
switch (_that) {
case _MemberChanged() when memberChanged != null:
return memberChanged(_that.roomCode,_that.change);case _:
  return null;

}
}

}

/// @nodoc


class _MemberChanged implements ConnectionEvent {
  const _MemberChanged({required this.roomCode, required this.change});
  

@override final  String roomCode;
@override final  MemberChange change;

/// Create a copy of ConnectionEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MemberChangedCopyWith<_MemberChanged> get copyWith => __$MemberChangedCopyWithImpl<_MemberChanged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MemberChanged&&(identical(other.roomCode, roomCode) || other.roomCode == roomCode)&&(identical(other.change, change) || other.change == change));
}


@override
int get hashCode {
    return Object.hash(runtimeType,roomCode,change);
}

@override
String toString() {
    return 'ConnectionEvent.memberChanged(roomCode: $roomCode, change: $change)';
}


}

/// @nodoc
abstract mixin class _$MemberChangedCopyWith<$Res> implements $ConnectionEventCopyWith<$Res> {
  factory _$MemberChangedCopyWith(_MemberChanged value, $Res Function(_MemberChanged) _then) = __$MemberChangedCopyWithImpl;
@override @useResult
$Res call({
 String roomCode, MemberChange change
});


@override $MemberChangeCopyWith<$Res> get change;

}
/// @nodoc
class __$MemberChangedCopyWithImpl<$Res>
    implements _$MemberChangedCopyWith<$Res> {
  __$MemberChangedCopyWithImpl(this._self, this._then);

  final _MemberChanged _self;
  final $Res Function(_MemberChanged) _then;

/// Create a copy of ConnectionEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? roomCode = null,Object? change = null,}) {
  return _then(_MemberChanged(
roomCode: null == roomCode ? _self.roomCode : roomCode // ignore: cast_nullable_to_non_nullable
as String,change: null == change ? _self.change : change // ignore: cast_nullable_to_non_nullable
as MemberChange,
  ));
}

/// Create a copy of ConnectionEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MemberChangeCopyWith<$Res> get change {
  
  return $MemberChangeCopyWith<$Res>(_self.change, (value) {
    return _then(_self.copyWith(change: value));
  });
}
}

/// @nodoc
mixin _$ConnectionState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ConnectionState()';
}


}

/// @nodoc
class $ConnectionStateCopyWith<$Res>  {
$ConnectionStateCopyWith(ConnectionState _, $Res Function(ConnectionState) __);
}


/// Adds pattern-matching-related methods to [ConnectionState].
extension ConnectionStatePatterns on ConnectionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Init value)?  init,TResult Function( _Data value)?  data,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _Data() when data != null:
return data(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Init value)  init,required TResult Function( _Data value)  data,}){
final _that = this;
switch (_that) {
case _Init():
return init(_that);case _Data():
return data(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Init value)?  init,TResult? Function( _Data value)?  data,}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _Data() when data != null:
return data(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function( Map<String, PeerStatus> peers)?  data,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _Data() when data != null:
return data(_that.peers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function( Map<String, PeerStatus> peers)  data,}) {final _that = this;
switch (_that) {
case _Init():
return init();case _Data():
return data(_that.peers);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function( Map<String, PeerStatus> peers)?  data,}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _Data() when data != null:
return data(_that.peers);case _:
  return null;

}
}

}

/// @nodoc


class _Init implements ConnectionState {
  const _Init();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Init);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ConnectionState.init()';
}


}




/// @nodoc


class _Data implements ConnectionState {
  const _Data({required  Map<String, PeerStatus> peers}): _peers = peers;
  

 final  Map<String, PeerStatus> _peers;
 Map<String, PeerStatus> get peers {
  if (_peers is EqualUnmodifiableMapView) return _peers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_peers);
}


/// Create a copy of ConnectionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DataCopyWith<_Data> get copyWith => __$DataCopyWithImpl<_Data>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Data&&const DeepCollectionEquality().equals(other.peers, _peers));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_peers));
}

@override
String toString() {
    return 'ConnectionState.data(peers: $peers)';
}


}

/// @nodoc
abstract mixin class _$DataCopyWith<$Res> implements $ConnectionStateCopyWith<$Res> {
  factory _$DataCopyWith(_Data value, $Res Function(_Data) _then) = __$DataCopyWithImpl;
@useResult
$Res call({
 Map<String, PeerStatus> peers
});




}
/// @nodoc
class __$DataCopyWithImpl<$Res>
    implements _$DataCopyWith<$Res> {
  __$DataCopyWithImpl(this._self, this._then);

  final _Data _self;
  final $Res Function(_Data) _then;

/// Create a copy of ConnectionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? peers = null,}) {
  return _then(_Data(
peers: null == peers ? _self._peers : peers // ignore: cast_nullable_to_non_nullable
as Map<String, PeerStatus>,
  ));
}


}

// dart format on
