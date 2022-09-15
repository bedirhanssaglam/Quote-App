import 'package:bloc/bloc.dart';
import 'package:bloc_pattern/view/quotes/models/quote_model.dart';
import 'package:bloc_pattern/view/quotes/repository/quote_repository.dart';
import 'package:equatable/equatable.dart';

part 'quote_event.dart';
part 'quote_state.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  QuoteBloc() : super(QuoteInitial()) {
    final QuotesRepository quotesRepository = QuotesRepository();

    on<FetchQuotes>((event, emit) async {
      emit(QuoteLoading());
      try {
        var response = await quotesRepository.getAllQuotes();
        emit(QuoteLoaded(response));
      } catch (e) {
        emit(QuoteError(e.toString()));
      }
    });
  }
}
