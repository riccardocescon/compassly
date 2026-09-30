// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RoomEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is RoomEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'RoomEvent()';
}


}

/// @nodoc
class $RoomEventCopyWith<$Res>  {
$RoomEventCopyWith(RoomEvent _, $Res Function(RoomEvent) __);
}


/// Adds pattern-matching-related methods to [RoomEvent].
extension RoomEventPatterns on RoomEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Create value)?  create,TResult Function( _Join value)?  join,TResult Function( _Leave value)?  leave,TResult Function( _MembersUpdated value)?  membersUpdated,TResult Function( _MembersWatchFailed value)?  membersWatchFailed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Create() when create != null:
return create(_that);case _Join() when join != null:
return join(_that);case _Leave() when leave != null:
return leave(_that);case _MembersUpdated() when membersUpdated != null:
return membersUpdated(_that);case _MembersWatchFailed() when membersWatchFailed != null:
return membersWatchFailed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Create value)  create,required TResult Function( _Join value)  join,required TResult Function( _Leave value)  leave,required TResult Function( _MembersUpdated value)  membersUpdated,required TResult Function( _MembersWatchFailed value)  membersWatchFailed,}){
final _that = this;
switch (_that) {
case _Create():
return create(_that);case _Join():
return join(_that);case _Leave():
return leave(_that);case _MembersUpdated():
return membersUpdated(_that);case _MembersWatchFailed():
return membersWatchFailed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Create value)?  create,TResult? Function( _Join value)?  join,TResult? Function( _Leave value)?  leave,TResult? Function( _MembersUpdated value)?  membersUpdated,TResult? Function( _MembersWatchFailed value)?  membersWatchFailed,}){
final _that = this;
switch (_that) {
case _Create() when create != null:
return create(_that);case _Join() when join != null:
return join(_that);case _Leave() when leave != null:
return leave(_that);case _MembersUpdated() when membersUpdated != null:
return membersUpdated(_that);case _MembersWatchFailed() when membersWatchFailed != null:
return membersWatchFailed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  create,TResult Function( String code)?  join,TResult Function()?  leave,TResult Function( List<MemberChange> members)?  membersUpdated,TResult Function( Failure failure)?  membersWatchFailed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Create() when create != null:
return create();case _Join() when join != null:
return join(_that.code);case _Leave() when leave != null:
return leave();case _MembersUpdated() when membersUpdated != null:
return membersUpdated(_that.members);case _MembersWatchFailed() when membersWatchFailed != null:
return membersWatchFailed(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  create,required TResult Function( String code)  join,required TResult Function()  leave,required TResult Function( List<MemberChange> members)  membersUpdated,required TResult Function( Failure failure)  membersWatchFailed,}) {final _that = this;
switch (_that) {
case _Create():
return create();case _Join():
return join(_that.code);case _Leave():
return leave();case _MembersUpdated():
return membersUpdated(_that.members);case _MembersWatchFailed():
return membersWatchFailed(_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  create,TResult? Function( String code)?  join,TResult? Function()?  leave,TResult? Function( List<MemberChange> members)?  membersUpdated,TResult? Function( Failure failure)?  membersWatchFailed,}) {final _that = this;
switch (_that) {
case _Create() when create != null:
return create();case _Join() when join != null:
return join(_that.code);case _Leave() when leave != null:
return leave();case _MembersUpdated() when membersUpdated != null:
return membersUpdated(_that.members);case _MembersWatchFailed() when membersWatchFailed != null:
return membersWatchFailed(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _Create implements RoomEvent {
  const _Create();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Create);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'RoomEvent.create()';
}


}




/// @nodoc


class _Join implements RoomEvent {
  const _Join(this.code);
  

 final  String code;

/// Create a copy of RoomEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JoinCopyWith<_Join> get copyWith => __$JoinCopyWithImpl<_Join>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Join&&(identical(other.code, code) || other.code == code));
}


@override
int get hashCode {
    return Object.hash(runtimeType,code);
}

@override
String toString() {
    return 'RoomEvent.join(code: $code)';
}


}

/// @nodoc
abstract mixin class _$JoinCopyWith<$Res> implements $RoomEventCopyWith<$Res> {
  factory _$JoinCopyWith(_Join value, $Res Function(_Join) _then) = __$JoinCopyWithImpl;
@useResult
$Res call({
 String code
});




}
/// @nodoc
class __$JoinCopyWithImpl<$Res>
    implements _$JoinCopyWith<$Res> {
  __$JoinCopyWithImpl(this._self, this._then);

  final _Join _self;
  final $Res Function(_Join) _then;

/// Create a copy of RoomEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? code = null,}) {
  return _then(_Join(
null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Leave implements RoomEvent {
  const _Leave();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Leave);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'RoomEvent.leave()';
}


}




/// @nodoc


class _MembersUpdated implements RoomEvent {
  const _MembersUpdated({required  List<MemberChange> members}): _members = members;
  

 final  List<MemberChange> _members;
 List<MemberChange> get members {
  if (_members is EqualUnmodifiableListView) return _members;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_members);
}


/// Create a copy of RoomEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MembersUpdatedCopyWith<_MembersUpdated> get copyWith => __$MembersUpdatedCopyWithImpl<_MembersUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MembersUpdated&&const DeepCollectionEquality().equals(other.members, _members));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_members));
}

@override
String toString() {
    return 'RoomEvent.membersUpdated(members: $members)';
}


}

/// @nodoc
abstract mixin class _$MembersUpdatedCopyWith<$Res> implements $RoomEventCopyWith<$Res> {
  factory _$MembersUpdatedCopyWith(_MembersUpdated value, $Res Function(_MembersUpdated) _then) = __$MembersUpdatedCopyWithImpl;
@useResult
$Res call({
 List<MemberChange> members
});




}
/// @nodoc
class __$MembersUpdatedCopyWithImpl<$Res>
    implements _$MembersUpdatedCopyWith<$Res> {
  __$MembersUpdatedCopyWithImpl(this._self, this._then);

  final _MembersUpdated _self;
  final $Res Function(_MembersUpdated) _then;

/// Create a copy of RoomEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? members = null,}) {
  return _then(_MembersUpdated(
members: null == members ? _self._members : members // ignore: cast_nullable_to_non_nullable
as List<MemberChange>,
  ));
}


}

/// @nodoc


class _MembersWatchFailed implements RoomEvent {
  const _MembersWatchFailed(this.failure);
  

 final  Failure failure;

/// Create a copy of RoomEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MembersWatchFailedCopyWith<_MembersWatchFailed> get copyWith => __$MembersWatchFailedCopyWithImpl<_MembersWatchFailed>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MembersWatchFailed&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode {
    return Object.hash(runtimeType,failure);
}

@override
String toString() {
    return 'RoomEvent.membersWatchFailed(failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$MembersWatchFailedCopyWith<$Res> implements $RoomEventCopyWith<$Res> {
  factory _$MembersWatchFailedCopyWith(_MembersWatchFailed value, $Res Function(_MembersWatchFailed) _then) = __$MembersWatchFailedCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class __$MembersWatchFailedCopyWithImpl<$Res>
    implements _$MembersWatchFailedCopyWith<$Res> {
  __$MembersWatchFailedCopyWithImpl(this._self, this._then);

  final _MembersWatchFailed _self;
  final $Res Function(_MembersWatchFailed) _then;

/// Create a copy of RoomEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(_MembersWatchFailed(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

/// @nodoc
mixin _$RoomState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is RoomState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'RoomState()';
}


}

/// @nodoc
class $RoomStateCopyWith<$Res>  {
$RoomStateCopyWith(RoomState _, $Res Function(RoomState) __);
}


/// Adds pattern-matching-related methods to [RoomState].
extension RoomStatePatterns on RoomState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Init value)?  init,TResult Function( _Loading value)?  loading,TResult Function( _Data value)?  data,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _Loading() when loading != null:
return loading(_that);case _Data() when data != null:
return data(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Init value)  init,required TResult Function( _Loading value)  loading,required TResult Function( _Data value)  data,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Init():
return init(_that);case _Loading():
return loading(_that);case _Data():
return data(_that);case _Error():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Init value)?  init,TResult? Function( _Loading value)?  loading,TResult? Function( _Data value)?  data,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _Loading() when loading != null:
return loading(_that);case _Data() when data != null:
return data(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function()?  loading,TResult Function( Room? room,  List<MemberChange>? members)?  data,TResult Function( Failure failure)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _Loading() when loading != null:
return loading();case _Data() when data != null:
return data(_that.room,_that.members);case _Error() when error != null:
return error(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function()  loading,required TResult Function( Room? room,  List<MemberChange>? members)  data,required TResult Function( Failure failure)  error,}) {final _that = this;
switch (_that) {
case _Init():
return init();case _Loading():
return loading();case _Data():
return data(_that.room,_that.members);case _Error():
return error(_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function()?  loading,TResult? Function( Room? room,  List<MemberChange>? members)?  data,TResult? Function( Failure failure)?  error,}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _Loading() when loading != null:
return loading();case _Data() when data != null:
return data(_that.room,_that.members);case _Error() when error != null:
return error(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _Init implements RoomState {
  const _Init();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Init);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'RoomState.init()';
}


}




/// @nodoc


class _Loading implements RoomState {
  const _Loading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'RoomState.loading()';
}


}




/// @nodoc


class _Data implements RoomState {
  const _Data({required this.room, required  List<MemberChange>? members}): _members = members;
  

 final  Room? room;
 final  List<MemberChange>? _members;
 List<MemberChange>? get members {
  final value = _members;
  if (value == null) return null;
  if (_members is EqualUnmodifiableListView) return _members;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of RoomState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DataCopyWith<_Data> get copyWith => __$DataCopyWithImpl<_Data>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Data&&(identical(other.room, room) || other.room == room)&&const DeepCollectionEquality().equals(other.members, _members));
}


@override
int get hashCode {
    return Object.hash(runtimeType,room,const DeepCollectionEquality().hash(_members));
}

@override
String toString() {
    return 'RoomState.data(room: $room, members: $members)';
}


}

/// @nodoc
abstract mixin class _$DataCopyWith<$Res> implements $RoomStateCopyWith<$Res> {
  factory _$DataCopyWith(_Data value, $Res Function(_Data) _then) = __$DataCopyWithImpl;
@useResult
$Res call({
 Room? room, List<MemberChange>? members
});




}
/// @nodoc
class __$DataCopyWithImpl<$Res>
    implements _$DataCopyWith<$Res> {
  __$DataCopyWithImpl(this._self, this._then);

  final _Data _self;
  final $Res Function(_Data) _then;

/// Create a copy of RoomState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? room = freezed,Object? members = freezed,}) {
  return _then(_Data(
room: freezed == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as Room?,members: freezed == members ? _self._members : members // ignore: cast_nullable_to_non_nullable
as List<MemberChange>?,
  ));
}


}

/// @nodoc


class _Error implements RoomState {
  const _Error({required this.failure});
  

 final  Failure failure;

/// Create a copy of RoomState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode {
    return Object.hash(runtimeType,failure);
}

@override
String toString() {
    return 'RoomState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $RoomStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of RoomState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(_Error(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
