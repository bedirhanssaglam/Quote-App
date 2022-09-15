part of 'quote_bloc.dart';

abstract class QuoteState extends Equatable {
  const QuoteState();
}

class QuoteInitial extends QuoteState {
  @override
  List<Object?> get props => [];
}

class QuoteLoading extends QuoteState {
  @override
  List<Object> get props => [];
}

class QuoteLoaded extends QuoteState {
  final QuoteModel quoteModel;

  const QuoteLoaded(this.quoteModel);

  @override
  List<Object> get props => [quoteModel];
}

class QuoteError extends QuoteState {
  final String message;

  const QuoteError(this.message);

  @override
  List<Object> get props => [];
}
