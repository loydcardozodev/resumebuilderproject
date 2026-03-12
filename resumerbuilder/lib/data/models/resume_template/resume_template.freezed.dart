// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resume_template.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResumeTemplate {

 String get id; String get name;@ColorConverter() Color get accentColor; bool get isPopular;
/// Create a copy of ResumeTemplate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResumeTemplateCopyWith<ResumeTemplate> get copyWith => _$ResumeTemplateCopyWithImpl<ResumeTemplate>(this as ResumeTemplate, _$identity);

  /// Serializes this ResumeTemplate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResumeTemplate&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.accentColor, accentColor) || other.accentColor == accentColor)&&(identical(other.isPopular, isPopular) || other.isPopular == isPopular));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,accentColor,isPopular);

@override
String toString() {
  return 'ResumeTemplate(id: $id, name: $name, accentColor: $accentColor, isPopular: $isPopular)';
}


}

/// @nodoc
abstract mixin class $ResumeTemplateCopyWith<$Res>  {
  factory $ResumeTemplateCopyWith(ResumeTemplate value, $Res Function(ResumeTemplate) _then) = _$ResumeTemplateCopyWithImpl;
@useResult
$Res call({
 String id, String name,@ColorConverter() Color accentColor, bool isPopular
});




}
/// @nodoc
class _$ResumeTemplateCopyWithImpl<$Res>
    implements $ResumeTemplateCopyWith<$Res> {
  _$ResumeTemplateCopyWithImpl(this._self, this._then);

  final ResumeTemplate _self;
  final $Res Function(ResumeTemplate) _then;

/// Create a copy of ResumeTemplate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? accentColor = null,Object? isPopular = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,accentColor: null == accentColor ? _self.accentColor : accentColor // ignore: cast_nullable_to_non_nullable
as Color,isPopular: null == isPopular ? _self.isPopular : isPopular // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ResumeTemplate].
extension ResumeTemplatePatterns on ResumeTemplate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResumeTemplate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResumeTemplate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResumeTemplate value)  $default,){
final _that = this;
switch (_that) {
case _ResumeTemplate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResumeTemplate value)?  $default,){
final _that = this;
switch (_that) {
case _ResumeTemplate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @ColorConverter()  Color accentColor,  bool isPopular)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResumeTemplate() when $default != null:
return $default(_that.id,_that.name,_that.accentColor,_that.isPopular);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @ColorConverter()  Color accentColor,  bool isPopular)  $default,) {final _that = this;
switch (_that) {
case _ResumeTemplate():
return $default(_that.id,_that.name,_that.accentColor,_that.isPopular);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @ColorConverter()  Color accentColor,  bool isPopular)?  $default,) {final _that = this;
switch (_that) {
case _ResumeTemplate() when $default != null:
return $default(_that.id,_that.name,_that.accentColor,_that.isPopular);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResumeTemplate implements ResumeTemplate {
  const _ResumeTemplate({required this.id, required this.name, @ColorConverter() required this.accentColor, this.isPopular = false});
  factory _ResumeTemplate.fromJson(Map<String, dynamic> json) => _$ResumeTemplateFromJson(json);

@override final  String id;
@override final  String name;
@override@ColorConverter() final  Color accentColor;
@override@JsonKey() final  bool isPopular;

/// Create a copy of ResumeTemplate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResumeTemplateCopyWith<_ResumeTemplate> get copyWith => __$ResumeTemplateCopyWithImpl<_ResumeTemplate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResumeTemplateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResumeTemplate&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.accentColor, accentColor) || other.accentColor == accentColor)&&(identical(other.isPopular, isPopular) || other.isPopular == isPopular));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,accentColor,isPopular);

@override
String toString() {
  return 'ResumeTemplate(id: $id, name: $name, accentColor: $accentColor, isPopular: $isPopular)';
}


}

/// @nodoc
abstract mixin class _$ResumeTemplateCopyWith<$Res> implements $ResumeTemplateCopyWith<$Res> {
  factory _$ResumeTemplateCopyWith(_ResumeTemplate value, $Res Function(_ResumeTemplate) _then) = __$ResumeTemplateCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@ColorConverter() Color accentColor, bool isPopular
});




}
/// @nodoc
class __$ResumeTemplateCopyWithImpl<$Res>
    implements _$ResumeTemplateCopyWith<$Res> {
  __$ResumeTemplateCopyWithImpl(this._self, this._then);

  final _ResumeTemplate _self;
  final $Res Function(_ResumeTemplate) _then;

/// Create a copy of ResumeTemplate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? accentColor = null,Object? isPopular = null,}) {
  return _then(_ResumeTemplate(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,accentColor: null == accentColor ? _self.accentColor : accentColor // ignore: cast_nullable_to_non_nullable
as Color,isPopular: null == isPopular ? _self.isPopular : isPopular // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
