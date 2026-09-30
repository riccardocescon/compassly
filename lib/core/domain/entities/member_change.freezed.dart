// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_change.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MemberChange {

 Member get member;
/// Create a copy of MemberChange
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MemberChangeCopyWith<MemberChange> get copyWith => _$MemberChangeCopyWithImpl<MemberChange>(this as MemberChange, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as MemberChange;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MemberChange&&(identical(other.member, _this.member) || other.member == _this.member));
}


@override
int get hashCode {
  final _this = this as MemberChange;
  return Object.hash(runtimeType,_this.member);
}

@override
String toString() {
  final _this = this as MemberChange;
  return 'MemberChange(member: ${_this.member})';
}


}

/// @nodoc
abstract mixin class $MemberChangeCopyWith<$Res>  {
  factory $MemberChangeCopyWith(MemberChange value, $Res Function(MemberChange) _then) = _$MemberChangeCopyWithImpl;
@useResult
$Res call({
 Member member
});




}
/// @nodoc
class _$MemberChangeCopyWithImpl<$Res>
    implements $MemberChangeCopyWith<$Res> {
  _$MemberChangeCopyWithImpl(this._self, this._then);

  final MemberChange _self;
  final $Res Function(MemberChange) _then;

/// Create a copy of MemberChange
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? member = null,}) {
  return _then(_self.copyWith(
member: null == member ? _self.member : member // ignore: cast_nullable_to_non_nullable
as Member,
  ));
}

}


/// Adds pattern-matching-related methods to [MemberChange].
extension MemberChangePatterns on MemberChange {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MemberJoined value)?  joined,TResult Function( MemberExisting value)?  existing,TResult Function( MemberLeft value)?  left,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MemberJoined() when joined != null:
return joined(_that);case MemberExisting() when existing != null:
return existing(_that);case MemberLeft() when left != null:
return left(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MemberJoined value)  joined,required TResult Function( MemberExisting value)  existing,required TResult Function( MemberLeft value)  left,}){
final _that = this;
switch (_that) {
case MemberJoined():
return joined(_that);case MemberExisting():
return existing(_that);case MemberLeft():
return left(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MemberJoined value)?  joined,TResult? Function( MemberExisting value)?  existing,TResult? Function( MemberLeft value)?  left,}){
final _that = this;
switch (_that) {
case MemberJoined() when joined != null:
return joined(_that);case MemberExisting() when existing != null:
return existing(_that);case MemberLeft() when left != null:
return left(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Member member)?  joined,TResult Function( Member member)?  existing,TResult Function( Member member)?  left,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MemberJoined() when joined != null:
return joined(_that.member);case MemberExisting() when existing != null:
return existing(_that.member);case MemberLeft() when left != null:
return left(_that.member);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Member member)  joined,required TResult Function( Member member)  existing,required TResult Function( Member member)  left,}) {final _that = this;
switch (_that) {
case MemberJoined():
return joined(_that.member);case MemberExisting():
return existing(_that.member);case MemberLeft():
return left(_that.member);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Member member)?  joined,TResult? Function( Member member)?  existing,TResult? Function( Member member)?  left,}) {final _that = this;
switch (_that) {
case MemberJoined() when joined != null:
return joined(_that.member);case MemberExisting() when existing != null:
return existing(_that.member);case MemberLeft() when left != null:
return left(_that.member);case _:
  return null;

}
}

}

/// @nodoc


class MemberJoined implements MemberChange {
  const MemberJoined({required this.member});
  

@override final  Member member;

/// Create a copy of MemberChange
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MemberJoinedCopyWith<MemberJoined> get copyWith => _$MemberJoinedCopyWithImpl<MemberJoined>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is MemberJoined&&(identical(other.member, member) || other.member == member));
}


@override
int get hashCode {
    return Object.hash(runtimeType,member);
}

@override
String toString() {
    return 'MemberChange.joined(member: $member)';
}


}

/// @nodoc
abstract mixin class $MemberJoinedCopyWith<$Res> implements $MemberChangeCopyWith<$Res> {
  factory $MemberJoinedCopyWith(MemberJoined value, $Res Function(MemberJoined) _then) = _$MemberJoinedCopyWithImpl;
@override @useResult
$Res call({
 Member member
});




}
/// @nodoc
class _$MemberJoinedCopyWithImpl<$Res>
    implements $MemberJoinedCopyWith<$Res> {
  _$MemberJoinedCopyWithImpl(this._self, this._then);

  final MemberJoined _self;
  final $Res Function(MemberJoined) _then;

/// Create a copy of MemberChange
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? member = null,}) {
  return _then(MemberJoined(
member: null == member ? _self.member : member // ignore: cast_nullable_to_non_nullable
as Member,
  ));
}


}

/// @nodoc


class MemberExisting implements MemberChange {
  const MemberExisting({required this.member});
  

@override final  Member member;

/// Create a copy of MemberChange
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MemberExistingCopyWith<MemberExisting> get copyWith => _$MemberExistingCopyWithImpl<MemberExisting>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is MemberExisting&&(identical(other.member, member) || other.member == member));
}


@override
int get hashCode {
    return Object.hash(runtimeType,member);
}

@override
String toString() {
    return 'MemberChange.existing(member: $member)';
}


}

/// @nodoc
abstract mixin class $MemberExistingCopyWith<$Res> implements $MemberChangeCopyWith<$Res> {
  factory $MemberExistingCopyWith(MemberExisting value, $Res Function(MemberExisting) _then) = _$MemberExistingCopyWithImpl;
@override @useResult
$Res call({
 Member member
});




}
/// @nodoc
class _$MemberExistingCopyWithImpl<$Res>
    implements $MemberExistingCopyWith<$Res> {
  _$MemberExistingCopyWithImpl(this._self, this._then);

  final MemberExisting _self;
  final $Res Function(MemberExisting) _then;

/// Create a copy of MemberChange
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? member = null,}) {
  return _then(MemberExisting(
member: null == member ? _self.member : member // ignore: cast_nullable_to_non_nullable
as Member,
  ));
}


}

/// @nodoc


class MemberLeft implements MemberChange {
  const MemberLeft({required this.member});
  

@override final  Member member;

/// Create a copy of MemberChange
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MemberLeftCopyWith<MemberLeft> get copyWith => _$MemberLeftCopyWithImpl<MemberLeft>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is MemberLeft&&(identical(other.member, member) || other.member == member));
}


@override
int get hashCode {
    return Object.hash(runtimeType,member);
}

@override
String toString() {
    return 'MemberChange.left(member: $member)';
}


}

/// @nodoc
abstract mixin class $MemberLeftCopyWith<$Res> implements $MemberChangeCopyWith<$Res> {
  factory $MemberLeftCopyWith(MemberLeft value, $Res Function(MemberLeft) _then) = _$MemberLeftCopyWithImpl;
@override @useResult
$Res call({
 Member member
});




}
/// @nodoc
class _$MemberLeftCopyWithImpl<$Res>
    implements $MemberLeftCopyWith<$Res> {
  _$MemberLeftCopyWithImpl(this._self, this._then);

  final MemberLeft _self;
  final $Res Function(MemberLeft) _then;

/// Create a copy of MemberChange
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? member = null,}) {
  return _then(MemberLeft(
member: null == member ? _self.member : member // ignore: cast_nullable_to_non_nullable
as Member,
  ));
}


}

// dart format on
