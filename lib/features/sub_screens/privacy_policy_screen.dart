import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
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
                  'Privacy Policy for LifePill',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Introduction',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'LifePill is committed to protecting your privacy online. This Privacy Policy endeavours to describe to you our practices regarding the personal information we collect from users on our website, located at LifePill (the “Site”), and the services offered through the Site. If you have any questions about our Privacy Policy, our collection practices, the processing of user information, or if you would like to report a security violation to us directly, please contact us at help@LifePill',
                ),
                const SizedBox(height: 8),
                const Text(
                  'Please read this policy in conjunction with the Freestar Privacy Policy.',
                ),
                const SizedBox(height: 16),
                const Text(
                  'What Data We Collect',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'General Data: The use of our services will automatically create information that will be collected. For example, when you use our Services, your geographic location, how you use the Services, information about the type of device you use, your Open Device Identification Number, date/time stamps for your visit, your unique device identifier, your browser type, operating system, Internet Protocol (IP) address, and domain name are all collected. This information is generally used to help us deliver the most relevant information to you and administer and improve the Site.',
                ),
                const SizedBox(height: 8),
                const Text(
                  'Log Files: As is true of most websites, we gather certain information automatically and store it in log files. This information includes IP addresses, browser type, Internet service provider (ISP), referring/exit pages, operating system, date/time stamp, and clickstream data. We use this information to maintain and improve the performance of the Services.',
                ),
                const SizedBox(height: 8),
                const Text(
                  'Analytics: We use analytics services (including, but not limited to, Google Analytics) to help analyze how users use the Site. Analytics services use Cookies to collect information such as how often users visit the Site and we use the information to improve our Site and Services. The analytics services\' ability to use and share information collected by them is restricted by their terms of use and privacy policy, which you should refer to for more information about how these entities use this information.',
                ),
                const SizedBox(height: 8),
                const Text(
                  'Location Information: If you have enabled location services on your mobile device, we may collect your location information to improve the Services we offer. If you do not want this information collected, you can disable location services on your device.',
                ),
                const SizedBox(height: 8),
                const Text(
                  'Cookies: “Cookies” are small pieces of information (text files) that a website sends to your computer’s hard drive while you are viewing the website. These text files can be used by websites to make the users experience more efficient. The law states that we can store these cookies on your device if they are strictly necessary for the operation of this site. For all other types of cookies we need your permission. To that end, this site uses different types of cookies. Some cookies are placed by third party services that appear on our pages. We and some third parties may use both session Cookies (which expire once you close your web browser) and persistent Cookies (which stay on your computer until you delete them) to provide you with a more personal and interactive experience on our Services and to market the Services or other products. Marketing cookies are used to track visitors across websites. The intention is to display ads that are relevant and engaging for the individual user and thereby more valuable for publishers and third party advertisers. This tracking is done on an anonymous basis and, while not an exhaustive list, some of the companies we work with are Google, AppNexus, Criteo, Rubicon, Pubmatic and DistrictM. To learn more about this practice, including the Self Regulatory Principles for Online Advertising, to which we adhere, you can visit www.aboutads.info/choices, optout.networkadvertising.org and www.youronlinechoices.com',
                ),
                const SizedBox(height: 16),
                const Text(
                  'Use of Your Personal information',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'In general, personal information you submit to us is used either to respond to requests that you make, aid us in serving you better, or market our Services. We use your personal information in the following ways:',
                ),
                const SizedBox(height: 8),
                const Text(
                  '- Operate, maintain, and improve our site(s), products, and services;',
                ),
                const Text(
                  '- Respond to comments and questions and provide customer service;',
                ),
                const Text(
                  '- Link or combine user information with other personal information we get from third parties, to help understand your needs and provide you with better service;',
                ),
                const Text(
                  '- Develop, improve, and deliver marketing and advertising for the Services;',
                ),
                const Text(
                  '- Provide and deliver products and services you request;',
                ),
                const Text(
                  '- Identify you as a user in our system;',
                ),
                const SizedBox(height: 8),
                const Text(
                  'We may store and process your personal information on servers located in both the United States and Europe. We may also create anonymous data records from your personal information by completely excluding information (such as your name) that makes the data personally identifiable to you. We use this anonymous data to analyze request and usage patterns so that we may enhance the content of our Services and improve Site functionality. We reserve the right to use anonymous data for any purpose and disclose anonymous data to third parties at our sole discretion.',
                ),
                const SizedBox(height: 8),
                const Text(
                  'We may receive testimonials and comments from users who have had positive experiences with our Services. We may publish such content. When we publish this content, we may identify our users by their first and last name. We obtain the user\'s consent prior to posting this information along with the testimonial.',
                ),
                const SizedBox(height: 16),
                const Text(
                  'Disclosure of Your Personal information',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'We disclose your personal information as described below and as described elsewhere in this Privacy Policy.',
                ),
                const SizedBox(height: 8),
                const Text(
                  'Third Parties Designated by You: When you use the Services, the personal information you provide will be shared with the third parties that you authorize to receive such information.',
                ),
                const SizedBox(height: 8),
                const Text(
                  'Third Party Service Providers: We may share your personal information with third party service providers to: provide you with the Services that we offer you through our Services; conduct quality assurance testing; to provide technical support; market the Services; and/or to provide other services to us.',
                ),
                const SizedBox(height: 8),
                const Text(
                  'Information We Share: We may disclose aggregated information about our users and information that does not identify any individual without restriction. In addition, we may disclose personal information that we collect or you provide:',
                ),
                const SizedBox(height: 8),
                const Text(
                  '- To fulfill the purpose for which you provide it, for any other purpose disclosed by us when you provide the information, or with your consent;',
                ),
                const Text(
                  '- To third parties designated by you;',
                ),
                const Text(
                  '- With our subsidiaries and affiliates;',
                ),
                const Text(
                  '- To third parties to process payments made through the Services;',
                ),
                const Text(
                  '- With contractors, service providers and other third parties we use to support our business;',
                ),
                const Text(
                  '- To a buyer or other successor in the event of a merger, divestiture, restructuring, reorganization, dissolution or other sale or transfer of some or all of our assets, whether as a going concern or as part of bankruptcy, liquidation or similar proceeding, in which personal information held by us about users is among the assets transferred;',
                ),
                const Text(
                  '- Regardless of any choices you make regarding your Personal information (as described below), LifePill may disclose Personal information if it believes in good faith that such disclosure is necessary: (i) in connection with any legal investigation; (ii) to comply with relevant laws or to respond to subpoenas or warrants served on our company; (iii) to protect or defend the rights or property of LifePill or users of the Services; and/or (iv) to investigate or assist in preventing any violation or potential violation of the law, this Privacy Policy, or our Terms of Use.',
                ),
                const SizedBox(height: 16),
                const Text(
                  'Third Party Websites',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Our Site may contain links to third party websites. When you click on a link to any other website or location, you will leave our Site or Services and go to another site, and another entity may collect personal information or anonymous data from you. We have no control over, do not review, and are not responsible for, these outside websites or their content. Please be aware that the terms of this Privacy Policy do not apply to these outside websites or content, or to any collection of your personal information after you click on links to such outside websites. We encourage you to read the privacy policies of every website you visit. The links to third party websites or locations are for your convenience and do not signify our endorsement of such third parties or their products, content or websites.',
                ),
                const SizedBox(height: 16),
                const Text(
                  'Your Choices Regarding Information',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Choices: We offer you choices regarding the collection, use, and sharing of your personal information. We may periodically send you emails that directly promote the use of our Services. When you receive promotional communications from us, you may indicate a preference to stop receiving further communications from us and you will have the opportunity to “opt-out” by following the unsubscribe instructions provided in the email you receive or by contacting us directly. Despite your indicated email preferences, we may send you service related communications, including notices of any updates to our Terms of Use or Privacy Policy.',
                ),
                const SizedBox(height: 8),
                const Text(
                  'Cookies: If you decide at any time that you no longer wish to accept cookies from our Services for any of the purposes described above, then you can instruct your browser, by changing its settings, to stop accepting cookies or to prompt you before accepting a cookie from the websites you visit. Consult your browser’s technical information. If you do not accept cookies, however, you may not be able to use all portions of the Services or all functionality of the Services. If you have any questions about how to disable or modify cookies, please contact us at help@LifePill',
                ),
                const SizedBox(height: 16),
                const Text(
                  'Young People',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Our Services are not directed to children under the age of 13. If a child under 13 submits personal information to us and we learn that this is the case, we will take steps to remove the personal information from our databases. If you believe that we might have any personal information from a child under 13, please contact us at help@LifePill',
                ),
                const SizedBox(height: 16),
                const Text(
                  'Your Rights',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'As a user of our site you have the following rights, any of which you may exercise by contacting us at help@LifePill',
                ),
                const SizedBox(height: 8),
                const Text(
                  '- The right to ask what personal data that we hold about you at any time. Extra requests (particularly repetitive) for data may result in a fee being charged to the user.',
                ),
                const Text(
                  '- The right to ask us to update and correct any out-of-date or incorrect personal data that we hold about you free of charge.',
                ),
                const Text(
                  '- As set out above, the right to opt out of any marketing communications that we may send you.',
                ),
                const SizedBox(height: 8),
                const Text(
                  'Further information regarding your rights can be found under: https://ico.org.uk/for-organisations/guide-to-the-general-data-protection-regulation-gdpr/individual-rights/',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
