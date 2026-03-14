import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Edit Profile UI',
      theme: ThemeData(
        fontFamily: 'Roboto', // Atau gunakan font kustom Anda
        scaffoldBackgroundColor: const Color(
          0xFFF4F7F8,
        ), // Warna latar belakang abu-abu sangat muda
        primaryColor: const Color(0xFF00A896), // Warna Teal utama
      ),
      home: const EditProfileScreen(),
    );
  }
}

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final Color primaryTeal = const Color(0xFF00A896);
  final Color textDark = const Color(0xFF2D3142);
  final Color textLight = const Color(0xFF9098B1);
  bool isTwoFactorEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: textDark),
          onPressed: () {},
        ),
        title: Text(
          'Edit Profile',
          style: TextStyle(
            color: textDark,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 10, bottom: 10),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.check, size: 18, color: Colors.white),
              label: const Text('Save', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryTeal,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Bagian Foto Profil ---
              Center(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(
                            4,
                          ), // Jarak untuk border
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: primaryTeal.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const CircleAvatar(
                            radius: 45,
                            backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=200&q=80',
                            ), // Gambar placeholder
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: primaryTeal,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Tap to change profile photo',
                      style: TextStyle(color: textLight, fontSize: 13),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // --- Card Informasi Pribadi ---
              Container(
                decoration: _cardDecoration(),
                child: Column(
                  children: [
                    _buildInfoTile(
                      icon: Icons.person_outline,
                      label: 'Full Name',
                      value: 'Dinda Putri Anggraini',
                      trailingIcon: Icons.edit_outlined,
                    ),
                    _buildDivider(),
                    _buildInfoTile(
                      icon: Icons.mail_outline,
                      label: 'Email',
                      value: 'dinda.putri@gmail.com',
                      trailingIcon: Icons.edit_outlined,
                    ),
                    _buildDivider(),
                    _buildInfoTile(
                      icon: Icons.phone_outlined,
                      label: 'Phone Number',
                      value: '+62 812 3456 7890',
                      trailingIcon: Icons.edit_outlined,
                    ),
                    _buildDivider(),
                    _buildInfoTile(
                      icon: Icons.calendar_today_outlined,
                      label: 'Date of Birth',
                      value: '12 March 1998',
                      trailingIcon: Icons.chevron_right,
                    ),
                    _buildDivider(),
                    _buildInfoTile(
                      icon: Icons
                          .person_outline, // Bisa ganti icon gender jika ada
                      label: 'Gender',
                      value: 'Female',
                      trailingIcon: Icons.keyboard_arrow_down,
                    ),
                    _buildDivider(),
                    _buildInfoTile(
                      icon: Icons.location_on_outlined,
                      label: 'Address',
                      value: 'Jl. Merdeka No. 10, Jakarta',
                      trailingIcon: Icons.edit_outlined,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // --- Bagian Keamanan ---
              Text(
                'Security',
                style: TextStyle(
                  color: textDark,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                decoration: _cardDecoration(),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.lock_outline, color: textLight),
                      title: Text(
                        'Change Password',
                        style: TextStyle(color: textDark, fontSize: 14),
                      ),
                      subtitle: Text(
                        'Update your password',
                        style: TextStyle(color: textLight, fontSize: 12),
                      ),
                      trailing: Icon(Icons.chevron_right, color: textLight),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      onTap: () {},
                    ),
                    _buildDivider(),
                    ListTile(
                      leading: Icon(Icons.security_outlined, color: textLight),
                      title: Text(
                        'Two-Factor Authentication',
                        style: TextStyle(color: textDark, fontSize: 14),
                      ),
                      trailing: Switch(
                        value: isTwoFactorEnabled,
                        onChanged: (value) {
                          setState(() {
                            isTwoFactorEnabled = value;
                          });
                        },
                        activeColor: Colors.white,
                        activeTrackColor: primaryTeal,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // --- Tombol Save Changes Bawah ---
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.save_outlined, color: Colors.white),
                  label: const Text(
                    'Save Changes',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryTeal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // --- Widget Pembantu ---

  // Dekorasi untuk kotak (Card) putih dengan bayangan lembut
  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.08),
          spreadRadius: 2,
          blurRadius: 15,
          offset: const Offset(0, 5),
        ),
      ],
    );
  }

  // Garis pemisah antar item
  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Divider(color: Colors.grey[200], height: 1, thickness: 1),
    );
  }

  // Baris informasi kustom (Icon, Label, Value, Trailing Icon)
  Widget _buildInfoTile({
    required IconData icon,
    required String label,
    required String value,
    required IconData trailingIcon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Row(
        children: [
          Icon(icon, color: textLight, size: 22),
          const SizedBox(width: 16),
          SizedBox(
            width: 100, // Lebar tetap agar kolom 'Value' sejajar
            child: Text(
              label,
              style: TextStyle(color: textLight, fontSize: 13),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: textDark,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Icon(trailingIcon, color: textLight, size: 18),
        ],
      ),
    );
  }
}
