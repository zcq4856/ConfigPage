<!-- #include file ="saveFun.asp" -->
<%
    var log = ReadLog();
%>
<html>
<head runat="server">
    <title></title>
      <link rel="Stylesheet" type="text/css"  href="cipnet.css" />
    <script src="jquery-1.5.1.min.js" type="text/javascript"></script>
</head>
<body class="iframe">
    <form action= id="form1">
    <div style="padding-top:7px">
    <%Response.Write(log) %>
    </div>
    </form>
</body>
</html>
