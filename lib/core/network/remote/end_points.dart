// ignore_for_file: non_constant_identifier_names

String BASE_URL = 'https://jobsstudios.com/api/';

String SIGN_IN = 'login';
String SIGN_UP = 'register';
String LOGOUT = 'logout';

String FORGET_CHECK = 'send-otp';
String FORGET_OTP = 'validate-otp';
String FORGET_RESET = 'reset-password';

String IDENTIFIER = 'informative-page';

String CONTACT_US = 'contact';

String COMMUNITIES = 'communities';

String COMMUNITY(int communityId) => '$COMMUNITIES/$communityId';

String POSTS = 'communities/posts';

String GET_DEPARTMENTS = 'departments';

String GET_DEPARTMENT_FIELDS(int departmentId) =>
    'department/$departmentId/fields';

String PROFILE = 'profile';

String HOME = 'home';

String COUNTRIES = 'locations/countries';

String CITIES(int countryId) => 'locations/countries/$countryId/cities';

String AREAS(int cityId) => 'locations/cities/$cityId/areas';

String STORE_PERSONAL_INFORMATION = 'cv/personal-info';

String GET_PERSONAL_INFORMATION = 'cv/section?name=personal-info';

String STORE_EDUCATION = 'cv/education';

String GET_EDUCATIONS = 'cv/section?name=education';

String STORE_EXPERIENCE = 'cv/experience';

String GET_EXPERIENCES = 'cv/section?name=experience';

String STORE_LANGUAGE = 'cv/languages';

String GET_LANGUAGES = 'cv/section?name=languages';

String STORE_SKILLS = 'cv/skills';

String GET_SKILLS = 'cv/section?name=skills';

String GET_SYSTEM_SKILLS = 'skills';

String DELETE_SECTION_ITEM = 'cv/delete';

String UPDATE_PROFILE = 'employee/complete-profile';

String CHANGE_PASSWORD = 'change-password';

String DELETE_ACCOUNT = 'delete-account';

String ADD_BOOKMARK = 'bookmarks';
String SHOW_ALL_BOOKMARK = 'bookmarks';
String DELETE_BOOKMARK(int bookmarkId) => '$SHOW_ALL_BOOKMARK/$bookmarkId';

String JOBS = 'jobs';
String MY_APPLICATIONS = '$JOBS/my-applications';

String JOB(int id) => '$JOBS/$id ';

String Apply_JOB(int id) => '$JOBS/$id/apply';
