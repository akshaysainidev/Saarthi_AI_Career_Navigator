import 'package:career_guidance_project/androidDevPage.dart';
import 'package:flutter/material.dart';
import 'package:career_guidance_project/util.dart';
import 'package:url_launcher/url_launcher.dart';

class GameDevPage extends StatefulWidget {
  const GameDevPage({Key? key}) : super(key: key);

  @override
  _GameDevPageState createState() => _GameDevPageState();
}

class _GameDevPageState extends State<GameDevPage> {
  // Data for the table
  final List<JobPost> _jobPosts = [
    JobPost("Intern", "0-1 year", "₹3,00,000 - ₹6,00,000", "Support senior developers, debug issues."),
    JobPost("Fresher", "0-2 years", "₹6,00,000 - ₹12,00,000", "Develop simple features, bug fixing."),
    JobPost("Junior Developer", "2-4 years", "₹12,00,000 - ₹20,00,000", "Develop and maintain games, testing."),
    JobPost("Senior Developer", "4+ years", "₹20,00,000 - ₹50,00,000+", "Lead teams, architecture, code reviews."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Game Development", style: myTextStyle30().copyWith(fontSize: 25, color: Colors.white)),
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: myGradient2(Alignment.topRight, Alignment.topLeft),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20, weight: 20),
          onPressed: () {
            FocusScope.of(context).unfocus();
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Definition Section
            _buildSection(
              title: "Definition",
              icon: Icons.info_outline,
              content: [
                "Game Development is the process of designing, creating, testing, and deploying interactive video games. It involves multiple stages, including concept design, programming, art creation, sound design, testing, and publishing. Games can be developed for various platforms such as PCs, consoles, mobile devices, and VR/AR systems.",
              ],
            ),
            SizedBox(height: 20),
            // Job Posts and Average Packages Section
            Card(
              elevation: 4,
              color: Colors.purple.shade100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.video_library, color: Colors.purple),
                        SizedBox(width: 10),
                        Text("Learn Game Development", style: myTextStyle30Blacky().copyWith(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15)),
                      ],
                    ),
                    Divider(color: Colors.grey),
                    SizedBox(height: 10),
                    // YouTube Video Thumbnail
                    GestureDetector(
                      onTap: () {
                        // Open the YouTube video link
                        launchURL("https://youtu.be/Imo9ZOrBVZE?si=IBHpj9ZJggBs0JGh");
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          "https://img.youtube.com/vi/Imo9ZOrBVZE/0.jpg", // YouTube thumbnail URL
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 200,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    // YouTube Video Link
                    GestureDetector(
                      onTap: () {
                        // Open the YouTube video link
                        launchURL("https://youtu.be/Imo9ZOrBVZE?si=IBHpj9ZJggBs0JGh");
                      },
                      child: Text(
                        "Watch on YouTube: https://youtu.be/Imo9ZOrBVZE?si=IBHpj9ZJggBs0JGh",
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildJobPostsTable(),
            SizedBox(height: 20),
            // Required Skills Section
            _buildSection(
              title: "Required Skills",
              icon: Icons.code,
              content: [
                "Programming Languages",
                "1. C#: Primary language for Unity.",
                "   Companies: Unity Technologies, Zynga, Niantic.",
                "2. C++: Widely used in Unreal Engine for high-performance games.",
                "   Companies: Epic Games, Ubisoft, Rockstar Games.",
                "3. Rust: Emerging in game development for performance and safety.",
                "   Companies: Embark Studios.",
                "Game Engines and Frameworks",
                "1. Unity: Most popular for indie and mobile games.",
                "   Companies: Niantic (Pokémon GO), Supercell (Clash of Clans).",
                "2. Unreal Engine 5: Advanced graphics and physics for AAA games.",
                "   Companies: Epic Games (Fortnite), CD Projekt Red (Cyberpunk 2077).",
                "3. Godot: Open-source and gaining popularity for 2D and 3D games.",
                "   Companies: Small indie developers and open-source communities.",
                "4. CryEngine: Known for high-end graphics.",
                "   Companies: Crytek (Crysis), Cloud Imperium Games (Star Citizen).",
                "Graphics and Rendering Libraries",
                "1. Vulkan: High-performance graphics API.",
                "   Companies: Valve Corporation, NVIDIA.",
                "2. DirectX 12: Windows-based graphics API.",
                "   Companies: Microsoft, Activision Blizzard.",
                "3. OpenGL/GLSL: Cross-platform rendering.",
                "   Companies: id Software (Doom series).",
                "Developer Tools",
                "1. Blender: 3D modeling and animation.",
                "   Companies: Ubisoft, indie game developers.",
                "2. Maya/3ds Max: Advanced 3D modeling and animation.",
                "   Companies: Rockstar Games, EA.",
                "3. Substance Painter: Texturing and material creation.",
                "   Companies: Naughty Dog, Bungie.",
                "4. Git & GitHub/GitLab: Version control.",
                "   Companies: Almost every game development studio.",
                "Version Control and CI/CD",
                "1. Perforce: Popular version control system for large projects.",
                "   Companies: Epic Games, Ubisoft.",
                "2. Jenkins: CI/CD automation.",
                "   Companies: Riot Games, EA.",
              ],
            ),
            SizedBox(height: 20),
            // Job Titles Section
            _buildSection(
              title: "Job Titles in Game Development",
              icon: Icons.assignment_outlined,
              content: [
                "1. Game Developer",
                "2. Gameplay Programmer",
                "3. Game Designer",
                "4. Graphics Programmer",
                "5. AI Programmer",
                "6. Game Engine Developer",
                "7. Technical Artist",
                "8. Lead Game Developer",
                "9. VR/AR Game Developer",
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build a section with a title and content
  Widget _buildSection({required String title, required IconData icon, required List<String> content}) {
    return Card(
      elevation: 4,
      color: Colors.purple.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.purple),
                SizedBox(width: 10),
                Text(title, style: myTextStyle30Blacky().copyWith(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15)),
              ],
            ),
            Divider(color: Colors.grey),
            ...content.map((item) => Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text(item, style: myTextStyle15Blacky()),
            )).toList(),
          ],
        ),
      ),
    );
  }

  // Helper method to build the Job Posts table
  Widget _buildJobPostsTable() {
    return Card(
      elevation: 4,
      color: Colors.purple.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              child: Row(
                children: [
                  Icon(Icons.work_outline, color: Colors.purple),
                  SizedBox(width: 10),
                  FittedBox(
                    child: Text(
                      "Job Posts and Average Packages",
                      style: myTextStyle30Blacky().copyWith(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.grey),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: Text("Position", style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text("Experience Level", style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text("Average Salary (per annum)", style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text("Key Responsibilities", style: TextStyle(fontWeight: FontWeight.bold))),
                ],
                rows: _jobPosts.map((jobPost) => DataRow(cells: [
                  DataCell(Text(jobPost.position)),
                  DataCell(Text(jobPost.experienceLevel)),
                  DataCell(Text(jobPost.averageSalary)),
                  DataCell(Text(jobPost.keyResponsibilities)),
                ])).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Data model for Job Posts
class JobPost {
  final String position;
  final String experienceLevel;
  final String averageSalary;
  final String keyResponsibilities;

  JobPost(this.position, this.experienceLevel, this.averageSalary, this.keyResponsibilities);
}
// Helper method to launch URLs
void launchURL(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}