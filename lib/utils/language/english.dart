import 'package:lettutor/utils/language/language.dart';

class English extends Language {
  English() {
    id = 'EN';
  }

  // Login Text
  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get registerQuestion => 'Not a member yet?';

  @override
  String get register => 'Register';

  @override
  String get login => 'Login';

  @override
  String get forgotPassword => 'Forgot Password';

  @override
  String get loginWith => 'Or continue with';

  @override
  String get invalidEmail => 'Email format must be abc@example.com';

  @override
  String get emptyEmail => 'Email cannot be empty';

  @override
  String get passwordTooShort => 'Password must be at least 6 characters';

  @override
  String get emptyPassword => 'Password cannot be empty';

  @override
  String get loginSuccess => 'Login Successfully';
  // Register Text
  @override
  String get alreadyHaveAccount => 'Already have an account?';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get confirmPasswordEmpty => 'Please type your password again';

  @override
  String get confirmPasswordNotMatch => 'Re-typed password does not match';

  @override
  String get registerSuccess => 'Account Created Successfully';

  // Forgot Password Text
  @override
  String get enterEmailToResetPassword =>
      'Please enter your email address to receive recovery email.';

  @override
  String get sendRecoveryEmail => 'Send Recovery Email';

  @override
  String get sendRecoveryEmailSuccess => 'Recovery Email Sent Successfully';

  @override
  String get backToLogin => 'Go back to Login';
  //Text
  @override
  String get language => 'English';
  //Button
  @override
  String get backButton => 'Back';
  //Bottom navigation
  @override
  String get home => 'Home';
  @override
  String get tutor => 'Tutor';
  @override
  String get schedule => 'Schedule';
  @override
  String get course => 'Course';
  @override
  String get setting => 'Setting';
  //setting page
  @override
  String get logoutTitle => 'Do you want to sign out ?';
  @override
  String get ok => 'Sign out';
  @override
  String get editProfile => 'Edit profile';
  @override
  String get viewFeedback => 'View Feedback';
  @override
  String get bookingHistory => 'Booking History';
  @override
  String get courses => 'Courses';
  @override
  String get advancedSetting => 'Advanced Setting';
  @override
  String get becomeTutor => 'Become Tutor';
  @override
  String get website => 'Website';
  @override
  String get logout => 'Logout';
  @override
  String get switchSuccessfully => 'Switch language successfully';
  @override
  String get signoutSuccessfully => "Logout successfully";
  //home page
  @override
  String get seeAll => 'See All';
  @override
  String get recommendTutor => "Tutor recommend";
  @override
  String get upcomingLesson => "Upcoming Leson";
  @override
  String get inRoomButton => "Enter Lesson Room";
  @override
  String get totalTime => "Total Lesson Time";
  @override
  String get hours => "hours";
  @override
  String get minues => "minues";
  //Course page;
  @override
  String get allCourse => "All courses";
  @override
  String get topic => 'Topics';
  @override
  String get level => 'Level';
  @override
  String get courseDetails => 'Course Details';
  //Schedule page;
  @override
  String get upcomming => 'Upcomming';
  @override
  String get history => 'History';
  //topic page;
  @override
  String get noMaterial => 'No material found';
  //account page;
  @override
  String get uploadAvatarSuccessfully => "Upload avatar successfully";
  @override
  String get profile => 'Profile';
  @override
  String get name => 'Name';
  @override
  String get country => 'Country';
  @override
  String get phoneNumber => 'Phone number';
  @override
  String get birthDay => 'Date of birth';
  @override
  String get studySchedule => 'Study Schedule';
  @override
  String get save => 'Save';
  @override
  String get updateSuccess => "Update successully";
  @override
  String get testPreparation => 'Test Preparation';
  //report dialog
  @override
  String get report => "Report";
  @override
  String get reportTitle => "Reason for report";
  @override
  String get reportHint => "Let us know details about your problem";
  @override
  String get annoy => "This tutor is annoying me";
  @override
  String get pretend => 'This profile is pretending to be someone or is fake';
  @override
  String get violate => 'This tutor is violating our policies';
  @override
  String get another => 'Another';
  @override
  String get cancel => 'Cancle';
  @override
  String get reportSuccessfully => "Report was sent successfully.";
  @override
  String get submit => "Submit";
  @override
  String get review => "Review";
  //request dialog
  @override
  String get emptyRequest => 'This reason can not be empty';
  @override
  String get requestTitle => 'Which reason do you want?';
  @override
  String get requestHint => 'Please fill your reason in';
  @override
  String get sendRequestSuccessfully => 'Send request successfully.';
  //date formate
  @override
  String get dateTimeFormat => 'yyyy-MM-dd HH:mm';
  @override
  String get dateFormat => "yyyy-MM-dd";
  //tutor detail;
  @override
  String get noVideo => 'No video introduction';
  @override
  String get favorite => "Favorite";
  @override
  String get tutorDetails => "Tutor Detailss";
  @override
  String get more => 'more';
  @override
  String get less => 'less';
  @override
  String get specialties => 'Specialties';
  //upcomimg card
  @override
  String get requestForReason => "Request for reason";
  @override
  String get noRequest => "No request for this lesson";
  @override
  String get gotoMeeting => "Go to meeting";
  @override
  String get cancelScheduleSuccessfully => 'Cancle schedule successfully';
  @override
  String get deleteDialogTitle => 'Are you sure you want to delete ?';
  //tutor register page
  @override
  String get tutorRegisterTitle => "Tutor Registration";
  @override
  String get videoIntroduction => "Video Introduction";
  @override
  String get approval => "Approval";
  //profile step
  @override
  String get price => 'Price';
  @override
  String get example => 'Example: ';
  @override
  String get requiredField => 'This field must not be empty';
  @override
  String get setupContent =>
      "Your tutor profile is your chance to market yourself to students on Tutoring. You can make edits later on your profile settings page."
      "New students may browse tutor profiles to find a tutor that fits their learning goals and personality. Returning students may use the tutor profiles to find tutors they've had great experiences with already.";
  @override
  String get introduction => "Introduce yourself";
  @override
  String get basicInfo => "Basic information";
  @override
  String get uploadAvatar => 'Upload avatar here...';
  @override
  String get tapToUpload => 'Tap to upload';
  @override
  String get next => "Next";
  @override
  String get uploadPhotoGuidelines =>
      'Please upload a professional photo. See guidelines';
  @override
  String get from => 'I am from';
  @override
  String get profileInfoForStudents =>
      'Students will view this information on your profile to decide if you\'re a good fit for them';
  @override
  String get interests => "Interests";
  @override
  String get privacyWarning =>
      "In order to protect your privacy, please do not share your personal information (email, phone number, social email, skype, etc) in your profile.";
  @override
  String get profileSharePrompt =>
      "Interests, hobbies, memorable life experiences, or anything else you'd like to share!";
  @override
  String get education => "Education";
  @override
  String get educationHint =>
      'Example: "Bachelor of Arts in English from Cambly University; Certified yoga instructor, Second Language Acquisition and Teaching  (SLAT) certificate from Cambly University"';
  @override
  String get experience => "Experience";
  @override
  String get professionInfo => "Current or previous Profession";
  @override
  String get spokenLanguage => 'Language I spoken';
  @override
  String get taughtAudience => 'Who I teach';
  @override
  String get firstImpressionForStudents =>
      'This is the first thing students will see when looking for tutors.';
  @override
  String get mySpecialties => 'My specialities are';
  @override
  String get idealStudentProfile => 'I am best at teaching students who are';
  @override
  get teachingExample =>
      'Example: "I was a doctor for 35 years and can help you practice business or medical English. I also enjoy teaching beginners as I am very patient and always speak slowly and clearly."';
  @override
  String get videoHint =>
      'Let students know what they can expect from a lesson with you by recording a video highlighting your teaching style, expertise and personality. Students can be nervous to speak with a foreigner, so it really helps to have a friendly video that introduces yourself and invites students to call you.';
  @override
  String get tipTitle => 'Maybe follow those steps';
  @override
  String get firstStep => '1. Find a clean and quiet space';
  @override
  String get secondStep => '2. Smile and look at the camera';
  @override
  String get thirdStep => '3. Dress smart';
  @override
  String get fourthStep => '4. Speak for 1-3 minutes';
  @override
  String get fifthStep => '5. Brand yourself and have fun!';

  @override
  String get videoSetup => 'Set up your tutor profile';
  @override
  String get chooseVideo => 'Choose video';
  @override
  String get previous => 'Previous';
  @override
  String get done => 'Done';
  @override
  String get becomeTutorFailed => 'Send request failed';
  //approval step
  @override
  String get stepsCompleted => 'You have done all the steps';
  @override
  String get operatorApprovalWait => "Please, wait for the operator's approval";
  @override
  String get tutorRegistrationSuccess =>
      "Register successfully, wait for approval";
}
