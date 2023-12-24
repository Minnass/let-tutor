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
}
