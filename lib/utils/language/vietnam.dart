import 'package:lettutor/utils/language/language.dart';

class Vietnamese extends Language {
  Vietnamese() {
    id = 'VI';
  }
  // Login Text
  @override
  String get email => 'Email';

  @override
  String get password => 'Mật khẩu';

  @override
  String get registerQuestion => 'Chưa có tài khoản?';

  @override
  String get register => 'Đăng ký';

  @override
  String get login => 'Đăng nhập';

  @override
  String get forgotPassword => 'Quên mật khẩu';

  @override
  String get loginWith => 'Hoặc đăng nhập bằng';

  @override
  String get invalidEmail => 'Email phải có dạng abc@example.com';

  @override
  String get emptyEmail => 'Vui lòng nhập Email';

  @override
  String get loginSuccess => 'Đăng nhập thành công';

  @override
  String get passwordTooShort => 'Mật khẩu phải có ít nhất 6 ký tự';

  @override
  String get emptyPassword => 'Vui lòng nhập mật khẩu';

  @override
  String get registerSuccess => 'Tạo tài khoản thành công';

  // Register Text
  @override
  String get alreadyHaveAccount => 'Đã có tài khoản?';

  @override
  String get confirmPassword => 'Nhập lại mật khẩu';

  @override
  String get confirmPasswordEmpty => 'Vui lòng nhập lại mật khẩu';

  @override
  String get confirmPasswordNotMatch => 'Mật khẩu không khớp';

  // Forgot Password Text
  @override
  String get enterEmailToResetPassword =>
      'Vui lòng nhập địa chỉ email của bạn để nhận email đặt lại mật khẩu';

  @override
  String get sendRecoveryEmail => 'Gửi Email';

  @override
  String get sendRecoveryEmailSuccess =>
      'Gửi Email đặt lại mật khẩu thành công';

  @override
  String get backToLogin => 'Quay về đăng nhập';
  //Text
  @override
  String get language => 'Việt Nam';
  //Button
  @override
  String get backButton => 'Quay về';
  //Bottom naviagation
  @override
  String get home => 'Trang chủ';
  @override
  String get tutor => 'Giáo viên';
  @override
  String get schedule => 'Lịch';
  @override
  String get course => 'Khóa học';
  @override
  String get setting => 'Cài đặt';
  //setting page
  @override
  String get logoutTitle => 'Bạn chắc chắn muốn thoát không ?';
  @override
  String get ok => 'Thoát';
  @override
  String get editProfile => 'Chỉnh Sửa';
  @override
  String get viewFeedback => 'Xem Đánh Giá';
  @override
  String get bookingHistory => 'Lịch Sử';
  @override
  String get courses => 'Khóa học';
  @override
  String get advancedSetting => 'Cài đặt Nâng cao';
  @override
  String get becomeTutor => 'Đăng Ký Giáo Viên';
  @override
  String get website => 'Website';
  @override
  String get logout => 'Đăng xuất';
  @override
  String get switchSuccessfully => 'Chuyển đổi ngôn ngữ thành công';
  @override
  String get signoutSuccessfully => "Đăng xuất thành công";
  //home page
  @override
  String get seeAll => 'Xem tất cả';
  @override
  String get recommendTutor => "Đề xuất giáo viên";
  @override
  String get upcomingLesson => "Lịch học kế tiếp";
  @override
  String get inRoomButton => "Vào phòng học";
  @override
  String get totalTime => "Tổng thời gian";
  @override
  String get hours => "Giờ";
  @override
  String get minues => "Phút";
  //Course page;
  @override
  String get allCourse => 'Tất cả khóa học';
  @override
  String get topic => 'Chủ đề';
  @override
  String get level => 'Cấp độ';
  @override
  String get courseDetails => 'Chi tiết khóa học';
  //Schedule page;
  @override
  String get upcomming => 'Sắp đến';
  @override
  String get history => 'Lịch sử';
  //Topic page
  @override
  String get noMaterial => 'Không có tài liệu';
  //account page;
  @override
  String get uploadAvatarSuccessfully => 'Cập nhật ảnh thành công';
  @override
  String get profile => 'Tài khoản';
  @override
  String get name => 'Họ tên';
  @override
  String get country => 'Quốc gia';
  @override
  String get phoneNumber => 'Số điện thoại';
  @override
  String get birthDay => 'Ngày sinh';
  @override
  String get studySchedule => 'Study Schedule';
  @override
  String get save => 'Lưu';
  @override
  String get testPreparation => 'Loại bằng';
  @override
  String get updateSuccess => "Cập nhật thành công";
  //report dialog
  @override
  String get report => "Báo cáo";
  @override
  String get reportTitle => "Lý do báo cáo";
  @override
  String get reportHint => "Cho chúng tôi biết về vấn đề của bạn";
  @override
  String get annoy => "Giáo viên này làm phiền tôi";
  @override
  String get pretend => 'Hồ sơ này giả mạo';
  @override
  String get violate => 'Giáo viên vi phạm chính sách';
  @override
  String get another => 'Lý do khác';
  @override
  String get cancel => 'Hủy';
  @override
  String get reportSuccessfully => "Báo cáo gửi thành công.";
  @override
  String get submit => "Gửi";
  //review dialog
  @override
  String get review => "Phản hồi";
  //request dialog
  @override
  String get emptyRequest => 'Vui lòng điền lý do';
  @override
  String get requestTitle => 'Yêu cầu của bạn là gì ?';
  @override
  String get requestHint => 'Nhập yêu cầu';
  @override
  String get sendRequestSuccessfully => 'Gửi yêu cầu thành công.';
  //date format
  @override
  String get dateTimeFormat => 'dd-MM-yyyy HH:mm';
  @override
  String get dateFormat => "dd-MM-yyyy";
  //tutor details
  @override
  String get noVideo => "Không có video giới thiệu";
  @override
  String get favorite => "Yêu thích";
  @override
  String get tutorDetails => "Chi tiết giáo viên";
  @override
  String get more => 'thêm';
  @override
  String get less => 'ẩn bớt';
  @override
  String get specialties => 'Chuyên môn';
  //upcoming card
  @override
  String get requestForReason => "Yêu cầu lý do";
  @override
  String get noRequest => "Không có yêu cầu cho bài học";
  @override
  String get gotoMeeting => "Đi đến buổi học";
  @override
  String get cancelScheduleSuccessfully => "Hủy thành công";
  @override
  String get deleteDialogTitle => "Bạn chắc chắn muốn xóa không ?";
  //tutor register page
  @override
  String get tutorRegisterTitle => "Đăng ký giáo viên";
  @override
  String get videoIntroduction => "Video giới thiệu";
  @override
  String get approval => "Chấp nhận";
  //profile step;
  @override
  String get price => "Lệ phí";
  @override
  String get example => 'Ví dụ: ';
  @override
  String get requiredField => 'Vui lòng điền thông tin';
  @override
  String get setupContent =>
      "Hồ sơ gia sư của bạn là cơ hội để bạn tiếp thị bản thân với học sinh trên Dạy kèm. Bạn có thể chỉnh sửa sau trên trang cài đặt hồ sơ của mình."
      "Học viên mới có thể duyệt hồ sơ gia sư để tìm gia sư phù hợp với mục tiêu học tập và tính cách của mình. Học viên cũ có thể sử dụng hồ sơ gia sư để tìm gia sư mà họ đã có trải nghiệm tuyệt vời.";
  @override
  String get introduction => "Giới thiệu bản thân";
  @override
  String get basicInfo => "Thông tin cá nhân";
  @override
  String get uploadAvatar => 'Thêm ảnh ở đây...';
  @override
  String get tapToUpload => 'Vuốt đê thêm ảnh';
  @override
  String get next => "Tiếp tục";
  @override
  String get uploadPhotoGuidelines =>
      'Vui lòng tải lên một bức ảnh chuyên nghiệp. Xem hướng dẫn';
  @override
  String get from => 'Tôi đến từ';
  @override
  String get profileInfoForStudents =>
      'Học sinh sẽ xem thông tin này trên hồ sơ của bạn để quyết định xem bạn có phù hợp với họ không';
  @override
  String get interests => "Sở thích";
  @override
  String get privacyWarning =>
      "Để bảo vệ quyền riêng tư của bạn, vui lòng không chia sẻ thông tin cá nhân của bạn (email, số điện thoại, email xã hội, Skype, v.v.) trong hồ sơ của bạn.";
  @override
  String get profileSharePrompt =>
      "Sở thích, sở thích, trải nghiệm cuộc sống đáng nhớ hoặc bất kỳ điều gì khác mà bạn muốn chia sẻ!";
  @override
  String get education => "Giáo dục";
  @override
  String get educationHint =>
      'Ví dụ: "Cử nhân Văn học bằng tiếng Anh của Đại học Cambly; Người hướng dẫn yoga được chứng nhận, chứng chỉ Giảng dạy và Tiếp thu Ngôn ngữ Thứ hai (SLAT) của Đại học Cambly"';
  @override
  String get experience => "Kinh nghiệm";
  @override
  String get professionInfo => "Công việc hiện tại hoặc trước đây";
  @override
  String get spokenLanguage => 'Ngôn ngữ dạy';
  @override
  String get taughtAudience => 'Chủ đề tôi dạy';
  @override
  String get firstImpressionForStudents =>
      'Đây là điều đầu tiên học viên sẽ nhìn thấy khi tìm gia sư.';
  @override
  String get mySpecialties => 'Chuyên môn là';
  @override
  String get idealStudentProfile =>
      'Tôi giỏi nhất trong việc dạy những học sinh';
  @override
  get teachingExample =>
      'Ví dụ: "Tôi đã là bác sĩ trong 35 năm và có thể giúp bạn thực hành tiếng Anh thương mại hoặc y tế. Tôi cũng thích dạy những người mới bắt đầu vì tôi rất kiên nhẫn và luôn nói chậm và rõ ràng."';
  @override
  String get videoHint =>
      'Cho học sinh biết những gì họ có thể mong đợi từ một bài học với bạn bằng cách quay video nêu bật phong cách giảng dạy, chuyên môn và cá tính của bạn. Học sinh có thể lo lắng khi nói chuyện với người nước ngoài, vì vậy sẽ thực sự hữu ích khi có một video thân thiện giới thiệu bản thân và mời học sinh gọi cho bạn';
  @override
  String get tipTitle => 'Có thể theo dõi các bước sau';
  @override
  String get firstStep => '1. Tìm một không gian sạch sẽ và yên tĩnh';
  @override
  String get secondStep => '2. Cười và nhìn vào camera';
  @override
  String get thirdStep => '3. Ăn mặc lịch sự';
  @override
  String get fourthStep => '4. Nói trong 1-3 phút';
  @override
  String get fifthStep =>
      '5. Hãy xây dựng thương hiệu cho bản thân và tận hưởng niềm vui!';
  @override
  String get videoSetup => 'Thiết lập hồ sơ của bạn';
  @override
  String get chooseVideo => 'Chọn video';
  @override
  String get previous => 'Quay lui';
  @override
  String get done => 'Hoàn thành';
  @override
  String get becomeTutorFailed => 'Gửi yêu cầu thất bại';
  //approval step
  @override
  String get stepsCompleted => 'Bạn đã thực hiện tất cả các bước';
  @override
  String get operatorApprovalWait =>
      "Xin vui lòng chờ sự chấp thuận của nhà điều hành";
  @override
  String get tutorRegistrationSuccess =>
      "Đăng ký thành công, chờ đợi phê duyệt";
}
