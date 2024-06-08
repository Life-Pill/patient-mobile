import 'package:flutter/material.dart';

class TermsnConditions extends StatelessWidget {
  const TermsnConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms and Conditions'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Terms and Conditions for LifePill',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Introduction',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'These Website Standard Terms and Conditions written on this webpage shall manage your use of our website, LifePill accessible at LifePill.',
                ),
                const SizedBox(height: 8),
                const Text(
                  'These Terms will be applied fully and affect to your use of this Website. By using this Website, you agreed to accept all terms and conditions written in here. You must not use this Website if you disagree with any of these Website Standard Terms and Conditions. These Terms and Conditions have been generated with the help of the Terms And Conditiions Sample Generator.',
                ),
                const SizedBox(height: 8),
                const Text(
                  'Minors or people below 18 years old are not allowed to use this Website.',
                ),
                const SizedBox(height: 16),
                const Text(
                  'Intellectual Property Rights',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Other than the content you own, under these Terms, LifePill and/or its licensors own all the intellectual property rights and materials contained in this Website.',
                ),
                const SizedBox(height: 8),
                const Text(
                  'You are granted limited license only for purposes of viewing the material contained on this Website.',
                ),
                const SizedBox(height: 16),
                const Text(
                  'Restrictions',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text('You are specifically restricted from all of the following:'),
                const SizedBox(height: 8),
                ...[
                  'publishing any Website material in any other media;',
                  'selling, sublicensing and/or otherwise commercializing any Website material;',
                  'publicly performing and/or showing any Website material;',
                  'using this Website in any way that is or may be damaging to this Website;',
                  'using this Website in any way that impacts user access to this Website;',
                  'using this Website contrary to applicable laws and regulations, or in any way may cause harm to the Website, or to any person or business entity;',
                  'engaging in any data mining, data harvesting, data extracting or any other similar activity in relation to this Website;',
                  'using this Website to engage in any advertising or marketing.',
                ].map((restriction) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text('- $restriction'),
                )),
                const SizedBox(height: 8),
                const Text(
                  'Certain areas of this Website are restricted from being access by you and LifePill may further restrict access by you to any areas of this Website, at any time, in absolute discretion. Any user ID and password you may have for this Website are confidential and you must maintain confidentiality as well.',
                ),
                const SizedBox(height: 16),
                const Text(
                  'Your Content',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'In these Website Standard Terms and Conditions, "Your Content" shall mean any audio, video text, images or other material you choose to display on this Website. By displaying Your Content, you grant LifePill a non-exclusive, worldwide irrevocable, sub licensable license to use, reproduce, adapt, publish, translate and distribute it in any and all media.',
                ),
                const SizedBox(height: 8),
                const Text(
                  'Your Content must be your own and must not be invading any third-party\'s rights. LifePill reserves the right to remove any of Your Content from this Website at any time without notice.',
                ),
                const SizedBox(height: 16),
                const Text(
                  'No warranties',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'This Website is provided "as is," with all faults, and LifePill express no representations or warranties, of any kind related to this Website or the materials contained on this Website. Also, nothing contained on this Website shall be interpreted as advising you.',
                ),
                const SizedBox(height: 16),
                const Text(
                  'Limitation of liability',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'In no event shall LifePill, nor any of its officers, directors and employees, shall be held liable for anything arising out of or in any way connected with your use of this Website whether such liability is under contract. LifePill, including its officers, directors and employees shall not be held liable for any indirect, consequential or special liability arising out of or in any way related to your use of this Website.',
                ),
                const SizedBox(height: 16),
                const Text(
                  'Indemnification',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'You hereby indemnify to the fullest extent LifePill from and against any and/or all liabilities, costs, demands, causes of action, damages and expenses arising in any way related to your breach of any of the provisions of these Terms.',
                ),
                const SizedBox(height: 16),
                const Text(
                  'Severability',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'If any provision of these Terms is found to be invalid under any applicable law, such provisions shall be deleted without affecting the remaining provisions herein.',
                ),
                const SizedBox(height: 16),
                const Text(
                  'Variation of Terms',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'LifePill is permitted to revise these Terms at any time as it sees fit, and by using this Website you are expected to review these Terms on a regular basis.',
                ),
                const SizedBox(height: 16),
                const Text(
                  'Assignment',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'The LifePill is allowed to assign, transfer, and subcontract its rights and/or obligations under these Terms without any notification. However, you are not allowed to assign, transfer, or subcontract any of your rights and/or obligations under these Terms.',
                ),
                const SizedBox(height: 16),
                const Text(
                  'Entire Agreement',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'These Terms constitute the entire agreement between LifePill and you in relation to your use of this Website, and supersede all prior agreements and understandings.',
                ),
                const SizedBox(height: 16),
                const Text(
                  'Governing Law & Jurisdiction',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'These Terms will be governed by and interpreted in accordance with the laws of the State of af, and you submit to the non-exclusive jurisdiction of the state and federal courts located in af for the resolution of any disputes.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
