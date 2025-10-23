import 'package:graphql/client.dart';

class GraphQLService {
  late GraphQLClient client;

  String baseUrl = 'https://379923-7e.myshopify.com/api/2024-10/graphql.json';
  GraphQLService() {
    HttpLink link = HttpLink(baseUrl, defaultHeaders: {
      'X-Shopify-Storefront-Access-Token':
      'd885c1c7722a638ec9c2703288b0c90f',
    });

    client = GraphQLClient(
      link: link,
      queryRequestTimeout: Duration(seconds: 15),
      cache: GraphQLCache(),
      defaultPolicies: DefaultPolicies(
        query: Policies(
          cacheReread: CacheRereadPolicy.ignoreAll,
          fetch: FetchPolicy.noCache,
        ),
      ),
    );
  }

  void recheckBaseUrl() {
    HttpLink link = HttpLink(baseUrl, defaultHeaders: {
      'X-Shopify-Storefront-Access-Token':
      '',
    });

    client = GraphQLClient(
      link: link,
      cache: GraphQLCache(),
      queryRequestTimeout: Duration(seconds: 15),
      defaultPolicies: DefaultPolicies(
        query: Policies(
          cacheReread: CacheRereadPolicy.ignoreAll,
          fetch: FetchPolicy.noCache,
        ),
      ),
    );
  }

  Future<QueryResult> performQuery(String query) async {
    recheckBaseUrl();

    QueryOptions options = QueryOptions(
      document: gql(query),
    );

    late QueryResult result;
    try {
      result = await client.query(options);
    } on GraphQLError catch (_) {
      rethrow;
    }
    return result;
  }

  Future<QueryResult> performQueryWithParams(
      {required String query, required Map<String, dynamic> params}) async {
    recheckBaseUrl();
    QueryOptions options =
    QueryOptions(document: gql(query), variables: params);

    late QueryResult result;
    try {
      result = await client.query(options);
      print(result);
    } on GraphQLError catch (e) {
      if (e.message == 'No Internet') {
        throw NetworkException(originalException: 'No Internet', uri: Uri());
      }
      rethrow;
    }

    return result;
  }

  Future<QueryResult> performMutation(String query,
      {Map<String, dynamic>? variables}) async {
    recheckBaseUrl();
    MutationOptions options =
    MutationOptions(document: gql(query), variables: variables!);

    final result = await client.mutate(options);

    return result;
  }
}
