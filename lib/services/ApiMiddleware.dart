import 'dart:async';
import 'package:dio/dio.dart';
import 'package:redux/redux.dart';
import 'package:wait4me/models/app_state.dart';

// class ApiMiddleware implements MiddlewareClass<AppState> {
//   final GithubApi api;

//   ApiMiddleware(this.api);

//   @override
void apiMiddleware(Store<AppState> store, dynamic action, NextDispatcher next) {
  Timer? _timer;
  CancelToken? _token;
  // if (action is ) {
  // Stop our previous debounce timer and search.

  _timer!.cancel();
  _token!.cancel("cancelled");

  // Don't start searching until the user pauses for 250ms. This will stop
  // us from over-fetching from our backend.
  _timer = new Timer(new Duration(milliseconds: 250), () {
    // store.dispatch(SearchLoadingAction());

    // Instead of a simple Future, we'll use a CancellableOperation from the
    // `async` package. This will allow us to cancel the previous operation
    // if a new Search term comes in. This will prevent us from
    // accidentally showing stale results.
    _token = new CancelToken();
    // api.search(action, _token)
    //     .then((result) => store..dispatch(SearchResultAction(result)))
    //     .catchError((e, s) => store..dispatch(SearchErrorAction()));;
//        _operation = CancelableOperation.fromFuture(api
//            .search(action.term)
//            .then((result) => store..dispatch(SearchResultAction(result)))
//            .catchError((e, s) => store..dispatch(SearchErrorAction())));
  });
  // }

  // Make sure to forward actions to the next middleware in the chain!
  next(action);
}
// }