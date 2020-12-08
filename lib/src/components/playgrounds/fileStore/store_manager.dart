import 'models/basic/store_object.dart';
import 'persistance/store.dart';

class addStoreObjectRoutes<T extends StoreObject> {
  Store<T> store;
/*
  //search
  app.post('/search/$name', (Request req) async {
    try {
      var body = await req.readAsString();
      var params = Uri.splitQueryString(body);
      var query = params['search'];
      var objects = (await store.getAllElements())
          .where((element) => (element as Searchable).match(query))
          .toList();
      return scaffold(
          body: '''<div class="my-2">${presenter.buildList(objects)}</div>''');
    } catch (e) {
      return Response.internalServerError(body: e.toString());
    }
  });*/
}
