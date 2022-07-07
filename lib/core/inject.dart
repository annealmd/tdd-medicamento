import '../external/datasources/local/sql/read_medicine_sql.dart';
import '../external/datasources/local/sql/update_medicine_sql.dart';
import '../features/medicine/data/datasources/i_count_medicine_data_source.dart';
import '../features/medicine/data/datasources/i_create_medicine_data_source.dart';
import '../features/medicine/data/datasources/i_read_medicine_datasource.dart';
import '../features/medicine/data/datasources/i_update_medicine_data_source.dart';
import '../features/medicine/data/repositories/add_medicine_repository_ipml.dart';
import '../features/medicine/domain/repositories/i_add_medicine_repository.dart';
import '../features/medicine/domain/usecases/add_medicine_usecase.dart';
import '../features/medicine/presentation/controllers/bloc/add_medicine_bloc.dart';
import 'package:get_it/get_it.dart';

import '../external/datasources/local/sql/count_medicine_sql.dart';
import '../external/datasources/local/sql/create_medicine_sql.dart';
import '../external/datasources/local/sql/delete_medicine_sql.dart';
import '../features/medicine/data/datasources/i_delete_medicine_data_source.dart';
import '../features/medicine/data/repositories/delete_medicine_repository_ipml.dart';
import '../features/medicine/data/repositories/edit_medicine_repository_ipml.dart';
import '../features/medicine/data/repositories/list_medicine_repository_ipml.dart';
import '../features/medicine/domain/repositories/i_delete_medicine_repository.dart';
import '../features/medicine/domain/repositories/i_edit_medicine_repository.dart';
import '../features/medicine/domain/repositories/i_list_medicine_repository.dart';
import '../features/medicine/domain/usecases/delete_medicine_usecase.dart';
import '../features/medicine/domain/usecases/edit_medicine_usecase.dart';
import '../features/medicine/domain/usecases/list_medicine_usecase.dart';
import '../features/medicine/presentation/controllers/bloc/delete_medicine_bloc.dart';
import '../features/medicine/presentation/controllers/bloc/edit_medicine_bloc.dart';
import '../features/medicine/presentation/controllers/bloc/list_medicine_bloc.dart';

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
