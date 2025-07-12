import 'package:envied/envied.dart';

part 'env.g.dart';

/// 環境変数を読み出すためのクラス.[envied]パッケージを利用して生成する
/// 必ずobfuscate: trueを指定して、難読化しておくこと。
@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'QIITA_API_KEY', obfuscate: true)
  static String qiitaApiKey = _Env.qiitaApiKey;
}
