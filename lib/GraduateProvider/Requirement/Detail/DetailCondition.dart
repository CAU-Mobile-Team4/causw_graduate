abstract class DetailCondition {
  abstract final int type; //0: 해당 세부 조건을 미적용, 1: satisfied/require 꼴로 출력
  abstract final String conditionName;
  abstract final String guideLine;

  abstract final int require;

  int get satisfied;
  bool get isSatisfied;

  void analysisUpdate();
}
