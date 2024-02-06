import 'package:dangai_riverpod/domain/filter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'filter_provider.g.dart';

@riverpod
class FilterSetting extends _$FilterSetting {
  @override
  Filter build() {
    return Filter.all;
  }

  void setFilter(Filter filter) {
    state = filter;
  }
}
