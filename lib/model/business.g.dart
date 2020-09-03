// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Business extends Business {
  @override
  final String id;
  @override
  final String name;
  @override
  final bool active;
  @override
  final String currency;
  @override
  final String categoryId;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String userId;
  @override
  final String typeId;
  @override
  final String timeZone;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final String country;
  @override
  final String businessUrl;
  @override
  final String hexColor;
  @override
  final String image;
  @override
  final BusinessType type;

  factory _$Business([void Function(BusinessBuilder) updates]) =>
      (new BusinessBuilder()..update(updates)).build();

  _$Business._(
      {this.id,
      this.name,
      this.active,
      this.currency,
      this.categoryId,
      this.latitude,
      this.longitude,
      this.userId,
      this.typeId,
      this.timeZone,
      this.createdAt,
      this.updatedAt,
      this.country,
      this.businessUrl,
      this.hexColor,
      this.image,
      this.type})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Business', 'id');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('Business', 'name');
    }
    if (active == null) {
      throw new BuiltValueNullFieldError('Business', 'active');
    }
    if (currency == null) {
      throw new BuiltValueNullFieldError('Business', 'currency');
    }
    if (categoryId == null) {
      throw new BuiltValueNullFieldError('Business', 'categoryId');
    }
    if (typeId == null) {
      throw new BuiltValueNullFieldError('Business', 'typeId');
    }
  }

  @override
  Business rebuild(void Function(BusinessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BusinessBuilder toBuilder() => new BusinessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Business &&
        id == other.id &&
        name == other.name &&
        active == other.active &&
        currency == other.currency &&
        categoryId == other.categoryId &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        userId == other.userId &&
        typeId == other.typeId &&
        timeZone == other.timeZone &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        country == other.country &&
        businessUrl == other.businessUrl &&
        hexColor == other.hexColor &&
        image == other.image &&
        type == other.type;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(0,
                                                                        id.hashCode),
                                                                    name.hashCode),
                                                                active.hashCode),
                                                            currency.hashCode),
                                                        categoryId.hashCode),
                                                    latitude.hashCode),
                                                longitude.hashCode),
                                            userId.hashCode),
                                        typeId.hashCode),
                                    timeZone.hashCode),
                                createdAt.hashCode),
                            updatedAt.hashCode),
                        country.hashCode),
                    businessUrl.hashCode),
                hexColor.hashCode),
            image.hashCode),
        type.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Business')
          ..add('id', id)
          ..add('name', name)
          ..add('active', active)
          ..add('currency', currency)
          ..add('categoryId', categoryId)
          ..add('latitude', latitude)
          ..add('longitude', longitude)
          ..add('userId', userId)
          ..add('typeId', typeId)
          ..add('timeZone', timeZone)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('country', country)
          ..add('businessUrl', businessUrl)
          ..add('hexColor', hexColor)
          ..add('image', image)
          ..add('type', type))
        .toString();
  }
}

class BusinessBuilder implements Builder<Business, BusinessBuilder> {
  _$Business _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  bool _active;
  bool get active => _$this._active;
  set active(bool active) => _$this._active = active;

  String _currency;
  String get currency => _$this._currency;
  set currency(String currency) => _$this._currency = currency;

  String _categoryId;
  String get categoryId => _$this._categoryId;
  set categoryId(String categoryId) => _$this._categoryId = categoryId;

  double _latitude;
  double get latitude => _$this._latitude;
  set latitude(double latitude) => _$this._latitude = latitude;

  double _longitude;
  double get longitude => _$this._longitude;
  set longitude(double longitude) => _$this._longitude = longitude;

  String _userId;
  String get userId => _$this._userId;
  set userId(String userId) => _$this._userId = userId;

  String _typeId;
  String get typeId => _$this._typeId;
  set typeId(String typeId) => _$this._typeId = typeId;

  String _timeZone;
  String get timeZone => _$this._timeZone;
  set timeZone(String timeZone) => _$this._timeZone = timeZone;

  String _createdAt;
  String get createdAt => _$this._createdAt;
  set createdAt(String createdAt) => _$this._createdAt = createdAt;

  String _updatedAt;
  String get updatedAt => _$this._updatedAt;
  set updatedAt(String updatedAt) => _$this._updatedAt = updatedAt;

  String _country;
  String get country => _$this._country;
  set country(String country) => _$this._country = country;

  String _businessUrl;
  String get businessUrl => _$this._businessUrl;
  set businessUrl(String businessUrl) => _$this._businessUrl = businessUrl;

  String _hexColor;
  String get hexColor => _$this._hexColor;
  set hexColor(String hexColor) => _$this._hexColor = hexColor;

  String _image;
  String get image => _$this._image;
  set image(String image) => _$this._image = image;

  BusinessType _type;
  BusinessType get type => _$this._type;
  set type(BusinessType type) => _$this._type = type;

  BusinessBuilder();

  BusinessBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _active = _$v.active;
      _currency = _$v.currency;
      _categoryId = _$v.categoryId;
      _latitude = _$v.latitude;
      _longitude = _$v.longitude;
      _userId = _$v.userId;
      _typeId = _$v.typeId;
      _timeZone = _$v.timeZone;
      _createdAt = _$v.createdAt;
      _updatedAt = _$v.updatedAt;
      _country = _$v.country;
      _businessUrl = _$v.businessUrl;
      _hexColor = _$v.hexColor;
      _image = _$v.image;
      _type = _$v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Business other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Business;
  }

  @override
  void update(void Function(BusinessBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Business build() {
    final _$result = _$v ??
        new _$Business._(
            id: id,
            name: name,
            active: active,
            currency: currency,
            categoryId: categoryId,
            latitude: latitude,
            longitude: longitude,
            userId: userId,
            typeId: typeId,
            timeZone: timeZone,
            createdAt: createdAt,
            updatedAt: updatedAt,
            country: country,
            businessUrl: businessUrl,
            hexColor: hexColor,
            image: image,
            type: type);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new