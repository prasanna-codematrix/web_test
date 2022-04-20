import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQl {
  ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
          link: HttpLink('https://api.letsweebl.com/'),
          cache: GraphQLCache(store: HiveStore())));

  query(String queryDoc) async {
    QueryResult result = await client.value.queryManager.query(QueryOptions(
        document: gql(queryDoc), fetchPolicy: FetchPolicy.networkOnly));
    return result;
  }
}
