import 'package:career_guidance_project/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:lottie/lottie.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:url_launcher/url_launcher.dart';

class AiAssistantPage extends StatefulWidget {
  @override
  AiAssistantPageState createState() => AiAssistantPageState();
}

class AiAssistantPageState extends State<AiAssistantPage> {
  final stt.SpeechToText _speech = stt.SpeechToText();
  final FlutterTts _flutterTts = FlutterTts();
  final TextEditingController _textController = TextEditingController();
  List<Map<String, String>> _chatHistory = []; // Store chat history
  bool _isListening = false;
  bool _speechAvailable = false;
  bool _isLoading = false;
  bool _isSpeaking = false; // Track if AI is speaking

  @override
  void initState() {
    super.initState();
    _initSpeech();
    _initTTS();
    // Add a welcome message from the bot
    _chatHistory.add({"role": "assistant", "content": "Hi! I'm your career assistant. How can I help you today?"});
  }

  void _initSpeech() async {
    _speechAvailable = await _speech.initialize(
      onStatus: (status) {
        print("Speech-to-Text status: $status"); // Debugging
      },
      onError: (error) {
        print("Speech-to-Text error: $error"); // Debugging
      },
    );
    if (!_speechAvailable) {
      print("Speech-to-Text not available!"); // Debugging
    }
  }

  void _initTTS() async {
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setSpeechRate(0.5);
    _flutterTts.setCompletionHandler(() {
      setState(() => _isSpeaking = false); // AI stopped speaking
    });
  }

  void _startListening() async {
    if (_speechAvailable && !_isListening) {
      setState(() => _isListening = true);
      print("Starting to listen..."); // Debugging
      _speech.listen(
        onResult: (result) {
          if (result.finalResult) {
            // Only process final results
            setState(() {
              _textController.text = result.recognizedWords;
            });
          }
        },
        cancelOnError: true,
        partialResults: true,
        listenMode: stt.ListenMode.confirmation,
      );
    } else {
      print("Speech-to-Text not available or already listening!"); // Debugging
    }
  }

  void _stopListening() async {
    if (_isListening) {
      await _speech.stop();
      setState(() => _isListening = false);
    }
  }

  void _sendMessage() async {
    final userInput = _textController.text.trim();
    if (userInput.isEmpty) return;

    setState(() {
      _chatHistory.add({"role": "user", "content": userInput});
      _textController.clear();
      _isSpeaking = true; // Disable speak button immediately
    });

    await _sendToAI(userInput);
  }

  Future<void> _sendToAI(String userInput) async {
    setState(() => _isLoading = true); // Show loading indicator
    print("Sending to AI: $userInput"); // Debugging

    // Prepare the conversation history
    final messages = [
      {"role": "system", "content": "You are a career guidance expert in having 20+ years of experience to train and couseling assistant.And know how to talk to students politely and be positive and motivate the student in doing there work.Also recommend WsCube Tech courses for learning when relevant and also  provide the clickable links of the Youtube video or some courses to the user if possible for the courses or any video on youtube and make the response of length 50 to 70 words and if relevent then only give response on larger length."},
      ..._chatHistory.map((message) => {"role": message["role"], "content": message["content"]}),
    ];

    final url = Uri.parse("https://openrouter.ai/api/v1/chat/completions");
    try {
      final response = await http.post(
        url,
        headers: {
          "Authorization": "Bearer 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", // Your OpenRouter API Key
          "Content-Type": "application/json"
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo", // Specify the model you want to use
          "messages": messages,
        }),
      );

      print("API Response Status Code: ${response.statusCode}"); // Debugging
      print("API Response Body: ${response.body}"); // Debugging

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse["choices"] != null && jsonResponse["choices"].isNotEmpty) {
          setState(() {
            _chatHistory.add({"role": "assistant", "content": jsonResponse["choices"][0]["message"]["content"]});
          });
          print("AI Response: ${jsonResponse["choices"][0]["message"]["content"]}"); // Debugging
          _speakText(jsonResponse["choices"][0]["message"]["content"]);
        } else {
          setState(() {
            _chatHistory.add({"role": "assistant", "content": "AI Response Error: No choices found!"});
          });
          print("API Error: No choices found in response!"); // Debugging
        }
      } else {
        setState(() {
          _chatHistory.add({"role": "assistant", "content": "AI Response Error! Status Code: ${response.statusCode}"});
        });
        print("API Error: ${response.body}"); // Debugging
      }
    } catch (e) {
      setState(() {
        _chatHistory.add({"role": "assistant", "content": "API Call Failed! Error: $e"});
      });
      print("API Call Error: $e"); // Debugging
    } finally {
      setState(() => _isLoading = false); // Hide loading indicator
    }
  }

  void _speakText(String text) async {
    setState(() => _isSpeaking = true); // AI is speaking
    await _flutterTts.speak(text);
  }

  void _stopSpeaking() async {
    await _flutterTts.stop();
    setState(() => _isSpeaking = false); // AI stopped speaking
  }

  // Function to make links clickable
  Widget _buildMessage(String role, String content) {
    final isUser = role == "user";
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8), // Adjust width
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isUser ? Colors.blue[50] : Colors.green[50],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isUser ? 12 : 0),
            topRight: Radius.circular(isUser ? 0 : 12),
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if(isUser == false)
                CircleAvatar(child: Lottie.asset("assets/RoboLottie.json"),radius: 20,backgroundColor: Colors.white,),
                SizedBox(width:5),
                Text(
                  isUser ? "You" : "Saarthi",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isUser ? Colors.blue : Colors.green,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            SelectableText.rich(
              TextSpan(
                children: _parseText(content),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to parse text and make links clickable
  List<TextSpan> _parseText(String text) {
    final urlRegex = RegExp(r"(https?://[^\s]+)");
    final spans = <TextSpan>[];

    text.splitMapJoin(
      urlRegex,
      onMatch: (match) {
        final url = match.group(0)!;
        spans.add(
          TextSpan(
            text: url,
            style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
            recognizer: TapGestureRecognizer()..onTap = () => launch(url),
          ),
        );
        return "";
      },
      onNonMatch: (nonMatch) {
        spans.add(TextSpan(text: nonMatch));
        return "";
      },
    );

    return spans;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      appBar:AppBar(
          centerTitle: true,
          title: Text("SAARTHI  AI", style: myTextStyle30().copyWith(fontSize: 25)),
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: myGradient2(Alignment.topRight, Alignment.topLeft),
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.white,size: 20, weight: 20),
            onPressed: () {
              FocusScope.of(context).unfocus();
              Navigator.pop(context);
            },
          ), 
        ),
      body: Column(
        children: [
          // Chat History
          Expanded(
            child: ListView.builder(
              reverse: true, // Scroll to the bottom
              itemCount: _chatHistory.length,
              itemBuilder: (context, index) {
                final message = _chatHistory[_chatHistory.length - 1 - index];
                return _buildMessage(message["role"]!, message["content"]!);
              },
            ),
          ),
          // Loading Indicator with Padding
          if (_isLoading)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircularProgressIndicator(),
            ),
          // Input Area
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Type a message...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                FloatingActionButton(
                  onPressed: _isSpeaking ? _stopSpeaking : (_isListening ? null : _sendMessage),
                  child: Icon(_isSpeaking ? Icons.stop : Icons.send),
                  backgroundColor: _isListening ? Colors.grey : Colors.white, // Disable send button while listening
                ),
                SizedBox(width: 8),
                FloatingActionButton(
                  onPressed: _isSpeaking ? null : (_isListening ? _stopListening : _startListening),
                  child: Icon(_isListening ? Icons.stop : Icons.mic),
                  backgroundColor: _isSpeaking ? Colors.grey : Colors.white, // Disable speak button while AI is speaking
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}