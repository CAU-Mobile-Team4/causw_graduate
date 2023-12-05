import 'package:causw_graduate/AppColor.dart';
import 'package:causw_graduate/startPage.dart';
import 'package:flutter/material.dart';

class GraduateInformation extends StatelessWidget {
  const GraduateInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Graduate Information",
            style: TextStyle(fontWeight: FontWeight.bold,
                color: AppColor.main
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColor.background,
          leading: const BackButton(
        color: AppColor.main,
      )),
      body:const Text("미안하다 이거 보여주려고 어그로끌었다.. 나루토 사스케 싸움수준 ㄹㅇ실화냐? 진짜 세계관최강자들의 싸움이다.. 그찐따같던 나루토가 맞나? 진짜 나루토는 전설이다..진짜옛날에 맨날나루토봘는데 왕같은존재인 호카게 되서 세계최강 전설적인 영웅이된나루토보면 진짜내가다 감격스럽고 나루토 노래부터 명장면까지 가슴울리는장면들이 뇌리에 스치면서 가슴이 웅장해진다.. 그리고 극장판 에 카카시앞에 운석날라오는 거대한 걸 사스케가 갑자기 순식간에 나타나서 부숴버리곤 개간지나게 나루토가 없다면 마을을 지킬 자는 나밖에 없다 라며 바람처럼 사라진장면은 진짜 나루토처음부터 본사람이면 안울수가없더라 진짜 너무 감격스럽고 보루토를 최근에 알았는데 미안하다.. 지금20화보는데 진짜 나루토세대나와서 너무 감격스럽고 모두어엿하게 큰거보니 내가 다 뭔가 알수없는 추억이라해야되나 그런감정이 이상하게 얽혀있다.. 시노는 말이많아진거같다 좋은선생이고..그리고 보루토왜욕하냐 귀여운데 나루토를보는것같다 성격도 닮았어 그리고버루토에 나루토사스케 둘이싸워도 이기는 신같은존재 나온다는게 사실임?? 그리고인터닛에 쳐봣는디 이거 ㄹㅇㄹㅇ 진짜팩트냐?? 저적이 보루토에 나오는 신급괴물임?ㅡ 나루토사스케 합체한거봐라 진짜 ㅆㅂ 이거보고 개충격먹어가지고 와 소리 저절로 나오더라 ;; 진짜 저건 개오지는데.. 저게 ㄹㅇ이면 진짜 꼭봐야돼 진짜 세계도 파괴시키는거아니야 .. 와 진짜 나루토사스케가 저렇게 되다니 진짜 눈물나려고했다.. 버루토그라서 계속보는중인데 저거 ㄹㅇ이냐..? 하.. ㅆㅂ 사스케 보고싶다..  진짜언제 이렇게 신급 최강들이 되었을까 옛날생각나고 나 중딩때생각나고 뭔가 슬프기도하고 좋기도하고 감격도하고 여러가지감정이 복잡하네.. 아무튼 나루토는 진짜 애니중최거명작임.."
      "세상에 70억명의 호날두 팬이 있다면, 나는 그들 중 한 명일 것이다.세상에 1억명의 호날두 팬이 있다면., 나 또한 그들 중 한 명일 것이다."
    "세상에 천만 명의 호날두 팬이 있다면, 나는 여전히 그들 중 한 명일 것이다."
   " 세상에 백 명의 호날두 팬이 있다면, 나는 아직도 그들 중 한 명일 것이다."
    "세상에 한 명의 호날두 팬이 있다면, 그 사람은 아마도 나일 것이다."
    "세상에 단 한 명의 호날두 팬도 없다면, 나는 그제서야 이 세상에 없는 것이다."
    "호날두, 나의 사랑."
    "호날두, 나의 빛."
    "호날두, 나의 어둠."
    "호날두, 나의 삶."
    "호날두, 나의 기쁨."
    "호날두, 나의 슬픔."
    "호날두, 나의 고통."
    "호날두, 나의 안식."
    "호날두, 나.",style: TextStyle(fontSize: 15),),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const StartPage()));
      },child:Icon(Icons.home_filled,)),
    );
  }
}

