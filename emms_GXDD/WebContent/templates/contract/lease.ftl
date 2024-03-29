<p style="TEXT-ALIGN: center; LINE-HEIGHT: 1.5em">
	<span style="FONT-FAMILY: 宋体,SimSunFONT-FAMILY: 宋体,SimSun; FONT-SIZE: 36px; FONT-WEIGHT: bold">
		建筑起重机械设备租赁合同
		<br />
	</span>
	<span style="FONT-FAMILY: 宋体,SimSunFONT-FAMILY: 宋体,SimSun; FONT-SIZE: 14px; FONT-WEIGHT: bold">
		<br />
	</span>
</p>
<p style="LINE-HEIGHT: 1.5em">
	<span style="FONT-FAMILY: 宋体,SimSun; FONT-SIZE: 14px">
		承租人（甲方）：
		<span style="FONT-FAMILY: 宋体,SimSun; FONT-SIZE: 14px; TEXT-DECORATION: underline">
			<strong>&nbsp;${contractLease.paEntName}&nbsp;&nbsp; &nbsp;
			</strong>
		</span>
		（单位全称)
		<br />
		出租人（乙方）：
		<span style="FONT-FAMILY: 宋体,SimSun; FONT-SIZE: 14px; TEXT-DECORATION: underline">
			<strong>&nbsp;&nbsp;${contractLease.pbEntName}&nbsp;&nbsp;
			</strong>
		</span>
		（单位全称)
		<br />&nbsp;&nbsp;依照《中华人民共和国合同法》及相关法律、法规和《建筑起重机械安全监督管理规定》(原建设部令第166号)的规定，遵循平等、自愿、公平和诚实信用的原则，经双方协商，就租赁建筑起重机械设备的相关事宜达成协议如下： &nbsp;
		<br />&nbsp;&nbsp;第一条
		机械设备租赁及租金计算与支付
		<br />&nbsp;&nbsp;1．机械设备租赁及租金计算明细表
		<br />
	</span>
</p>
<p style="TEXT-ALIGN: center; LINE-HEIGHT: 1.5em">
	<span style="FONT-FAMILY: 宋体,SimSunFONT-FAMILY: 宋体,SimSun; FONT-SIZE: 14px">
		表一、设备租赁租金标准明细表
		<br />
	</span>
</p>
<table width="600px" border="1" align="center" cellpadding="2" cellspacing="0">
	<tr class="firstRow">
		<td height="40" width="18%" align="middle">
			<p style="LINE-HEIGHT: 1.5em">
				<span style="FONT-FAMILY: 宋体,SimSun; FONT-SIZE: 14px">品名</span>
			</p>
		</td>
		<td height="40" width="15%" align="middle">
			<p style="LINE-HEIGHT: 1.5em">
				<span style="FONT-FAMILY: 宋体,SimSun; FONT-SIZE: 14px">规格</span>
			</p>
		</td>
		<td height="40" width="10%" align="middle">
			<p style="LINE-HEIGHT: 1.5em">
				<span style="FONT-FAMILY: 宋体,SimSun; FONT-SIZE: 14px">单位</span>
			</p>
		</td>
		<td height="40" width="10%" align="middle">
			<p style="LINE-HEIGHT: 1.5em">
				<span style="FONT-FAMILY: 宋体,SimSun; FONT-SIZE: 14px">租用数量</span>
			</p>
		</td>
		<td height="40" width="16%" align="middle">
			<p style="LINE-HEIGHT: 1.5em">
				<span style="FONT-FAMILY: 宋体,SimSun; FONT-SIZE: 14px">租金标准</span>
			</p>
		</td>
		<td height="40" width="14%" align="middle">
			<p style="LINE-HEIGHT: 1.5em">
				<span style="FONT-FAMILY: 宋体,SimSun; FONT-SIZE: 14px">租金单位</span>
			</p>
		</td>
		<td height="40" width="15%" align="middle">
			<p style="LINE-HEIGHT: 1.5em">
				<span style="FONT-FAMILY: 宋体,SimSun; FONT-SIZE: 14px">备注</span>
			</p>
		</td>
	</tr>
	<#list contractLease.contractEquipBriefSet as eb>
	<tr>
		<td align="middle">
			<p style="LINE-HEIGHT: 1.5em">
				<span style="FONT-FAMILY: 宋体,SimSun; FONT-SIZE: 14px">&nbsp;${eb.equipCategoryName}
				</span>
			</p>
		</td>
		<td align="middle">
			<p style="LINE-HEIGHT: 1.5em">
				<span style="FONT-FAMILY: 宋体,SimSun; FONT-SIZE: 14px">&nbsp;${eb.equipSpecificName}
				</span>
			</p>
		</td>
		<td align="middle">
			<p style="LINE-HEIGHT: 1.5em">
				<span style="FONT-FAMILY: 宋体,SimSun; FONT-SIZE: 14px">&nbsp;${eb.unit}
				</span>
			</p>
		</td>
		<td align="middle">
			<p style="LINE-HEIGHT: 1.5em">
				<span style="FONT-FAMILY: 宋体,SimSun; FONT-SIZE: 14px">&nbsp;${eb.quantity}
				</span>
			</p>
		</td>
		<td align="middle">
			<p style="LINE-HEIGHT: 1.5em">
				<span style="FONT-FAMILY: 宋体,SimSun; FONT-SIZE: 14px">&nbsp;${eb.rentStandard}
				</span>
			</p>
		</td>
		<td align="middle">
			<p style="LINE-HEIGHT: 1.5em">
				<span style="FONT-FAMILY: 宋体,SimSun; FONT-SIZE: 14px">&nbsp;${eb.measurement}
				</span>
			</p>
		</td>
		<td align="middle">
			<p style="LINE-HEIGHT: 1.5em">
				<span style="FONT-FAMILY: 宋体,SimSun; FONT-SIZE: 14px">&nbsp;
				</span>
			</p>
		</td>
	</tr>
	</#list>
</table>
<br />
<p style="TEXT-ALIGN: center; LINE-HEIGHT: 1.5em">
	<span style="FONT-FAMILY: 宋体,SimSun; FONT-SIZE: 14px">表二、机械设备操作人员计费标准明细表</span>
</p>
<table class="tabp" width="600px" border="1" align="center" cellpadding="2" cellspacing="0">
	<tr class="firstRow">
		<td height="40" width="25%" align="middle">
			<p style="LINE-HEIGHT: 1.5em">
				<span style="FONT-FAMILY: 宋体,SimSun; FONT-SIZE: 14px">工种类别</span>
			</p>
		</td>
		<td height="40" width="15%" align="middle">
			<p style="LINE-HEIGHT: 1.5em">
				<span style="FONT-FAMILY: 宋体,SimSun; FONT-SIZE: 14px">人数</span>
			</p>
		</td>
		<td height="40" width="20%" align="middle">
			<p style="LINE-HEIGHT: 1.5em">
				<span style="FONT-FAMILY: 宋体,SimSun; FONT-SIZE: 14px">月工资</span>
			</p>
		</td>
		<td height="40" width="20%" align="middle">
			<p style="LINE-HEIGHT: 1.5em">
				<span style="FONT-FAMILY: 宋体,SimSun; FONT-SIZE: 14px">工资小计（元）</span>
			</p>
		</td>
		<td height="40" width="20%" align="middle">
			<p style="LINE-HEIGHT: 1.5em">
				<span style="FONT-FAMILY: 宋体,SimSun; FONT-SIZE: 14px">备注</span>
			</p>
		</td>
	</tr>
	<#list contractLease.contractPractiBriefSet as eb>
	<tr>
		<td align="middle">
			<p style="LINE-HEIGHT: 1.5em">
				<span style="FONT-FAMILY: 宋体,SimSun; FONT-SIZE: 14px">&nbsp;${eb.kindWorkName}
				</span>
			</p>
		</td>
		<td align="middle">
			<p style="LINE-HEIGHT: 1.5em">
				<span style="FONT-FAMILY: 宋体,SimSun; FONT-SIZE: 14px">&nbsp;${eb.quantity}
				</span>
			</p>
		</td>
		<td align="middle">
			<p style="LINE-HEIGHT: 1.5em">
				<span style="FONT-FAMILY: 宋体,SimSun; FONT-SIZE: 14px">&nbsp;${eb.expense}
				</span>
			</p>
		</td>
		<td align="middle">
			<p style="LINE-HEIGHT: 1.5em">
				<span style="FONT-FAMILY: 宋体,SimSun; FONT-SIZE: 14px">&nbsp;${eb.summary}
				</span>
			</p>
		</td>
		<td align="middle">
			<p style="LINE-HEIGHT: 1.5em">
				<span style="FONT-FAMILY: 宋体,SimSun; FONT-SIZE: 14px">&nbsp;
				</span>
			</p>
		</td>
	</tr>
	</#list>
</table>
<br />
<p style="LINE-HEIGHT: 1.5em; TEXT-INDENT: 2em">
	<span style="FONT-FAMILY: 宋体,SimSun; FONT-SIZE: 14px">
		2．租金计算。机械设备租金计算标准见（表一）。按合同约定，若是乙方指派操作人员则租金包括工资（见表二）。不足月的尾数日租金按月租金标准除以当月实际天数，再乘以实际使用天数计算。租金从机械设备启用日起计算。在租赁期内，若非乙方原因造成机械设备停机或停止使用，甲方应按租金标准照常支付租赁费。
		<br />&nbsp;&nbsp;3．支付方式：
		<span style="FONT-FAMILY: 宋体,SimSun; FONT-SIZE: 14px; TEXT-DECORATION: underline">
			<strong>现金支付（不含税）， 但乙方应出具有效的收据为证。</strong>
		</span>
		<br />&nbsp;&nbsp;4．支付时间：
	</span>
	<span style="FONT-FAMILY: 宋体,SimSun; FONT-SIZE: 14px; TEXT-DECORATION: underline">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<br />
	</span>
	<span style="FONT-FAMILY: 宋体,SimSun; FONT-SIZE: 14px">&nbsp;&nbsp;&nbsp;&nbsp;第二条
		项目名称、使用地点
		<br />&nbsp;&nbsp;项目名称：
		<span style="FONT-FAMILY: 宋体,SimSun; FONT-SIZE: 14px; TEXT-DECORATION: underline">
			<strong>${contractLease.projectName}</strong>
		</span>
		<br />&nbsp;&nbsp;使用地点：
		<span style="FONT-FAMILY: 宋体,SimSun; FONT-SIZE: 14px; TEXT-DECORATION: underline">
			<strong>${contractLease.address}</strong>
		</span>
		<br />&nbsp;&nbsp;第三条
		租赁期限
		<br />&nbsp;&nbsp;1．因工程需要延长租期，双方应在租赁期满前日内，续签合同。
		<br />&nbsp;&nbsp;2．租赁期满，甲方继续使用机械，乙方没有提出异议的，原租赁合同继续有效；甲方承诺租赁期不少于个月，则按实际租赁时间结算；少于个月，按个月结算租赁费。
		<br />&nbsp;&nbsp;3．本合同签定之日起日内，设备进场安装。机械设备进场安装完毕，经安装单位自检、检验检测机构检验合格并由甲方组织有关单位验收合格之日为启用日；甲方通知乙方机械设备停止使用，并拆卸完毕具备机械设备退场条件之日为停用日。停用日须经双方书面确认。
		<br />&nbsp;&nbsp;4．由于甲方的原因（如现场施工条件不具备、高压线防护措施不到位等），造成机械设备验收合格后停机待用或造成验收不合格，机械设备启用日为验收合格时间或组织验收时间。
		<br />&nbsp;&nbsp;5．机械设备自启用日起至停用日止为双方确定的租赁期限。
		<br />&nbsp;&nbsp;第四条
		保证金
		<br />&nbsp;&nbsp;1．合同签订后甲方向乙方支付元作为本合同的履约保证金。
		<br />&nbsp;&nbsp;2．甲方应在机械设备进场前日内支付保证金。租赁期满，保证金扣除应付的机械设备毁损、灭失赔偿金后，余额退还甲方。
		<br />&nbsp;&nbsp;3．其他约定:
		。
		<br />&nbsp;&nbsp;第五条
		机械设备操作、维护与修理
		<br />&nbsp;&nbsp;1．双方约定机械设备由方负责操作、由方负责维护。
		<br />&nbsp;&nbsp;2．因故障造成机械设备无法正常作业的，按合同约定由乙方负责维护时,乙方应当自接到甲方通知时起小时内到达现场维修。乙方自接到维修通知起小时/日内未能修复的，自故障发生第日起免收租金直至机械设备恢复正常作业日止。但机械设备故障系因甲方违章指挥、违章作业造成的，甲方仍应支付停工期间的租金。
		3．双方约定机械设备正常维护保养时间为小时/月，具体时间安排为： 。
		<br />&nbsp;&nbsp;第六条
		双方权利义务
		<br />&nbsp;&nbsp;一、甲方权利义务
		<br />&nbsp;&nbsp;1．有权要求乙方按照合同约定提供符合要求的机械设备。 &nbsp;
		<br />&nbsp;&nbsp;2．有权要求乙方按照合同约定提供机械设备的操作和维修保养服务。若因乙方原因导致机械设备毁损、灭失或者出现故障无法使用的，甲方有权解除合同或要求乙方更换同等型号、性能的机械设备，并要求乙方赔偿损失。
		<br />&nbsp;&nbsp;3．按照合同约定的时间、方式和金额支付租金和其他费用。
		4．为机械设备提供进出场作业、维护保养作业的便利和安全作业环境，负责机械设备及其附件（如电缆等）在施工现场的保护保管工作，保护机械设备的安全。如因甲方原因造成机械设备毁损、灭失的，应赔偿乙方损失。
		<br />&nbsp;&nbsp;5．负责司机、指挥工的日常安全教育和进场安全技术交底，并签定安全生产责任状。 &nbsp;
		<br />&nbsp;&nbsp;6．甲方应在机械设备进场安装完毕之日起日内，组织租赁、安拆、监理单位对其进行验收，及时办理使用登记；并负责配备相应的机械设备管理人员，督促做好机械设备日常维护、保养和检查工作。
		<br />&nbsp;&nbsp;7．负责按三相五线制配置机械设备专用开关箱，以及工地配电箱至专用开关箱的电缆线；负责配备使用中所需对讲机以及各种配套吊运材料的吊具，负责提供工地宿舍，作为机械设备常用配件仓库及司机休息场所。 &nbsp;
		<br />&nbsp;&nbsp;8．按机械设备操作规程和合同约定管理使用机械设备，不得违章或超负荷作业。由甲方指派的操作人员必须持证上岗。 &nbsp;
		<br />&nbsp;&nbsp;9．未经乙方书面同意，甲方不得转租机械设备，不得对机械设备进行改造或增设他物。 &nbsp;
		<br />&nbsp;&nbsp;二、乙方权利义务 &nbsp;
		<br />&nbsp;&nbsp;1．有权按照合同约定按月收取租金。 &nbsp;
		<br />&nbsp;&nbsp;2．机械设备进场前，应认真地进行维修和保养，保证进场机械设备的完好性。 &nbsp;
		<br />&nbsp;&nbsp;3．负责提供的内业技术资料包括机械设备备案证、制造许可证、产品合格证、制造监督检验证明、使用说明书、进场前维修保养记录、定期检查、维护和保养记录，特种作业人员资格证书、特种作业人员进场前的安全教育和技术交底记录、交接班和运转记录，行业确认证书和营业执照（复印件）等。 &nbsp;
		<br />&nbsp;&nbsp;4．负责提供机械设备司机名/台，指挥工名/台。进场前，负责与上岗人员签订《劳动合同》并进行安全教育，上岗人员须持证上岗。在租赁期间，司机、指挥工应严格遵守甲、乙双方有关的劳动纪律，严格遵守安全操作规程，服从甲方项目部正常的施工安排，为甲方项目部提供优质服务，同时有权拒绝甲方提出的违章指挥和违章作业。若出现司机、指挥工违反或不能满足上述要求，甲方有权要求退回，乙方应及时协调处理直?粮弧?&nbsp;
		<br />&nbsp;&nbsp;5．按合同约定负责机械设备在租赁期间的每月定期检查、日常维护和保养工作、不定期进行机械设备检修、巡修，并及时将结果书面反馈甲方。 &nbsp;
		<br />&nbsp;&nbsp;6．负责机械设备在各种检查中发现的问题和隐患的整改，并承担应由乙方承担的处罚及相关费用。 &nbsp;
		<br />&nbsp;&nbsp;7．机械设备安装前，负责提供符合要求的基础预埋件；机械设备附着顶升前，负责提供符合要求的附着预埋件、附墙装置（含撑杆）。 &nbsp;
		<br />&nbsp;&nbsp;8．租赁期满后日内，保证金扣除应付的机械设备毁损、损失赔偿金后，乙方应将保证金余额及时返还甲方。 &nbsp;
		<br />&nbsp;&nbsp;第七条
		双方安全责任 &nbsp;
		<br />&nbsp;&nbsp;一、甲方安全责任 &nbsp;
		<br />&nbsp;&nbsp;1．甲方负责制定机械设备生产安全事故应急救援预案。 &nbsp;
		<br />&nbsp;&nbsp;2．施工现场有多台机械设备交叉作业时，甲方负责组织制定并实施防止机械设备相互碰撞的安全措施。 &nbsp;
		<br />&nbsp;&nbsp;3．甲方负责做好机械设备周边的高压线、障碍物的防护工作。
		<br />&nbsp;&nbsp;4．甲方负责在机械设备活动范围内设置明显的安全警示标志，对集中作业区做好安全防护。
		<br />&nbsp;&nbsp;二、乙方安全责任
		1．负责机械设备的安全保护装置的日常检查和维护，对机械设备的安全可靠性负责。 &nbsp;
		<br />&nbsp;&nbsp;2．在对机械设备进行检修、检查、维护保养作业过程中，乙方对机械设备及相关作业人员的安全负责。
		<br />&nbsp;&nbsp;3．当机械设备出现故障或者发生异常情况时，司机应及时通知甲乙双方相关人员，机械设备应立即停止使用，乙方应组织人员及时排除故障之后方可重新投入使用。 &nbsp;
		<br />&nbsp;&nbsp;三、双方共同安全责任 &nbsp;
		<br />&nbsp;&nbsp;1．本着“谁违章谁承担责任”的原则，甲、乙双方均应遵守机械设备安全操作规程，严禁违章指挥、违章操作。严禁强令工人违章冒险作业，严禁机械设备带病运转。
		<br />&nbsp;&nbsp;2．机械设备在使用过程中，甲乙双方均应对司机、指挥工进行日常安全教育和技术交底，督促上述人员遵守安全操作规程，规范作业方式，确保不超载，且货物放置、绑扎符合安全要求。
		<br />&nbsp;&nbsp;第八条
		违约责任 &nbsp;
		<br />&nbsp;&nbsp;一、甲方违约责任：
		<br />&nbsp;&nbsp;1．甲方未按合同约定支付租金的，按每逾期一日元的标准向乙方支付延期违约金。租金逾期满日未支付的，乙方有权解除合同并要求甲方支付违约金。 &nbsp;
		<br />&nbsp;&nbsp;2．按合同约定的进场时间，若因甲方原因影响机械设备进场安装超过日，乙方有权终止合同并向甲方收取违约金元。 &nbsp;
		<br />&nbsp;&nbsp;3．甲方未按有关法律、法规规定或合同约定的方法使用机械设备，致使机械设备受到严重损坏的，乙方有权解除合同并要求甲方赔偿损失。 &nbsp;
		<br />&nbsp;&nbsp;4．其他约定：。 &nbsp;
		<br />&nbsp;&nbsp;二、乙方违约责任： &nbsp;
		<br />&nbsp;&nbsp;1．乙方无法提供合同约定的机械设备或提供的机械设备型号和规格与合同不符，导致合同无法履行的，甲方有权解除合同并要求乙方支付违约金元。
		<br />&nbsp;&nbsp;2．乙方未按合同约定日期提供机械设备的，应按照每逾期一日每台次元的标准向甲方支付违约金。累计逾期满日的，甲方有权解除合同并要求乙方支付违约金元。
		<br />&nbsp;&nbsp;3．在合同期间因乙方原因（包括乙方指派的操作、维护人员的行为，但乙方按照合同约定对机械设备进行维修保养的时间除外）导致机械设备停工的，每停工一天，甲方除扣减相应的租金外，可要求乙方支付每台次元/日的违约金。累计停工超过日的，甲方有权解除合同并要求乙方赔偿损失。 &nbsp;
		<br />&nbsp;&nbsp;4．乙方未按合同约定期及时返还保证金，应按照每逾期一日元的标准向甲方支付违约金。
		<br />&nbsp;&nbsp;5．其他约定：
		<br />&nbsp;&nbsp;第九条
		不可抗力
		<br />&nbsp;&nbsp;当事人一方因不可抗力不能按照合同约定履行本合同的，根据不可抗力的影响，可部分或全部免除责任；当事人一方因不可抗力不能履行合同的，应当及时告知对方，并自不可抗力结束之日起日内向对方当事人提供证明。 &nbsp;
		<br />&nbsp;&nbsp;第十条
		争议解决 &nbsp;
		<br />&nbsp;&nbsp;本合同项下发生的争议，由双方协商解决，也可由行业主管部门调解，协商或者调解不成的，按下列第
		1种方式解决。 &nbsp;
		<br />&nbsp;&nbsp;1．向人民法院提起诉讼； &nbsp;
		<br />&nbsp;&nbsp;2．向仲裁委员会申请仲裁。 &nbsp;
		<br />&nbsp;&nbsp;第十一条
		其他条款 &nbsp;
		<br />&nbsp;&nbsp;1．本合sb.append("同自双方签字并盖章之日起生效。本合同及附件共页，一式份，具有同等法律效力，其中甲方
		份，乙方 份。
		<br />&nbsp;&nbsp;2．本合同附件以及合同履行过程中形成的各种书面文件，经双方签署确认后为本合同的组成部分，与本合同具有同等法律效力。
		<br />&nbsp;&nbsp;3．本合同未尽事宜，双方可协商签订补充协议，补充协议与本合同具有同等法律效力。 &nbsp;
		<br />&nbsp;&nbsp;&nbsp;承租人：（甲方签章） &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		出 租 人：（乙方签章） &nbsp;
		<br />&nbsp;&nbsp;&nbsp;住
		所： &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;住
		所： &nbsp;
		<br />&nbsp;&nbsp;&nbsp;法定代表人： &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;法定代表人： &nbsp;
		<br />&nbsp;&nbsp;&nbsp;委托代理人： &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;委托代理人： &nbsp;
		<br />&nbsp;&nbsp;&nbsp;电
		话： &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电
		话： &nbsp;
		<br />&nbsp;&nbsp;&nbsp;传
		真： &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;传
		真： &nbsp;
		<br />&nbsp;&nbsp;&nbsp;开
		户 银 行： &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;开
		户 银 行： &nbsp;
		<br />&nbsp;&nbsp;&nbsp;帐
		号： &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;帐
		号： &nbsp;
		<br />&nbsp;&nbsp;&nbsp;邮
		政 编 码： &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮
		政 编 码： &nbsp;
		<br />&nbsp;&nbsp;&nbsp;年
		月 日 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年
		月 日 &nbsp;
		<br />
	</span>
</p>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 