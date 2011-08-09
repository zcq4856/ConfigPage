<!-- #include file ="saveFun.asp" -->
<%
var isSave =Request.Form("save");
if(isSave=="true"){
      var rt = SaveConfigInfo();
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
            tableHtml +="<tr><td><input id='guid' type='text' name='guid' style='width: 97%; background-color: #FFFFEF' value='";
            tableHtml +=meter.guid;
            tableHtml +="' /></td>";
            tableHtml +="<td><input id='address' type='text' name='address' style='width: 97%; background-color: #FFFFEF' value='";
            tableHtml +=meter.meterID;
            tableHtml +="' /></td>";
            tableHtml +="<td><select id='busNum' type='text' name='busNum' style='width: 97%; background-color: #FFFFEF'>";
            tableHtml +=getbusSelect(bus.id);
            tableHtml +="</select></td>";
            tableHtml +="<td><select id='type' type='text' name='type' style='width: 97%; background-color: #FFFFEF'>";
            tableHtml +=gettypeSelect(meter.meterType);
            tableHtml +="</select></td>";
            tableHtml +="<td><select id='subtype' type='text' name='subtype' style='width: 97%; background-color: #FFFFEF'>";
            tableHtml +=getsubtypeSelect(meter.meterSubType);
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

function gettypeSelect(value)
{
    var type1selected = value==METER_TYPE_1?"selected":"",
        type2selected = value==METER_TYPE_2?"selected":"",
        type3selected = value==METER_TYPE_3?"selected":"",
        type4selected = value==METER_TYPE_4?"selected":"";
    var optionstr = "";
    optionstr +="<option value='"+METER_TYPE_1+"' "+type1selected+">电表</option>";
    optionstr +="<option value='"+METER_TYPE_2+"' "+type2selected+">水表</option>";
    optionstr +="<option value='"+METER_TYPE_3+"' "+type3selected+">气表</option>";
    optionstr +="<option value='"+METER_TYPE_4+"' "+type4selected+">热表</option>";
    return optionstr;
}

function getsubtypeSelect(value)
{
var subtype1selected = value==METER_TYPE_1?"selected":"",
        subtype2selected = value==METER_TYPE_2?"selected":"";
    var optionstr = "";
    optionstr +="<option value='"+METER_SUBTYPE_1+"' "+subtype1selected+">1</option>";
    optionstr +="<option value='"+METER_SUBTYPE_2+"' "+subtype2selected+">2</option>";
    return optionstr;
}
%>
<html>
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="cipnet.css" />
    <script src="jquery-1.5.1.min.js" type="text/javascript"></script>
    <script src="cipnet.js" type="text/javascript"></script>
</head>
<body class="iframe">
    <form id="form1" action="MetersConfig.asp" method="post">
    <table id="tb" class="show" width="98%" border="1" align="center" cellpadding="1" cellspacing="1">
        <tr>
            <td class="title" title="cipnetConfig" colspan="6">
                表计配置信息
            </td>
        </tr>
        <tr>
            <th scope="col" width="20%">
                GUID
            </th>
            <th scope="col" width="20%">
                地址
            </th>
            <th scope="col" width="20%">
                总线编号
            </th>
            <th scope="col" width="20%">
                类型
            </th>
            <th scope="col" width="20%">
                子表类型
            </th>
            <th>
            </th>
        </tr>
        <%Response.Write(tablehtml) %>
        <tr>
            <td colspan="6" class="center" align="center">
                <input id="save" name="save" value="true" type="hidden" />
                <input id="addBT" name="add" type="button" onclick="addRow()" value="添加" />
                <input id="SaveMeter" name="SaveMeter" type="submit" value="保存" />
                <span id="result"><%if(rt!=undefined)Response.Write(rt) %></span>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
