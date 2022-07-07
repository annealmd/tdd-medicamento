import '../../domain/repositories/i_delete_medicine_repository.dart';
import '../datasources/i_delete_medicine_data_source.dart';

class DeleteMedicineRepositoryIpml implements IDeleteMedicineRepository {
  final IDeleteMedicineDatasource deleteDatasource;

  DeleteMedicineRepositoryIpml({required this.deleteDatasource});
  @override
  Future<bool> call({required int id}) {
    return deleteDatasource(id: id);
  }
}
