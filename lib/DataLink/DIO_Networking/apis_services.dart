import 'package:dio/dio.dart';

import 'network_client.dart';

class ApiService {
  final NetworkClient networkClient;

  ApiService({required this.networkClient});

  ///Register
  // Future<Response> registerUser(Map<String, Object> params) {
  //   return networkClient.post('api/auth/register', params);
  // }

  ///LogIn
  Future<Response> loginUser(Map<String, Object> params) {
    print('login method api loginUser             ========================login service in api service');
    return networkClient.post('api/login', params);
  }
  ///NEW INVENTORY
  Future<Response> newinventory(Map<String, Object> params) {
    print('login method api loginUser             ========================login service in api service');
    return networkClient.post('api/inventory', params);
  }
  ///LogIn
/*  Future<Response> logoutUser() {

    return networkClient.post('api/auth/Logout', {});
  }*/
  // api/auth/password/update/190
  ///Update User Profile
  Future<Response> getCompleteInventoryData() {
    return networkClient.get('api/inventory/all',{});
  }
  Future<Response> requirementsInventoryData() {
    return networkClient.get('api/inventory/all',{});
  }
  Future<Response> affilateddealersInventoryData() {
    return networkClient.get('api/inventory/all',{});
  }
  Future<Response> profileData() {
    return networkClient.get('api/user',{});
  }
  Future<Response> Logout() {
    return networkClient.post('api/logout',{});
  }
  Future<Response> updateinventory(Inventoryid,Map<String, Object> params) {
    print("update inventory api service-----------${Inventoryid}");
    return networkClient.post('api/edit_inventory/${Inventoryid}',params);
  }
  ///Update  Password
  // Future<Response> updatePassword(Map<String, Object> params) {
  //   return networkClient.post(
  //       'api/auth/password/update/${AppConstant.getUserId}', params);
  // }

  ///forgot Password
  Future<Response> forgotPasswordWithPassword(Map<String, Object> params) {
    return networkClient.forGotPassword('api/auth/password/email', params);
  }

  ///PostReview
  Future<Response> postReview(Map<String, Object> params) {
    return networkClient.post('api/store_reviews', params);
  }

  ///makeAnOffer
  Future<Response> makeAnOffer(Map<String, Object> params) {
    return networkClient.post('api/offer', params);
  }

  ///############################### USER ###################################

  ///get Home User Dictionary Data
  Future<Response> getHomeUserDictionaryData() {
    return networkClient.get('v1/68c94735-44f0-4d32-b5f1-49d21311cf6d', {});
  }

  ///get Categories Listing vendor data
  Future<Response> getCategoriesListingVendorData() {
    return networkClient.get('v1/ed177f5c-97b1-4475-89b5-965bbe0c6262', {});
  }

  ///get Categories Listing  data
  Future<Response> getUserListingData() {
    return networkClient.get('v1/f6d33e87-f745-4348-aec8-19a38a8157fd', {});
  }

  ///get Categories Show Case  data
  Future<Response> getUserShowCaseData() {
    return networkClient.get('v1/2f7cbd24-bedd-4f92-bff3-9eb05928e67c', {});
  }

  ///get  order  data
  Future<Response> getUserOrderData() {
    return networkClient.get('v1/1f127461-55c1-4cfa-92c3-8c3c6c45699d', {});
  }

  ///get  order  data
  Future<Response> getPlaceOrderListData() {
    return networkClient.get('v1/c8612022-e614-42b2-a0b7-20bae105ed8e', {});
  }

  ///get  Showcase  data
  Future<Response> getShowCaseListData() {
    return networkClient.get('v1/1098ebab-a21e-4d73-9366-da04449b333f', {});
  }

  ///get  Showcase  data
  Future<Response> getProfileData() {
    return networkClient.get('v1/5331b1bf-dc32-4063-b189-a7e102847e02', {});
  }

  ///##################################################################
  /// MyAdverts show only my post
  // Future<Response> myAdverts() {
  //   return networkClient.get('api/my_posts/${AppConstant.getUserId}', {});
  // }

  ///post video with post id
  Future<Response> postMyVideoWithPostId(var params) {
    return networkClient.addNewPost('api/posts/store_vedio', params);
  }

  /// for add new post
  Future<Response> postNewAdd(var params) {
    return networkClient.addNewPost(
      'api/posts',
      params,
    );
  }

  ///getMyVideoWithPostId
  // Future<Response> getVideoWithPostId({required String postId}) {
  //   print("this is apis post id ${AppConstant.postId}");
  //   return networkClient.get('api/posts/post_videos/${postId}', {});
  // }
  ///getMy All Reviews on my all posts
  // Future<Response> getMyAllPostReviews({required String userId}) {
  //   // AppConstant.appPostUserId;
  //   return networkClient.get('api/mypostreviews/${AppConstant.appPostUserId}', {});
  // }
  ///get Total Rating on My All Post
  Future<Response> getMyAllPostReviewsRating({required String userId}) {
    // AppConstant.appPostUserId;
    return networkClient.get('api/user_reviews/${userId}', {});
  }

  ///  product owner  details
  Future<Response> viewProfile({required String userId}) {
    return networkClient.get('api/auth/profile/${userId}', {});
  }

  ///getReview and rating only specific post
  Future<Response> getReviewWithPostId({required String postId}) {
    return networkClient.get('api/reviews/${postId}', {});
  }

  /// Post Message
  Future<Response> postMessage(Map<String, Object> params) {
    print("this is value ${params.toString()}");
    return networkClient.post('api/threads/latest_thread', params);
  }

  /// Post Message
  Future<Response> signInWithGoogle(Map<String, Object> params) {
    print("this is value ${params.toString()}");
    return networkClient.post('api/google_login', params);
  }

  ///Get Category
  Future<Response> getCategory() {
    return networkClient.get('api/categories', {});
  }

  /// getHomeScreen  Category and find data through id
  Future<Response> getDataOnCategory({required final name}) {
    return networkClient.get('api/posts/find/$name', {});
  }

  /// getHomeScreen  Category and find data through id
  Future<Response> getSubCategory({required final name}) {
    return networkClient
        .get('api/categories?embed=children&parentId=$name', {});
  }

  ///get Message
  // Future<Response> getMessages({required String recieverId}) {
  //   print("get message");
  //   return networkClient.get(
  //       'api/threads/get_mychat/${AppConstant.getUserId}/${recieverId}', {});
  // }

  // api/threads/get_sms/190
  ///get Message
  Future<Response> getInboxUsers({required String userId}) {
    print("get message");
    return networkClient.get('api/threads/get_sms/${userId}', {});
  }

  ///Get Item Details through Id
  Future<Response> getItemDetail({required final id}) {
    return networkClient.get('/api/posts/$id', {});
  }

  ///LogOut
  // Future<Response> logout() {
  //   return networkClient.get('api/auth/logout/${AppConstant.getUserId}', {});
  // }

  /// current user details already login
  // Future<Response> userProfile() {
  //   return networkClient.get('api/auth/profile/${AppConstant.getUserId}', {});
  // }

  /// Get packages data
  Future<Response> getPackages() {
    return networkClient.get('api/packages', {});
  }

  /// for remove my favorite post
  Future<Response> removeMyFavorite({required String postId}) {
    return networkClient.post('api/remove-fav/${postId}', {});
  }

  /// for delete all my favorite post
  // Future<Response> deleteMyAllFavoritePost() {
  //   return networkClient.post('api/delfav/${AppConstant.getUserId}', {});
  // }

  /// add to favorite
  Future<Response> addToFavorite(Map<String, Object> params) {
    return networkClient.post('api/add_fav', params);
  }

  /// saved post
  // Future<Response> getMyFavorite() {
  //   return networkClient.get('api/get-fav/${AppConstant.getUserId}', {});
  // }

  /// google signIn
  Future<Response> googleSignin() {
    return networkClient.get('auth/google', {});
  }
}
