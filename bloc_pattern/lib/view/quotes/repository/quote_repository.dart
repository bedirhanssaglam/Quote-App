import 'package:bloc_pattern/core/init/network/vexana_manager.dart';
import 'package:bloc_pattern/view/quotes/models/quote_model.dart';
import 'package:bloc_pattern/view/quotes/service/quote_service.dart';

class QuotesRepository {
  final quoteService = QuoteService(VexanaManager());

  Future<QuoteModel> getAllQuotes() {
    return quoteService.getAllQuotes();
  }
}
