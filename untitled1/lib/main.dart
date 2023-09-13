import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  int _currentIndex = 0; // Màn hiện tại

  final List<Widget> _screens = [
    LoginPage(),
    HomePage(),
    ProductPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: _screens[_currentIndex], // Hiển thị màn tương ứng
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.login),
              label: 'Đăng nhập',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Trang chủ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Sản phẩm',
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index; // chuyển maàn
            });
          },
        ),
      ),
    );
  }
}
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trang chủ'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Nội dung của Trang chủ'),
      ),
    );
  }
}

class ProductPage extends StatelessWidget {
  final List<Product> products = [
    Product('1', 'assets/anh1.png'),
    Product('2', 'assets/anh2.jpg'),
    Product('3', 'assets/anh3.jpg'),
    Product('4', 'assets/anh2.jpg'),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sản phẩm'),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return ProductItem(product: products[index]);
        },
      ),
    );
  }
}

class Product {
  final String name;
  final String imageUrl;

  Product(this.name, this.imageUrl);
}

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Image.asset(
            product.imageUrl,
            width: 70,
            height: 70,
          ),
          SizedBox(height: 1),
          Text(
            product.name,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đăng nhập'),
        centerTitle: true,
      ),
      body: Center(
        child: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Container(
        width: 250.0,
        height: 300.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/anh1.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.75),
              BlendMode.dstATop,
            ),
          ),
          borderRadius: BorderRadius.circular(10.0), // Bo góc của khung
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: _emailController,
                style: TextStyle(color: Colors.yellow),
                decoration: InputDecoration(
                  labelText: 'Email',
                  focusedBorder: UnderlineInputBorder(

                    borderSide: BorderSide(color: Colors.yellow),
                  ),

                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Mật khẩu'),
                obscureText: true,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Xử lý đăng nhập
                final email = _emailController.text;
                final password = _passwordController.text;
                // kiểm tra đăng nhập
              },
              child: Text('Đăng nhập'),
            ),
          ],
        ),
      ),
    );
  }
}