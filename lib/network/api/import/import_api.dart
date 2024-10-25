import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:projeto_atividade/network/response/asset/asset_response.dart';
import 'package:projeto_atividade/network/response/locations/locations_response.dart';
import 'package:projeto_atividade/network/response/companies/companies_response.dart';

part 'import_api.g.dart';

@RestApi()
abstract class ImportApi {
  factory ImportApi(Dio dio) = _ImportApi;

  @GET('companies')
  Future<List<CompaniesResponse>> companies();

  @GET('companies/{company}/locations')
  Future<List<LocationsResponse>> locations(@Path('company') String company);

  @GET('companies/{company}/assets')
  Future<List<AssetResponse>> assets(@Path('company') String company);
}
