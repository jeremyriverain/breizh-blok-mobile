import 'package:bloc_test/bloc_test.dart';
import 'package:breizh_blok_mobile/app_http_client.dart';
import 'package:breizh_blok_mobile/blocs/boulder_bloc.dart';
import 'package:breizh_blok_mobile/repositories/boulder_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<AppHttpClient>()])
import './boulder_bloc_test.mocks.dart';

void main() {
  final mockHttpClient = MockAppHttpClient();

  group('BoulderBloc', () {
    blocTest<BoulderBloc, BoulderState>(
      'default state OK',
      setUp: () {
        reset(mockHttpClient);
      },
      build: () => BoulderBloc(
        repository: BoulderRepository(httpClient: mockHttpClient),
      ),
      act: (BoulderBloc bloc) => bloc.add(
        DbBouldersRequested(
          queryParams: {
            'rock.boulderArea.id[]': [
              '3',
            ],
            'order[id]': ['desc'],
            'pagination': ['false'],
          },
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
            '/boulders?order%5Bid%5D=desc&pagination=false&rock.boulderArea.id%5B%5D=3',
          ),
        );
      },
    );
  });
}
