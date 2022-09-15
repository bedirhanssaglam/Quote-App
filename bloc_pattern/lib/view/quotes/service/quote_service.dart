import 'package:vexana/vexana.dart';
import 'package:bloc_pattern/core/constants/app_constants.dart';
import 'package:bloc_pattern/view/quotes/models/quote_model.dart';

abstract class IQuoteService {
  final INetworkManager networkManager;

  IQuoteService(this.networkManager);

  Future<QuoteModel> getAllQuotes();
}

class QuoteService extends IQuoteService {
  QuoteService(INetworkManager networkManager) : super(networkManager);

  @override
  Future<QuoteModel> getAllQuotes() async {
    var response = await networkManager.send(
      AppConstants.baseUrl,
      parseModel: QuoteModel(),
      method: RequestType.GET,
    );
    return response.data;
  }
}
