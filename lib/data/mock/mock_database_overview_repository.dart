import 'package:dangai_riverpod/data/database_overview_repository.dart';

class MockDatabaseOverviewRepository implements DatabaseOverviewRepository {
  MockDatabaseOverviewRepository();

  // Content functions
  @override
  Future<List<String>> getContent() async {
    // simulating slow connection (waiting 2 secs)
    await Future.delayed(const Duration(seconds: 2));
    // return database contents
    return ["asdasd"];
  }
}
