import 'package:flutter/material.dart';
import 'package:career_guidance_project/util.dart';
import 'package:url_launcher/url_launcher.dart';

class CyberSecurityDevPage extends StatefulWidget {
  const CyberSecurityDevPage({Key? key}) : super(key: key);

  @override
  _CyberSecurityDevPageState createState() => _CyberSecurityDevPageState();
}

class _CyberSecurityDevPageState extends State<CyberSecurityDevPage> {
  // Data for the table
  final List<JobPost> _jobPosts = [
    JobPost("Intern", "0-1 year", "₹4,00,000 - ₹8,00,000", "Support senior analysts, monitor threats."),
    JobPost("Fresher", "0-2 years", "₹8,00,000 - ₹15,00,000", "Analyze security logs, assist in incident response."),
    JobPost("Junior Analyst", "2-4 years", "₹15,00,000 - ₹25,00,000", "Monitor and respond to security incidents."),
    JobPost("Senior Analyst/Engineer", "4+ years", "₹25,00,000 - ₹50,00,000+", "Lead security teams, design security architectures."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cyber Security", style: myTextStyle30().copyWith(fontSize: 25, color: Colors.white)),
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
                "Cyber Security is the practice of protecting computer systems, networks, and data from digital attacks, unauthorized access, and data breaches. It involves implementing security measures, monitoring threats, and responding to incidents to safeguard sensitive information.",
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
                        Text("Learn Cyber Security", style: myTextStyle30Blacky().copyWith(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15)),
                      ],
                    ),
                    Divider(color: Colors.grey),
                    SizedBox(height: 10),
                    // YouTube Video Thumbnail
                    GestureDetector(
                      onTap: () {
                        // Open the YouTube video link
                        launchURL("https://youtu.be/v3iUx2SNspY?si=lKp1JabuquLZSHv0");
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          "https://img.youtube.com/vi/v3iUx2SNspY/0.jpg", // YouTube thumbnail URL
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
                        launchURL("https://youtu.be/v3iUx2SNspY?si=lKp1JabuquLZSHv0");
                      },
                      child: Text(
                        "Watch on YouTube: https://youtu.be/v3iUx2SNspY?si=lKp1JabuquLZSHv0",
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
                "Programming and Scripting Languages",
                "1. Python: Widely used for automation, penetration testing, and scripting.",
                "   Companies: Google, IBM, Cisco.",
                "2. Go (Golang): Known for building high-performance security tools.",
                "   Companies: CrowdStrike, Cloudflare.",
                "3. Rust: Increasingly popular for secure and efficient system programming.",
                "   Companies: Mozilla, Dropbox.",
                "4. Bash/Shell Scripting: Essential for automating tasks on Linux systems.",
                "   Companies: Red Hat, Amazon Web Services (AWS).",
                "Cyber Security Frameworks and Tools",
                "1. Metasploit: Popular for penetration testing.",
                "   Companies: Rapid7, Tenable.",
                "2. Nmap: Network discovery and security auditing.",
                "   Companies: Cisco, IBM.",
                "3. Wireshark: Network traffic analysis.",
                "   Companies: Dell, Juniper Networks.",
                "4. Burp Suite: Web vulnerability scanner.",
                "   Companies: PortSwigger, security consultancies.",
                "5. Snort: Intrusion detection and prevention.",
                "   Companies: Cisco, government agencies.",
                "6. Zeek (Bro): Network monitoring and analysis.",
                "   Companies: Corelight, FireEye.",
                "Security Information and Event Management (SIEM)",
                "1. Splunk: Data analytics and threat detection.",
                "   Companies: Splunk Inc., Verizon.",
                "2. ELK Stack (Elasticsearch, Logstash, Kibana): Log and threat analysis.",
                "   Companies: Elastic, Netflix.",
                "3. QRadar: Threat intelligence and security monitoring.",
                "   Companies: IBM, AT&T Cybersecurity.",
                "Cloud Security",
                "1. AWS Security Hub: Unified view of security alerts.",
                "   Companies: Amazon, Capital One.",
                "2. Azure Security Center: Threat management for Azure.",
                "   Companies: Microsoft, Accenture.",
                "3. Google Chronicle: Threat intelligence and analytics.",
                "   Companies: Google, Deloitte.",
                "Version Control and Collaboration",
                "1. Git & GitHub/GitLab: Version control for scripts and tools.",
                "   Companies: Almost every tech company.",
                "2. JIRA: Project management in security operations.",
                "   Companies: Atlassian, IT services.",
              ],
            ),
            SizedBox(height: 20),
            // Job Titles Section
            _buildSection(
              title: "Job Titles in Cyber Security",
              icon: Icons.assignment_outlined,
              content: [
                "1. Cyber Security Analyst",
                "2. Penetration Tester (Pentester)",
                "3. Security Engineer",
                "4. Security Operations Center (SOC) Analyst",
                "5. Incident Response Analyst",
                "6. Network Security Engineer",
                "7. Cloud Security Engineer",
                "8. Threat Intelligence Analyst",
                "9. Cyber Security Architect",
                "10. Forensic Analyst",
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
  try {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  } catch (e) {
    print("Error launching URL: $e");
  }
}