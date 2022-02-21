class Post {
  Post({
    
    this.username,
    this.email,
    
  });

  
  final String? username;
  
  final String? email;

  factory Post.fromJson(Map<String, String> json) {
       return Post( username: json["username"],
        email: json["email"],
      );
}}