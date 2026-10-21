// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reply_to_message_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReplyToMessageDto {

 String get id;@JsonKey(name: 'sender_id') String? get senderId; String? get content;@JsonKey(name: 'content_type') ContentType? get contentType; bool get deleted;
/// Create a copy of ReplyToMessageDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReplyToMessageDtoCopyWith<ReplyToMessageDto> get copyWith => _$ReplyToMessageDtoCopyWithImpl<ReplyToMessageDto>(this as ReplyToMessageDto, _$identity);

  /// Serializes this ReplyToMessageDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReplyToMessageDto&&(identical(other.id, id) || other.id == id)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.content, content) || other.content == content)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.deleted, deleted) || other.deleted == deleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,senderId,content,contentType,deleted);

@override
String toString() {
  return 'ReplyToMessageDto(id: $id, senderId: $senderId, content: $content, contentType: $contentType, deleted: $deleted)';
}


}

/// @nodoc
abstract mixin class $ReplyToMessageDtoCopyWith<$Res>  {
  factory $ReplyToMessageDtoCopyWith(ReplyToMessageDto value, $Res Function(ReplyToMessageDto) _then) = _$ReplyToMessageDtoCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'sender_id') String? senderId, String? content,@JsonKey(name: 'content_type') ContentType? contentType, bool deleted
});




}
/// @nodoc
class _$ReplyToMessageDtoCopyWithImpl<$Res>
    implements $ReplyToMessageDtoCopyWith<$Res> {
  _$ReplyToMessageDtoCopyWithImpl(this._self, this._then);

  final ReplyToMessageDto _self;
  final $Res Function(ReplyToMessageDto) _then;

/// Create a copy of ReplyToMessageDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? senderId = freezed,Object? content = freezed,Object? contentType = freezed,Object? deleted = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,senderId: freezed == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,contentType: freezed == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as ContentType?,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ReplyToMessageDto].
extension ReplyToMessageDtoPatterns on ReplyToMessageDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReplyToMessageDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReplyToMessageDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReplyToMessageDto value)  $default,){
final _that = this;
switch (_that) {
case _ReplyToMessageDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReplyToMessageDto value)?  $default,){
final _that = this;
switch (_that) {
case _ReplyToMessageDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'sender_id')  String? senderId,  String? content, @JsonKey(name: 'content_type')  ContentType? contentType,  bool deleted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReplyToMessageDto() when $default != null:
return $default(_that.id,_that.senderId,_that.content,_that.contentType,_that.deleted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'sender_id')  String? senderId,  String? content, @JsonKey(name: 'content_type')  ContentType? contentType,  bool deleted)  $default,) {final _that = this;
switch (_that) {
case _ReplyToMessageDto():
return $default(_that.id,_that.senderId,_that.content,_that.contentType,_that.deleted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'sender_id')  String? senderId,  String? content, @JsonKey(name: 'content_type')  ContentType? contentType,  bool deleted)?  $default,) {final _that = this;
switch (_that) {
case _ReplyToMessageDto() when $default != null:
return $default(_that.id,_that.senderId,_that.content,_that.contentType,_that.deleted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReplyToMessageDto implements ReplyToMessageDto {
  const _ReplyToMessageDto({required this.id, @JsonKey(name: 'sender_id') this.senderId, this.content, @JsonKey(name: 'content_type') this.contentType, this.deleted = false});
  factory _ReplyToMessageDto.fromJson(Map<String, dynamic> json) => _$ReplyToMessageDtoFromJson(json);

@override final  String id;
@override@JsonKey(name: 'sender_id') final  String? senderId;
@override final  String? content;
@override@JsonKey(name: 'content_type') final  ContentType? contentType;
@override@JsonKey() final  bool deleted;

/// Create a copy of ReplyToMessageDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReplyToMessageDtoCopyWith<_ReplyToMessageDto> get copyWith => __$ReplyToMessageDtoCopyWithImpl<_ReplyToMessageDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReplyToMessageDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReplyToMessageDto&&(identical(other.id, id) || other.id == id)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.content, content) || other.content == content)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.deleted, deleted) || other.deleted == deleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,senderId,content,contentType,deleted);

@override
String toString() {
  return 'ReplyToMessageDto(id: $id, senderId: $senderId, content: $content, contentType: $contentType, deleted: $deleted)';
}


}

/// @nodoc
abstract mixin class _$ReplyToMessageDtoCopyWith<$Res> implements $ReplyToMessageDtoCopyWith<$Res> {
  factory _$ReplyToMessageDtoCopyWith(_ReplyToMessageDto value, $Res Function(_ReplyToMessageDto) _then) = __$ReplyToMessageDtoCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'sender_id') String? senderId, String? content,@JsonKey(name: 'content_type') ContentType? contentType, bool deleted
});




}
/// @nodoc
class __$ReplyToMessageDtoCopyWithImpl<$Res>
    implements _$ReplyToMessageDtoCopyWith<$Res> {
  __$ReplyToMessageDtoCopyWithImpl(this._self, this._then);

  final _ReplyToMessageDto _self;
  final $Res Function(_ReplyToMessageDto) _then;

/// Create a copy of ReplyToMessageDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? senderId = freezed,Object? content = freezed,Object? contentType = freezed,Object? deleted = null,}) {
  return _then(_ReplyToMessageDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,senderId: freezed == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,contentType: freezed == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as ContentType?,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
