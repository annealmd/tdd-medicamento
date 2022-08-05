import 'package:get_it/get_it.dart';
import '../external/datasources/local/sql/sql.dart';
import '../features/medicine/data/datasources/i_data_sources.dart';
import '../features/medicine/data/repositories/repositories.dart';
import '../features/medicine/domain/repositories/i_repositories.dart';
import '../features/medicine/domain/usecases/usecases.dart';
import '../features/medicine/presentation/controllers/bloc/bloc.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

    // datasource sql
    getIt.registerLazySingleton<ICountMedicineDatasource>(
        () => CountMedicineSql());
    getIt.registerLazySingleton<ICreateMedicineDatasource>(
        () => CreateMedicineSql());
    getIt.registerLazySingleton<IReadMedicineDatasource>(
        () => ReadMedicineSql());
    getIt.registerLazySingleton<IUpdateMedicineDatasource>(
        () => UpdateMedicineSql());
    getIt.registerLazySingleton<IDeleteMedicineDatasource>(
        () => DeleteMedicineSql());

    //repository
    getIt.registerLazySingleton<IAddMedicineRepository>(
        () => AddMedicineRepositoryIpml(createDatasource: getIt()));
    getIt.registerLazySingleton<IListMedicineRepository>(
        () => ListMedicineRepositoryIpml(readDatasource: getIt()));
    getIt.registerLazySingleton<IEditMedicineRepository>(
        () => EditMedicineRepositoryIpml(updateDatasource: getIt()));
    getIt.registerLazySingleton<IDeleteMedicineRepository>(
        () => DeleteMedicineRepositoryIpml(deleteDatasource: getIt()));
    //usecases
    getIt.registerLazySingleton<IAddMedicineUsecase>(
        () => AddMedicineUsecase(addRepository: getIt()));
    getIt.registerLazySingleton<IListMedicineUsecase>(
        () => ListMedicineUsecase(listRepository: getIt()));
    getIt.registerLazySingleton<IEditMedicineUsecase>(
        () => EditMedicineUsecase(editRepository: getIt()));
    getIt.registerLazySingleton<IDeleteMedicineUsecase>(
        () => DeleteMedicineUsecase(deleteRepository: getIt()));

    //controllers BlOc
    getIt.registerLazySingleton<AddMedicineBloc>(
        () => AddMedicineBloc(addUsecase: getIt()));
    getIt.registerLazySingleton<ListMedicineBloc>(
        () => ListMedicineBloc(listUsecase: getIt()));
    getIt.registerLazySingleton<EditMedicineBloc>(
        () => EditMedicineBloc(editUsecase: getIt()));
    getIt.registerLazySingleton<DeleteMedicineBloc>(
        () => DeleteMedicineBloc(deleteUsecase: getIt()));
  }
}
