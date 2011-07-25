<!-- #include file ="saveFun.asp" -->
<%
    var isSave =Request.Form("save");
    if(isSave=="true"){
      var result = SaveCIPConfig();
      if(result == true)
      result = "保存成功!";
      else
      result ="保存失败!";
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
                CIPNET配置
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
                采集 GUID:
            </td>
            <td class="text">
                <input id="GatherGuid" name="sensorGuid" type="text" value="<%Response.write(conf.Guid) %>" />
            </td>
            <td>
                其他：
            </td>
            <td class="text">
                <input id="Others" name="Other" type="text" value="<%Response.write(conf.Guid) %>" />
            </td>
        </tr>
        <tr>
            <td>
                采集间隔(分钟):
            </td>
            <td class="text">
                <input id="GatherPeriod" name="collectInterval" type="text" value="<%Response.write(conf.CInter) %>" />
            </td>
            <td>
                发送间隔(分钟):
            </td>
            <td class="text">
                <input id="SendPeriod" name="sendInterval" type="text" value="<%Response.write(conf.SInter) %>" />
            </td>
        </tr>
        <tr>
            <td>
                心跳间隔(分钟):
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
                <input id="SaveCipnetConfig" name="SaveCipnetConfig" type="submit" value="保存" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
