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
});

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