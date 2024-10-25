import 'package:floor/floor.dart';

@dao
abstract class BaseDao<T> {
  @Insert(onConflict: OnConflictStrategy.fail)
  Future<int> create(T entity);

  @Update(onConflict: OnConflictStrategy.fail)
  Future<int> update(T entity);

  @transaction
  Future<int> createOrUpdate(T entity) async {
    try {
      return await create(entity);
    } catch (_) {
      return await update(entity);
    }
  }
}
