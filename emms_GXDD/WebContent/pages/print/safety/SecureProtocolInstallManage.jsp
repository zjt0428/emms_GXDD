<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="kfn" uri="http://www.knight.com/jsp/jstl/functions"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>安全管理协议</title>
<link rel="stylesheet" type="text/css" href="../pages/print/css/style_word.css" />
<style media="print">
.Noprint {
	display: none;
	
}
.PageNext {
	page-break-after: always;
}
</style>
</head>
<body>
<center class="Noprint">
	<p align="right" class="mar_15">
		<object id="WebBrowser" classid="clsid:8856F961-340A-11D0-A96B-00C04FD705A2" height="0" width="0"></object>
		<input type="button" style="font-size: 12px" value="直接打印" onClick="document.all.WebBrowser.ExecWB(6,6)">
		<input type="button" style="font-size: 12px" value="打印预览" onClick="document.all.WebBrowser.ExecWB(7,1)">
	</p>
</center>
<center>
<div class="main_detail">
<p style="font-size:28px;text-align:center; padding-top:10px; font-weight:bold;">上海市建设工程承发包安全管理协议</p>
<p style="font-size:16px;text-align:right; padding-top:15px; padding-right:15px;">合同编号:<u><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${secureProtocol.protocolSerial}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></u></p>
<p>
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="line-height:28px; font-size:14px;">
  <tr>
    <td class="indt2">发包单位：<u><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${secureProtocol.emEntName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></u>（甲方）</td>
    </tr>
  <tr>
    <td class="indt2">承包单位：：<u><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${secureProtocol.inEntName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></u>（乙方）</td>
    </tr>
</table>
</p>
<p class="indt2">甲方将本建筑安装工程项目发（分）包给乙方施工，为贯彻“安全第一、预防为主”的方针，根据《上海市招标、承包工程安全管理暂行规定》和国家的有关法规，明确双方的安全生产责任 ，确保施工安全，双方在签订建筑安装工程合同的同时，签订本协议。
</p>

<p style="font-size:18px;padding-top:10px;"><strong>一、承包工程项目</strong></p>
<p style=" padding-top:5px; padding-left:15px;">
   <span>工程项目名称：${secureProtocol.project.projectName}</span><br>
   <span>工程地址：${secureProtocol.project.address}</span><br>
   <span>承包范围： 塔吊安、拆 </span><br>
   <span>承包方式：分包 </span>
  </p>
  
<p style="font-size:18px;padding-top:10px;"><strong>二、工程项目期限：</strong></p>
<p>预计自<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>年<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>月<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>起至<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>年<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>月<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>止。</p>

<p style="font-size:18px;padding-top:10px;"><strong>二、协议内容：</strong></p>

<p><strong>1、</strong>	甲乙双方必须认真贯彻国家、上海市和上级劳动保护、安全生产主管部门颁发的有关安全生产、消防工作的方针、政策，严格执行有关劳动保护法规、条例、规定。</p>

<p><strong>2、</strong>	甲乙双方都应有安全管理组织体制，包括抓安全生产的领导，各级专职和兼职的安全干部，应有各工种和安全操作规程，特种操作人员的审证考核制度及各级安全生产岗位现任制和定期安全检查制度、 安全教育制度等。</p>
<p><strong>3、</strong>	甲乙双方在施工前要认真勘察现场：<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（1）	工程项目应由甲方编制施工组织总设计；<br>   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（2）	工程项目由乙方按甲方的要求自行编制施工组织设计； 并制定安全技术措施计划，严格按施工组织设计和有关安全要求施工。</p>
<p><strong>4、</strong>	甲乙双方的有关领导必须对本单位职工进行安全生产制度及安全技术知识教育，增强法制观念，提高职工的安全生产思想意识和自我保护的能力，督促职工自觉遵守安全生产纪律、制度和法规。</p>
<p><strong>5、</strong>	施工前、甲方应对乙方的管理人员、施工人员进行安全生产现场教育，介绍有关安全生产管理制度、规定和要求，乙方应组织召开管理人员、施工人员安全生产教育会议，并通知甲方委托有关人员出席会议，介绍施工中有关安全、防火等规章制度及要求；乙方必须检查、督促施工人员严格遵守、认真执行。
<br>
根据工程项目内容、特点、甲乙双方应做到安全技术交底，并有交底的书面材料，交底材料一式二份，由甲乙双方各执一份。</p>
<p><strong>6、</strong>	施工期间，乙方指派<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>同志负责本工程项目的有关安全、防火工作；甲方指派<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>同志负责联系、检查督促乙方执行有关安全、防火规定。甲乙双方应经常联系，相互协助检查和处理工程施工有关的安全、防火工作，共同预防事故发生。</p>
<p><strong>7、</strong>	在施工期间必须严格执行和遵守甲方的安全生产、防火管理和各项规定，接受甲方督促、检查和指导。甲方有协助乙方搞好安全生产、防火管理及督促检查的义务，对于查出的隐患，乙方必须限期整改，对甲方违反安全生产规定，制度等情况，乙方有要求甲方整改的权利，甲方应该认真整改。</p>
<p><strong>8、</strong>	在生产操作过程中的个人防护用品，由各方自理，甲、乙方都应督促施工现场人员自觉穿戴好防护用品。</p>
<p><strong>9、</strong>	甲乙双方人员对各自所在的施工区域、作业环境、操作设施设备、工具用具等必须认真检查、发现隐患，应立即停止施工，并由有关单位落实整改后方准施工。一经施工，就表示该施工单位确认施工场所、作业环境、设施设备、工具用具等符合安全要求和处于安全状态。施工单位对施工过程中由于上述因素不良而导致的事故后果负责。</p>
<p><strong>10、</strong>	由甲方提供的机械设备、脚手架等设备设施，在搭设、安装完毕提交使用前，甲方应会同乙方共同按规定验收，并做好验收及交付使用的书面手续，严禁在未经验收或验收不合格的情况下投入使用，否则由此发生的后果概有擅自使用方负责。</p>
<p><strong>11、</strong>	乙方在施工期间所使用的各种设备以及工具等均由乙方自备。如甲乙双方必须相互借用或租赁，应由甲乙双方有关人员办理借用或租赁手续，制订有关安全使用和管理制度。借出方应保证借出的设备和工具完好并符合安全要求，借入方必须进行检验，并做好书面记录。借入使用方一旦接收，设备和工具的保管应由借入使用方负责，并严格执行安全操作规程。在使用过程中，由于设备、工具等因素或因使用操作不当而造成伤亡事故，由借入使用方负责。</p>
<p><strong>12、</strong>	甲乙双方的人员，对施工现场的脚手架、各类安全防护设施、安全标志和警告牌等，不得擅自拆除、更动。如确实需要拆除更动的，必须经工地施工负责人和甲乙双方指派的安全管理人员同意，并采取必要、可靠的安全措施后方能拆除。任何一方人员，擅自拆除所造成的后果，均由该方人员及其单位负责。</p>
<p><strong>13、</strong>	特种作业人员必须执行国家《特种作业人员安全技术培训考核管理规定》，经省、市、地区的特种作业安全技术考核培训后持证上岗。并按规定定期审证，进上海施工的外省市特种作业人员还须经上海市的关特种作业考核站进行审证教育；中、小型机械的操作人员必须按规定做到“定机定人”和有证操作；起重吊装作业人员必须遵守“十不吊”规定，严禁违章、无证操作；严禁不懂电器、机械设备的人，擅自操作使用电器、机械设备。</p>
<p><strong>14、</strong>	甲乙双方必须严格执行各类防火防爆制度，易爆场所严禁吸烟及动用明火，消防器材不准挪作他用。电焊、气割作业应按规定办理动火审批手续，严格遵守“十不烧”规定，严禁使用电炉。冬季施工如必须采用明火加热的防冻措施时，应取得防火主管人员同意，落实防火、防中毒措施，并指派专人值班。</p>
<p><strong>15、</strong>	乙方需用甲方提供的电气设备，在使用前先进行检测，并做好检测记录，如不符合安全规定的应及时向甲方得出，甲方应积极整改，整改合格后方可准使用，违反本规定或不经甲方许可，擅自乱拉电器线路所造成的后果均由肇事者单位负责。</p>
<p><strong>16、</strong>	贯彻先订合同后施工的原则。甲方不得指派乙方人员从事合同外的施工任务，乙方应拒绝合同外的施工任务，否则由此造成的一切后果均由有关方负责。</p>
<p><strong>17、</strong>	甲乙双方在施工过程中，应注意地下管道线及高压架空线路的保护，甲方对地下管线和障碍物应详细交底，乙方应贯彻交底要求，如遇有情况，应及时向甲方和有关部门联系，采取保护措施。</p>
<p><strong>18、</strong>	乙方在签订建筑安装施工合同后，应自觉地向地区（县）劳动局劳动保护监察科（股）等有关部门办理开工报告手续。</p>
<p><strong>19、 </strong>贯彻谁施工谁负责安全的原则。甲、乙双方人员在施工期间造成的伤亡、火警、火灾、机械等重大事故（包括甲、乙双方责任造成对方人员、他方人员、行人伤亡等），双方应协力进行紧急抢救伤员和保护现场，按国务院及上海市的关事故发生后的廿四小时内及时报告各自的上级主管部门及市、区（县）劳动保护监察部门等的关机构。事故的损失和善后处理费用等，应按责任，协商解决。</p>
<p><strong>20、</strong>	本协议订的各项规定适用立协单位双方，如遇有同国家和上海的有关法规不同,则按国家和上海市的有关规定执行。</p>
<p><strong>21、</strong>	本协议立协双方签字、盖章有效，作为合同附件一式四份，甲、乙双方各执二份。</p>
<p><strong>22、</strong>	本协议同工程合同正本同日生效，甲、乙双方必须严格执行，由于违反本协议而造成伤亡事故，由违约方承担一切经济损失。</p>








<br>  <br>  
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="line-height:30px; font-size:14px;">
  <tr>
    <td width="50%">甲方：单位名称<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>（盖章 ） </td>
    <td><p>乙方：单位名称<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>（盖章） </p></td>
  </tr>
  <tr>
    <td>法定代表人<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>（盖章 ）</td>
    <td>法定代表人<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>（盖章 ）</td>
  </tr>
  <tr>
    <td>授权人<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>（盖章 ）</td>
    <td>授权人<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>（盖章 ）</td>
  </tr>
  <tr>
    <td>联系电话<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
    <td>联系电话<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
  </tr>
  <tr>
    <td colspan="2" style="padding-top:20px;"><p>签约地址：上海市嘉定区浏翔公路3068弄28号 </p></td>
    </tr>
  <tr>
    <td colspan="2"><p>签约日期：           年             月           日 </p></td>
    </tr>
</table>

<br><br>
</p>
</div>
</center>
</body>
</html>
