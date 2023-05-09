import 'package:flutter/material.dart';

class Observer<T> extends StatelessWidget {
  @required
  final Stream<T> stream;
  final Function onError;
  final Function onWaiting;

  @required
  final Function onSuccess;

  Observer(
      {required this.onError,
      required this.onSuccess,
      required this.stream,
      required this.onWaiting});

  Function _defaultOnWaiting =
      (context) => Center(child: CircularProgressIndicator());

  Function get _defaultOnError =>
      (context, error) => Center(child: Text("Error"));

  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: stream,
        builder: (context, AsyncSnapshot<T> snapshot) {
          if (snapshot.hasError) {
            return (onError != null)
                ? onError(context, snapshot.error)
                : _defaultOnError(context, snapshot.error);
          }
          if (snapshot.hasData) {
            T data = snapshot.data!;
            return onSuccess(context, data);
          } else {
            if (onWaiting != null) {
              return onWaiting(context);
            } else {
              return _defaultOnWaiting(context);
            }
          }
        });
  }
}
