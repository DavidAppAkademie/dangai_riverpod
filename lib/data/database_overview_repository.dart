import 'package:dangai_riverpod/data/mock/mock_database_overview_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'database_overview_repository.g.dart';

@Riverpod(keepAlive: true)
DatabaseOverviewRepository databaseOverviewRepository(
    DatabaseOverviewRepositoryRef ref) {
  return MockDatabaseOverviewRepository();
}

abstract class DatabaseOverviewRepository {
  Future<List<String>> getContent();
}
