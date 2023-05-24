import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Muhammad Dzakyyuddin Badri - 6701213011'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  String? _selectedJenisKendaraan;
  String? _selectedDurasiPeminjaman;
  bool _keteranganSupir = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Nama:',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Masukkan nama',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Mohon masukkan nama';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Prodi:',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 8),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Masukkan prodi',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Mohon masukkan prodi';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Fakultas:',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 8),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Masukkan fakultas',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Mohon masukkan fakultas';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'Keperluan Peminjaman Kendaraan:',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Masukkan keperluan peminjaman kendaraan',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Mohon masukkan keperluan peminjaman kendaraan';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                Text(
                  'Jenis Kendaraan:',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RadioListTile(
                      title: Text('Avanza/Xenia'),
                      value: 'Avanza/Xenia',
                      groupValue: _selectedJenisKendaraan,
                      onChanged: (value) {
                        setState(() {
                          _selectedJenisKendaraan = value as String?;
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text('Elf'),
                      value: 'Elf',
                      groupValue: _selectedJenisKendaraan,
                      onChanged: (value) {
                        setState(() {
                          _selectedJenisKendaraan = value as String?;
                        });
                      },
                    ),
                  ],
                ),
                if (_selectedJenisKendaraan != null &&
                    _selectedJenisKendaraan!.isEmpty)
                  Padding(
                    padding: EdgeInsets.only(left: 24),
                    child: Text(
                      'Mohon pilih jenis kendaraan',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                SizedBox(height: 16),
                Text(
                  'Durasi Peminjaman Kendaraan:',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RadioListTile(
                      title: Text('12 Jam'),
                      value: '12 Jam',
                      groupValue: _selectedDurasiPeminjaman,
                      onChanged: (value) {
                        setState(() {
                          _selectedDurasiPeminjaman = value as String?;
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text('18 Jam'),
                      value: '18 Jam',
                      groupValue: _selectedDurasiPeminjaman,
                      onChanged: (value) {
                        setState(() {
                          _selectedDurasiPeminjaman = value as String?;
                        });
                      },
                    ),
                  ],
                ),
                if (_selectedDurasiPeminjaman != null &&
                    _selectedDurasiPeminjaman!.isEmpty)
                  Padding(
                    padding: EdgeInsets.only(left: 24),
                    child: Text(
                      'Mohon pilih durasi peminjaman kendaraan',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                SizedBox(height: 16),
                Text(
                  'Dengan Sopir:',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8),
                CheckboxListTile(
                  title: Text('Dengan Sopir'),
                  value: _keteranganSupir,
                  onChanged: (value) {
                    setState(() {
                      _keteranganSupir = value!;
                    });
                  },
                ),
                SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text('Kirim Permintaan'),
                  ),
                ),
                SizedBox(height: 100), // Tambahkan spasi di bagian bawah
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
