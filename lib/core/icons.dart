// lib/app/core/constants/app_icons.dart
import 'package:flutter/material.dart';

@immutable
class AppIcons {
  // Basic Icons
  static const home = Icons.home;
  static const search = Icons.search;
  static const settings = Icons.settings;
  static const person = Icons.person;
  static const favorite = Icons.favorite;
  static const star = Icons.star;
  static const info = Icons.info;
  static const help = Icons.help;
  static const error = Icons.error;
  static const close = Icons.close;
  static const libraryAddCheck = Icons.library_add_check;

  // Navigation Icons
  static const arrowBack = Icons.arrow_back;
  static const arrowForward = Icons.arrow_forward;
  static const chevronLeft = Icons.chevron_left;
  static const chevronRight = Icons.chevron_right;
  static const menu = Icons.menu;
  static const moreHoriz = Icons.more_horiz;
  static const moreVert = Icons.more_vert;
  static const navigateNext = Icons.navigate_next;
  static const navigateBefore = Icons.navigate_before;
  static const homeFilled = Icons.home_filled;

  // Social Icons
  static const share = Icons.share;
  static const thumbUp = Icons.thumb_up;
  static const thumbDown = Icons.thumb_down;
  static const comment = Icons.comment;
  static const notifications = Icons.notifications;
  static const chat = Icons.chat;
  static const group = Icons.group;
  static const personAdd = Icons.person_add;
  static const personRemove = Icons.person_remove;
  static const addCircle = Icons.add_circle;

  // Media & Communication Icons
  static const movie = Icons.movie;
  static const playArrow = Icons.play_arrow;
  static const pause = Icons.pause;
  static const stop = Icons.stop;
  static const volumeUp = Icons.volume_up;
  static const volumeOff = Icons.volume_off;
  static const skipNext = Icons.skip_next;
  static const skipPrevious = Icons.skip_previous;
  static const mic = Icons.mic;
  static const call = Icons.call;
  static const videoCall = Icons.video_call;

  // Editing & Action Icons
  static const edit = Icons.edit;
  static const delete = Icons.delete;
  static const checkCircle = Icons.check_circle;
  static const removeCircle = Icons.remove_circle;
  static const save = Icons.save;
  static const undo = Icons.undo;
  static const redo = Icons.redo;
  static const copyAll = Icons.copy_all;
  static const paste = Icons.paste;

  // File & Folder Icons
  static const folder = Icons.folder;
  static const insertDriveFile = Icons.insert_drive_file;
  static const cloudUpload = Icons.cloud_upload;
  static const cloudDownload = Icons.cloud_download;
  static const cloud = Icons.cloud;
  static const attachFile = Icons.attach_file;
  static const download = Icons.download;
  static const upload = Icons.upload;
  static const fileCopy = Icons.file_copy;
  static const documentScanner = Icons.document_scanner;

  // Device & System Icons
  static const wifi = Icons.wifi;
  static const bluetooth = Icons.bluetooth;
  static const batteryFull = Icons.battery_full;
  static const signalCellularAlt = Icons.signal_cellular_alt;
  static const screenLockPortrait = Icons.screen_lock_portrait;
  static const lock = Icons.lock;
  static const alarm = Icons.alarm;
  static const locationOn = Icons.location_on;
  static const language = Icons.language;
  static const speaker = Icons.speaker;

  // Food & Drink Icons
  static const fastfood = Icons.fastfood;
  static const localDining = Icons.local_dining;
  static const cake = Icons.cake;
  static const coffee = Icons.coffee;
  static const kitchen = Icons.kitchen;
  static const localPizza = Icons.local_pizza;
  static const localCafe = Icons.local_cafe;
  static const icecream = Icons.icecream;
  static const localBar = Icons.local_bar;

  // Fitness & Health Icons
  static const fitnessCenter = Icons.fitness_center;
  static const accessibility = Icons.accessibility;
  static const directionsRun = Icons.directions_run;
  static const selfImprovement = Icons.self_improvement;
  static const healing = Icons.healing;
  static const spa = Icons.spa;
  static const mood = Icons.mood;
  static const directionsBike = Icons.directions_bike;
  static const pedalBike = Icons.pedal_bike;
  static const emergency = Icons.emergency;
  static const monitorHeart = Icons.monitor_heart;
  static const healthAndSafety = Icons.health_and_safety;

  // Vehicles Icons
  static const electricMoped = Icons.electric_moped;
  static const train = Icons.train;
  static const electricCar = Icons.electric_car;
  static const agriculture = Icons.agriculture;
  static const flightRounded = Icons.flight_rounded;
  static const rocketLaunch = Icons.rocket_launch;

  // Weather & Nature Icons
  static const beachAccess = Icons.beach_access;
  static const nature = Icons.nature;
  static const terrain = Icons.terrain;
  static const localFlorist = Icons.local_florist;
  static const naturePeople = Icons.nature_people;
  static const acUnit = Icons.ac_unit;
  static const umbrella = Icons.umbrella;
  static const cloudySnowing = Icons.cloudy_snowing;
  static const storm = Icons.storm;

  // Shopping & Finance Icons
  static const shoppingCart = Icons.shopping_cart;
  static const accountBalanceWallet = Icons.account_balance_wallet;
  static const attachMoney = Icons.attach_money;
  static const creditCard = Icons.credit_card;
  static const store = Icons.store;
  static const redeem = Icons.redeem;
  static const moneyOff = Icons.money_off;
  static const monetizationOn = Icons.monetization_on;
  static const accountBalance = Icons.account_balance;
  static const payment = Icons.payment;
  static const localActivity = Icons.local_activity;

  // Miscellaneous Icons
  static const work = Icons.work;
  static const add = Icons.add;
  static const remove = Icons.remove;
  static const refresh = Icons.refresh;
  static const loop = Icons.loop;
  static const today = Icons.today;
  static const calendarToday = Icons.calendar_today;
  static const accessAlarm = Icons.access_alarm;
  static const alarmOn = Icons.alarm_on;
  static const event = Icons.event;
  static const category = Icons.category;
  static const sportsEsports = Icons.sports_esports;
  static const widgets = Icons.widgets;
  static const brush = Icons.brush;
  static const newspaperOutlined = Icons.newspaper_outlined;
  static const school = Icons.school;
  static const block = Icons.block;

  static const Map<String, List<IconData>> categoryIcons = {
    'Basic': [
      home,
      search,
      settings,
      person,
      favorite,
      star,
      info,
      help,
      error,
      close,
      libraryAddCheck
    ],
    'Navigation': [
      arrowBack,
      arrowForward,
      chevronLeft,
      chevronRight,
      menu,
      moreHoriz,
      moreVert,
      navigateNext,
      navigateBefore,
      homeFilled
    ],
    'Social': [
      share,
      thumbUp,
      thumbDown,
      comment,
      notifications,
      chat,
      group,
      personAdd,
      personRemove,
      addCircle
    ],
    'Media & Communication': [
      movie,
      playArrow,
      pause,
      stop,
      volumeUp,
      volumeOff,
      skipNext,
      skipPrevious,
      mic,
      call,
      videoCall
    ],
    'Editing & Action': [
      edit,
      delete,
      checkCircle,
      addCircle,
      removeCircle,
      save,
      undo,
      redo,
      copyAll,
      paste
    ],
    'File & Folder': [
      folder,
      insertDriveFile,
      cloudUpload,
      cloudDownload,
      cloud,
      attachFile,
      download,
      upload,
      fileCopy,
      documentScanner
    ],
    'Device & System': [
      wifi,
      bluetooth,
      batteryFull,
      signalCellularAlt,
      screenLockPortrait,
      lock,
      alarm,
      locationOn,
      language,
      speaker
    ],
    'Food & Drink': [
      fastfood,
      localDining,
      cake,
      coffee,
      kitchen,
      localPizza,
      localCafe,
      icecream,
      localBar
    ],
    'Fitness & Health': [
      fitnessCenter,
      accessibility,
      directionsRun,
      selfImprovement,
      healing,
      spa,
      mood,
      directionsBike,
      pedalBike,
      emergency,
      monitorHeart,
      healthAndSafety
    ],
    'Vehicles': [
      electricMoped,
      train,
      electricCar,
      agriculture,
      flightRounded,
      rocketLaunch
    ],
    'Weather & Nature': [
      cloud,
      beachAccess,
      nature,
      terrain,
      localFlorist,
      naturePeople,
      acUnit,
      umbrella,
      cloudySnowing,
      storm
    ],
    'Shopping & Finance': [
      shoppingCart,
      accountBalanceWallet,
      attachMoney,
      creditCard,
      store,
      redeem,
      moneyOff,
      monetizationOn,
      accountBalance,
      payment,
      localActivity
    ],
    'Miscellaneous': [
      work,
      add,
      remove,
      refresh,
      loop,
      today,
      calendarToday,
      accessAlarm,
      alarmOn,
      event,
      category,
      sportsEsports,
      widgets,
      brush,
      newspaperOutlined,
      school,
      block
    ],
  };

  static const Map<String, IconData> iconMap = {
    'home': home,
    'search': search,
    'settings': settings,
    'person': person,
    'favorite': favorite,
    'star': star,
    'info': info,
    'help': help,
    'error': error,
    'close': close,
    'library_add_check': libraryAddCheck,
    'arrow_back': arrowBack,
    'arrow_forward': arrowForward,
    'chevron_left': chevronLeft,
    'chevron_right': chevronRight,
    'menu': menu,
    'more_horiz': moreHoriz,
    'more_vert': moreVert,
    'navigate_next': navigateNext,
    'navigate_before': navigateBefore,
    'home_filled': homeFilled,
    'share': share,
    'thumb_up': thumbUp,
    'thumb_down': thumbDown,
    'comment': comment,
    'notifications': notifications,
    'chat': chat,
    'group': group,
    'person_add': personAdd,
    'person_remove': personRemove,
    'add_circle': addCircle,
    'movie': movie,
    'play_arrow': playArrow,
    'pause': pause,
    'stop': stop,
    'volume_up': volumeUp,
    'volume_off': volumeOff,
    'skip_next': skipNext,
    'skip_previous': skipPrevious,
    'mic': mic,
    'call': call,
    'video_call': videoCall,
    'edit': edit,
    'delete': delete,
    'check_circle': checkCircle,
    'remove_circle': removeCircle,
    'save': save,
    'undo': undo,
    'redo': redo,
    'copy_all': copyAll,
    'paste': paste,
    'folder': folder,
    'insert_drive_file': insertDriveFile,
    'cloud_upload': cloudUpload,
    'cloud_download': cloudDownload,
    'cloud': cloud,
    'attach_file': attachFile,
    'download': download,
    'upload': upload,
    'file_copy': fileCopy,
    'document_scanner': documentScanner,
    'wifi': wifi,
    'bluetooth': bluetooth,
    'battery_full': batteryFull,
    'signal_cellular_alt': signalCellularAlt,
    'screen_lock_portrait': screenLockPortrait,
    'lock': lock,
    'alarm': alarm,
    'location_on': locationOn,
    'language': language,
    'speaker': speaker,
    'fastfood': fastfood,
    'local_dining': localDining,
    'cake': cake,
    'coffee': coffee,
    'kitchen': kitchen,
    'local_pizza': localPizza,
    'local_cafe': localCafe,
    'icecream': icecream,
    'local_bar': localBar,
    'fitness_center': fitnessCenter,
    'accessibility': accessibility,
    'directions_run': directionsRun,
    'self_improvement': selfImprovement,
    'healing': healing,
    'spa': spa,
    'mood': mood,
    'directions_bike': directionsBike,
    'pedal_bike': pedalBike,
    'emergency': emergency,
    'monitor_heart': monitorHeart,
    'health_and_safety': healthAndSafety,
    'electric_moped': electricMoped,
    'train': train,
    'electric_car': electricCar,
    'agriculture': agriculture,
    'flight_rounded': flightRounded,
    'rocket_launch': rocketLaunch,
    'beach_access': beachAccess,
    'nature': nature,
    'terrain': terrain,
    'local_florist': localFlorist,
    'nature_people': naturePeople,
    'ac_unit': acUnit,
    'umbrella': umbrella,
    'cloudy_snowing': cloudySnowing,
    'storm': storm,
    'shopping_cart': shoppingCart,
    'account_balance_wallet': accountBalanceWallet,
    'attach_money': attachMoney,
    'credit_card': creditCard,
    'store': store,
    'redeem': redeem,
    'money_off': moneyOff,
    'monetization_on': monetizationOn,
    'account_balance': accountBalance,
    'payment': payment,
    'local_activity': localActivity,
    'work': work,
    'add': add,
    'remove': remove,
    'refresh': refresh,
    'loop': loop,
    'today': today,
    'calendar_today': calendarToday,
    'access_alarm': accessAlarm,
    'alarm_on': alarmOn,
    'event': event,
    'category': category,
    'sports_esports': sportsEsports,
    'widgets': widgets,
    'brush': brush,
    'newspaper_outlined': newspaperOutlined,
    'school': school,
    'block': block,
  };

  static IconData getIconFromString(String iconString) {
    // Try direct mapping first
    if (iconMap.containsKey(iconString)) {
      return iconMap[iconString]!;
    }

    // Try to clean the icon string
    final cleanIconString =
        iconString.replaceAll('Icons.', '').replaceAll(' ', '_').toLowerCase();

    // Look for a case-insensitive match
    final matchingKey = iconMap.keys.firstWhere(
      (key) => key.toLowerCase() == cleanIconString,
      orElse: () => 'category',
    );

    return iconMap[matchingKey]!;
  }

  static String getIconString(IconData icon) {
    final entry = iconMap.entries.firstWhere(
      (entry) => entry.value == icon,
      orElse: () => const MapEntry('category', category),
    );
    return entry.key;
  }
}
