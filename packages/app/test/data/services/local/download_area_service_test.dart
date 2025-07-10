import 'package:breizh_blok_mobile/data/data_sources/api/api_client.dart';
import 'package:breizh_blok_mobile/data/data_sources/local/app_database.dart';
import 'package:breizh_blok_mobile/data/data_sources/local/model/image_boulder_cache.dart';
import 'package:breizh_blok_mobile/data/services/local/download_area_service.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder_area/boulder_area.dart';
import 'package:breizh_blok_mobile/domain/entities/location/location.dart';
import 'package:breizh_blok_mobile/domain/entities/municipality/municipality.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<ImageBoulderCache>(), MockSpec<CacheManager>()])
import './download_area_service_test.mocks.dart';

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;

  var onRequest = (String requestUrl) {
    return '{}';
  };

  String onRequestOriginal(String requestUrl) {
    return '{}';
  }

  final mockClient = MockClient((request) async {
    final requestUrl = request.url.toString();
    final response = onRequest(requestUrl);

    return http.Response(
      response,
      200,
      request: request,
      headers: {'content-type': 'application/json'},
    );
  });
  final database = AppDatabase(NativeDatabase.memory());
  final httpClient = ApiClient(database: database, httpClient: mockClient);

  const boulderArea = BoulderArea(
    iri: '/boulder_areas/3',
    name: 'foo',
    municipality: Municipality(
      iri: '/bar',
      name: 'bar',
      centroid: Location(latitude: 0, longitude: 0),
    ),
  );

  setUp(() {
    onRequest = onRequestOriginal;
  });

  test('download then remove download', () async {
    const mockResponseBoulders = '''
{
  "filterUrl": "/media/cache/resolve/%filter%/uploads/ima/image-foo.jpg",
  "filterUrl": "/media/cache/resolve/%filter%/uploads/ima/image-bar.jpg"
}''';
    onRequest = (String requestUrl) {
      if (requestUrl.contains('/boulders?')) {
        return mockResponseBoulders;
      }
      return '{}';
    };

    final imageBoulderCache = MockImageBoulderCache();
    final mockCacheManager = MockCacheManager();

    when(mockCacheManager.getSingleFile(any)).thenThrow(Exception());
    when(mockCacheManager.removeFile(any)).thenThrow(Exception());
    when(imageBoulderCache.cache).thenReturn(mockCacheManager);

    final downloadAreaService = DownloadAreaService(
      database: database,
      httpClient: httpClient,
      imageBoulderCache: imageBoulderCache,
    );

    final storedRequestsBeforeDownloading =
        await database.select(database.dbRequests).get();
    expect(storedRequestsBeforeDownloading.length, equals(0));

    final storedBoulderAreasBeforeDownloading =
        await database.select(database.dbBoulderAreas).get();
    expect(storedBoulderAreasBeforeDownloading.length, equals(0));

    // download
    await downloadAreaService.download(
      const BoulderArea(
        iri: '/boulder_areas/3',
        name: 'foo',
        municipality: Municipality(
          iri: '/bar',
          name: 'bar',
          centroid: Location(latitude: 0, longitude: 0),
        ),
      ),
    );

    final storedRequests = await database.select(database.dbRequests).get();

    const expectedBouldersRequestPath =
        '/boulders?groups%5B%5D=Boulder%3Aitem-get&groups%5B%5D=Boulder%3Aread&groups%5B%5D=read&order%5Bid%5D=desc&pagination=false&rock.boulderArea.id%5B%5D=3';
    const expectedGradesRequestPath =
        '/grades?exists%5Bboulders%5D=true&order%5Bname%5D=asc&pagination=false';
    expect(storedRequests.length, equals(3));
    expect(storedRequests, [
      const DbRequest(
        requestPath: expectedBouldersRequestPath,
        responseBody: mockResponseBoulders,
      ),
      DbRequest(requestPath: boulderArea.iri, responseBody: '{}'),
      const DbRequest(
        requestPath: expectedGradesRequestPath,
        responseBody: '{}',
      ),
    ]);

    final storedBoulderAreas =
        await database.select(database.dbBoulderAreas).get();
    expect(storedBoulderAreas.length, equals(1));
    final mockDate = DateTime.now();
    expect(storedBoulderAreas.map((e) => e.copyWith(downloadedAt: mockDate)), [
      DbBoulderArea(
        iri: boulderArea.iri,
        downloadProgress: 100,
        boulders: expectedBouldersRequestPath,
        downloadedAt: mockDate,
      ),
    ]);

    verify(
      mockCacheManager.getSingleFile(
        argThat(
          endsWith('/media/cache/resolve/scale_md/uploads/ima/image-foo.jpg'),
        ),
      ),
    ).called(1);

    verify(
      mockCacheManager.getSingleFile(
        argThat(
          endsWith('/media/cache/resolve/scale_md/uploads/ima/image-bar.jpg'),
        ),
      ),
    ).called(1);

    // remove download
    await downloadAreaService.removeDownload(boulderArea.iri);
    final storedBoulderAreasAfterRemovingDownload =
        await database.select(database.dbBoulderAreas).get();
    expect(storedBoulderAreasAfterRemovingDownload.length, equals(0));
    final storedRequetsAfterRemovingDownload =
        await database.select(database.dbRequests).get();
    expect(storedRequetsAfterRemovingDownload.length, equals(1));

    expect(storedRequetsAfterRemovingDownload, [
      const DbRequest(
        requestPath: expectedGradesRequestPath,
        responseBody: '{}',
      ),
    ]);

    verify(
      mockCacheManager.removeFile(
        argThat(
          endsWith('/media/cache/resolve/scale_md/uploads/ima/image-foo.jpg'),
        ),
      ),
    ).called(1);

    verify(
      mockCacheManager.removeFile(
        argThat(
          endsWith('/media/cache/resolve/scale_md/uploads/ima/image-bar.jpg'),
        ),
      ),
    ).called(1);
  });

  test('regexp image', () {
    final matches = DownloadAreaService.regexpImage.allMatches(r'''
"filePath": "image-foo.jpg",
            "filterUrl": "\/media\/resolve\/%filter%\/uploads\/ima\/image-foo.jpg",
''');
    expect(matches.length, 0);

    final matches2 = DownloadAreaService.regexpImage.allMatches(r'''
"filePath": "image-foo.jpg",
            "filterUrl": "\/media\/cache\/resolve\/%filter%\/uploads\/ima\/image-foo.jpg",
''');
    expect(matches2.length, 1);
    expect(
      matches2.elementAt(0).group(1),
      r'\/media\/cache\/resolve\/%filter%\/uploads\/ima\/image-foo.jpg',
    );

    final matches3 = DownloadAreaService.regexpImage.allMatches('''
"filePath": "image-foo.jpg",
            "filterUrl": "/media/cache/resolve/%filter%/uploads/ima/image-foo.jpg",
''');
    expect(matches3.length, 1);
    expect(
      matches3.elementAt(0).group(1),
      '/media/cache/resolve/%filter%/uploads/ima/image-foo.jpg',
    );
  });

  test('extractImages', () {
    final downloadAreaService = DownloadAreaService(
      database: database,
      httpClient: httpClient,
      imageBoulderCache: MockImageBoulderCache(),
    );
    final images = downloadAreaService.extractImages(r'''
"filePath": "image-foo.jpg",
            "filterUrl": "\/media\/cache\/resolve\/%filter%\/uploads\/ima\/image-foo.jpg",
            "filterUrl": "\/media\/cache\/resolve\/%filter%\/uploads\/ima\/image-foo.jpg",
            "filterUrl": "/media/cache/resolve/%filter%/uploads/ima/image-foo.jpg",
            "filterUrl": "\/media\/cache\/resolve\/%filter%\/uploads\/ima\/image-bar.jpg",
            "filterUrl": "\/media\/cache\/resolve\/%filter%\/uploads\/ima\/image-baz.jpg",
''');
    expect(images, {
      '/media/cache/resolve/scale_md/uploads/ima/image-foo.jpg',
      '/media/cache/resolve/scale_md/uploads/ima/image-bar.jpg',
      '/media/cache/resolve/scale_md/uploads/ima/image-baz.jpg',
    });
  });
}
