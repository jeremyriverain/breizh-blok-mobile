import 'package:bloc_test/bloc_test.dart';
import 'package:breizh_blok_mobile/app_http_client.dart';
import 'package:breizh_blok_mobile/blocs/boulder_bloc.dart';
import 'package:breizh_blok_mobile/download_area_service.dart';
import 'package:breizh_blok_mobile/models/boulder.dart';
import 'package:breizh_blok_mobile/models/boulder_area.dart';
import 'package:breizh_blok_mobile/models/collection_items.dart';
import 'package:breizh_blok_mobile/models/grade.dart';
import 'package:breizh_blok_mobile/models/location.dart';
import 'package:breizh_blok_mobile/models/municipality.dart';
import 'package:breizh_blok_mobile/models/order_query_param.dart';
import 'package:breizh_blok_mobile/models/rock.dart';
import 'package:breizh_blok_mobile/repositories/boulder_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<AppHttpClient>(), MockSpec<BoulderRepository>()])
import './boulder_bloc_test.mocks.dart';

void main() {
  final mockHttpClient = MockAppHttpClient();
  final mockBoulderRepository = MockBoulderRepository();

  setUp(() {
    reset(mockHttpClient);
    reset(mockBoulderRepository);
  });
  group('BoulderBloc', () {
    const idBoulderArea = '3';
    final boulderArea = BoulderArea(
      iri: '/boulder_areas/$idBoulderArea',
      name: 'foo',
      municipality: Municipality(
        iri: '/bar',
        name: 'bar',
        boulderAreas: const [],
      ),
    );

    Boulder createBoulder({
      required String id,
      Grade? grade,
    }) {
      return Boulder(
        iri: id,
        name: id,
        grade: grade,
        rock: Rock(
          boulderArea: boulderArea,
          iri: id,
          location: Location(latitude: 0, longitude: 0),
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
      build: () => BoulderBloc(
        repository: BoulderRepository(httpClient: mockHttpClient),
      ),
      act: (BoulderBloc bloc) => bloc.add(
        DbBouldersRequested(
          boulderArea: boulderArea,
          orderQueryParam: const OrderQueryParam(
            name: kGradeOrderQueryParam,
            direction: kAscendantDirection,
          ),
          grades: {},
        ),
      ),
      verify: (BoulderBloc bloc) {
        expect(
          (verify(
            mockHttpClient.get(
              captureAny,
              headers: anyNamed('headers'),
              offlineFirst: true,
              timeout: anyNamed('timeout'),
            ),
          ).captured.single as Uri)
              .toString(),
          endsWith(
            '/boulders?groups%5B%5D=Boulder%3Aitem-get&groups%5B%5D=Boulder%3Aread&groups%5B%5D=read&order%5Bid%5D=desc&pagination=false&rock.boulderArea.id%5B%5D=3',
          ),
        );
      },
    );
    blocTest<BoulderBloc, BoulderState>(
      'sort by grade asc',
      setUp: () {
        when(
          mockBoulderRepository.findBy(
            offlineFirst: true,
            timeout: anyNamed('timeout'),
            queryParams: DownloadAreaService.bouldersQueryParamsOf(
              boulderArea: boulderArea,
            ),
          ),
        ).thenAnswer((_) async {
          return CollectionItems<Boulder>(
            items: [
              boulder5a,
              boulder6a,
              boulder5aPlus,
              boulderWithoutGrade,
            ],
            totalItems: 0,
          );
        });
      },
      build: () => BoulderBloc(
        repository: mockBoulderRepository,
      ),
      act: (BoulderBloc bloc) => bloc.add(
        DbBouldersRequested(
          boulderArea: boulderArea,
          orderQueryParam: const OrderQueryParam(
            name: kGradeOrderQueryParam,
            direction: kAscendantDirection,
          ),
          grades: {},
        ),
      ),
      verify: (BoulderBloc bloc) {
        expect(
          bloc.state.data?.totalItems,
          equals(4),
        );
        expect(
          bloc.state.data?.items,
          equals(
            [
              boulder5a,
              boulder5aPlus,
              boulder6a,
              boulderWithoutGrade,
            ],
          ),
        );
      },
    );

    blocTest<BoulderBloc, BoulderState>(
      'sort by grade desc',
      setUp: () {
        when(
          mockBoulderRepository.findBy(
            offlineFirst: true,
            timeout: anyNamed('timeout'),
            queryParams: DownloadAreaService.bouldersQueryParamsOf(
              boulderArea: boulderArea,
            ),
          ),
        ).thenAnswer((_) async {
          return CollectionItems<Boulder>(
            items: [
              boulder5a,
              boulder6a,
              boulder5aPlus,
              boulderWithoutGrade,
            ],
            totalItems: 0,
          );
        });
      },
      build: () => BoulderBloc(
        repository: mockBoulderRepository,
      ),
      act: (BoulderBloc bloc) => bloc.add(
        DbBouldersRequested(
          boulderArea: boulderArea,
          orderQueryParam: const OrderQueryParam(
            name: kGradeOrderQueryParam,
            direction: kDescendantDirection,
          ),
          grades: {},
        ),
      ),
      verify: (BoulderBloc bloc) {
        expect(
          bloc.state.data?.totalItems,
          equals(4),
        );
        expect(
          bloc.state.data?.items,
          equals(
            [
              boulderWithoutGrade,
              boulder6a,
              boulder5aPlus,
              boulder5a,
            ],
          ),
        );
      },
    );

    blocTest<BoulderBloc, BoulderState>(
      'sort by grade desc',
      setUp: () {
        when(
          mockBoulderRepository.findBy(
            offlineFirst: true,
            timeout: anyNamed('timeout'),
            queryParams: DownloadAreaService.bouldersQueryParamsOf(
              boulderArea: boulderArea,
            ),
          ),
        ).thenAnswer((_) async {
          return CollectionItems<Boulder>(
            items: [
              boulder5a,
              boulder6a,
              boulder5aPlus,
              boulderWithoutGrade,
            ],
            totalItems: 0,
          );
        });
      },
      build: () => BoulderBloc(
        repository: mockBoulderRepository,
      ),
      act: (BoulderBloc bloc) => bloc.add(
        DbBouldersRequested(
          boulderArea: boulderArea,
          orderQueryParam: const OrderQueryParam(
            name: kGradeOrderQueryParam,
            direction: kAscendantDirection,
          ),
          grades: {
            boulder5aPlus.grade!,
            boulder6a.grade!,
          },
        ),
      ),
      verify: (BoulderBloc bloc) {
        expect(
          bloc.state.data?.totalItems,
          equals(2),
        );
        expect(
          bloc.state.data?.items,
          equals(
            [
              boulder5aPlus,
              boulder6a,
            ],
          ),
        );
      },
    );

    blocTest<BoulderBloc, BoulderState>(
      'filter by boulder IDs',
      setUp: () {
        when(
          mockBoulderRepository.findBy(
            offlineFirst: true,
            timeout: anyNamed('timeout'),
            queryParams: DownloadAreaService.bouldersQueryParamsOf(
              boulderArea: boulderArea,
            ),
          ),
        ).thenAnswer((_) async {
          return CollectionItems<Boulder>(
            items: [
              boulder5a,
              boulder5aPlus,
              boulder6a,
              boulderWithoutGrade,
            ],
            totalItems: 0,
          );
        });
      },
      build: () => BoulderBloc(
        repository: mockBoulderRepository,
      ),
      act: (BoulderBloc bloc) => bloc.add(
        DbBouldersRequested(
          boulderArea: boulderArea,
          boulderIds: {boulder5a.id, boulder5aPlus.id},
          orderQueryParam: const OrderQueryParam(
            name: kGradeOrderQueryParam,
            direction: kDescendantDirection,
          ),
        ),
      ),
      verify: (BoulderBloc bloc) {
        expect(
          bloc.state.data?.totalItems,
          equals(2),
        );
        expect(
          bloc.state.data?.items,
          equals(
            [
              boulder5aPlus,
              boulder5a,
            ],
          ),
        );
      },
    );

    blocTest<BoulderBloc, BoulderState>(
      'filter by boulder IDs and grade',
      setUp: () {
        when(
          mockBoulderRepository.findBy(
            offlineFirst: true,
            timeout: anyNamed('timeout'),
            queryParams: DownloadAreaService.bouldersQueryParamsOf(
              boulderArea: boulderArea,
            ),
          ),
        ).thenAnswer((_) async {
          return CollectionItems<Boulder>(
            items: [
              boulder5a,
              boulder5aPlus,
              boulder6a,
              boulderWithoutGrade,
            ],
            totalItems: 0,
          );
        });
      },
      build: () => BoulderBloc(
        repository: mockBoulderRepository,
      ),
      act: (BoulderBloc bloc) => bloc.add(
        DbBouldersRequested(
          boulderArea: boulderArea,
          boulderIds: {boulder5a.id, boulder5aPlus.id},
          orderQueryParam: const OrderQueryParam(
            name: kGradeOrderQueryParam,
            direction: kDescendantDirection,
          ),
          grades: {
            boulder5aPlus.grade!,
          },
        ),
      ),
      verify: (BoulderBloc bloc) {
        expect(
          bloc.state.data?.totalItems,
          equals(1),
        );
        expect(
          bloc.state.data?.items,
          equals(
            [
              boulder5aPlus,
            ],
          ),
        );
      },
    );
  });
}
