import 'package:flutter/material.dart';
import '../services/connectWithAPI.dart';
import '../services/urls/urlSignup.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  // دالة لإنشاء TextFormField مع ظل داخلي وخارجي
  Widget field(
    TextEditingController controller,
    String label, {
    bool obscure = false,
  }) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Color(0xFFCDDEF2), // لون الخلفية
        borderRadius: BorderRadius.circular((5)),
        boxShadow: [
          // Outer shadow
          BoxShadow(
            color: Color.fromARGB(65, 0, 0, 0),
            offset: Offset(4, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        style: TextStyle(fontSize: 16, color: Colors.black87),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.blue[900]),
          suffixIcon: Icon(
            obscure ? Icons.lock : Icons.person,
            color: Color.fromARGB(255, 78, 143, 233),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }

  signup() async {
    if (formState.currentState!.validate()) {
      var responsebody = await postRequestServies(signupUrl, {
        "username": username.text,
        "email": email.text,
        "password": password.text,
      });

      print("Flutter received: $responsebody"); // <--- هذا مهم

      if (responsebody["state"] == "success") {
        Navigator.of(context).pushNamedAndRemoveUntil("login", (Route) => false);
      } else {
        print("sign up is fail");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // الصورة كـ background
          SizedBox.expand(
            child: Image.asset("images/signupnote.jpg", fit: BoxFit.cover),
          ),
          // الفورم فوق الصورة
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: formState,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                      ),
                    ),
                    const SizedBox(height: 20),
                    field(username, "Username"),
                    const SizedBox(height: 16),
                    field(email, "Email"),
                    const SizedBox(height: 16),
                    field(password, "Password", obscure: true),
                    const SizedBox(height: 30),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xff95B7E4),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(65, 0, 0, 0),
                            offset: Offset(4, 4),
                            blurRadius: 4,
                          ),
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            offset: Offset(4, 4),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: MaterialButton(
                        onPressed: () async {
                          await signup();
                        },
                        padding: EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 24,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "لديك حساب بالفعل؟ ",
                          style: TextStyle(
                            color: Colors.blue[900],
                            fontSize: 16,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed("login");
                          },
                          child: Text(
                            "سجل الدخول",
                            style: TextStyle(
                              color: Colors.blue[700],
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
