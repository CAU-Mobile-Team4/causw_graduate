abstract class DetailCondition {
  /// type
  /// 0: 해당 졸업 조건을 미적용
  /// 1: 디폴트 (조건 이름 satisfied/require)
  /// 2: or 부모 조건 바인딩 (조건 이름)
  /// 3: or 하위 조건 (->조건 이름 satisfied/require)
  abstract final int type;
  abstract final int groupId; // type 0, 1의 경우 0 고정, 그룹 번호는 1부터 시작
  abstract final int conditionGroupId; // 소속할 groupId에 맞는 값 대입, 그룹의 그룹 있을 경우를 대비
  abstract final String conditionName;
  abstract final String guideLine;

  abstract final int require;

  int get satisfied;
  bool get isSatisfied;
  List<DetailCondition> subCondition = [];

  void analysisUpdate();
}
