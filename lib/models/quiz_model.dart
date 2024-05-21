enum LangCode {
  en('en', '영어'),
  jp('jp', '일본어'),
  zh('zh', '중국어'),
  de('de', '독일어'),
  es('es', '스페인어'),
  fr('fr', '프랑스어'),
  ru('ru', '러시아어'),
  hi('hi', '힌두어'),
  ar('ar', '아랍어'),
  bn('bn', '뱅골어'),
  pt('pt', '포르투갈어'),
  ms('ms', '마인어'),
  etc('etc', '기타');

  const LangCode(this.code, this.displayName);
  final String code;
  final String displayName;
  //국기 이미지 경로 추가 필요

  factory LangCode.getByCode(String code) {
    return LangCode.values
        .firstWhere((value) => value.code == code, orElse: () => LangCode.etc);
  }
}

class Quiz {
  final LangCode langCode;
  final String question;
  final String answer;

  const Quiz({
    required this.langCode,
    required this.question,
    required this.answer,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      langCode: LangCode.getByCode(json['langCode']),
      question: json['quiz'] as String,
      answer: json['answer'] as String,
    );
  }
}
