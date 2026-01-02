// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:hive/hive.dart';
// import 'package:bin_buddy/core/constants/hive_table_constant.dart';

// import 'package:bin_buddy/features/batch/data/models/batch_hive_model.dart';

// import 'package:path_provider/path_provider.dart';

// final hiveServiceProvider = Provider<HiveService>((ref) {
//   return HiveService();
// });

// class HiveService {
//   // ======================= Initialization =======================
//   Future<void> init() async {
//     final directory = await getApplicationDocumentsDirectory();
//     final path = '${directory.path}/${HiveTableConstant.dbName}';
//     Hive.init(path);

//     _registerAdapters();
//     await _openBoxes();
//     await _insertDummyData();
//   }

//   void _registerAdapters() {
//     if (!Hive.isAdapterRegistered(HiveTableConstant.userTypeId)) {
//       Hive.registerAdapter(UserHiveModelAdapter());
//     }
//     if (!Hive.isAdapterRegistered(HiveTableConstant.batchTypeId)) {
//       Hive.registerAdapter(BatchHiveModelAdapter());
//     }
//     if (!Hive.isAdapterRegistered(HiveTableConstant.categoryTypeId)) {
//       Hive.registerAdapter(CategoryHiveModelAdapter());
//     }
//     if (!Hive.isAdapterRegistered(HiveTableConstant.recyclingProgressTypeId)) {
//       Hive.registerAdapter(RecyclingProgressHiveModelAdapter());
//     }
//   }

//   Future<void> _openBoxes() async {
//     await Hive.openBox<UserHiveModel>(HiveTableConstant.userTable);
//     await Hive.openBox<BatchHiveModel>(HiveTableConstant.batchTable);
//     await Hive.openBox<CategoryHiveModel>(HiveTableConstant.categoryTable);
//     await Hive.openBox<RecyclingProgressHiveModel>(
//       HiveTableConstant.recyclingProgressTable,
//     );
//   }

//   Future<void> _insertDummyData() async {
//     // Insert batches
//     final batchBox = Hive.box<BatchHiveModel>(HiveTableConstant.batchTable);
//     if (batchBox.isEmpty) {
//       final dummyBatches = [
//         BatchHiveModel(batchName: 'Bin A'),
//         BatchHiveModel(batchName: 'Bin B'),
//         BatchHiveModel(batchName: 'Bin C'),
//       ];
//       for (var batch in dummyBatches) {
//         await batchBox.put(batch.batchId, batch);
//       }
//     }

//     // Insert categories
//     final categoryBox = Hive.box<CategoryHiveModel>(
//       HiveTableConstant.categoryTable,
//     );
//     if (categoryBox.isEmpty) {
//       final categories = [
//         CategoryHiveModel(name: HiveTableConstant.plasticCategory),
//         CategoryHiveModel(name: HiveTableConstant.paperCategory),
//         CategoryHiveModel(name: HiveTableConstant.organicCategory),
//         CategoryHiveModel(name: HiveTableConstant.metalCategory),
//         CategoryHiveModel(name: HiveTableConstant.glassCategory),
//         CategoryHiveModel(name: HiveTableConstant.electronicsCategory),
//       ];
//       for (var cat in categories) {
//         await categoryBox.put(cat.categoryId, cat);
//       }
//     }
//   }

//   Future<void> close() async => await Hive.close();

//   // ======================= User Queries =======================
//   Box<UserHiveModel> get _userBox =>
//       Hive.box<UserHiveModel>(HiveTableConstant.userTable);

//   Future<UserHiveModel> createUser(UserHiveModel user) async {
//     await _userBox.put(user.userId, user);
//     return user;
//   }

//   UserHiveModel? getUserById(String userId) => _userBox.get(userId);

//   List<UserHiveModel> getAllUsers() => _userBox.values.toList();

//   Future<bool> updateUser(UserHiveModel user) async {
//     if (_userBox.containsKey(user.userId)) {
//       await _userBox.put(user.userId, user);
//       return true;
//     }
//     return false;
//   }

//   Future<void> deleteUser(String userId) async => await _userBox.delete(userId);

//   // ======================= Batch Queries =======================
//   Box<BatchHiveModel> get _batchBox =>
//       Hive.box<BatchHiveModel>(HiveTableConstant.batchTable);

//   Future<BatchHiveModel> createBatch(BatchHiveModel batch) async {
//     await _batchBox.put(batch.batchId, batch);
//     return batch;
//   }

//   BatchHiveModel? getBatchById(String batchId) => _batchBox.get(batchId);

//   List<BatchHiveModel> getAllBatches() => _batchBox.values.toList();

//   Future<bool> updateBatch(BatchHiveModel batch) async {
//     if (_batchBox.containsKey(batch.batchId)) {
//       await _batchBox.put(batch.batchId, batch);
//       return true;
//     }
//     return false;
//   }

//   Future<void> deleteBatch(String batchId) async =>
//       await _batchBox.delete(batchId);

//   // ======================= Category Queries =======================
//   Box<CategoryHiveModel> get _categoryBox =>
//       Hive.box<CategoryHiveModel>(HiveTableConstant.categoryTable);

//   Future<CategoryHiveModel> createCategory(CategoryHiveModel category) async {
//     await _categoryBox.put(category.categoryId, category);
//     return category;
//   }

//   CategoryHiveModel? getCategoryById(String categoryId) =>
//       _categoryBox.get(categoryId);

//   List<CategoryHiveModel> getAllCategories() => _categoryBox.values.toList();

//   Future<bool> updateCategory(CategoryHiveModel category) async {
//     if (_categoryBox.containsKey(category.categoryId)) {
//       await _categoryBox.put(category.categoryId, category);
//       return true;
//     }
//     return false;
//   }

//   Future<void> deleteCategory(String categoryId) async =>
//       await _categoryBox.delete(categoryId);

//   // ======================= Recycling Progress Queries =======================
//   Box<RecyclingProgressHiveModel> get _progressBox =>
//       Hive.box<RecyclingProgressHiveModel>(
//         HiveTableConstant.recyclingProgressTable,
//       );

//   Future<RecyclingProgressHiveModel> addProgress(
//     RecyclingProgressHiveModel progress,
//   ) async {
//     await _progressBox.put(progress.progressId, progress);
//     return progress;
//   }

//   List<RecyclingProgressHiveModel> getAllProgress() =>
//       _progressBox.values.toList();

//   RecyclingProgressHiveModel? getProgressById(String progressId) =>
//       _progressBox.get(progressId);

//   Future<bool> updateProgress(RecyclingProgressHiveModel progress) async {
//     if (_progressBox.containsKey(progress.progressId)) {
//       await _progressBox.put(progress.progressId, progress);
//       return true;
//     }
//     return false;
//   }

//   Future<void> deleteProgress(String progressId) async =>
//       await _progressBox.delete(progressId);
// }
