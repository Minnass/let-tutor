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
  String get favorite => "Favorite";
  @override
  String get tutorDetails => "Tutor Detailss";
  @override
  String get more => 'more';
  @override
  String get less => 'less';
}
