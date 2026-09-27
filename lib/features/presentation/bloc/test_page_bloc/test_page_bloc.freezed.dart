// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_page_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TestPageEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TestPageEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'TestPageEvent()';
}


}

/// @nodoc
class $TestPageEventCopyWith<$Res>  {
$TestPageEventCopyWith(TestPageEvent _, $Res Function(TestPageEvent) __);
}


/// Adds pattern-matching-related methods to [TestPageEvent].
extension TestPageEventPatterns on TestPageEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Setup value)?  setup,TResult Function( _CreateRoom value)?  createRoom,TResult Function( _LeaveRoom value)?  leaveRoom,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Setup() when setup != null:
return setup(_that);case _CreateRoom() when createRoom != null:
return createRoom(_that);case _LeaveRoom() when leaveRoom != null:
return leaveRoom(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Setup value)  setup,required TResult Function( _CreateRoom value)  createRoom,required TResult Function( _LeaveRoom value)  leaveRoom,}){
final _that = this;
switch (_that) {
case _Setup():
return setup(_that);case _CreateRoom():
return createRoom(_that);case _LeaveRoom():
return leaveRoom(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Setup value)?  setup,TResult? Function( _CreateRoom value)?  createRoom,TResult? Function( _LeaveRoom value)?  leaveRoom,}){
final _that = this;
switch (_that) {
case _Setup() when setup != null:
return setup(_that);case _CreateRoom() when createRoom != null:
return createRoom(_that);case _LeaveRoom() when leaveRoom != null:
return leaveRoom(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  setup,TResult Function()?  createRoom,TResult Function()?  leaveRoom,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Setup() when setup != null:
return setup();case _CreateRoom() when createRoom != null:
return createRoom();case _LeaveRoom() when leaveRoom != null:
return leaveRoom();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  setup,required TResult Function()  createRoom,required TResult Function()  leaveRoom,}) {final _that = this;
switch (_that) {
case _Setup():
return setup();case _CreateRoom():
return createRoom();case _LeaveRoom():
return leaveRoom();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  setup,TResult? Function()?  createRoom,TResult? Function()?  leaveRoom,}) {final _that = this;
switch (_that) {
case _Setup() when setup != null:
return setup();case _CreateRoom() when createRoom != null:
return createRoom();case _LeaveRoom() when leaveRoom != null:
return leaveRoom();case _:
  return null;

}
}

}

/// @nodoc


class _Setup implements TestPageEvent {
  const _Setup();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Setup);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'TestPageEvent.setup()';
}


}




/// @nodoc


class _CreateRoom implements TestPageEvent {
  const _CreateRoom();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateRoom);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'TestPageEvent.createRoom()';
}


}




/// @nodoc


class _LeaveRoom implements TestPageEvent {
  const _LeaveRoom();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeaveRoom);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'TestPageEvent.leaveRoom()';
}


}




/// @nodoc
mixin _$TestPageState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TestPageState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'TestPageState()';
}


}

/// @nodoc
class $TestPageStateCopyWith<$Res>  {
$TestPageStateCopyWith(TestPageState _, $Res Function(TestPageState) __);
}


/// Adds pattern-matching-related methods to [TestPageState].
extension TestPageStatePatterns on TestPageState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Init value)?  init,TResult Function( _Loading value)?  loading,TResult Function( _Ui value)?  ui,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _Loading() when loading != null:
return loading(_that);case _Ui() when ui != null:
return ui(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Init value)  init,required TResult Function( _Loading value)  loading,required TResult Function( _Ui value)  ui,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Init():
return init(_that);case _Loading():
return loading(_that);case _Ui():
return ui(_that);case _Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Init value)?  init,TResult? Function( _Loading value)?  loading,TResult? Function( _Ui value)?  ui,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _Loading() when loading != null:
return loading(_that);case _Ui() when ui != null:
return ui(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function()?  loading,TResult Function( String uid,  Room? room)?  ui,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _Loading() when loading != null:
return loading();case _Ui() when ui != null:
return ui(_that.uid,_that.room);case _Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function()  loading,required TResult Function( String uid,  Room? room)  ui,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Init():
return init();case _Loading():
return loading();case _Ui():
return ui(_that.uid,_that.room);case _Error():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function()?  loading,TResult? Function( String uid,  Room? room)?  ui,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _Loading() when loading != null:
return loading();case _Ui() when ui != null:
return ui(_that.uid,_that.room);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Init implements TestPageState {
  const _Init();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Init);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'TestPageState.init()';
}


}




/// @nodoc


class _Loading implements TestPageState {
  const _Loading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'TestPageState.loading()';
}


}




/// @nodoc


class _Ui implements TestPageState {
  const _Ui({required this.uid, this.room});
  

 final  String uid;
 final  Room? room;

/// Create a copy of TestPageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UiCopyWith<_Ui> get copyWith => __$UiCopyWithImpl<_Ui>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Ui&&(identical(other.uid, uid) || other.uid == uid)&&const DeepCollectionEquality().equals(other.room, room));
}


@override
int get hashCode {
    return Object.hash(runtimeType,uid,const DeepCollectionEquality().hash(room));
}

@override
String toString() {
    return 'TestPageState.ui(uid: $uid, room: $room)';
}


}

/// @nodoc
abstract mixin class _$UiCopyWith<$Res> implements $TestPageStateCopyWith<$Res> {
  factory _$UiCopyWith(_Ui value, $Res Function(_Ui) _then) = __$UiCopyWithImpl;
@useResult
$Res call({
 String uid, Room? room
});




}
/// @nodoc
class __$UiCopyWithImpl<$Res>
    implements _$UiCopyWith<$Res> {
  __$UiCopyWithImpl(this._self, this._then);

  final _Ui _self;
  final $Res Function(_Ui) _then;

/// Create a copy of TestPageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? room = freezed,}) {
  return _then(_Ui(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,room: freezed == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as Room?,
  ));
}


}

/// @nodoc


class _Error implements TestPageState {
  const _Error({required this.message});
  

 final  String message;

/// Create a copy of TestPageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'TestPageState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $TestPageStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of TestPageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
