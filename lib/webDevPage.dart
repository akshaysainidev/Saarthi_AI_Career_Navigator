import 'package:career_guidance_project/androidDevPage.dart';
import 'package:flutter/material.dart';
import 'package:career_guidance_project/util.dart';
import 'package:url_launcher/url_launcher.dart';

class WebDevPage extends StatefulWidget {
  const WebDevPage({Key? key}) : super(key: key);

  @override
  _WebDevPageState createState() => _WebDevPageState();
}

class _WebDevPageState extends State<WebDevPage> {
  // Data for the table
  final List<JobPost> _jobPosts = [
    JobPost("Intern", "0-1 year", "₹3,00,000 - ₹6,00,000", "Assist in building and maintaining web applications."),
    JobPost("Fresher", "0-2 years", "₹6,00,000 - ₹12,00,000", "Develop and maintain frontend and backend components."),
    JobPost("Junior Developer", "2-4 years", "₹12,00,000 - ₹20,00,000", "Work on complex features and optimize web applications."),
    JobPost("Senior Developer", "4+ years", "₹20,00,000 - ₹50,00,000+", "Lead development teams, design system architecture."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Web Development", style: myTextStyle30().copyWith(fontSize: 25, color: Colors.white)),
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
                "Web Development is the process of creating websites and web applications for the internet or an intranet. It involves building and maintaining the frontend (client-side) and backend (server-side) of a website, along with database management and server configuration.",
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
                        Text("Learn Web Development", style: myTextStyle30Blacky().copyWith(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15)),
                      ],
                    ),
                    Divider(color: Colors.grey),
                    SizedBox(height: 10),
                    // YouTube Video Thumbnail
                    GestureDetector(
                      onTap: () {
                        // Open the YouTube video link
                        launchURL("https://youtu.be/ksD3FgLcW7w?si=BkQq5xPXAg6obXWj");
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          "https://img.youtube.com/vi/ksD3FgLcW7w/0.jpg", // YouTube thumbnail URL
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
                        launchURL("https://youtu.be/ksD3FgLcW7w?si=BkQq5xPXAg6obXWj");
                      },
                      child: Text(
                        "Watch on YouTube: https://youtu.be/ksD3FgLcW7w?si=BkQq5xPXAg6obXWj",
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
                "Programming and Markup Languages:",
                "• JavaScript (ES6+): Core language for interactive web applications.",
                "  Companies: Google, Facebook, Amazon.",
                "• TypeScript: Strongly typed superset of JavaScript.",
                "  Companies: Microsoft, Slack, Asana.",
                "• Python: For backend development and automation.",
                "  Companies: Instagram, Spotify, Netflix.",
                "• Go (Golang): High-performance backend services.",
                "  Companies: Google, Uber, Twitch.",
                "• Rust: Performance-critical backend applications.",
                "  Companies: Dropbox, Mozilla.",
                "Frontend Frameworks and Libraries:",
                "• React: Most popular library for building interactive UIs.",
                "  Companies: Facebook, Airbnb, Uber.",
                "• Next.js: React framework for server-side rendering (SSR) and static site generation (SSG).",
                "  Companies: Vercel, Hashnode.",
                "• Vue.js: Progressive JavaScript framework.",
                "  Companies: Xiaomi, Alibaba, GitLab.",
                "• Svelte: Lightweight and fast framework.",
                "  Companies: The New York Times, GoDaddy.",
                "Backend Frameworks and Libraries:",
                "• Node.js (with Express): Popular for building scalable server-side applications.",
                "  Companies: Netflix, PayPal, LinkedIn.",
                "• Django (Python): High-level web framework for secure and rapid development.",
                "  Companies: Instagram, Disqus, Pinterest.",
                "• FastAPI (Python): High-performance API framework.",
                "  Companies: Netflix, Microsoft.",
                "• NestJS: Scalable Node.js framework.",
                "  Companies: Capgemini, Adidas.",
                "DevOps and CI/CD Tools:",
                "• Docker: Containerization.",
                "  Companies: Spotify, PayPal.",
                "• Kubernetes: Container orchestration.",
                "  Companies: Google, Red Hat.",
                "• GitHub Actions: CI/CD directly on GitHub.",
                "  Companies: Microsoft, Open-source projects.",
                "• Jenkins: Automation server.",
                "  Companies: LinkedIn, Netflix.",
                "Version Control and Collaboration:",
                "• Git & GitHub/GitLab: Source code management.",
                "  Companies: Almost every tech company.",
                "• Bitbucket: CI/CD and Git repository management.",
                "  Companies: Atlassian, Trello.",
              ],
            ),
            SizedBox(height: 20),
            // Job Titles Section
            _buildSection(
              title: "Job Titles in Web Development",
              icon: Icons.assignment_outlined,
              content: [
                "1. Frontend Developer",
                "2. Backend Developer",
                "3. Full-Stack Developer",
                "4. Web Developer",
                "5. UI/UX Developer",
                "6. React Developer",
                "7. Node.js Developer",
                "8. DevOps Engineer",
                "9. Web Architect",
                "10. API Developer",
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