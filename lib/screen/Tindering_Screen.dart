import 'package:dattingapp_flutter/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../res/services/api_service.dart';
import '../res/models/user.dart';

class TinderingScreen extends StatefulWidget {
  @override
  _TinderingScreenState createState() => _TinderingScreenState();
}

class _TinderingScreenState extends State<TinderingScreen> {
  final ApiService _apiService = ApiService();
  User? _user;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchUser();
  }

  Future<void> _fetchUser() async {
    try {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final data = await _apiService.fetchUser(authProvider.token!);
      setState(() {
        _user = data;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  void _handleDislike() {
    // Add your dislike handling logic here
    print("User disliked");
    // Fetch a new user after dislike
    _fetchUser();
  }

  void _handleLike() {
    // Add your like handling logic here
    print("User liked");
    // Fetch a new user after like
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    _apiService.createChat(_user!.id, authProvider.token!);
    _fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top bar with icons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.person),
                    onPressed: () {
                      Navigator.pushNamed(context, '/profile');
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.local_fire_department),
                    color: Colors.red,
                    onPressed: () {
                      // Handle flame button press
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.message),
                    onPressed: () {
                      Navigator.pushNamed(context, '/chat');
                    },
                  ),
                ],
              ),
            ),
            // Profile picture and details
            Expanded(
              child: Center(
                child: _isLoading
                    ? CircularProgressIndicator()
                    : _error != null
                        ? Text('Error: $_error')
                        : _user != null
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    height: MediaQuery.of(context).size.width * 0.8,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      image: DecorationImage(
                                        image: NetworkImage(_user!.profileUrl),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    '${_user!.name}, 24',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('Photographer'), // Adjust as needed
                                ],
                              )
                            : Text('No user data available'),
              ),
            ),
            // Action buttons
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(Icons.close, color: Colors.red, size: 40),
                    onPressed: _handleDislike,
                  ),
                  IconButton(
                    icon: Icon(Icons.star, color: Colors.blue, size: 40),
                    onPressed: () {
                      // Handle super like button press
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.favorite, color: Colors.green, size: 40),
                    onPressed: _handleLike,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}