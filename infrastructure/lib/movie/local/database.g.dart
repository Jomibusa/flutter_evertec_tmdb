// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $MovieTable extends Movie with TableInfo<$MovieTable, MovieData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MovieTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _originalTitleMeta =
      const VerificationMeta('originalTitle');
  @override
  late final GeneratedColumn<String> originalTitle = GeneratedColumn<String>(
      'original_title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _overviewMeta =
      const VerificationMeta('overview');
  @override
  late final GeneratedColumn<String> overview = GeneratedColumn<String>(
      'overview', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _backdropPathMeta =
      const VerificationMeta('backdropPath');
  @override
  late final GeneratedColumn<String> backdropPath = GeneratedColumn<String>(
      'backdrop_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _posterPathMeta =
      const VerificationMeta('posterPath');
  @override
  late final GeneratedColumn<String> posterPath = GeneratedColumn<String>(
      'poster_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _releaseDateMeta =
      const VerificationMeta('releaseDate');
  @override
  late final GeneratedColumn<DateTime> releaseDate = GeneratedColumn<DateTime>(
      'release_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _voteAverageMeta =
      const VerificationMeta('voteAverage');
  @override
  late final GeneratedColumn<double> voteAverage = GeneratedColumn<double>(
      'vote_average', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _originalLanguageMeta =
      const VerificationMeta('originalLanguage');
  @override
  late final GeneratedColumn<String> originalLanguage = GeneratedColumn<String>(
      'original_language', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _adultMeta = const VerificationMeta('adult');
  @override
  late final GeneratedColumn<bool> adult = GeneratedColumn<bool>(
      'adult', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("adult" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        originalTitle,
        overview,
        backdropPath,
        posterPath,
        title,
        releaseDate,
        voteAverage,
        originalLanguage,
        adult
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'movie';
  @override
  VerificationContext validateIntegrity(Insertable<MovieData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('original_title')) {
      context.handle(
          _originalTitleMeta,
          originalTitle.isAcceptableOrUnknown(
              data['original_title']!, _originalTitleMeta));
    } else if (isInserting) {
      context.missing(_originalTitleMeta);
    }
    if (data.containsKey('overview')) {
      context.handle(_overviewMeta,
          overview.isAcceptableOrUnknown(data['overview']!, _overviewMeta));
    } else if (isInserting) {
      context.missing(_overviewMeta);
    }
    if (data.containsKey('backdrop_path')) {
      context.handle(
          _backdropPathMeta,
          backdropPath.isAcceptableOrUnknown(
              data['backdrop_path']!, _backdropPathMeta));
    } else if (isInserting) {
      context.missing(_backdropPathMeta);
    }
    if (data.containsKey('poster_path')) {
      context.handle(
          _posterPathMeta,
          posterPath.isAcceptableOrUnknown(
              data['poster_path']!, _posterPathMeta));
    } else if (isInserting) {
      context.missing(_posterPathMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('release_date')) {
      context.handle(
          _releaseDateMeta,
          releaseDate.isAcceptableOrUnknown(
              data['release_date']!, _releaseDateMeta));
    } else if (isInserting) {
      context.missing(_releaseDateMeta);
    }
    if (data.containsKey('vote_average')) {
      context.handle(
          _voteAverageMeta,
          voteAverage.isAcceptableOrUnknown(
              data['vote_average']!, _voteAverageMeta));
    } else if (isInserting) {
      context.missing(_voteAverageMeta);
    }
    if (data.containsKey('original_language')) {
      context.handle(
          _originalLanguageMeta,
          originalLanguage.isAcceptableOrUnknown(
              data['original_language']!, _originalLanguageMeta));
    } else if (isInserting) {
      context.missing(_originalLanguageMeta);
    }
    if (data.containsKey('adult')) {
      context.handle(
          _adultMeta, adult.isAcceptableOrUnknown(data['adult']!, _adultMeta));
    } else if (isInserting) {
      context.missing(_adultMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MovieData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MovieData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      originalTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}original_title'])!,
      overview: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}overview'])!,
      backdropPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}backdrop_path'])!,
      posterPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}poster_path'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      releaseDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}release_date'])!,
      voteAverage: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}vote_average'])!,
      originalLanguage: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}original_language'])!,
      adult: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}adult'])!,
    );
  }

  @override
  $MovieTable createAlias(String alias) {
    return $MovieTable(attachedDatabase, alias);
  }
}

class MovieData extends DataClass implements Insertable<MovieData> {
  final int id;
  final String originalTitle;
  final String overview;
  final String backdropPath;
  final String posterPath;
  final String title;
  final DateTime releaseDate;
  final double voteAverage;
  final String originalLanguage;
  final bool adult;
  const MovieData(
      {required this.id,
      required this.originalTitle,
      required this.overview,
      required this.backdropPath,
      required this.posterPath,
      required this.title,
      required this.releaseDate,
      required this.voteAverage,
      required this.originalLanguage,
      required this.adult});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['original_title'] = Variable<String>(originalTitle);
    map['overview'] = Variable<String>(overview);
    map['backdrop_path'] = Variable<String>(backdropPath);
    map['poster_path'] = Variable<String>(posterPath);
    map['title'] = Variable<String>(title);
    map['release_date'] = Variable<DateTime>(releaseDate);
    map['vote_average'] = Variable<double>(voteAverage);
    map['original_language'] = Variable<String>(originalLanguage);
    map['adult'] = Variable<bool>(adult);
    return map;
  }

  MovieCompanion toCompanion(bool nullToAbsent) {
    return MovieCompanion(
      id: Value(id),
      originalTitle: Value(originalTitle),
      overview: Value(overview),
      backdropPath: Value(backdropPath),
      posterPath: Value(posterPath),
      title: Value(title),
      releaseDate: Value(releaseDate),
      voteAverage: Value(voteAverage),
      originalLanguage: Value(originalLanguage),
      adult: Value(adult),
    );
  }

  factory MovieData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MovieData(
      id: serializer.fromJson<int>(json['id']),
      originalTitle: serializer.fromJson<String>(json['originalTitle']),
      overview: serializer.fromJson<String>(json['overview']),
      backdropPath: serializer.fromJson<String>(json['backdropPath']),
      posterPath: serializer.fromJson<String>(json['posterPath']),
      title: serializer.fromJson<String>(json['title']),
      releaseDate: serializer.fromJson<DateTime>(json['releaseDate']),
      voteAverage: serializer.fromJson<double>(json['voteAverage']),
      originalLanguage: serializer.fromJson<String>(json['originalLanguage']),
      adult: serializer.fromJson<bool>(json['adult']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'originalTitle': serializer.toJson<String>(originalTitle),
      'overview': serializer.toJson<String>(overview),
      'backdropPath': serializer.toJson<String>(backdropPath),
      'posterPath': serializer.toJson<String>(posterPath),
      'title': serializer.toJson<String>(title),
      'releaseDate': serializer.toJson<DateTime>(releaseDate),
      'voteAverage': serializer.toJson<double>(voteAverage),
      'originalLanguage': serializer.toJson<String>(originalLanguage),
      'adult': serializer.toJson<bool>(adult),
    };
  }

  MovieData copyWith(
          {int? id,
          String? originalTitle,
          String? overview,
          String? backdropPath,
          String? posterPath,
          String? title,
          DateTime? releaseDate,
          double? voteAverage,
          String? originalLanguage,
          bool? adult}) =>
      MovieData(
        id: id ?? this.id,
        originalTitle: originalTitle ?? this.originalTitle,
        overview: overview ?? this.overview,
        backdropPath: backdropPath ?? this.backdropPath,
        posterPath: posterPath ?? this.posterPath,
        title: title ?? this.title,
        releaseDate: releaseDate ?? this.releaseDate,
        voteAverage: voteAverage ?? this.voteAverage,
        originalLanguage: originalLanguage ?? this.originalLanguage,
        adult: adult ?? this.adult,
      );
  @override
  String toString() {
    return (StringBuffer('MovieData(')
          ..write('id: $id, ')
          ..write('originalTitle: $originalTitle, ')
          ..write('overview: $overview, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('posterPath: $posterPath, ')
          ..write('title: $title, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('originalLanguage: $originalLanguage, ')
          ..write('adult: $adult')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, originalTitle, overview, backdropPath,
      posterPath, title, releaseDate, voteAverage, originalLanguage, adult);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MovieData &&
          other.id == this.id &&
          other.originalTitle == this.originalTitle &&
          other.overview == this.overview &&
          other.backdropPath == this.backdropPath &&
          other.posterPath == this.posterPath &&
          other.title == this.title &&
          other.releaseDate == this.releaseDate &&
          other.voteAverage == this.voteAverage &&
          other.originalLanguage == this.originalLanguage &&
          other.adult == this.adult);
}

class MovieCompanion extends UpdateCompanion<MovieData> {
  final Value<int> id;
  final Value<String> originalTitle;
  final Value<String> overview;
  final Value<String> backdropPath;
  final Value<String> posterPath;
  final Value<String> title;
  final Value<DateTime> releaseDate;
  final Value<double> voteAverage;
  final Value<String> originalLanguage;
  final Value<bool> adult;
  const MovieCompanion({
    this.id = const Value.absent(),
    this.originalTitle = const Value.absent(),
    this.overview = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.title = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.voteAverage = const Value.absent(),
    this.originalLanguage = const Value.absent(),
    this.adult = const Value.absent(),
  });
  MovieCompanion.insert({
    this.id = const Value.absent(),
    required String originalTitle,
    required String overview,
    required String backdropPath,
    required String posterPath,
    required String title,
    required DateTime releaseDate,
    required double voteAverage,
    required String originalLanguage,
    required bool adult,
  })  : originalTitle = Value(originalTitle),
        overview = Value(overview),
        backdropPath = Value(backdropPath),
        posterPath = Value(posterPath),
        title = Value(title),
        releaseDate = Value(releaseDate),
        voteAverage = Value(voteAverage),
        originalLanguage = Value(originalLanguage),
        adult = Value(adult);
  static Insertable<MovieData> custom({
    Expression<int>? id,
    Expression<String>? originalTitle,
    Expression<String>? overview,
    Expression<String>? backdropPath,
    Expression<String>? posterPath,
    Expression<String>? title,
    Expression<DateTime>? releaseDate,
    Expression<double>? voteAverage,
    Expression<String>? originalLanguage,
    Expression<bool>? adult,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (originalTitle != null) 'original_title': originalTitle,
      if (overview != null) 'overview': overview,
      if (backdropPath != null) 'backdrop_path': backdropPath,
      if (posterPath != null) 'poster_path': posterPath,
      if (title != null) 'title': title,
      if (releaseDate != null) 'release_date': releaseDate,
      if (voteAverage != null) 'vote_average': voteAverage,
      if (originalLanguage != null) 'original_language': originalLanguage,
      if (adult != null) 'adult': adult,
    });
  }

  MovieCompanion copyWith(
      {Value<int>? id,
      Value<String>? originalTitle,
      Value<String>? overview,
      Value<String>? backdropPath,
      Value<String>? posterPath,
      Value<String>? title,
      Value<DateTime>? releaseDate,
      Value<double>? voteAverage,
      Value<String>? originalLanguage,
      Value<bool>? adult}) {
    return MovieCompanion(
      id: id ?? this.id,
      originalTitle: originalTitle ?? this.originalTitle,
      overview: overview ?? this.overview,
      backdropPath: backdropPath ?? this.backdropPath,
      posterPath: posterPath ?? this.posterPath,
      title: title ?? this.title,
      releaseDate: releaseDate ?? this.releaseDate,
      voteAverage: voteAverage ?? this.voteAverage,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      adult: adult ?? this.adult,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (originalTitle.present) {
      map['original_title'] = Variable<String>(originalTitle.value);
    }
    if (overview.present) {
      map['overview'] = Variable<String>(overview.value);
    }
    if (backdropPath.present) {
      map['backdrop_path'] = Variable<String>(backdropPath.value);
    }
    if (posterPath.present) {
      map['poster_path'] = Variable<String>(posterPath.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (releaseDate.present) {
      map['release_date'] = Variable<DateTime>(releaseDate.value);
    }
    if (voteAverage.present) {
      map['vote_average'] = Variable<double>(voteAverage.value);
    }
    if (originalLanguage.present) {
      map['original_language'] = Variable<String>(originalLanguage.value);
    }
    if (adult.present) {
      map['adult'] = Variable<bool>(adult.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MovieCompanion(')
          ..write('id: $id, ')
          ..write('originalTitle: $originalTitle, ')
          ..write('overview: $overview, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('posterPath: $posterPath, ')
          ..write('title: $title, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('originalLanguage: $originalLanguage, ')
          ..write('adult: $adult')
          ..write(')'))
        .toString();
  }
}

class $TrackingTable extends Tracking
    with TableInfo<$TrackingTable, TrackingData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TrackingTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
      'date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, date];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tracking';
  @override
  VerificationContext validateIntegrity(Insertable<TrackingData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TrackingData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TrackingData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}date'])!,
    );
  }

  @override
  $TrackingTable createAlias(String alias) {
    return $TrackingTable(attachedDatabase, alias);
  }
}

class TrackingData extends DataClass implements Insertable<TrackingData> {
  final int id;
  final String date;
  const TrackingData({required this.id, required this.date});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<String>(date);
    return map;
  }

  TrackingCompanion toCompanion(bool nullToAbsent) {
    return TrackingCompanion(
      id: Value(id),
      date: Value(date),
    );
  }

  factory TrackingData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TrackingData(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<String>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<String>(date),
    };
  }

  TrackingData copyWith({int? id, String? date}) => TrackingData(
        id: id ?? this.id,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('TrackingData(')
          ..write('id: $id, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TrackingData && other.id == this.id && other.date == this.date);
}

class TrackingCompanion extends UpdateCompanion<TrackingData> {
  final Value<int> id;
  final Value<String> date;
  const TrackingCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
  });
  TrackingCompanion.insert({
    this.id = const Value.absent(),
    required String date,
  }) : date = Value(date);
  static Insertable<TrackingData> custom({
    Expression<int>? id,
    Expression<String>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
    });
  }

  TrackingCompanion copyWith({Value<int>? id, Value<String>? date}) {
    return TrackingCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TrackingCompanion(')
          ..write('id: $id, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $MovieTable movie = $MovieTable(this);
  late final $TrackingTable tracking = $TrackingTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [movie, tracking];
}
