import 'package:flutter/material.dart';
import 'package:cobakuis/pages/home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isPasswordVisible = false;
  final Color primaryColor = const Color.fromARGB(255, 31, 55, 162);

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 254, 193, 219), 
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/truz.jpeg',
                        height: 200,
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: Color.fromARGB(221, 20, 12, 113),
                        ),
                      ),
                      const SizedBox(height: 30),

                      _buildUsernameField(),
                      const SizedBox(height: 15),

                      _buildPasswordField(),
                      const SizedBox(height: 25),

                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: _loginButton(context),
                      ),
                      const SizedBox(height: 15),
                      
                      Text(
                        "Forgot password?",
                        style: TextStyle(color: const Color.fromARGB(255, 64, 57, 118)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUsernameField() {
    return TextFormField(
      controller: _usernameController,
      style: const TextStyle(color: Color.fromARGB(221, 22, 27, 151)),
      validator: (value) {
        if (value == null || value.isEmpty) return 'Username tidak boleh kosong';
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person_outline, color: primaryColor),
        labelText: "Username",
        labelStyle: const TextStyle(color: Color.fromARGB(255, 153, 180, 244)),
        floatingLabelStyle: TextStyle(color: primaryColor),
        filled: true,
        fillColor: Colors.white.withOpacity(0.8),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color.fromARGB(255, 174, 219, 255)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: primaryColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color.fromARGB(255, 30, 43, 133)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color.fromARGB(255, 30, 43, 133), width: 2),
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: !_isPasswordVisible,
      validator: (value) {
        if (value == null || value.isEmpty) return 'Password tidak boleh kosong';
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock_outline, color: primaryColor),
        labelText: "Password",
        labelStyle: const TextStyle(color: Color.fromARGB(255, 153, 197, 244)),
        floatingLabelStyle: TextStyle(color: primaryColor),
        filled: true,
        fillColor: Colors.white.withOpacity(0.8),
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: const Color.fromARGB(255, 52, 31, 173),
          ),
          onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color.fromARGB(255, 174, 219, 255)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: primaryColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color.fromARGB(255, 30, 43, 133)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color.fromARGB(255, 30, 43, 133), width: 2),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        foregroundColor: Colors.white,
        backgroundColor: primaryColor,
      ),
      onPressed: _handleLogin,
      child: const Text("LOGIN", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      if (_usernameController.text == "Alfin" && _passwordController.text == "Alfin123") {
        _showSnackBar("Login Berhasil!", const Color.fromARGB(255, 0, 132, 255));
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
      } else {
        _showSnackBar("Login gagal, password atau username salah!", const Color.fromARGB(255, 255, 0, 102));
      }
    }
  }

  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        content: Text(message, textAlign: TextAlign.center),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(20),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}