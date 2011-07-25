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
            tableHtml +="<td><input type='button' onClick='javascript:delRow(this.parentElement.parentElement)' value='ɾ��'></td></tr>";
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
    var eCa1selected = value=="��"?"selected":"",
        eCa2selected = value=="ˮ"?"selected":"",
        eCa3selected = value=="ȼ��(��Ȼ����ú��)"?"selected":"",
        eCa4selected = value=="���й�����"?"selected":"",
        eCa5selected = value=="���й�����"?"selected":"",
        eCa6selected = value=="������Դ"?"selected":"",
        eCa7selected = value=="ú"?"selected":"",
        eCa8selected = value=="Һ��ʯ����"?"selected":"",
        eCa9selected = value=="�˹�ú��"?"selected":"",
        eCa10selected = value=="����"?"selected":"",
        eCa11selected = value=="ú��"?"selected":"",
        eCa12selected = value=="����"?"selected":"",
        eCa13selected = value=="��������Դ"?"selected":"";
    var optionstr = "";
    optionstr +="<option value='��' "+eCa1selected +">��</option>";
    optionstr +="<option value='ˮ' "+eCa2selected +">ˮ</option>";
    optionstr +="<option value='ȼ��(��Ȼ����ú��)' "+eCa3selected +">ȼ��(��Ȼ����ú��)</option>";
    optionstr +="<option value='���й�����' "+eCa4selected +">���й�����</option>";
    optionstr +="<option value='���й�����' "+eCa5selected +">���й�����</option>";
    optionstr +="<option value='������Դ' "+eCa6selected +">������Դ</option>";
    optionstr +="<option value='ú' "+eCa7selected +">ú</option>";
    optionstr +="<option value='Һ��ʯ����' "+eCa8selected +">Һ��ʯ����</option>";
    optionstr +="<option value='�˹�ú��' "+eCa9selected +">�˹�ú��</option>";
    optionstr +="<option value='����' "+eCa10selected+">����</option>";
    optionstr +="<option value='ú��' "+eCa11selected+">ú��</option>";
    optionstr +="<option value='����' "+eCa12selected+">����</option>";
    optionstr +="<option value='��������Դ' "+eCa13selected+">��������Դ</option>";
    return optionstr;
}

function getEItSelect(value)
{
    var eIt1selected = value=="���������õ�"?"selected":"",
        eIt2selected = value=="�յ��õ�"?"selected":"",
        eIt3selected = value=="�����õ�"?"selected":"",
        eIt4selected = value=="�����õ�"?"selected":"";
    var optionstr = "";
    optionstr +="<option value='���������õ�' "+eIt1selected+">���������õ�</option>";
    optionstr +="<option value='�յ��õ�' "+eIt2selected+">�յ��õ�</option>";
    optionstr +="<option value='�����õ�' "+eIt3selected+">�����õ�</option>";
    optionstr +="<option value='�����õ�' "+eIt4selected+">�����õ�</option>";
    return optionstr;
}

function getL1Select(value)
{
    var l1selected = value=="���������"?"selected":"",
        l2selected = value=="������Ӧ��"?"selected":"",
        l3selected = value=="���⾰������"?"selected":"",
        l4selected = value=="����վ"?"selected":"",
        l5selected = value=="�յ�ĩ��"?"selected":"",
        l6selected = value=="����"?"selected":"",
        l7selected = value=="ˮ��"?"selected":"",
        l8selected = value=="ͨ���"?"selected":"",
        l9selected = value=="��Ϣ����"?"selected":"",
        l10selected = value=="ϴ�·�"?"selected":"",
        l11selected = value=="��������"?"selected":"",
        l12selected = value=="��Ӿ��"?"selected":"",
        l13selected = value=="����"?"selected":"",
        l14selected = value=="����"?"selected":"";
    var optionstr = "";
    optionstr +="<option value='���������' "+l1selected +">���������</option>";
    optionstr +="<option value='������Ӧ��' "+l2selected +">������Ӧ��</option>";
    optionstr +="<option value='���⾰������' "+l3selected +">���⾰������</option>";
    optionstr +="<option value='����վ' "+l4selected +">����վ</option>";
    optionstr +="<option value='�յ�ĩ��' "+l5selected +">�յ�ĩ��</option>";
    optionstr +="<option value='����' "+l6selected +">����</option>";
    optionstr +="<option value='ˮ��' "+l7selected +">ˮ��</option>";
    optionstr +="<option value='ͨ���' "+l8selected +">ͨ���</option>";
    optionstr +="<option value='��Ϣ����' "+l9selected +">��Ϣ����</option>";
    optionstr +="<option value='ϴ�·�' "+l10selected+">ϴ�·�</option>";
    optionstr +="<option value='��������' "+l11selected+">��������</option>";
    optionstr +="<option value='��Ӿ��' "+l12selected+">��Ӿ��</option>";
    optionstr +="<option value='����' "+l13selected+">����</option>";
    optionstr +="<option value='����' "+l14selected+">����</option>";
    return optionstr;
}

function getL2Select(value)
{
    var l1selected = value=="�䶳��"?"selected":"",
        l2selected = value=="��ȴ��"?"selected":"",
        l3selected = value=="���"?"selected":"",
        l4selected = value=="����"?"selected":"",
        l5selected = value=="��ˮѭ����"?"selected":"",
        l6selected = value=="���¯"?"selected":"";
    var optionstr = "";
    optionstr +="<option value='�䶳��' "+l1selected +">�䶳��</option>";
    optionstr +="<option value='��ȴ��' "+l2selected +">��ȴ��</option>";
    optionstr +="<option value='���' "+l3selected +">���</option>";
    optionstr +="<option value='����' "+l4selected +">����</option>";
    optionstr +="<option value='��ˮѭ����' "+l5selected +">��ˮѭ����</option>";
    optionstr +="<option value='���¯' "+l6selected +">���¯</option>";
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
                ���������Ϣ
            </td>
        </tr>
        <tr>
            <th scope="col" width="12%" class="style1">
                ��ַ
            </th>
            <th scope="col" width="12%" class="style1">
                ���߱��
            </th>
            <th scope="col" width="12%" class="style1">
                ��ѹ���
            </th>
            <th scope="col" width="12%" class="style1">
                �������
            </th>
            <th scope="col" width="12%" class="style1">
                �����ܺ�
            </th>
            <th scope="col" width="12%" class="style1">
                �����ܺ�
            </th>
            <th scope="col" width="12%" class="style1">
                һ������
            </th>
            <th scope="col" width="12%" class="style1">
                ��������
            </th>
            <th class="style1">
            </th>
        </tr>
        <%Response.Write(tablehtml) %>
        <tr>
            <td colspan="9" class="center" align="center">
                <input id="save" name="save" value="true" type="hidden" />
                <input id="addBT" name="add" type="button" onclick="addRow()" value="���" />
                <input id="SaveMeter" name="SaveMeter" type="submit" value="����" />
                <span id="result"><%=result%></span>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
