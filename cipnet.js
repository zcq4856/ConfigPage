$(document).ready(function () {
    $("#mainForm").attr("src", "HomePage.html");
    //    $(document.getElementById('mainForm').contentWindow.document.body).attr("margin", "0px");
    //页面链接
    $("#homePage").click(function () {
        $("#mainForm").attr("src", "HomePage.html");
    });

    $("#cipnetConfig").click(function () {
        $("#mainForm").attr("src", "CipnetConfig.asp");
    });

    $("#metersIntroductions").click(function () {
        $("#mainForm").attr("src", "MetersIntroductions.asp");
    });

    $("#metersConfig").click(function () {
        $("#mainForm").attr("src", "MetersConfig.asp");
    });

    $("#note").click(function () {
        $("#mainForm").attr("src", "Note.asp");
    });

    $("#SaveMeter").click(function () {
        var option = {
            type: "POST",
            url: "MetersConfig.asp",
            data: $("#form1").serialize(),
            success: function (msg) {
                SuccessFun(msg);
            }
        };
        //$.ajax(option);
    });

    $("#Left_Menu ul li span").first().addClass("active");
    $("#Left_Menu ul li span").click(function () {
        ele = $(this).parents("ul").find("li span");
        ele.removeClass("active");
        $(this).addClass("active");
    });

    function SuccessFun(msg) {
        if (parseInt(msg) >= 0)
            $('#result').text("保存成功" + msg + "条记录！");
    };

    $("#SaveCipnetConfig").click(function () {

        var ipreg = /^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])$/;
        var sip = $(".IP").val();
        if (!ipreg.test(sip)) {
            $(".IP").focus();
            $(".IP").select();
            alert("请按'[0-255].[0-255].[0-255].[0-255]的正确格式输入IP地址！");
            return false;
        }

        var xreg = /^[1-9]\d{5}(?!\d)$/;
        var sreg = $("#region").val();
        if (!xreg.test(sreg)) {
            $("#region").focus();
            $("#region").select();
            alert("请按六位数字的正确格式输入邮编地址！");
            return false;
        }

        //        var portReg = /^[4-9][0-9]{3}|[1-5][0-9]{4}|6[0-4][0-9]{3}|65[0-4][0-9]{2}|655[0-2][0-9]{1}|6553[0-5]$/;
        var portReg = /(^[4-9][0-9][0-9][0-9]$)|(^[1-6][0-5][0-5][0-3][0-5]$)/;
        var port = $("#ServerPort").val();
        if (!portReg.test(port)) {
            $("#ServerPort").focus();
            $("#ServerPort").select();
            alert("端口号请输入4000-65535之间的数！");
            return false;
        }

        var numS = /^[1-9]\d*|0$/;
        var con = 0;
        $(".num_Time").each(function () {
            var sNum = $(this).val();
            if (!numS.test(sNum)) {
                con++;
                $(this).focus();
                $(this).select();
                alert("时间请输入非负整数！");
                return false;
            }
        });
        if (con != 0)
            return false;


        var count = 0;
        $(".num_2").each(function () {
            var obj = $(this).val();
            var num = 2;
            if (!checkNum(num, $(this).val(), $(this).parents("td").prev("td").text())) {
                count++;
                $(this).focus();
                $(this).select();
                return false;
            }

        });

        if (count == 0)
            return true;
        else
            return false;

    });

    $("#SaveMeter").click(function () {
        var count4 = 0;
        $(".num_4").each(function () {
            var obj = $(this).val();
            var num = 4;

            if (!checkNum(num, $(this).val(), "地址栏:")) {
                count4++;
                $(this).focus();
                $(this).select();
                return false;
            }

        });

        if (count4 == 0)
            return true;
        else
            return false;
    });

});


function checkNum(num, obj, mesg) {
    var ppNum, numstr;
    if (num == 2) {
        ppNum = /^\d{2}$/;
        numstr = "00-99";
    }
    else
        if (num == 4) {
            ppNum = /^\d{4}$/;
            numstr = "0000-9999";
        }

    if (!ppNum.test(obj)) {
        alert(mesg + "请输入" + numstr + "之间的数字！");
        return false;
    }
    else
        return true;

}


function delRow(src) {
    $(src).remove();
}

function addRow() {
    var tr = $("table tr");
    if (tr.length > 3) {
        var ele = $("table tr:last").prev().clone();
        add = $("td:nth-child(2) input", ele).val();
        add = parseInt(add) + 1;
        $("td:nth-child(2) input", ele).val(add);
        ele.insertBefore("table tr:last");
    } else {
        ele = $('<tr><td><input id="address" type="text" name="address" style="width: 97%; background-color: #FFFFEF" value="1"></td><td><select id="busNum" type="text" name="busNum" style="width: 97%; background-color: #FFFFEF"><option value="1" selected="">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option></select></td><td><input id="dybb" type="text" name="dybb" style="width: 97%; background-color: #FFFFEF" value="1"></td><td><input id="dlbb" type="text" name="dlbb" style="width: 97%; background-color: #FFFFEF" value="1"></td><td><select id="energyConsumptionCa" type="text" name="energyConsumptionCa" style="width: 97%; background-color: #FFFFEF"><option value="电" selected="">电</option><option value="水">水</option><option value="燃气(天然气或煤气)">燃气(天然气或煤气)</option><option value="集中供热量">集中供热量</option><option value="集中供冷量">集中供冷量</option><option value="其它能源">其它能源</option><option value="煤">煤</option><option value="液化石油气">液化石油气</option><option value="人工煤气">人工煤气</option><option value="汽油">汽油</option><option value="煤油">煤油</option><option value="柴油">柴油</option><option value="可再生能源">可再生能源</option></select></td><td><select id="energyConsumptionItem" type="text" name="energyConsumptionItem" style="width: 97%; background-color: #FFFFEF"><option value="照明插座用电" selected="">照明插座用电</option><option value="空调用电">空调用电</option><option value="动力用电">动力用电</option><option value="特殊用电">特殊用电</option></select></td><td><select id="level1Item" type="text" name="level1Item" style="width: 97%; background-color: #FFFFEF"><option value="照明与插座" selected="">照明与插座</option><option value="走廊与应急">走廊与应急</option><option value="室外景观照明">室外景观照明</option><option value="冷热站">冷热站</option><option value="空调末端">空调末端</option><option value="电梯">电梯</option><option value="水泵">水泵</option><option value="通风机">通风机</option><option value="信息中心">信息中心</option><option value="洗衣房">洗衣房</option><option value="厨房餐厅">厨房餐厅</option><option value="游泳池">游泳池</option><option value="健身房">健身房</option><option value="其它">其它</option></select></td><td><select id="level2Item" type="text" name="level2Item" style="width: 97%; background-color: #FFFFEF"><option value="冷冻泵" selected="">冷冻泵</option><option value="冷却泵">冷却泵</option><option value="冷机">冷机</option><option value="冷塔">冷塔</option><option value="热水循环泵">热水循环泵</option><option value="电锅炉">电锅炉</option></select></td><td><input type="button" onclick="javascript:delRow(this.parentElement.parentElement)" value="删除"></td></tr>');
        ele.insertBefore("table tr:last");
    }
}