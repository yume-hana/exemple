import 'package:flutter/material.dart';
import '../services/connectWithAPI.dart';
import '../services/urls/urlSignup.dart';
import '../app_state.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  // دالة لإنشاء TextFormField مع ظل داخلي وخارجي
  Widget field(
    TextEditingController controller,
    String label, {
    bool obscure = false,
    IconData? icon,
  }) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Color(0xFFCDDEF2), // لون الخلفية
        borderRadius: BorderRadius.circular(5),
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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'هذا الحقل مطلوب';
          }
          if (!obscure && !value.contains('@')) {
            return 'يرجى إدخال بريد إلكتروني صحيح';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.blue[900]),
          suffixIcon: Icon(
            icon ?? (obscure ? Icons.lock : Icons.email),
            color: Color.fromARGB(255, 78, 143, 233),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }

  login() async {
    if (formState.currentState!.validate()) {
      var responsebody = await postRequestServies(loginUrl, {
        "email": email.text,
        "password": password.text,
      });

      print("Flutter received: $responsebody");

      if (responsebody["state"] == "success") {
        AppState.userId = responsebody["data"]["user_id"];
        AppState.username = responsebody["data"]["username"];

        print("USER ID = ${AppState.userId}");

        Navigator.of(context).pushNamedAndRemoveUntil("home", (Route) => false);
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
                      "Login",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                      ),
                    ),
                    const SizedBox(height: 20),
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
                          await login();
                        },
                        padding: EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 24,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // رابط للذهاب لصفحة التسجيل
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize:
                          MainAxisSize.min, // مهم باش يتقيد بالعرض الطبيعي
                      children: [
                        Flexible(
                          child: Text(
                            "ليس لديك حساب؟ ",
                            style: TextStyle(
                              color: Colors.blue[900],
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed("signup");
                          },
                          child: Text(
                            "سجل الآن",
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
