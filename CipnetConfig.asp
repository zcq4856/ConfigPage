<!-- #include file ="saveFun.asp" -->
<%
    var isSave =Request.Form("save");
    if(isSave=="true"){
      var result = SaveCIPConfig();
      if(result == true)
      result = "����ɹ�!";
      else
      result ="����ʧ��!";
    }
    var conf = GetCIPConf();
%>
<html>
<head>
    <title></title>
        <link rel="stylesheet" type="text/css" href="cipnet.css" />
</head>
<body class="iframe">
    <form action="CipnetConfig.asp" id="form1" method="post">
    <table class="show" width="66%" align="center" border="1" cellpadding="1" cellspacing="1">
        <tr>
            <td class="title" title="cipnetConfig" colspan="4">
                CIPNET����
            </td>
        </tr>
        <tr>
            <td>
                Server IP:
            </td>
            <td class="text">
                <input id="ServerIP" name="ServerIP" type="text" value="<%Response.write(conf.IP) %>" />
            </td>
            <td>
                Server Port:
            </td>
            <td class="text">
                <input id="ServerPort" name="ServerPort" type="text" value="<%Response.write(conf.PORT) %>" />
            </td>
        </tr>
        <tr>
            <td>
                �ɼ� GUID:
            </td>
            <td class="text">
                <input id="GatherGuid" name="sensorGuid" type="text" value="<%Response.write(conf.Guid) %>" />
            </td>
            <td>
                ������
            </td>
            <td class="text">
                <input id="Others" name="Other" type="text" value="<%Response.write(conf.Guid) %>" />
            </td>
        </tr>
        <tr>
            <td>
                �ɼ����(����):
            </td>
            <td class="text">
                <input id="GatherPeriod" name="collectInterval" type="text" value="<%Response.write(conf.CInter) %>" />
            </td>
            <td>
                ���ͼ��(����):
            </td>
            <td class="text">
                <input id="SendPeriod" name="sendInterval" type="text" value="<%Response.write(conf.SInter) %>" />
            </td>
        </tr>
        <tr>
            <td>
                �������(����):
            </td>
            <td class="text">
                <input id="HeartbeatPeriod" name="beatInterval" type="text" value="<%Response.write(conf.BInter) %>" />
            </td>
            <td colspan="2">
            </td>
        </tr>
        <tr>
            <td colspan="4" align="right">
                <input id="save" name="save" value="true" type="hidden" />
                <span>
                    <%Response.Write(result) %></span>
                <input id="SaveCipnetConfig" name="SaveCipnetConfig" type="submit" value="����" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
