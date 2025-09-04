import 'package:bloc_test/bloc_test.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/api_client.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/model/api_order_param.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/model/paginated_collection.dart';
import 'package:breizh_blok_mobile/data/repositories/boulder/boulder_repository.dart';
import 'package:breizh_blok_mobile/data/services/local/download_area_service.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder/boulder.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder_area/boulder_area.dart';
import 'package:breizh_blok_mobile/domain/entities/grade/grade.dart';
import 'package:breizh_blok_mobile/domain/entities/location/location.dart';
import 'package:breizh_blok_mobile/domain/entities/municipality/municipality.dart';
import 'package:breizh_blok_mobile/domain/entities/rock/rock.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';

void main() {
  late ApiClient apiClient;
  late BoulderRepository boulderRepository;

  setUp(() {
    apiClient = MockApiClient();
    boulderRepository = MockBoulderRepository();
    registerFallbackValue(const Duration(seconds: 1));
    registerFallbackValue(Uri());
  });
  group('BoulderBloc', () {
    const idBoulderArea = '3';
    const boulderArea = BoulderArea(
      iri: '/boulder_areas/$idBoulderArea',
      name: 'foo',
      municipality: Municipality(iri: '/bar', name: 'bar'),
    );

    Boulder createBoulder({required String id, Grade? grade}) {
      return Boulder(
        iri: id,
        name: id,
        grade: grade,
        rock: Rock(
          boulderArea: boulderArea,
          iri: id,
          location: const Location(latitude: 0, longitude: 0),
        ),
      );
    }

    final boulderWithoutGrade = createBoulder(id: 'no grade');
    final boulder5a = createBoulder(
      id: '5a',
      grade: const Grade(iri: 'b', name: '5a'),
    );
    final boulder5aPlus = createBoulder(
      id: '5a+',
      grade: const Grade(iri: 'c', name: '5a+'),
    );
    final boulder6a = createBoulder(
      id: '6a',
      grade: const Grade(iri: 'd', name: '6a'),
    );
    blocTest<BoulderBloc, BoulderState>(
      'default state OK',
      build: () =>
          BoulderBloc(repository: BoulderRepository(httpClient: apiClient)),
      act: (BoulderBloc bloc) => bloc.add(
        DbBouldersRequested(
          boulderArea: boulderArea,
          orderParam: const ApiOrderParam(
            name: kGradeOrderParam,
            direction: kAscendantDirection,
          ),
          grades: {},
        ),
      ),
      verify: (BoulderBloc bloc) {
        verify(
          () => apiClient.get(
            any(
              that: isA<Uri>().having(
                (e) => e.toString(),
                'uri',
                endsWith(
                  '/boulders?groups%5B%5D=Boulder%3Aitem-get&groups%5B%5D=Boulder%3Aread&groups%5B%5D=read&order%5Bid%5D=desc&pagination=false&rock.boulderArea.id%5B%5D=3',
                ),
              ),
            ),
            headers: any(named: 'headers'),
            offlineFirst: true,
            timeout: any(named: 'timeout'),
          ),
        ).called(1);
      },
    );
    blocTest<BoulderBloc, BoulderState>(
      'sort by grade asc',
      setUp: () {
        when(
          () => boulderRepository.findBy(
            offlineFirst: true,
            timeout: any(named: 'timeout'),
            queryParams: DownloadAreaService.bouldersQueryParamsOf(
              boulderArea: boulderArea,
            ),
          ),
        ).thenAnswer((_) async {
          return PaginatedCollection<Boulder>(
            items: [boulder5a, boulder6a, boulder5aPlus, boulderWithoutGrade],
            totalItems: 0,
          );
        });
      },
      build: () => BoulderBloc(repository: boulderRepository),
      act: (BoulderBloc bloc) => bloc.add(
        DbBouldersRequested(
          boulderArea: boulderArea,
          orderParam: const ApiOrderParam(
            name: kGradeOrderParam,
            direction: kAscendantDirection,
          ),
          grades: {},
        ),
      ),
      verify: (BoulderBloc bloc) {
        expect(bloc.state.data?.totalItems, equals(4));
        expect(
          bloc.state.data?.items,
          equals([boulder5a, boulder5aPlus, boulder6a, boulderWithoutGrade]),
        );
      },
    );

    blocTest<BoulderBloc, BoulderState>(
      'sort by grade desc',
      setUp: () {
        when(
          () => boulderRepository.findBy(
            offlineFirst: true,
            timeout: any(named: 'timeout'),
            queryParams: DownloadAreaService.bouldersQueryParamsOf(
              boulderArea: boulderArea,
            ),
          ),
        ).thenAnswer((_) async {
          return PaginatedCollection<Boulder>(
            items: [boulder5a, boulder6a, boulder5aPlus, boulderWithoutGrade],
            totalItems: 0,
          );
        });
      },
      build: () => BoulderBloc(repository: boulderRepository),
      act: (BoulderBloc bloc) => bloc.add(
        DbBouldersRequested(
          boulderArea: boulderArea,
          orderParam: const ApiOrderParam(
            name: kGradeOrderParam,
            direction: kDescendantDirection,
          ),
          grades: {},
        ),
      ),
      verify: (BoulderBloc bloc) {
        expect(bloc.state.data?.totalItems, equals(4));
        expect(
          bloc.state.data?.items,
          equals([boulderWithoutGrade, boulder6a, boulder5aPlus, boulder5a]),
        );
      },
    );

    blocTest<BoulderBloc, BoulderState>(
      'sort by grade desc',
      setUp: () {
        when(
          () => boulderRepository.findBy(
            offlineFirst: true,
            timeout: any(named: 'timeout'),
            queryParams: DownloadAreaService.bouldersQueryParamsOf(
              boulderArea: boulderArea,
            ),
          ),
        ).thenAnswer((_) async {
          return PaginatedCollection<Boulder>(
            items: [boulder5a, boulder6a, boulder5aPlus, boulderWithoutGrade],
            totalItems: 0,
          );
        });
      },
      build: () => BoulderBloc(repository: boulderRepository),
      act: (BoulderBloc bloc) => bloc.add(
        DbBouldersRequested(
          boulderArea: boulderArea,
          orderParam: const ApiOrderParam(
            name: kGradeOrderParam,
            direction: kAscendantDirection,
          ),
          grades: {boulder5aPlus.grade!, boulder6a.grade!},
        ),
      ),
      verify: (BoulderBloc bloc) {
        expect(bloc.state.data?.totalItems, equals(2));
        expect(bloc.state.data?.items, equals([boulder5aPlus, boulder6a]));
      },
    );

    blocTest<BoulderBloc, BoulderState>(
      'filter by boulder IDs',
      setUp: () {
        when(
          () => boulderRepository.findBy(
            offlineFirst: true,
            timeout: any(named: 'timeout'),
            queryParams: DownloadAreaService.bouldersQueryParamsOf(
              boulderArea: boulderArea,
            ),
          ),
        ).thenAnswer((_) async {
          return PaginatedCollection<Boulder>(
            items: [boulder5a, boulder5aPlus, boulder6a, boulderWithoutGrade],
            totalItems: 0,
          );
        });
      },
      build: () => BoulderBloc(repository: boulderRepository),
      act: (BoulderBloc bloc) => bloc.add(
        DbBouldersRequested(
          boulderArea: boulderArea,
          boulderIds: {boulder5a.id, boulder5aPlus.id},
          orderParam: const ApiOrderParam(
            name: kGradeOrderParam,
            direction: kDescendantDirection,
          ),
        ),
      ),
      verify: (BoulderBloc bloc) {
        expect(bloc.state.data?.totalItems, equals(2));
        expect(bloc.state.data?.items, equals([boulder5aPlus, boulder5a]));
      },
    );

    blocTest<BoulderBloc, BoulderState>(
      'filter by boulder IDs and grade',
      setUp: () {
        when(
          () => boulderRepository.findBy(
            offlineFirst: true,
            timeout: any(named: 'timeout'),
            queryParams: DownloadAreaService.bouldersQueryParamsOf(
              boulderArea: boulderArea,
            ),
          ),
        ).thenAnswer((_) async {
          return PaginatedCollection<Boulder>(
            items: [boulder5a, boulder5aPlus, boulder6a, boulderWithoutGrade],
            totalItems: 0,
          );
        });
      },
      build: () => BoulderBloc(repository: boulderRepository),
      act: (BoulderBloc bloc) => bloc.add(
        DbBouldersRequested(
          boulderArea: boulderArea,
          boulderIds: {boulder5a.id, boulder5aPlus.id},
          orderParam: const ApiOrderParam(
            name: kGradeOrderParam,
            direction: kDescendantDirection,
          ),
          grades: {boulder5aPlus.grade!},
        ),
      ),
      verify: (BoulderBloc bloc) {
        expect(bloc.state.data?.totalItems, equals(1));
        expect(bloc.state.data?.items, equals([boulder5aPlus]));
      },
    );
  });
}
