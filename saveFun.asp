<%@  language="javascript" %>
<%
    var SourceConfigFile = Server.MapPath("sample.xml"), //Server.MapPath("sample.xml"),"\\Nand\\www\\wwwpub\\sample.xml"
        SourceLogFile = Server.MapPath("logfile.log"), //Server.MapPath("logfile.log"),"\\logfile.log"
                rootNodeNodeName = "CIPNET",
                 CIP_sIpNodeName = "serverIP",
              CIP_sPortrNodeName = "serverPort",
               //CIP_otherNodeName = "other",
               //CIP_sGuidNodeName = "sensorGuid",
           CIP_cIntervalNodeName = "collectInterval",
           CIP_sendInterNodeName = "sendInterval",
           CIP_beatInterNodeName = "beatInterval",
           CIP_MeterinfoNodeName = "meterInfo",
                      CIP_region = "region",
            CIP_buildingCategory = "buildingCategory",
     CIP_buildingIdentificationn = "buildingIdentification",
     CIP_collectorIdentification = "collectorIdentification";


    function SaveCIPConfig() {
        var objXml = GetConfXMLObj(),
              serverIP = new String(Request.Form("serverIP")),
            serverport = new String(Request.Form("serverport")),
                 //other = new String(Request.Form("other")),
            //sensorGuid = new String(Request.Form("sensorGuid")),
       collectInterval = new String(Request.Form("collectInterval")),
          sendInterval = new String(Request.Form("sendInterval")),
          beatInterval = new String(Request.Form("beatInterval")),
                region = new String(Request.Form("region")),
      buildingCategory = new String(Request.Form("buildingCategory")),
buildingIdentification = new String(Request.Form("buildingIdentification")),
collectorIdentification = new String(Request.Form("collectorIdentification"));

        SaveNode(objXml, CIP_sIpNodeName, serverIP);
        SaveNode(objXml, CIP_sPortrNodeName, serverport);
        //SaveNode(objXml, CIP_otherNodeName, other);
        //SaveNode(objXml, CIP_sGuidNodeName, sensorGuid);
        SaveNode(objXml, CIP_cIntervalNodeName, collectInterval);
        SaveNode(objXml, CIP_sendInterNodeName, sendInterval);
        SaveNode(objXml, CIP_beatInterNodeName, beatInterval);
        SaveNode(objXml, CIP_region, region);
        SaveNode(objXml, CIP_buildingCategory, buildingCategory);
        SaveNode(objXml, CIP_buildingIdentificationn, buildingIdentification);
        SaveNode(objXml, CIP_collectorIdentification, collectorIdentification);
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
            objXML.loadXML("<?xml version='1.0' encoding='GB2312'?><?xml-stylesheet type='text/xsl'?><CIPNET><serverIP></serverIP><serverPort></serverPort><collectInterval>20</collectInterval><sendInterval></sendInterval><beatInterval></beatInterval><region>1</region><buildingCategory>1</buildingCategory><buildingIdentification>1</buildingIdentification><collectorIdentification>1</collectorIdentification><meterInfo></meterInfo></CIPNET>");
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
        //CIP.OTHER = ReadNode(objXml, CIP_otherNodeName).text.replace(/^\s*/, "").replace(/\s*$/, "");
        //CIP.Guid = ReadNode(objXml, CIP_sGuidNodeName).text.replace(/^\s*/, "").replace(/\s*$/, "");
        CIP.CInter = ReadNode(objXml, CIP_cIntervalNodeName).text.replace(/^\s*/, "").replace(/\s*$/, "");
        CIP.SInter = ReadNode(objXml, CIP_sendInterNodeName).text.replace(/^\s*/, "").replace(/\s*$/, "");
        CIP.BInter = ReadNode(objXml, CIP_beatInterNodeName).text.replace(/^\s*/, "").replace(/\s*$/, "");
        CIP.Region = ReadNode(objXml, CIP_region).text.replace(/^\s*/, "").replace(/\s*$/, "");
        CIP.BuildCate = ReadNode(objXml,CIP_buildingCategory).text.replace(/^\s*/, "").replace(/\s*$/, "");
        CIP.BuildIden = ReadNode(objXml,CIP_buildingIdentificationn).text.replace(/^\s*/, "").replace(/\s*$/, "");
        CIP.ColleIden = ReadNode(objXml,CIP_collectorIdentification).text.replace(/^\s*/, "").replace(/\s*$/, "");
        return CIP;
    }

    function GetCIPConfstr() {
        var objXml = GetConfXMLObj();
        var CIP = new Array();
        CIP[0] = ReadNode(objXml, CIP_sIpNodeName).text.replace(/^\s*/, "").replace(/\s*$/, "");
        CIP[1] = ReadNode(objXml, CIP_sPortrNodeName).text.replace(/^\s*/, "").replace(/\s*$/, "");
        //CIP[2] = ReadNode(objXml, CIP_otherNodeName).text.replace(/^\s*/, "").replace(/\s*$/, "");
        //CIP[3] = ReadNode(objXml, CIP_sGuidNodeName).text.replace(/^\s*/, "").replace(/\s*$/, "");
        CIP[2] = ReadNode(objXml, CIP_cIntervalNodeName).text.replace(/^\s*/, "").replace(/\s*$/, "");
        CIP[3] = ReadNode(objXml, CIP_sendInterNodeName).text.replace(/^\s*/, "").replace(/\s*$/, "");
        CIP[4] = ReadNode(objXml, CIP_beatInterNodeName).text.replace(/^\s*/, "").replace(/\s*$/, "");
        CIP[5] = ReadNode(objXml, CIP_region).text.replace(/^\s*/, "").replace(/\s*$/, "");
        CIP[6] = ReadNode(objXml, CIP_buildingCategory).text.replace(/^\s*/, "").replace(/\s*$/, "");
        CIP[7] = ReadNode(objXml, CIP_buildingIdentificationn).text.replace(/^\s*/, "").replace(/\s*$/, "");
        CIP[8] = ReadNode(objXml, CIP_collectorIdentification).text.replace(/^\s*/, "").replace(/\s*$/, "");
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
                MeterObj.dybb = MeterNode.childNodes[1].text;
                MeterObj.dlbb = MeterNode.childNodes[2].text;
                //MeterObj.meterSubType = MeterNode.childNodes[2].text;
                MeterObj.meterID = MeterNode.childNodes[0].text;
                MeterObj.energyConsumptionCa = MeterNode.childNodes[3].text;
                MeterObj.energyConsumptionItem = MeterNode.childNodes[4].text;
                MeterObj.level1Item = MeterNode.childNodes[5].text;
                MeterObj.level2Item = MeterNode.childNodes[6].text;
                busObj.Meters[iindex] = MeterObj;
            }
            meterinfo.Buses[index] = busObj;
        }
        return meterinfo;
    }

    function ReadLog() {
        var fs = new ActiveXObject("Microsoft.XMLDOM");
        fs.load(SourceLogFile);
        var log = fs.parseError.srcText;
        log = log.match(/\<node((.|\n)*?)\<\/node\>/gi);
        var logtext = "";
        if (log != null) {
            for (i = 0; i < log.length; i++) {
                log[i] = log[i].substring(6, log[i].length - 7);
            }

            if (log != null) {
                for (i = 0; i < log.length; i++) {
                    logtext += log[i] + "<br />";
                }
            }
            else
                logtext = "没有日志!";
        }
        else {
            logtext = "没有日志!"; 
        }
        return logtext;
    }

    var METER_TYPE_1="1";
    var METER_TYPE_2="2";
    var METER_TYPE_3="3";
    var METER_TYPE_4="4";
   
    var METER_BUS_1="1";
    var METER_BUS_2="2";
    var METER_BUS_3="3";
    var METER_BUS_4="4";
    
    var METER_SUBTYPE_1="1";
    var METER_SUBTYPE_2 = "2";

    function SaveConfigInfo() {
/*读取cipconfig 
    CIP = GetCIPConfstr();
    CIP = CIP.split(",");
           var serverIP=CIP[0],
          serverPort=CIP[1],
               //other=CIP[2],
          //sensorGuid=CIP[3],
    collectInterval =CIP[2],
       sendInterval =CIP[3],
       beatInterval = CIP[4],
             region =CIP[5],
   buildingCategory =CIP[6],
buildingIdentification=CIP[7],
collectorIdentification = CIP[8],*/
    //str1=Request.Form("guid"),
    str2=Request.Form("address"),
    str3=Request.Form("busNum"),
    str4=Request.Form("dybb"),
    str5 = Request.Form("dlbb"),
    str6 = Request.Form("energyConsumptionCa"),
    str7 = Request.Form("energyConsumptionItem"),
    str8 = Request.Form("level1Item"),
    str9 = Request.Form("level2Item"),
    
    //guids=str1.Item.split(","),
    addresses = str2.Item.split(", "),
    buses = str3.Item.split(", "),
    dybb = str4.Item.split(", "),
    dlbb = str5.Item.split(", "),
    energyConsumptionCa = str6.Item.split(", "),
    energyConsumptionItem = str7.Item.split(", "),
    level1Item = str8.Item.split(", "),
    level2Item = str9.Item.split(", "),

    guidslength = addresses.length;

    //写入xml文件
    var objDom;
    var objRoot;
    var objChild1;
    var objChild2;
    var objChild3;
    var objChild4;
    var objChild5;
    var objChild6;
    var objChild7;
    var objChild8;
    var objChild9;
    var objPI;
    var PINode;
    //objDom = new ActiveXObject("Microsoft.XMLDOM");
    var objDom = GetConfXMLObj();
    CipNetroot = objDom.documentElement.selectSingleNode("/CIPNET");
    MeterInfoRoot = objDom.documentElement.selectSingleNode("/CIPNET/meterInfo");
    MeterInfoRoot.parentNode.removeChild(MeterInfoRoot);
    MeterInfoRoot = objDom.createElement("meterInfo");
    CipNetroot.appendChild(MeterInfoRoot);
    /*//写入样式
    PINode=objDom.createProcessingInstruction("xml-stylesheet", "type='text/xsl'");
    objDom.appendChild(PINode);
    //创建根接点
    CipNetRoot = objDom.createElement("CIPNET");
    objDom.appendChild(CipNetRoot);

    objServerIP = objDom.createElement("serverIP");
    objServerIP.text=serverIP;
    CipNetRoot.appendChild(objServerIP);


    objServerPort = objDom.createElement("serverPort");
    objServerPort.text=serverPort;
    CipNetRoot.appendChild(objServerPort);

    //objOther=objDom.createElement("other");
    //objOther.text=other;
    //CipNetRoot.appendChild(objOther);

    //objSensorGuid=objDom.createElement("sensorGuid");
    //objSensorGuid.text=sensorGuid;
    //CipNetRoot.appendChild(objSensorGuid);
    
    objCollectInterval = objDom.createElement("collectInterval");
    objCollectInterval.text = collectInterval;
    CipNetRoot.appendChild(objCollectInterval);
    
    objSendInterval = objDom.createElement("sendInterval");
    objSendInterval.text = sendInterval;
    CipNetRoot.appendChild(objSendInterval);

    objBeatInterval = objDom.createElement("beatInterval");
    objBeatInterval.text = beatInterval;
    CipNetRoot.appendChild(objBeatInterval);

    objRegion = objDom.createElement("region");
    objRegion.text = region;
    CipNetRoot.appendChild(objRegion);

    objBuildingCategoryl = objDom.createElement("buildingCategory");
    objBuildingCategoryl.text = buildingCategory;
    CipNetRoot.appendChild(objBuildingCategoryl);

    objBuildingIdentification = objDom.createElement("buildingIdentification");
    objBuildingIdentification.text = buildingIdentification;
    CipNetRoot.appendChild(objBuildingIdentification);

    objCollectorIdentification = objDom.createElement("collectorIdentification");
    objCollectorIdentification.text = collectorIdentification;
    CipNetRoot.appendChild(objCollectorIdentification);
    
    MeterInfoRoot=objDom.createElement("meterInfo");
    CipNetRoot.appendChild(MeterInfoRoot);*/

    NodeBus1=objDom.createElement("bus") ;
    NodeBus1.setAttribute("id",METER_BUS_1);
    NodeBus2=objDom.createElement("bus");
    NodeBus2.setAttribute("id",METER_BUS_2);
    NodeBus3=objDom.createElement("bus") ;
    NodeBus3.setAttribute("id",METER_BUS_3);
    NodeBus4=objDom.createElement("bus") ;
    NodeBus4.setAttribute("id",METER_BUS_4);  
     
    for(i = 0;i< guidslength;i++){
        MeterItem=objDom.createElement("meter");

        //FieldType= objDom.createElement("meterType");
        //FieldType.text = types[i];

        FieldAddress= objDom.createElement("meterID");
        FieldAddress.text = addresses[i];

        Fielddybb = objDom.createElement("dybb");
        Fielddybb.text = dybb[i];
        
        Fielddlbb=objDom.createElement("dlbb");
        Fielddlbb.text = dlbb[i];

        FieldEnergyConsumptionCa = objDom.createElement("energyConsumptionCa");
        FieldEnergyConsumptionCa.text = energyConsumptionCa[i];

        FieldEnergyConsumptionItem = objDom.createElement("energyConsumptionItem");
        FieldEnergyConsumptionItem.text = energyConsumptionItem[i];

        FieldLevel1Item = objDom.createElement("level1Item");
        FieldLevel1Item.text = level1Item[i];

        FieldLevel2Item = objDom.createElement("level2Item");
        FieldLevel2Item.text = level2Item[i];
        
        //添加每个meter的信息
        // MeterItem.appendChild(FieldGuid);
        MeterItem.appendChild(FieldAddress);
        MeterItem.appendChild(Fielddybb);
        MeterItem.appendChild(Fielddlbb);
        MeterItem.appendChild(FieldEnergyConsumptionCa);
        MeterItem.appendChild(FieldEnergyConsumptionItem);
        MeterItem.appendChild(FieldLevel1Item);
        MeterItem.appendChild(FieldLevel2Item);

        //追加MeterItem元素为相应Bus下的子元素。
        busID = buses[i].replace(/^\s*/, "").replace(/\s*$/, ""); //必须要去空格 fuck
        switch(busID){
            case METER_BUS_1:
                 NodeBus1.appendChild(MeterItem);
                 break;           
            case METER_BUS_2:                 
                 NodeBus2.appendChild(MeterItem); 
                 break;            
            case METER_BUS_3:                 
                 NodeBus3.appendChild(MeterItem); 
                 break;            
            case METER_BUS_4:                 
                 NodeBus4.appendChild(MeterItem);   
                 break;
                 default:
                 break;         
        }
        MeterItem = null;
    }

    if (NodeBus1.hasChildNodes()){
        MeterInfoRoot.appendChild(NodeBus1);
    } 
    if (NodeBus2.hasChildNodes()){
        MeterInfoRoot.appendChild(NodeBus2);
    }
    if (NodeBus3.hasChildNodes()){
        MeterInfoRoot.appendChild(NodeBus3);
    } 
    if (NodeBus4.hasChildNodes){
        MeterInfoRoot.appendChild(NodeBus4);
    }          
    //objPI = objDom.createProcessingInstruction("xml","version='1.0'");

    //objDom.insertBefore(objPI, objDom.childNodes[0]);

    objDom.save(SourceConfigFile);
    return "保存成功!"+guidslength+"条!";
}

%>