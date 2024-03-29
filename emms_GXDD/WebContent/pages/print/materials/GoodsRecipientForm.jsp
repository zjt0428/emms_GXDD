<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.lang.Math" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>租借收货单</title>

<style media=print>
.Noprint {
	display: none;
}

.PageNext {
	page-break-after: always;
}
</style>
<style>
.tdh {
	line-height: 28px;
	text-align: left;
	font-size: 12px;
	padding: 0px 0px 0px 0px;
}

.tabp {
	margin-top: 0px;
	border-color: #000000 #000000 #000000 #000000;
	border-style: solid;
	border-top-width: 1px;
	border-right-width: 2px;
	border-bottom-width: 2px;
	border-left-width: 1px;
}

.tdp {
	height : 18px;
	font-size: 13px;
	border-bottom: 0 solid #000000;
	border-left: 1px solid #000000;
	border-right: 0 solid #000000;
	border-top: 1px solid #000000;
}

.tda {
	font-size: 13px;
	border-bottom: 0 solid #000000;
	border-left: 0 solid #000000;
	border-right: 0 solid #000000;
	border-top: 0 solid #000000;
}

.tdc {
	font-size: 14px;
	text-align: center;
	border-bottom: 0 solid #000000;
	border-left: 1px solid #000000;
	border-right: 0 solid #000000;
	border-top: 1px solid #000000;
}

.ftdp {
	height: 60px;
	font-weight: bold;
	font-size: 30px;
}

.main_detail_0523{width:755px; margin:0px 0px 0px -60px; height:370px; font-size:16px;}
</style>

</head>
<body>

<c:set var="countNumber" value="${fn:length(goodsRecipient.recipientListSet)}" scope="application"></c:set>
<c:set var="count" value="${((fn:length(goodsRecipient.recipientListSet))-(fn:length(goodsRecipient.recipientListSet)%9))/9}" scope="application"></c:set>
<center class="Noprint">
	<p align="right">
		<!-- <object id="WebBrowser" classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2" height="0" width="0"></object>
		<input type="button" style="font-size: 12px" value="直接打印" onClick="document.all.WebBrowser.ExecWB(6,6)">
		<input type="button" style="font-size: 12px" value="打印预览" onClick="document.all.WebBrowser.ExecWB(7,1)">
		<input type="button" style="font-size: 12px" value="页面设置" onClick="document.all.WebBrowser.ExecWB(8,1)"> -->
		<input id="btnPrint" value="直接打印" type="button" onclick="window.print()"/>  
	</p>
</center>
<center>

<div class="main_detail_0523">
	<c:if test="${countNumber%9==0&&countNumber!=0}">
		<c:set var="count" value="${count-1}" scope="application"></c:set>
	</c:if>
	<c:if test="${(fn:length(goodsRecipient.recipientListSet)!=0)&&(fn:length(goodsRecipient.recipientListSet)%9==0)}">
		<c:set var="countNumber" value="${fn:length(goodsRecipient.recipientListSet)-1}" scope="application"></c:set>
	</c:if>
	<c:forEach var="v" begin="0" end="${count}"   varStatus="loop">
		<table  width="100%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top: -2px;border-spacing: 0px;overflow: hidden;" >
			<tr valign="bottom">
				<td height="120px">
					<table  width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top: -2px;border-spacing: 0px" >
						<tr>
							<td  width="30%"  rowspan="2" >
								<table width="100%" height="100%">
									<tr></tr>
									<tr>
										<td width="38%"></td>
										<td width="24%" align="center" style="border: solid 1.5px;font-size: 18px;">收货</td>
										<td width="38%"></td>
									</tr>
									<tr></tr>
								</table>
							</td>
							<td  width="30%" align="center"  rowspan="2" ><font size=3px style="font-weight:bold;">天元建设集团有限公司<br>周转材料租借收货单</font></td>
								<td rowspan="2">
								<div>
									<img src='<%=request.getContextPath() %>/image-widget?method=qrcode&contents={relateId:${goodsRecipient.recipientId};relateModule : GOODS_RECIPIENT}' height=80 width=89/>
								</div>
							</td>
							<td width="27%" valign="middle" align="right" >
								<font size=1px>
									<%= (new java.util.Date()).toLocaleString()%>  <script type="text/javascript">document.write('第1次打印');</script>
								</font><br><br>
								<font size=1px>编号：${detailNo}</font>
							</td>
						</tr>
						<tr>
							<td width="27%" valign="bottom" align="right" >
								<font size=1px>第${v+1}页,共<fmt:formatNumber value="${count+1}" pattern="#"/>页</font>
							</td>
						</tr>
					</table>
					<table width="100%" class="tabp" border="0" align="center" cellpadding="0" cellspacing="0"  >
						<tr style="border-bottom: 1px">
							<th class="tdp">租借合同:</th>
							<td class="tdp">&nbsp;${goodsRecipient.leaseContract.leaseIdentifier}</td>
							<th class="tdp">收货时间:</th>
							<td class="tdp">&nbsp;${goodsRecipient.deliveryDate}</td>
							<th class="tdp">收货单号:</th>
							<td class="tdp">&nbsp;${goodsRecipient.recipientSerial}</td>
						</tr>
						<tr style="border-bottom: 1px">	
							<th class="tdp">租借单位:</th>
							<td class="tdp" >&nbsp;${goodsRecipient.leaseUnit}</td>
							<th class="tdp">项目名称:</th>
							<td class="tdp" colspan="4">&nbsp;${goodsRecipient.project.projectName}</td>
						</tr>
<%-- 						<tr style="border-bottom: 1px">
							<th width="10%" class="tdp">租借合同:</th>
							<td width="25%" class="tdp">&nbsp;${goodsRecipient.leaseContract.leaseIdentifier}</td>
							<th width="10%" class="tdp">收货时间:</th>
							<td width="20%" class="tdp">&nbsp;${goodsRecipient.deliveryDate}</td>
							<th width="10%" class="tdp">收货单号:</th>
							<td width="25%" class="tdp">&nbsp;${goodsRecipient.recipientSerial}</td>
						</tr>
						<tr style="border-bottom: 1px">	
							<th width="10%" class="tdp">租借单位:</th>
							<td width="15%" class="tdp" >&nbsp;${goodsRecipient.leaseUnit}</td>
							<th width="10%" class="tdp">项目名称:</th>
							<td width="65%" class="tdp" colspan="4">&nbsp;${goodsRecipient.project.projectName}</td>
						</tr> --%>
					</table>
				</td>
			</tr>
			<tr valign="top">
				<td height="216px">
					<table width="100%" class="tabp"  border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top: -2px">
						<tr style="border-bottom: 1px">
							<th class="tdp" width="4.5%">序号</th>
							<th class="tdp" width="14%">周材品名</th>
							<th class="tdp" width="21%">规格型号</th>
							<th class="tdp" width="4.5%">单位</th>
							<th class="tdp" width="7%">数量</th>
							<th class="tdp" width="8%">辅助单位</th>
							<th class="tdp" width="10%">辅助数量</th>
							<th class="tdp">备注</th>
						</tr>
						<c:forEach var="element" items="${goodsRecipient.recipientListSet}" varStatus="status" begin="${9*v}" end="${9*v+8 }">
							<tr>
								<td class="tdc" width="4.5%">${status.count+9*v}</td>
								<td class="tdc" width="14%">${element.commodity}</td>
								<td class="tdc" width="21%">${element.specifications}</td>
								<td class="tdc" width="4.5%">${element.measurementUnit}</td>
								<td class="tdc" width="7%">${element.recipientQuantity}</td>
								<td class="tdc" width="8%">${element.assistUnit}</td>
								<td class="tdc" width="10%">${element.assistQuantity}</td>
								<td class="tdc">${element.remarks}</td>
							</tr>
						</c:forEach>
					</table>
				</td>
			</tr>
			<tr valign="bottom">
				<td height="34px">
					<table  width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top: -2px;border-spacing: 0px" >
						<tr>
							<td class="tda">一联存根(白色黑字)</td>
							<td class="tda">二联核算(粉)</td>
							<td class="tda" >三联专职(黄)</td>
							<td class="tda">四联承租单位(粉蓝)</td>
							<td class="tda">五联承运人(粉绿)</td>
							<td class="tda">六联租借单位(白蓝)</td>
						</tr>
					</table>
					<table  width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top: -2px;border-spacing: 0px" >
						<tr>
							<td class="tda" width="15%"><font style="font-weight:bold;">运输人：</font>&nbsp;${goodsRecipient.transportPersonnel}</td>
							<td class="tda" width="21%"><font style="font-weight:bold;">车牌号：</font>&nbsp;${goodsRecipient.transportVehicle}</td>
							<td class="tda" ><font style="font-weight:bold;">承租单位：</font></td>
							<td class="tda" width="21%"><font style="font-weight:bold;">审核确认：</font></td>
							<td class="tda" width="15%"><font style="font-weight:bold;">制单人：</font>&nbsp;${goodsRecipient.userName}</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<c:if test="${!loop.last}">
			<div style="height : 25px"></div>
		</c:if>
	</c:forEach>
</div>
</center>

</body>
</html>