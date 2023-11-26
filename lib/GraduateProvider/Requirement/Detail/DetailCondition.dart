abstract class DetailCondition {
  abstract final int type;
  abstract final String conditionName;
  abstract final String guideLine;

  abstract final int require;

  int get satisfied;
  bool get isSatisfied;

  void analysisUpdate();
}
