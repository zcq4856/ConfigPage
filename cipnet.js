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
        $.ajax(option);
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
        ele = $('<tr><td><input id="guid" type="text" name="guid" style="width: 97%; background-color: #FFFFEF" value="0012"></td><td><input id="address" type="text" name="address" style="width: 97%; background-color: #FFFFEF" value="1"></td><td><select id="busNum" type="text" name="busNum" style="width: 97%; background-color: #FFFFEF"><option value="1" selected="">1</option><option value="2">2</option><option value="3">3</option><option value="4" >4</option></select></td><td><select id="type" type="text" name="type" style="width: 97%; background-color: #FFFFEF"><option value="1" selected="">电表</option><option value="2">水表</option><option value="3">气表</option><option value="4">热表</option></select></td><td><select id="subtype" type="text" name="subtype" style="width: 97%; background-color: #FFFFEF"><option value="1" selected="">1</option><option value="2">2</option></select></td><td><input type="button" onclick="javascript:delRow(this.parentElement.parentElement)" value="删除"></td></tr>');
        ele.insertBefore("table tr:last");
    }
}