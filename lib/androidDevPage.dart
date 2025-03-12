import 'package:flutter/material.dart';
import 'package:career_guidance_project/util.dart';
import 'package:url_launcher/url_launcher.dart';

class AndroidDevPage extends StatefulWidget {
  const AndroidDevPage({Key? key}) : super(key: key);

  @override
  _AndroidDevPageState createState() => _AndroidDevPageState();
}

class _AndroidDevPageState extends State<AndroidDevPage> {
  // Data for the table
  final List<JobPost> _jobPosts = [
    JobPost("Intern", "0-1 year", "₹400,000 - ₹1,200,000", "Support senior developers, debug issues."),
    JobPost("Fresher", "0-2 years", "₹1,600,000 - ₹2,800,000", "Develop simple features, bug fixing."),
    JobPost("Junior Developer", "2-4 years", "₹3,200,000 - ₹5,600,000", "Develop and maintain apps, testing."),
    JobPost("Senior Developer", "4+ years", "₹6,400,000 - ₹12,000,000+", "Lead teams, architecture, code reviews."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Android Development", style: myTextStyle30().copyWith(fontSize: 25, color: Colors.white)),
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
                "Android Development involves creating applications for devices that run on the Android operating system. It uses programming languages like Java and Kotlin and often leverages frameworks and libraries for faster and more efficient development. Android developers design, build, test, and maintain apps that can run on various Android devices.",
              ],
            ),
            SizedBox(height: 20),
            _buildJobPostsTable(),
            SizedBox(height: 20),
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
                        Text("Learn Android Development", style: myTextStyle30Blacky().copyWith(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15)),
                      ],
                    ),
                    Divider(color: Colors.grey),
                    SizedBox(height: 10),
                    // YouTube Video Thumbnail
                    GestureDetector(
                      onTap: () {
                        // Open the YouTube video link
                        launchURL("https://youtu.be/1bQwDO88Gyw?si=UrwuWGBe0G6fHPeW");
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: 
                        Image.network(
                          "https://img.youtube.com/vi/1bQwDO88Gyw/0.jpg", // YouTube thumbnail URL
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
                        launchURL("https://youtu.be/1bQwDO88Gyw?si=UrwuWGBe0G6fHPeW");
                        setState(() {
                        });
                      },
                      child: Text(
                        "Watch on YouTube: https://youtu.be/1bQwDO88Gyw?si=UrwuWGBe0G6fHPeW",
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
            // Required Skills Section
            _buildSection(
              title: "Required Skills",
              icon: Icons.code,
              content: [
                "Programming Languages",
                "1. Java: The traditional language for Android development.",
                "   Companies: Google, Uber, Airbnb.",
                "2. Kotlin: The official language for Android development since 2019.",
                "   Companies: Pinterest, Trello, Coursera.",
                "3. Dart (for Flutter): Popular for cross-platform app development.",
                "4. Rust (for Tauri): Efficient and secure for backend integration.",
                "Frameworks and Libraries",
                "1. Flutter: An open-source UI software development kit by Google, enabling cross-platform applications from a single codebase for Android, iOS, web, and desktop.",
                "2. React Native: Cross-platform framework by Meta.",
                "3. Tauri: An open-source framework designed to create cross-platform desktop and mobile applications using a web frontend, with a Rust back-end.",
                "4. ArkTS: A high-level, multi-paradigm programming language developed by Huawei, extending TypeScript for HarmonyOS development, emphasizing declarative programming.",
                "Developer Tools",
                "1. Android Studio: The official IDE for Android development.",
                "   Companies: Google, Microsoft.",
                "2. Firebase: For backend services.",
                "   Companies: Any company developing Android apps.",
                "3. Gradle: Build automation tool.",
                "   Companies: LinkedIn, Slack.",
                "4. ADB (Android Debug Bridge): Command-line tool for debugging.",
                "   Companies: Duolingo, Shazam.",
                "Version Control and Collaboration",
                "1. Git/GitHub/GitLab: Version control and code collaboration.",
                "   Companies: Almost every tech company.",
                "2. Bitbucket: Git repository management.",
                "   Companies: Atlassian, Trello.",
                "UI/UX Tools",
                "1. Lottie: For animated vector graphics.",
                "2. MotionLayout: Advanced motion handling.",
              ],
            ),
            SizedBox(height: 20),
            // Job Titles Section
            _buildSection(
              title: "Job Titles in Android Development",
              icon: Icons.assignment_outlined,
              content: [
                "1. Android Intern",
                "2. Android Developer",
                "3. Junior Android Developer",
                "4. Senior Android Developer",
                "5. Lead Android Engineer",
                "6. Mobile Application Developer",
                "7. Full Stack Mobile Developer",
                "8. Android Architect",
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
                  FittedBox(child: Text("Job Posts and Average Packages", style: myTextStyle30Blacky().copyWith(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15)),)
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