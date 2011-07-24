<%@  language="javascript" %>
<%
    var SourceConfigFile = "\\Nand\\cipsensor.ui\\sample.xml",
        SourceLogFile = "\\Nand\\cipsensor.ui\\logfile.log",
        rootNodeNodeName = "CIPNET",
         CIP_sIpNodeName = "serverIP",
      CIP_sPortrNodeName = "serverPort",
       CIP_otherNodeName = "other",
       CIP_sGuidNodeName = "sensorGuid",
   CIP_cIntervalNodeName = "collectInterval",
   CIP_sendInterNodeName = "sendInterval",
   CIP_beatInterNodeName = "beatInterval";
    CIP_MeterinfoNodeName = "meterInfo";

    function SaveCIPConfig() {
        var objXml = GetConfXMLObj(),
          serverIP = new String(Request.Form("serverIP")),
        serverport = new String(Request.Form("serverport")),
             other = new String(Request.Form("other")),
        sensorGuid = new String(Request.Form("sensorGuid")),
   collectInterval = new String(Request.Form("collectInterval")),
      sendInterval = new String(Request.Form("sendInterval")),
      beatInterval = new String(Request.Form("beatInterval"));

        SaveNode(objXml, CIP_sIpNodeName, serverIP);
        SaveNode(objXml, CIP_sPortrNodeName, serverport);
        SaveNode(objXml, CIP_otherNodeName, other);
        SaveNode(objXml, CIP_sGuidNodeName, sensorGuid);
        SaveNode(objXml, CIP_cIntervalNodeName, collectInterval);
        SaveNode(objXml, CIP_sendInterNodeName, sendInterval);
        SaveNode(objXml, CIP_beatInterNodeName, beatInterval);
        objXml.save(SourceConfigFile);
        return true;
    };


    function GetConfXMLObj() {
        var objXML = new ActiveXObject("Microsoft.XMLDOM");
        objXML.async = false;
        objXML.load(SourceConfigFile);
        if (objXML.parseError.errorCode != 0) {
            var myErr = objXML.parseError;
            Response.Write("You have error " + myErr.reason);
            objXML.loadXML("<?xml version='1.0' encoding='GB2312'?><?xml-stylesheet type='text/xsl'?><CIPNET><serverIP></serverIP><serverPort></serverPort><other></other><sensorGuid></sensorGuid><collectInterval>20</collectInterval><sendInterval></sendInterval><beatInterval></beatInterval><meterInfo></meterInfo></CIPNET>");
        }
        return objXML;
    }

    function ReadNode(objXml, node) {
        _node = objXml.documentElement.selectSingleNode(node);
        if (_node == null)
            _node = objXml.createTextNode('');
        return _node;
    };

    function SaveNode(objXml, node, text) {
        _node = objXml.documentElement.selectSingleNode(node);
        if (_node == null) {
            Response.Write("error");
        }
        else {
            _node.text = text;
        }
    }

    function GetCIPConf() {
        var objXml = GetConfXMLObj();
        function CIP() { };
        CIP.IP = ReadNode(objXml, CIP_sIpNodeName).text.replace(/^\s*/, "").replace(/\s*$/, "");
        CIP.PORT = ReadNode(objXml, CIP_sPortrNodeName).text.replace(/^\s*/, "").replace(/\s*$/, "");
        CIP.OTHER = ReadNode(objXml, CIP_otherNodeName).text.replace(/^\s*/, "").replace(/\s*$/, "");
        CIP.Guid = ReadNode(objXml, CIP_sGuidNodeName).text.replace(/^\s*/, "").replace(/\s*$/, "");
        CIP.CInter = ReadNode(objXml, CIP_cIntervalNodeName).text.replace(/^\s*/, "").replace(/\s*$/, "");
        CIP.SInter = ReadNode(objXml, CIP_sendInterNodeName).text.replace(/^\s*/, "").replace(/\s*$/, "");
        CIP.BInter = ReadNode(objXml, CIP_beatInterNodeName).text.replace(/^\s*/, "").replace(/\s*$/, "");
        return CIP;
    }

    function GetCIPConfstr() {
        var objXml = GetConfXMLObj();
        var CIP = new Array();
        CIP[0] = ReadNode(objXml, CIP_sIpNodeName).text.replace(/^\s*/, "").replace(/\s*$/, "");
        CIP[1] = ReadNode(objXml, CIP_sPortrNodeName).text.replace(/^\s*/, "").replace(/\s*$/, "");
        CIP[2] = ReadNode(objXml, CIP_otherNodeName).text.replace(/^\s*/, "").replace(/\s*$/, "");
        CIP[3] = ReadNode(objXml, CIP_sGuidNodeName).text.replace(/^\s*/, "").replace(/\s*$/, "");
        CIP[4] = ReadNode(objXml, CIP_cIntervalNodeName).text.replace(/^\s*/, "").replace(/\s*$/, "");
        CIP[5] = ReadNode(objXml, CIP_sendInterNodeName).text.replace(/^\s*/, "").replace(/\s*$/, "");
        CIP[6] = ReadNode(objXml, CIP_beatInterNodeName).text.replace(/^\s*/, "").replace(/\s*$/, "");
        
        return CIP.join(',');
    }

    function GetMeters() {
        var objXml = GetConfXMLObj();
        var meterinfo = new Object();
        meterinfo.BusNodes = ReadNode(objXml, CIP_MeterinfoNodeName).childNodes;
        var num = meterinfo.BusNodes.length;
        meterinfo.Buses = new Array();
        for (var index = 0; index < num; index++) {
            var busnode = meterinfo.BusNodes[index];
            var busObj = new Object();
            busObj.id = busnode.getAttribute('id');
            busObj.Meters = new Array();
            for (var iindex = 0; iindex < busnode.childNodes.length; iindex++) {
                var MeterObj = new Object();
                var MeterNode = busnode.childNodes[iindex];
                MeterObj.guid = MeterNode.childNodes[0].text;
                MeterObj.meterType = MeterNode.childNodes[1].text;
                MeterObj.meterSubType = MeterNode.childNodes[2].text;
                MeterObj.meterID = MeterNode.childNodes[3].text;
                busObj.Meters[iindex] = MeterObj;
            }
            meterinfo.Buses[index] = busObj;
        }
        return meterinfo;
    }

    function ReadLog() {
        var fs = new ActiveXObject("Scripting.FileSystemObject");
        var f = fs.OpenTextFile(SourceLogFile, 1);
        var log = "";
        while (f.AtEndOfStream == false) {
            log += f.ReadLine();
            log += "<br />";
        }
        f.Close();
        log = log.replace(/\r\n|\r|\n/g, " <br   /> ").replace(/   /g, "&nbsp; ");
        return log;
    }

    var METER_TYPE_1="1"
    var METER_TYPE_2="2"
    var METER_TYPE_3="3"
    var METER_TYPE_4="4"
    var
    var METER_BUS_1="1"
    var METER_BUS_2="2"
    var METER_BUS_3="3"
    var METER_BUS_4="4"
    var
    var METER_SUBTYPE_1="1" 
    var METER_SUBTYPE_2="2" 

function SaveConfigInfo(){
    Response.Write("3");
    CIP = GetCIPConfstr();
    Response.Write(CIP);
    CIP = split(CIP,",")
            serverIP=CIP[0];
          serverport=CIP[1];
               other=CIP[2];
          sensorGuid=CIP[3];
    collectInterval =CIP[4];
       sendInterval =CIP[5];
       beatInterval =CIP[6];
    str1=Request.Form("guid");
    str2=Request.Form("address");
    str3=Request.Form("busNum");
    str4=Request.Form("type");
    str5=Request.Form("subtype");
    
    guids=str1.split(",");
    addresses=str2.split(",");
    buses=str3.split(",");
    types=str4.split(",");
    subtypes=str5.split(",");

    '///////////////////写入xml文件
    var objDom;
    var objRoot;
    var objChild1;
    var objChild2;
    var objChild3;
    var objChild4;
    var objChild5;
    var objPI;
    var PINode;
    objDom = new ActiveXObject("Microsoft.XMLDOM");

    //写入样式
    Set PINode=objDom.CreateProcessingInstruction("xml-stylesheet", "type='text/xsl'")
    objDom.appendchild PINode
    '/////创建根接点
    Set CipNetRoot = objDom.createElement("CIPNET")
    objDom.appendChild CipNetRoot

    Set objServerIP = objDom.createElement("serverIP")
    objServerIP.text=serverIP
    CipNetRoot.appendChild objServerIP


    Set objServerPort = objDom.createElement("serverPort")
    objServerPort.text=serverPort
    CipNetRoot.appendChild objServerPort

    Set objOther=objDom.createElement("other")
    objOther.text=other
    CipNetRoot.appendChild objOther

    Set objSensorGuid=objDom.createElement("sensorGuid")
    objSensorGuid.text=SensorGuid
    CipNetRoot.appendChild objSensorGuid
    
    Set objCollectInterval = objDom.createElement("collectInterval")
    objCollectInterval.text = collectInterval
    CipNetRoot.appendChild objCollectInterval
    
    Set objSendInterval = objDom.createElement("sendInterval")
    objSendInterval.text = sendInterval
    CipNetRoot.appendChild objSendInterval

    Set objBeatInterval = objDom.createElement("beatInterval")
    objBeatInterval.text = beatInterval
    CipNetRoot.appendChild objBeatInterval
    
    Set MeterInfoRoot=objDom.createElement("meterInfo")
    CipNetRoot.appendChild MeterInfoRoot

    set NodeBus1=objDom.createElement("bus") 
    NodeBus1.setAttribute "id",METER_BUS_1
    set NodeBus2=objDom.createElement("bus") 
    NodeBus2.setAttribute "id",METER_BUS_2
    set NodeBus3=objDom.createElement("bus") 
    NodeBus3.setAttribute "id",METER_BUS_3
    set NodeBus4=objDom.createElement("bus") 
    NodeBus4.setAttribute "id",METER_BUS_4  
     
    For i = 0 to UBound(guids)
        Set MeterItem=objDom.CreateElement("meter")

        Set FieldType= objDom.createElement("meterType")
        FieldType.Text = types(i)

        Set FieldAddress= objDom.createElement("meterID")
        FieldAddress.Text = addresses(i)

        Set FieldGuid = objDom.createElement("guid")
        FieldGuid.Text = guids(i)
        
        Set FieldSubType=objDom.createElement("meterSubType")
        FieldSubType.Text=subtypes(i)
        
        '添加每个meter的信息
        MeterItem.appendChild FieldGuid
        MeterItem.appendChild FieldType
        MeterItem.appendChild FieldSubType
        MeterItem.appendChild FieldAddress

        '追加MeterItem元素为相应Bus下的子元素。
			  dim busID
      	busID=trim(buses(i))'必须要去空格 fuck
        Select Case busID
            Case METER_BUS_1
                NodeBus1.AppendChild MeterItem            
            Case METER_BUS_2
                NodeBus2.AppendChild MeterItem              
            Case METER_BUS_3
                NodeBus3.AppendChild MeterItem              
            Case METER_BUS_4
                NodeBus4.AppendChild MeterItem             
        End Select
        Set MeterItem = Nothing
    next

    if NodeBus1.HasChildNodes then
        MeterInfoRoot.appendChild NodeBus1
    end if 
    if NodeBus2.HasChildNodes then
        MeterInfoRoot.appendChild NodeBus2 
    end if 
    if NodeBus3.HasChildNodes then
        MeterInfoRoot.appendChild NodeBus3 
    end if 
    if NodeBus4.HasChildNodes then
        MeterInfoRoot.appendChild NodeBus4
    end if          
    Set objPI = objDom.createProcessingInstruction("xml","version='1.0'")

    objDom.insertBefore objPI, objDom.childNodes(0)

    objDom.Save(SourceConfigFile)
  	Response.Write(UBound(guids)+1)
    Response.End()
    '//////////释放资源
    Set objDom = Nothing
    Set objRoot = Nothing
    Set objField = Nothing
    Set objFieldValue = Nothing
    Set objattID = Nothing
    Set objattTabOrder = Nothing
    Set objPI = Nothing
    Set PINode=Nothing
}

%>