import 'package:vexana/vexana.dart';

import '../../constants/app_constants.dart';

class VexanaManager extends NetworkManager {
  VexanaManager()
      : super(
            options: BaseOptions(
              baseUrl: AppConstants.baseUrl,
              followRedirects: true,
            ),
            isEnableLogger: true,
            isEnableTest: true);
}
