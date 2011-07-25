<!-- #include file ="saveFun.asp" -->
<%
var isSave =Request.Form("save");
var result="";
if(isSave=="true"){
      result = SaveConfigInfo();
    }

var METER_TYPE_1="1",
    METER_TYPE_2="2",
    METER_TYPE_3="3",
    METER_TYPE_4="4",
    METER_BUS_1="1",
    METER_BUS_2="2",
    METER_BUS_3="3",
    METER_BUS_4="4",
    METER_SUBTYPE_1="1",
    METER_SUBTYPE_2="2"; 
var Meters = GetMeters();
var tablehtml = produceHtml(Meters);
function produceHtml(meters)
{
    var tableHtml="";
   for(item in meters.Buses)
   {
        var bus = meters.Buses[item];
        for(iitem in bus.Meters)
        {
            var meter = bus.Meters[iitem];
            tableHtml +="<tr>";
            tableHtml +="<td><input id='address' type='text' name='address' style='width: 97%; background-color: #FFFFEF' value='";
            tableHtml +=meter.meterID;
            tableHtml +="' /></td>";
            tableHtml +="<td><select id='busNum' type='text' name='busNum' style='width: 97%; background-color: #FFFFEF'>";
            tableHtml +=getbusSelect(bus.id);
            tableHtml +="</select></td>";
            tableHtml +="<td><input id='dybb' type='text' name='dybb' style='width: 97%; background-color: #FFFFEF' value='";
            tableHtml +=meter.dybb;
            tableHtml +="' /></td>";
            tableHtml +="<td><input id='dlbb' type='text' name='dlbb' style='width: 97%; background-color: #FFFFEF' value='";
            tableHtml +=meter.dlbb;
            tableHtml +="' /></td>";
            tableHtml +="<td><select id='energyConsumptionCa' type='text' name='energyConsumptionCa' style='width: 97%; background-color: #FFFFEF'>";
            tableHtml +=getECaSelect(meter.energyConsumptionCa);
            tableHtml +="</select></td>";
            tableHtml +="<td><select id='energyConsumptionItem' type='text' name='energyConsumptionItem' style='width: 97%; background-color: #FFFFEF'>";
            tableHtml +=getEItSelect(meter.energyConsumptionItem);
            tableHtml +="</select></td>";
            tableHtml +="<td><select id='level1Item' type='text' name='level1Item' style='width: 97%; background-color: #FFFFEF'>";
            tableHtml +=getL1Select(meter.level1Item);
            tableHtml +="</select></td>";
            tableHtml +="<td><select id='level2Item' type='text' name='level2Item' style='width: 97%; background-color: #FFFFEF'>";
            tableHtml +=getL2Select(meter.level2Item);
            tableHtml +="</select></td>";
            tableHtml +="<td><input type='button' onClick='javascript:delRow(this.parentElement.parentElement)' value='删除'></td></tr>";
        }
   }
   return tableHtml;
}

function getbusSelect(value)
{
    var bus1selected = value==METER_BUS_1?"selected":"",
        bus2selected = value==METER_BUS_2?"selected":"",
        bus3selected = value==METER_BUS_3?"selected":"",
        bus4selected = value==METER_BUS_4?"selected":"";
    var optionstr = "";
    optionstr +="<option value='"+METER_BUS_1+"' "+bus1selected+">1</option>";
    optionstr +="<option value='"+METER_BUS_2+"' "+bus2selected+">2</option>";
    optionstr +="<option value='"+METER_BUS_3+"' "+bus3selected+">3</option>";
    optionstr +="<option value='"+METER_BUS_4+"' "+bus4selected+">4</option>";
    return optionstr;
}

function getECaSelect(value)
{
    var eCa1selected = value=="电"?"selected":"",
        eCa2selected = value=="水"?"selected":"",
        eCa3selected = value=="燃气(天然气或煤气)"?"selected":"",
        eCa4selected = value=="集中供热量"?"selected":"",
        eCa5selected = value=="集中供冷量"?"selected":"",
        eCa6selected = value=="其它能源"?"selected":"",
        eCa7selected = value=="煤"?"selected":"",
        eCa8selected = value=="液化石油气"?"selected":"",
        eCa9selected = value=="人工煤气"?"selected":"",
        eCa10selected = value=="汽油"?"selected":"",
        eCa11selected = value=="煤油"?"selected":"",
        eCa12selected = value=="柴油"?"selected":"",
        eCa13selected = value=="可再生能源"?"selected":"";
    var optionstr = "";
    optionstr +="<option value='电' "+eCa1selected +">电</option>";
    optionstr +="<option value='水' "+eCa2selected +">水</option>";
    optionstr +="<option value='燃气(天然气或煤气)' "+eCa3selected +">燃气(天然气或煤气)</option>";
    optionstr +="<option value='集中供热量' "+eCa4selected +">集中供热量</option>";
    optionstr +="<option value='集中供冷量' "+eCa5selected +">集中供冷量</option>";
    optionstr +="<option value='其它能源' "+eCa6selected +">其它能源</option>";
    optionstr +="<option value='煤' "+eCa7selected +">煤</option>";
    optionstr +="<option value='液化石油气' "+eCa8selected +">液化石油气</option>";
    optionstr +="<option value='人工煤气' "+eCa9selected +">人工煤气</option>";
    optionstr +="<option value='汽油' "+eCa10selected+">汽油</option>";
    optionstr +="<option value='煤油' "+eCa11selected+">煤油</option>";
    optionstr +="<option value='柴油' "+eCa12selected+">柴油</option>";
    optionstr +="<option value='可再生能源' "+eCa13selected+">可再生能源</option>";
    return optionstr;
}

function getEItSelect(value)
{
    var eIt1selected = value=="照明插座用电"?"selected":"",
        eIt2selected = value=="空调用电"?"selected":"",
        eIt3selected = value=="动力用电"?"selected":"",
        eIt4selected = value=="特殊用电"?"selected":"";
    var optionstr = "";
    optionstr +="<option value='照明插座用电' "+eIt1selected+">照明插座用电</option>";
    optionstr +="<option value='空调用电' "+eIt2selected+">空调用电</option>";
    optionstr +="<option value='动力用电' "+eIt3selected+">动力用电</option>";
    optionstr +="<option value='特殊用电' "+eIt4selected+">特殊用电</option>";
    return optionstr;
}

function getL1Select(value)
{
    var l1selected = value=="照明与插座"?"selected":"",
        l2selected = value=="走廊与应急"?"selected":"",
        l3selected = value=="室外景观照明"?"selected":"",
        l4selected = value=="冷热站"?"selected":"",
        l5selected = value=="空调末端"?"selected":"",
        l6selected = value=="电梯"?"selected":"",
        l7selected = value=="水泵"?"selected":"",
        l8selected = value=="通风机"?"selected":"",
        l9selected = value=="信息中心"?"selected":"",
        l10selected = value=="洗衣房"?"selected":"",
        l11selected = value=="厨房餐厅"?"selected":"",
        l12selected = value=="游泳池"?"selected":"",
        l13selected = value=="健身房"?"selected":"",
        l14selected = value=="其它"?"selected":"";
    var optionstr = "";
    optionstr +="<option value='照明与插座' "+l1selected +">照明与插座</option>";
    optionstr +="<option value='走廊与应急' "+l2selected +">走廊与应急</option>";
    optionstr +="<option value='室外景观照明' "+l3selected +">室外景观照明</option>";
    optionstr +="<option value='冷热站' "+l4selected +">冷热站</option>";
    optionstr +="<option value='空调末端' "+l5selected +">空调末端</option>";
    optionstr +="<option value='电梯' "+l6selected +">电梯</option>";
    optionstr +="<option value='水泵' "+l7selected +">水泵</option>";
    optionstr +="<option value='通风机' "+l8selected +">通风机</option>";
    optionstr +="<option value='信息中心' "+l9selected +">信息中心</option>";
    optionstr +="<option value='洗衣房' "+l10selected+">洗衣房</option>";
    optionstr +="<option value='厨房餐厅' "+l11selected+">厨房餐厅</option>";
    optionstr +="<option value='游泳池' "+l12selected+">游泳池</option>";
    optionstr +="<option value='健身房' "+l13selected+">健身房</option>";
    optionstr +="<option value='其它' "+l14selected+">其它</option>";
    return optionstr;
}

function getL2Select(value)
{
    var l1selected = value=="冷冻泵"?"selected":"",
        l2selected = value=="冷却泵"?"selected":"",
        l3selected = value=="冷机"?"selected":"",
        l4selected = value=="冷塔"?"selected":"",
        l5selected = value=="热水循环泵"?"selected":"",
        l6selected = value=="电锅炉"?"selected":"";
    var optionstr = "";
    optionstr +="<option value='冷冻泵' "+l1selected +">冷冻泵</option>";
    optionstr +="<option value='冷却泵' "+l2selected +">冷却泵</option>";
    optionstr +="<option value='冷机' "+l3selected +">冷机</option>";
    optionstr +="<option value='冷塔' "+l4selected +">冷塔</option>";
    optionstr +="<option value='热水循环泵' "+l5selected +">热水循环泵</option>";
    optionstr +="<option value='电锅炉' "+l6selected +">电锅炉</option>";
    return optionstr;
}
%>
<html>
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="cipnet.css" />
    <script src="jquery-1.5.1.min.js" type="text/javascript"></script>
    <script src="cipnet.js" type="text/javascript"></script>
    <style type="text/css">
        .style1
        {
            height: 20px;
        }
    </style>
</head>
<body class="iframe">
    <form id="form1" action="MetersConfig.asp" method="post">
    <table id="tb" class="show" width="98%" border="1" align="center" cellpadding="1" cellspacing="1">
        <tr>
            <td class="title" title="cipnetConfig" colspan="9">
                表计配置信息
            </td>
        </tr>
        <tr>
            <th scope="col" width="12%" class="style1">
                地址
            </th>
            <th scope="col" width="12%" class="style1">
                总线编号
            </th>
            <th scope="col" width="12%" class="style1">
                电压变比
            </th>
            <th scope="col" width="12%" class="style1">
                电流变比
            </th>
            <th scope="col" width="12%" class="style1">
                分类能耗
            </th>
            <th scope="col" width="12%" class="style1">
                分项能耗
            </th>
            <th scope="col" width="12%" class="style1">
                一级子项
            </th>
            <th scope="col" width="12%" class="style1">
                二级子项
            </th>
            <th class="style1">
            </th>
        </tr>
        <%Response.Write(tablehtml) %>
        <tr>
            <td colspan="9" class="center" align="center">
                <input id="save" name="save" value="true" type="hidden" />
                <input id="addBT" name="add" type="button" onclick="addRow()" value="添加" />
                <input id="SaveMeter" name="SaveMeter" type="submit" value="保存" />
                <span id="result"><%=result%></span>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
