<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- <iframe width="100%" height="100%" src="${pageContext.request.contextPath}/resources/HTML/map.html"></iframe> -->

<div id="map" class="map" style="width: 100%; height: 100%;"></div>





<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ac62133af390475a070f5933661ec2c1"></script>
<script type="text/javascript">

function ajaxFun(url, method, query, dataType, fn) {
   $.ajax({
      type : method,
      url : url,
      data : query,
      dataType : dataType,
      success : function(data) {
         fn(data);
      },
      beforeSend : function(jqXHR) {
         jqXHR.setRequestHeader("AJAX", true);
      },
      error : function(jqXHR) {
         if (jqXHR.status === 400) {
            alert("요청 처리가 실패 했습니다.");
            return false;
         }

         console.log(jqXHR.responseText);
      }
   });
}
</script>




<script type="text/javascript">

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
    center: new kakao.maps.LatLng(37.55741966828745, 127.18158712098067), // 지도의 중심좌표
    level: 8 // 지도의 확대 레벨
};  

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다



var url = "${pageContext.request.contextPath}/map/meter";
var query = null;
var fn = function(data) {
	createPolygon(data);
	// console.log(data);
}

ajaxFun(url, "get", query, "json", fn);

function createPolygon(data){
	
	var polygonPath = [
	    new kakao.maps.LatLng(37.55741966828745, 127.18158712098067),
	    new kakao.maps.LatLng(37.557570936537076, 127.1815615588181),
	    new kakao.maps.LatLng(37.557600391517575, 127.18156638305696),
	    new kakao.maps.LatLng(37.55764289939822, 127.18157870829651),
	    new kakao.maps.LatLng(37.557668541805214, 127.1815841274142),
	    new kakao.maps.LatLng(37.55783491473064, 127.1815722079517),
	    new kakao.maps.LatLng(37.558010994552035, 127.18155085497816),
	    new kakao.maps.LatLng(37.558360474504504, 127.18148219387214),
	    new kakao.maps.LatLng(37.55853333574828, 127.18143499149232),
	    new kakao.maps.LatLng(37.55858474040183, 127.18141827482785),
	    new kakao.maps.LatLng(37.558538463473354, 127.18121252868828),
	    new kakao.maps.LatLng(37.5584652292252, 127.18113678463436),
	    new kakao.maps.LatLng(37.5584420880341, 127.1810859692779),
	    new kakao.maps.LatLng(37.55842718171158, 127.18104710254387),
	    new kakao.maps.LatLng(37.558403098003346, 127.18099987268431),
	    new kakao.maps.LatLng(37.55838227792658, 127.18094535078065),
	    new kakao.maps.LatLng(37.558348801491675, 127.1808476216608),
	    new kakao.maps.LatLng(37.558332546482426, 127.18078905905065),
	    new kakao.maps.LatLng(37.55831766386211, 127.18072857574941),
	    new kakao.maps.LatLng(37.558294225996946, 127.18062376334682),
	    new kakao.maps.LatLng(37.55828078361288, 127.18054034265981),
	    new kakao.maps.LatLng(37.55825533256179, 127.18042615453555),
	    new kakao.maps.LatLng(37.5582387241998, 127.18036280387808),
	    new kakao.maps.LatLng(37.558230246223765, 127.18032094225799),
	    new kakao.maps.LatLng(37.558221156698174, 127.18026642605348),
	    new kakao.maps.LatLng(37.55821605883933, 127.1802176574422),
	    new kakao.maps.LatLng(37.55821395364177, 127.18017987410174),
	    new kakao.maps.LatLng(37.5582135178106, 127.18014636150191),
	    new kakao.maps.LatLng(37.55821196609897, 127.18012982271279),
	    new kakao.maps.LatLng(37.55816152493034, 127.1801442568066),
	    new kakao.maps.LatLng(37.55806754048294, 127.18016364591482),
	    new kakao.maps.LatLng(37.55797279219437, 127.18017575592613),
	    new kakao.maps.LatLng(37.55787763150249, 127.18018055375404),
	    new kakao.maps.LatLng(37.557782409809676, 127.18017802894775),
	    new kakao.maps.LatLng(37.557687496519414, 127.18016818241713),
	    new kakao.maps.LatLng(37.557593242962895, 127.18015104898112),
	    new kakao.maps.LatLng(37.55749999140879, 127.18012669738897),
	    new kakao.maps.LatLng(37.55748716719339, 127.18012281881803),
	    new kakao.maps.LatLng(37.55733760818093, 127.1800777124135),
	    new kakao.maps.LatLng(37.55727246935493, 127.18005806824357),
	    new kakao.maps.LatLng(37.5572607016084, 127.180058206279),
	    new kakao.maps.LatLng(37.55720045040429, 127.18009473405377),
	    new kakao.maps.LatLng(37.55713542470743, 127.18012597138251),
	    new kakao.maps.LatLng(37.55707823455763, 127.18014448507162),
	    new kakao.maps.LatLng(37.557020282297586, 127.18015346185409),
	    new kakao.maps.LatLng(37.55696813769323, 127.18015368942525),
	    new kakao.maps.LatLng(37.55689134869479, 127.1801423318832),
	    new kakao.maps.LatLng(37.55688139492933, 127.18014086154002),
	    new kakao.maps.LatLng(37.55683554138081, 127.18012908051905),
	    new kakao.maps.LatLng(37.55656362528561, 127.18003923510959),
	    new kakao.maps.LatLng(37.556316933539584, 127.17998476712535),
	    new kakao.maps.LatLng(37.55625928439183, 127.17996867426935),
	    new kakao.maps.LatLng(37.556235500100335, 127.17996203371452),
	    new kakao.maps.LatLng(37.55619054470288, 127.17994382789549),
	    new kakao.maps.LatLng(37.55614139537226, 127.17991720769399),
	    new kakao.maps.LatLng(37.55611236969991, 127.17989715134222),
	    new kakao.maps.LatLng(37.55610657920156, 127.17989228564362),
	    new kakao.maps.LatLng(37.55608058990463, 127.17987044053511),
	    new kakao.maps.LatLng(37.55604161200625, 127.17982955663388),
	    new kakao.maps.LatLng(37.55600377857848, 127.17978142785837),
	    new kakao.maps.LatLng(37.55594092088537, 127.1796914073328),
	    new kakao.maps.LatLng(37.55592573611282, 127.17968682797839),
	    new kakao.maps.LatLng(37.555826923160396, 127.17962210682715),
	    new kakao.maps.LatLng(37.55574593403844, 127.17959768380031),
	    new kakao.maps.LatLng(37.555670217912954, 127.17957776632603),
	    new kakao.maps.LatLng(37.55566790648899, 127.18110404559708),
	    new kakao.maps.LatLng(37.55575811883656, 127.18115387101857),
	    new kakao.maps.LatLng(37.55601406367766, 127.18127528874264),
	    new kakao.maps.LatLng(37.556013717068126, 127.18126933726437),
	    new kakao.maps.LatLng(37.55609863257102, 127.18125928771856),
	    new kakao.maps.LatLng(37.556101705592994, 127.18131212439398),
	    new kakao.maps.LatLng(37.55609996146985, 127.18131237935249),
	    new kakao.maps.LatLng(37.55614965795769, 127.18133144697875),
	    new kakao.maps.LatLng(37.55621152309403, 127.18132662544471),
	    new kakao.maps.LatLng(37.556211430388664, 127.18135514795914),
	    new kakao.maps.LatLng(37.55625892948511, 127.18137337254375),
	    new kakao.maps.LatLng(37.55643000981676, 127.18142989176194),
	    new kakao.maps.LatLng(37.55660272474485, 127.18147793090817),
	    new kakao.maps.LatLng(37.55677680796588, 127.18151741585363),
	    new kakao.maps.LatLng(37.55695199106482, 127.18154828565748),
	    new kakao.maps.LatLng(37.55712800392883, 127.18157049266138),
	    new kakao.maps.LatLng(37.55712800392883, 127.18157049266138),
	    new kakao.maps.LatLng(37.55741966828745, 127.18158712098067),
	    new kakao.maps.LatLng(37.55553287727795, 127.18102567362834), 
	    new kakao.maps.LatLng(37.555535108632796, 127.17955183395027), 
	    new kakao.maps.LatLng(37.55544949318788, 127.17954216907907), 
	    new kakao.maps.LatLng(37.55534952530784, 127.17953826450666), 
	    new kakao.maps.LatLng(37.55509505081016, 127.17953765920406), 
	    new kakao.maps.LatLng(37.55504399450255, 127.17960155899107), 
	    new kakao.maps.LatLng(37.55504337348747, 127.18001285741714), 
	    new kakao.maps.LatLng(37.55490822557896, 127.18001253509482), 
	    new kakao.maps.LatLng(37.55451781028335, 127.18001160398214),
	    new kakao.maps.LatLng(37.55442479532613, 127.18001545629816),
	    new kakao.maps.LatLng(37.55437904581934, 127.18002138725933),
	    new kakao.maps.LatLng(37.55442576119785, 127.18007802162369),
	    new kakao.maps.LatLng(37.55455776892387, 127.18022593493998),
	    new kakao.maps.LatLng(37.55469429787706, 127.18036722501455),
	    new kakao.maps.LatLng(37.55483513756353, 127.18050167397676),
	    new kakao.maps.LatLng(37.55498007084214, 127.1806290744997),
	    new kakao.maps.LatLng(37.55512887425918, 127.18074923011996),
	    new kakao.maps.LatLng(37.55528131839274, 127.18086195554086),
	    new kakao.maps.LatLng(37.5554371682063, 127.18096707691814),
	    new kakao.maps.LatLng(37.55553287727795, 127.18102567362834),
	    new kakao.maps.LatLng(37.554280890905375, 127.17990064906013),
	    new kakao.maps.LatLng(37.55434080681782, 127.17988910468246),
	    new kakao.maps.LatLng(37.55442924513808, 127.17987902823089),
	    new kakao.maps.LatLng(37.55451801548925, 127.17987579938692),
	    new kakao.maps.LatLng(37.55462462016763, 127.17987605343625),
	    new kakao.maps.LatLng(37.55462513250104, 127.17953654145862),
	    new kakao.maps.LatLng(37.554518527820726, 127.17953628789287),
	    new kakao.maps.LatLng(37.554427875048, 127.17953909393026),
	    new kakao.maps.LatLng(37.55433745646303, 127.1795479211959),
	    new kakao.maps.LatLng(37.55424754239446, 127.17956274767714),
	    new kakao.maps.LatLng(37.5541583851675, 127.17958354000169),
	    new kakao.maps.LatLng(37.55407021913784, 127.17961023080447),
	    new kakao.maps.LatLng(37.554068683362395, 127.17961080527425),
	    new kakao.maps.LatLng(37.554176116230664, 127.17976324743582),
	    new kakao.maps.LatLng(37.554280890905375, 127.17990064906013),
	    new kakao.maps.LatLng(37.5573105211044, 127.17187177776366),
	    new kakao.maps.LatLng(37.55730885951062, 127.17301962399492),
	    new kakao.maps.LatLng(37.55737145008578, 127.17310102724954),
	    new kakao.maps.LatLng(37.557957381886965, 127.17312537940157),
	    new kakao.maps.LatLng(37.558073928334196, 127.17314154793327),
	    new kakao.maps.LatLng(37.558167697600624, 127.17314544121888),
	    new kakao.maps.LatLng(37.55816989595686, 127.1731454802137),
	    new kakao.maps.LatLng(37.55817209444469, 127.17314542866762),
	    new kakao.maps.LatLng(37.55817429308059, 127.17314527526305),
	    new kakao.maps.LatLng(37.558176491848066, 127.1731450313177),
	    new kakao.maps.LatLng(37.55817867274387, 127.17314468547255),
	    new kakao.maps.LatLng(37.55818084476145, 127.17314424906577),
	    new kakao.maps.LatLng(37.558183007900745, 127.17314372209748),
	    new kakao.maps.LatLng(37.55818514415851, 127.1731430932087),
	    new kakao.maps.LatLng(37.55818727153803, 127.17314237375834),
	    new kakao.maps.LatLng(37.55818938102941, 127.17314156372574),
	    new kakao.maps.LatLng(37.55819145462938, 127.17314065175196),
	    new kakao.maps.LatLng(37.55819351032479, 127.17313966051356),
	    new kakao.maps.LatLng(37.55819753201181, 127.17313740620727),
	    new kakao.maps.LatLng(37.558199488993516, 127.17313614311871),
	    new kakao.maps.LatLng(37.55824737817124, 127.1731040315803),
	    new kakao.maps.LatLng(37.55836023750905, 127.17322078316114),
	    new kakao.maps.LatLng(37.558263142343044, 127.17328589721622),
	    new kakao.maps.LatLng(37.55825698283068, 127.17328985557558),
	    new kakao.maps.LatLng(37.558250715595015, 127.1732935420632),
	    new kakao.maps.LatLng(37.558244358655806, 127.17329695672062),
	    new kakao.maps.LatLng(37.55823790303611, 127.17330007689186),
	    new kakao.maps.LatLng(37.55823790303611, 127.17330007689186),
	    new kakao.maps.LatLng(37.55823790303611, 127.17330007689186),
	    new kakao.maps.LatLng(37.55823790303611, 127.17330007689186)
	    
	];

	// 지도에 표시할 다각형을 생성합니다
	var polygon = new kakao.maps.Polygon({
	    path:polygonPath, // 그려질 다각형의 좌표 배열입니다
	    strokeWeight: 3, // 선의 두께입니다
	    strokeColor: '#39DE2A', // 선의 색깔입니다
	    strokeOpacity: 0.8, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	    strokeStyle: 'longdash', // 선의 스타일입니다
	    fillColor: '#A2FF99', // 채우기 색깔입니다
	    fillOpacity: 0.7 // 채우기 불투명도 입니다
	});

	// 지도에 다각형을 표시합니다
	polygon.setMap(map);
	
	
}

</script>