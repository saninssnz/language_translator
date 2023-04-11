class UtilFunctions{

  static final _langs = {
    'af': 'Afrikaans',
    'sq': 'Albanian',
    'am': 'Amharic',
    'ar': 'Arabic',
    'hy': 'Armenian',
    'az': 'Azerbaijani',
    'eu': 'Basque',
    'be': 'Belarusian',
    'bn': 'Bengali',
    'bs': 'Bosnian',
    'bg': 'Bulgarian',
    'ca': 'Catalan',
    'ceb': 'Cebuano',
    'ny': 'Chichewa',
    'zh-cn': 'Chinese Simplified',
    'zh-tw': 'Chinese Traditional',
    'co': 'Corsican',
    'hr': 'Croatian',
    'cs': 'Czech',
    'da': 'Danish',
    'nl': 'Dutch',
    'en': 'English',
    'eo': 'Esperanto',
    'et': 'Estonian',
    'tl': 'Filipino',
    'fi': 'Finnish',
    'fr': 'French',
    'fy': 'Frisian',
    'gl': 'Galician',
    'ka': 'Georgian',
    'de': 'German',
    'el': 'Greek',
    'gu': 'Gujarati',
    'ht': 'Haitian Creole',
    'ha': 'Hausa',
    'haw': 'Hawaiian',
    'iw': 'Hebrew',
    'hi': 'Hindi',
    'hmn': 'Hmong',
    'hu': 'Hungarian',
    'is': 'Icelandic',
    'ig': 'Igbo',
    'id': 'Indonesian',
    'ga': 'Irish',
    'it': 'Italian',
    'ja': 'Japanese',
    'jw': 'Javanese',
    'kn': 'Kannada',
    'kk': 'Kazakh',
    'km': 'Khmer',
    'ko': 'Korean',
    'ku': 'Kurdish (Kurmanji)',
    'ky': 'Kyrgyz',
    'lo': 'Lao',
    'la': 'Latin',
    'lv': 'Latvian',
    'lt': 'Lithuanian',
    'lb': 'Luxembourgish',
    'mk': 'Macedonian',
    'mg': 'Malagasy',
    'ms': 'Malay',
    'ml': 'Malayalam',
    'mt': 'Maltese',
    'mi': 'Maori',
    'mr': 'Marathi',
    'mn': 'Mongolian',
    'my': 'Myanmar (Burmese)',
    'ne': 'Nepali',
    'no': 'Norwegian',
    'ps': 'Pashto',
    'fa': 'Persian',
    'pl': 'Polish',
    'pt': 'Portuguese',
    'pa': 'Punjabi',
    'ro': 'Romanian',
    'ru': 'Russian',
    'sm': 'Samoan',
    'gd': 'Scots Gaelic',
    'sr': 'Serbian',
    'st': 'Sesotho',
    'sn': 'Shona',
    'sd': 'Sindhi',
    'si': 'Sinhala',
    'sk': 'Slovak',
    'sl': 'Slovenian',
    'so': 'Somali',
    'es': 'Spanish',
    'su': 'Sundanese',
    'sw': 'Swahili',
    'sv': 'Swedish',
    'tg': 'Tajik',
    'ta': 'Tamil',
    'te': 'Telugu',
    'th': 'Thai',
    'tr': 'Turkish',
    'uk': 'Ukrainian',
    'ur': 'Urdu',
    'uz': 'Uzbek',
    'ug': 'Uyghur',
    'vi': 'Vietnamese',
    'cy': 'Welsh',
    'xh': 'Xhosa',
    'yi': 'Yiddish',
    'yo': 'Yoruba',
    'zu': 'Zulu'
  };

  static String getLanguageType(String lang) {
    String? language;
    if (lang == "af") {
      language = "Afrikaans";
    } else if (lang == "sq") {
      language = "Albanian";
    } else if (lang == "am") {
      language = "Amharic";
    }else if (lang == "ar") {
      language = "Arabic";
    }else if (lang == "hy") {
      language = "Armenian";
    }else if (lang == "az") {
      language = "Azerbaijani";
    }else if (lang == "eu") {
      language = "Basque";
    }else if (lang == "be") {
      language = "Belarusian";
    }else if (lang == "bn") {
      language = "Bengali";
    }else if (lang == "bs") {
      language = "Bosnian";
    }else if (lang == "bg") {
      language = "Bulgarian";
    }else if (lang == "ca") {
      language = "Catalan";
    }else if (lang == "ceb") {
      language = "Cebuano";
    }else if (lang == "ny") {
      language = "Chichewa";
    }else if (lang == "zh-cn") {
      language = "Chinese Simplified";
    }else if (lang == "zh-tw") {
      language = "Chinese Traditional";
    }else if (lang == "co") {
      language = "Corsican";
    }else if (lang == "hr") {
      language = "Croatian";
    }else if (lang == "cs") {
      language = "Czech";
    }else if (lang == "da") {
      language = "Danish";
    }else if (lang == "nl") {
      language = "Dutch";
    }else if (lang == "en") {
      language = "English";
    }else if (lang == "eo") {
      language = "Esperanto";
    }else if (lang == "et") {
      language = "Estonian";
    }else if (lang == "tl") {
      language = "Filipino";
    }else if (lang == "fi") {
      language = "Finnish";
    }else if (lang == "fr") {
      language = "French";
    }else if (lang == "fy") {
      language = "Frisian";
    }else if (lang == "gl") {
      language = "Galician";
    }else if (lang == "ka") {
      language = "Georgian";
    }else if (lang == "de") {
      language = "German";
    }else if (lang == "el") {
      language = "Greek";
    }else if (lang == "gu") {
      language = "Gujarati";
    }else if (lang == "ht") {
      language = "Haitian Creole";
    }else if (lang == "ha") {
      language = "Hausa";
    }else if (lang == "haw") {
      language = "Hawaiian";
    }else if (lang == "iw") {
      language = "Hebrew";
    }else if (lang == "hi") {
      language = "Hindi";
    }else if (lang == "hmn") {
      language = "Hmong";
    }else if (lang == "hu") {
      language = "Hungarian";
    }else if (lang == "is") {
      language = "Icelandic";
    }else if (lang == "ig") {
      language = "Igbo";
    }else if (lang == "id") {
      language = "Indonesian";
    }else if (lang == "ga") {
      language = "Irish";
    }else if (lang == "it") {
      language = "Italian";
    }else if (lang == "ja") {
      language = "Japanese";
    }else if (lang == "jw") {
      language = "Javanese";
    }else if (lang == "kn") {
      language = "Kannada";
    }else if (lang == "kk") {
      language = "Kazakh";
    }else if (lang == "km") {
      language = "Khmer";
    }else if (lang == "ko") {
      language = "Korean";
    }else if (lang == "ku") {
      language = "Kurdish (Kurmanji)";
    }else if (lang == "ky") {
      language = "Kyrgyz";
    }else if (lang == "lo") {
      language = "Lao";
    }else if (lang == "la") {
      language = "Latin";
    }else if (lang == "lv") {
      language = "Latvian";
    }else if (lang == "lt") {
      language = "Lithuanian";
    }else if (lang == "lb") {
      language = "Luxembourgish";
    }else if (lang == "mk") {
      language = "Macedonian";
    }else if (lang == "mg") {
      language = "Malagasy";
    }else if (lang == "ms") {
      language = "Malay";
    }else if (lang == "ml") {
      language = "Malayalam";
    }else if (lang == "mt") {
      language = "Maltese";
    }else if (lang == "mi") {
      language = "Maori";
    }else if (lang == "mr") {
      language = "Marathi";
    }else if (lang == "mn") {
      language = "Mongolian";
    }else if (lang == "my") {
      language = "Myanmar (Burmese)";
    }else if (lang == "ne") {
      language = "Nepali";
    }else if (lang == "no") {
      language = "Norwegian";
    }else if (lang == "ps") {
      language = "Pashto";
    }else if (lang == "fa") {
      language = "Persian";
    }else if (lang == "pl") {
      language = "Polish";
    }else if (lang == "pt") {
      language = "Portuguese";
    }else if (lang == "pa") {
      language = "Punjabi";
    }else if (lang == "ro") {
      language = "Romanian";
    }else if (lang == "ru") {
      language = "Russian";
    }else if (lang == "sm") {
      language = "Samoan";
    }else if (lang == "gd") {
      language = "Scots Gaelic";
    }else if (lang == "sr") {
      language = "Serbian";
    }else if (lang == "st") {
      language = "Sesotho";
    }else if (lang == "sn") {
      language = "Shona";
    }else if (lang == "sd") {
      language = "Sindhi";
    }else if (lang == "si") {
      language = "Sinhala";
    }else if (lang == "sk") {
      language = "Slovak";
    }else if (lang == "sl") {
      language = "Slovenian";
    }else if (lang == "so") {
      language = "Somali";
    }else if (lang == "es") {
      language = "Spanish";
    }else if (lang == "su") {
      language = "Sundanese";
    }else if (lang == "sw") {
      language = "Swahili";
    }else if (lang == "sv") {
      language = "Swedish";
    }else if (lang == "tg") {
      language = "Tajik";
    }else if (lang == "ta") {
      language = "Tamil";
    }else if (lang == "te") {
      language = "Telugu";
    }else if (lang == "th") {
      language = "Thai";
    }else if (lang == "tr") {
      language = "Turkish";
    }else if (lang == "uk") {
      language = "Ukrainian";
    }else if (lang == "ur") {
      language = "Urdu";
    }else if (lang == "uz") {
      language = "Uzbek";
    }else if (lang == "ug") {
      language = "Uyghur";
    }else if (lang == "vi") {
      language = "Vietnamese";
    }else if (lang == "cy") {
      language = "Welsh";
    }else if (lang == "xh") {
      language = "Xhosa";
    }else if (lang == "yi") {
      language = "Yiddish";
    }else if (lang == "yo") {
      language = "Yoruba";
    }else if (lang == "zu") {
      language = "Zulu";
    }
    else{
      language = "";
    }
    return language;
  }
}