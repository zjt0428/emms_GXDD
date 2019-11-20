<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="kfn" uri="http://www.knight.com/jsp/jstl/functions"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>安装方案审批表</title>
<link rel="stylesheet" type="text/css" href="../pages/print/css/style_table.css" />
<style media="print">
.Noprint {
	display: none;
	
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
  <div class="fsong_title"><strong>施工组织设计拆卸预案审批表</strong></div>
  <p>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="spbtable">
  <tr>
    <td colspan="2" align="center" width="120" >工 程 名 称</td>
    <td>${contingencyPlan.project.projectName}</td>
  </tr>
  <tr>
    <td colspan="2" align="center">安 装 单 位</td>
    <td>${contingencyPlan.inEntName}</td>
  </tr>
  <tr>
    <td colspan="2" align="center">施 工 单 位</td>
    <td>${contingencyPlan.emEntName}</td>
  </tr>
  <tr>
    <td width="60" rowspan="2" align="center">编制<br />
      人员</td>
    <td align="center" width="60">主持</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="center">参加</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2" align="center" style="padding:5pt 0;">安全技术措施<br />
      专项方案类别</td>
    <td>${contingencyPlan.equipment.equipSpecificName}&nbsp;${contingencyPlan.equipment.equipGenericName}&nbsp;拆卸应急专项方案</td>
  </tr>
  <tr>
    <td colspan="2" align="center" style="padding:10pt 0;">安   装<br />
      单   位<br />
      审   核<br />
      意   见</td>
    <td>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="spbtable_none">
	  <tr>
		<td width="50%">企业技术负责人签字：</td>
		<td align="center"> 单位：（公章）</td>
	  </tr>
	  <tr>
		<td>年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日</td>
		<td>&nbsp;</td>
	  </tr>
	</table>
</td>
  </tr>
  <tr>
    <td colspan="2" align="center" style="padding:10pt 0;">施   工<br />
      单   位<br />
      审   核<br />
      意   见</td>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="spbtable_none">
      <tr>
        <td width="50%">企业技术负责人签字：</td>
        <td align="center"> 单位：（公章）</td>
      </tr>
      <tr>
        <td>年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td colspan="2" align="center" style="padding:10pt 0;">监   理<br />
      单   位<br />
      审   查<br />
      意   见</td>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="spbtable_none">
      <tr>
        <td width="50%">总监理工程师签字：</td>
        <td align="center"> 单位：（公章）</td>
      </tr>
      <tr>
        <td>年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
</p>
</div>
</center>
</body>
</html>
