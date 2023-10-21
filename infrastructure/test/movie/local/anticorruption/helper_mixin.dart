import 'package:infrastructure/movie/local/anticorruption/movie_translator_domain_to_infra.dart';
import 'package:infrastructure/movie/local/anticorruption/movie_translator_infra_to_domain.dart';
import 'package:infrastructure/movie/local/anticorruption/tracking_translator_infra_to_domain.dart';

class HelperMixinTest
    with
        MovieTranslatorDomainToInfra,
        MovieTranslatorInfraToDomain,
        TrackingTranslatorInfraToDomain {}
