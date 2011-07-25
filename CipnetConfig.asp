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

    function getSelected(shouldtype,realtype)
    {
        if(shouldtype == realtype)
            return "selected";
            else
            return "";
    }
%>
<html>
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="cipnet.css" />
    <script src="jquery-1.5.1.min.js" type="text/javascript"></script>
    <script src="cipnet.js" type="text/javascript"></script>
</head>
<body class="iframe">
    <form action="CipnetConfig.asp" id="form1" method="post">
    <table class="show nowrap" width="66%" align="center" border="1" cellpadding="1"
        cellspacing="1">
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
            <td>
                行政区划代码:
            </td>
            <td class="text">
                <input id="region" name="region" type="text" value="<%Response.write(conf.Region) %>" />
            </td>
        </tr>
        <tr>
            <td>
                建筑类别:
            </td>
            <td class="text">
                <select id="buildingCategory" name="buildingCategory" style="width:100%">
                    <option value="A" <%=getSelected("A",conf.BuildCate) %>>办公建筑</option>
                    <option value="B" <%=getSelected("B",conf.BuildCate) %>>商场建筑</option>
                    <option value="C" <%=getSelected("C",conf.BuildCate) %>>宾馆饭店建筑</option>
                    <option value="D" <%=getSelected("D",conf.BuildCate) %>>文化教育建筑</option>
                    <option value="E" <%=getSelected("E",conf.BuildCate) %>>医疗卫生建筑</option>
                    <option value="F" <%=getSelected("F",conf.BuildCate) %>>体育建筑</option>
                    <option value="G" <%=getSelected("G",conf.BuildCate) %>>综合建筑</option>
                    <option value="H" <%=getSelected("H",conf.BuildCate) %>>其它建筑</option>
                </select>
            </td>
            <td>
                建筑识别:
            </td>
            <td class="text">
            <input id="buildingIdentification" name="buildingIdentification" type="text" value="<%Response.write(conf.BuildIden) %>" />
            </td>
        </tr>
        <tr>
            <td>
                数据采集器识别码:
            </td>
            <td class="text">
                <input id="collectorIdentification" name="collectorIdentification" type="text" value="<%Response.write(conf.ColleIden) %>" />
            </td>
            <td colspan="2" align="right">
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
