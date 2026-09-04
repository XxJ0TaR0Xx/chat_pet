// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MessageModel {

 String get id; String get chatId; String get senderId; ContentType get contentType; DateTime get createAt; String get content; MessageSender get messageSender; bool get isEditing;
/// Create a copy of MessageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageModelCopyWith<MessageModel> get copyWith => _$MessageModelCopyWithImpl<MessageModel>(this as MessageModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.chatId, chatId) || other.chatId == chatId)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.createAt, createAt) || other.createAt == createAt)&&(identical(other.content, content) || other.content == content)&&(identical(other.messageSender, messageSender) || other.messageSender == messageSender)&&(identical(other.isEditing, isEditing) || other.isEditing == isEditing));
}


@override
int get hashCode => Object.hash(runtimeType,id,chatId,senderId,contentType,createAt,content,messageSender,isEditing);

@override
String toString() {
  return 'MessageModel(id: $id, chatId: $chatId, senderId: $senderId, contentType: $contentType, createAt: $createAt, content: $content, messageSender: $messageSender, isEditing: $isEditing)';
}


}

/// @nodoc
abstract mixin class $MessageModelCopyWith<$Res>  {
  factory $MessageModelCopyWith(MessageModel value, $Res Function(MessageModel) _then) = _$MessageModelCopyWithImpl;
@useResult
$Res call({
 String id, String chatId, String senderId, ContentType contentType, DateTime createAt, String content, MessageSender messageSender, bool isEditing
});




}
/// @nodoc
class _$MessageModelCopyWithImpl<$Res>
    implements $MessageModelCopyWith<$Res> {
  _$MessageModelCopyWithImpl(this._self, this._then);

  final MessageModel _self;
  final $Res Function(MessageModel) _then;

/// Create a copy of MessageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? chatId = null,Object? senderId = null,Object? contentType = null,Object? createAt = null,Object? content = null,Object? messageSender = null,Object? isEditing = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,chatId: null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,contentType: null == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as ContentType,createAt: null == createAt ? _self.createAt : createAt // ignore: cast_nullable_to_non_nullable
as DateTime,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,messageSender: null == messageSender ? _self.messageSender : messageSender // ignore: cast_nullable_to_non_nullable
as MessageSender,isEditing: null == isEditing ? _self.isEditing : isEditing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MessageModel].
extension MessageModelPatterns on MessageModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessageModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessageModel value)  $default,){
final _that = this;
switch (_that) {
case _MessageModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessageModel value)?  $default,){
final _that = this;
switch (_that) {
case _MessageModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String chatId,  String senderId,  ContentType contentType,  DateTime createAt,  String content,  MessageSender messageSender,  bool isEditing)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessageModel() when $default != null:
return $default(_that.id,_that.chatId,_that.senderId,_that.contentType,_that.createAt,_that.content,_that.messageSender,_that.isEditing);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String chatId,  String senderId,  ContentType contentType,  DateTime createAt,  String content,  MessageSender messageSender,  bool isEditing)  $default,) {final _that = this;
switch (_that) {
case _MessageModel():
return $default(_that.id,_that.chatId,_that.senderId,_that.contentType,_that.createAt,_that.content,_that.messageSender,_that.isEditing);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String chatId,  String senderId,  ContentType contentType,  DateTime createAt,  String content,  MessageSender messageSender,  bool isEditing)?  $default,) {final _that = this;
switch (_that) {
case _MessageModel() when $default != null:
return $default(_that.id,_that.chatId,_that.senderId,_that.contentType,_that.createAt,_that.content,_that.messageSender,_that.isEditing);case _:
  return null;

}
}

}

/// @nodoc


class _MessageModel implements MessageModel {
  const _MessageModel({required this.id, required this.chatId, required this.senderId, required this.contentType, required this.createAt, required this.content, this.messageSender = MessageSender.me, this.isEditing = false});
  

@override final  String id;
@override final  String chatId;
@override final  String senderId;
@override final  ContentType contentType;
@override final  DateTime createAt;
@override final  String content;
@override@JsonKey() final  MessageSender messageSender;
@override@JsonKey() final  bool isEditing;

/// Create a copy of MessageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageModelCopyWith<_MessageModel> get copyWith => __$MessageModelCopyWithImpl<_MessageModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.chatId, chatId) || other.chatId == chatId)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.createAt, createAt) || other.createAt == createAt)&&(identical(other.content, content) || other.content == content)&&(identical(other.messageSender, messageSender) || other.messageSender == messageSender)&&(identical(other.isEditing, isEditing) || other.isEditing == isEditing));
}


@override
int get hashCode => Object.hash(runtimeType,id,chatId,senderId,contentType,createAt,content,messageSender,isEditing);

@override
String toString() {
  return 'MessageModel(id: $id, chatId: $chatId, senderId: $senderId, contentType: $contentType, createAt: $createAt, content: $content, messageSender: $messageSender, isEditing: $isEditing)';
}


}

/// @nodoc
abstract mixin class _$MessageModelCopyWith<$Res> implements $MessageModelCopyWith<$Res> {
  factory _$MessageModelCopyWith(_MessageModel value, $Res Function(_MessageModel) _then) = __$MessageModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String chatId, String senderId, ContentType contentType, DateTime createAt, String content, MessageSender messageSender, bool isEditing
});




}
/// @nodoc
class __$MessageModelCopyWithImpl<$Res>
    implements _$MessageModelCopyWith<$Res> {
  __$MessageModelCopyWithImpl(this._self, this._then);

  final _MessageModel _self;
  final $Res Function(_MessageModel) _then;

/// Create a copy of MessageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? chatId = null,Object? senderId = null,Object? contentType = null,Object? createAt = null,Object? content = null,Object? messageSender = null,Object? isEditing = null,}) {
  return _then(_MessageModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,chatId: null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,contentType: null == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as ContentType,createAt: null == createAt ? _self.createAt : createAt // ignore: cast_nullable_to_non_nullable
as DateTime,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,messageSender: null == messageSender ? _self.messageSender : messageSender // ignore: cast_nullable_to_non_nullable
as MessageSender,isEditing: null == isEditing ? _self.isEditing : isEditing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
