import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:daily_vital/screens/scan/medicinesetter.dart';
import 'package:daily_vital/models/medicine.dart';
import 'package:daily_vital/screens/shared/loading.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';

class Scanner extends StatefulWidget {
  const Scanner({super.key});

  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool _isFlashOn = false;
  bool _isRecognizingText = false;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _initializeControllerFuture = _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      final firstCamera = cameras.first;

      _controller = CameraController(
        firstCamera,
        ResolutionPreset.high,
      );

      await _controller.initialize();
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  void _toggleFlash() {
    setState(() {
      _isFlashOn = !_isFlashOn;
      _controller.setFlashMode(_isFlashOn ? FlashMode.torch : FlashMode.off);
    });
  }

  Future<void> _pickImageFromGallery() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final image = File(pickedFile.path);
        print('Image selected from gallery: ${image.path}');
        await _recognizeText(image);
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  Future<void> _recognizeText(File image) async {
    setState(() {
      _isRecognizingText = true;
    });

    try {
      final recognizedText = await FlutterTesseractOcr.extractText(image.path);
      print('Recognized Text: $recognizedText');
      _navigateToMedicineSetter(recognizedText); 

      setState(() {
        _isRecognizingText = false; 
      });
    } catch (e) {
      print('Error recognizing text: $e');
      setState(() {
        _isRecognizingText = false; 
      });
    }
  }

  void _navigateToMedicineSetter(String recognizedText) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MedicineSetter(
          medicines: [
            Medicine(name: 'Paracetamol', doses: '2', time: '08:00 AM'),
            Medicine(name: 'Ibuprofen', doses: '1', time: '12:00 PM'),
            // Add more medicines here
          ],
        ),
      ),
    );
  }

  Future<void> _createPdf(String text) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Text(text),
        ),
      ),
    );

    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/recognized_text.pdf');
    await file.writeAsBytes(await pdf.save());
    print('PDF saved at: ${file.path}');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scanner', style: TextStyle(color: Colors.black)),
        backgroundColor: const Color(0xffF4F5F6),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_sharp, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_controller);
              } else {
                return const Center(child: Loading());
              }
            },
          ),
          if (_isRecognizingText) // Show loading overlay during text recognition
            Container(
              color: Colors.black54,
              child: const Center(
                child: Loading(),
              ),
            ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 100.0),
        child: SizedBox(
          height: 65.0,
          width: 65.0,
          child: FloatingActionButton(
            onPressed: () async {
              try {
                await _initializeControllerFuture;
                final image = await _controller.takePicture();
                print('Image captured: ${image.path}');
                await _recognizeText(File(image.path));
              } catch (e) {
                print('Error capturing image: $e');
              }
            },
            backgroundColor: const Color(0xffF4F5F6),
            child: const Icon(
              Icons.camera_alt,
              color: Colors.black,
              size: 35.0,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xffF4F5F6),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBottomBarIcon(
                    Icons.photo_library, 'Gallery', _pickImageFromGallery),
                _buildBottomBarIcon(
                    _isFlashOn ? Icons.flash_on : Icons.flash_off,
                    'Flash',
                    _toggleFlash),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomBarIcon(
      IconData icon, String label, VoidCallback onPressed) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: 40.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.black),
          Text(
            label,
            style: const TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
