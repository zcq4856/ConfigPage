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
            <td>
                ������������:
            </td>
            <td class="text">
                <input id="region" name="region" type="text" value="<%Response.write(conf.Region) %>" />
            </td>
        </tr>
        <tr>
            <td>
                �������:
            </td>
            <td class="text">
                <select id="buildingCategory" name="buildingCategory" style="width:100%">
                    <option value="A" <%=getSelected("A",conf.BuildCate) %>>�칫����</option>
                    <option value="B" <%=getSelected("B",conf.BuildCate) %>>�̳�����</option>
                    <option value="C" <%=getSelected("C",conf.BuildCate) %>>���ݷ��꽨��</option>
                    <option value="D" <%=getSelected("D",conf.BuildCate) %>>�Ļ���������</option>
                    <option value="E" <%=getSelected("E",conf.BuildCate) %>>ҽ����������</option>
                    <option value="F" <%=getSelected("F",conf.BuildCate) %>>��������</option>
                    <option value="G" <%=getSelected("G",conf.BuildCate) %>>�ۺϽ���</option>
                    <option value="H" <%=getSelected("H",conf.BuildCate) %>>��������</option>
                </select>
            </td>
            <td>
                ����ʶ��:
            </td>
            <td class="text">
            <input id="buildingIdentification" name="buildingIdentification" type="text" value="<%Response.write(conf.BuildIden) %>" />
            </td>
        </tr>
        <tr>
            <td>
                ���ݲɼ���ʶ����:
            </td>
            <td class="text">
                <input id="collectorIdentification" name="collectorIdentification" type="text" value="<%Response.write(conf.ColleIden) %>" />
            </td>
            <td colspan="2" align="right">
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
