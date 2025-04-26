<%--
  Created by IntelliJ IDEA.
  User: 10638
  Date: 2023/1/28
  Time: 17:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="./bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="./dtree/dtree.css">


    <script src="https://cdn.jsdelivr.cn/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.cn/npm/respond.js@1.4.2/dest/respond.min.js"></script>

    <link rel="stylesheet" href="./jquery/jquery-ui.min.css"> <!-- 此处根据你自己的路径进行设置 -->
    <script src="./jquery/jquery-3.6.4.min.js"></script> <!-- 此处根据你自己的路径进行设置 -->
    <script src="./jquery/jquery-ui.min.js"></script> <!-- 此处根据你自己的路径进行设置 -->

    <script>
        $(function() {
            var availableTags = ["animal","cloth","demostic_application","food","houseware","musical_instrument","sport_equipment","tool","vehicle","fish","Alpaca","Bear","bird","butterfly","camel","Cat","Cattle","chicken","conch","coral","crab","crocodile","dog","dragonfly","duck","eagle","Elephant","fox","frog","gecko","Goose","Groundhog","Hedgehog","Hermit+crab","hippo","horse","Jellyfish","kangaroo","Koala","leopard","lion","lobster","monkey","mouse","ostrich","owl","panda","peacock","penguin","pig","platypus","rabbit","Raccoon","Scorpion","Sea+lion","sheep","snake","spider","squirrel","starfish","tiger","turtle","whale","Wolf","zebra"
                ,"boots","gloves","hat","jeans","necklace","scarf","Shoes","skirt","sock","sunglasses","Sweater","Watch"
                ,"camera","computer","hair+dryer","iron","light","Mobile+phone","oven","pot","radio","refrigerator","sound","Telephone","television","typewriter","vacuum+cleaner","washing+machine"
                ,"apple","banana","bread","Burger","cake","chestnut","corn","cucumber","Durian","green+pepper","hot+dog","Ice+cream","lemon","mushroom","orange","Pine+cone","pineapple","Pizza","pomegranate","pumpkin","spaghetti","Strawberry"
                ,"Bathtub","bed","bench","bowl","clock","pillow","Rocking+chair","Sewing+machine","sofa","Spatula","Toilet"
                ,"accordion","Cello","drum","Flute","guitar","harp","piano","Saxophone","violin"
                ,"Barbell","baseball","basketball","Billiard","Bow+and+arrow","fishing+rod","football","parachute","tennis","tent","volleyball","wheelbarrow"
                ,"pen","Piggy+bank","ruler","scales","Screw","screwdriver","Spoon","stapler","telescope","Tire","traffic+light","umbrella","Wallet"
                ,"aircraft","bicycle","car","carriage","Fire+truck","hot+air+balloon","motorcycle","Racing+car","sailboat","submarine","tank","train"
            ];
            $( "#inputPassword" ).autocomplete({
                source: availableTags,
                minLength:2
            });
        });
    </script>

    <link rel="stylesheet" href="./css/index1.css">
    <link rel="stylesheet" href="./bootstrap/css/bootstrap-select.min.css">
</head>
<body style="background-image: url(./images/shop.jpg)">
<script src="./bootstrap/js/bootstrap.min.js"></script>
<script src="./bootstrap/js/bootstrap-select.min.js"></script> <!-- 此处根据你自己的路径进行设置 -->
<script src="./js/index.js"></script> <!-- 此处根据你自己的路径进行设置 -->

<div class="header">
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">Project</a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="active"><a href="search.jsp">Search
                        <span class="glyphicon glyphicon-search" aria-hidden="true"></span></a></li>
                    <li><a href="demo.jsp">Picture
                        <span class="glyphicon glyphicon-picture" aria-hidden="true"></span></a></li>
                    <li><a href="login.jsp">Login
                        <span class="glyphicon glyphicon-log-in" aria-hidden="true"></span></a></li>
                    <li><a href="index.html">Home
                        <span class="glyphicon glyphicon-home" aria-hidden="true"></span></a></li>
                </ul>

            </div>
        </div>
    </nav>
</div>
<div class="lanmu">
    <%--        <select id="fengge" class="ui-selectable">--%>
    <%--            <option value="">all</option>--%>
    <%--            <option value="art_paint">art_paint</option>--%>
    <%--            <option value="cartoon">cartoon</option>--%>
    <%--        </select>--%>
    <%--        sort:<input type="text" id="input"><br>--%>
    <%--        <button id="btn_search">search</button>--%>


</div>

<div class="container right-panel-active">
    <%--        <div class="container_from container--signin">--%>
    <br>
    <br>
    <br>

    <h2 style="text-align: center" class="form-signin-heading">Search</h2>
    <label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>
    <div style="display: inline">
        <label class="control-label">Style----------</label>
        <select id="fengge" class="selectpicker">
            <option value="">all</option>
            <option value="art_paint">art_paint</option>
            <option value="cartoon">cartoon</option>
        </select>
    </div>
    <label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>
    <div style="display: inline">
        <label class="control-label">District-------</label>
        <select id="fengge2" class="selectpicker">
            <option value="">all</option>
            <option value="eastern">eastern</option>
            <option value="western">western</option>
        </select>
    </div>
    <br>
    <br>
    <label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>
    <div style="display: inline">
        <label class="control-label">Hue------------</label>
        <select id="fenggeh" class="selectpicker">
            <option value="">all</option>
            <option value="1">warm</option>
            <option value="2">cold</option>
        </select>
    </div>
    <label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>
    <div style="display: inline">
        <label class="control-label">Saturation---</label>
        <select id="fengges" class="selectpicker">
            <option value="">all</option>
            <option value="1">light</option>
            <option value="2">dark</option>
        </select>
    </div>
    <br>
    <br>
    <label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>
    <div style="display: inline">
        <label class="control-label">Value----------</label>
        <select id="fenggev" class="selectpicker">
            <option value="">all</option>
            <option value="1">bright</option>
            <option value="2">dim</option>
        </select>
    </div>
    <label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>
    <div style="display: inline">
        <label class="control-label" style="display: inline">Sort-----------</label>
        <input placeholder="Please Input" style="height:34px;width:220px;display: inline" type="text" id="inputPassword" class="form-control" required="">
    </div>

    <br>
    <br>
    <button class="btn btn-lg btn-primary btn-block" type="submit" id="btn_search">Search</button>
    <script>
        let b_log_login = document.getElementById("btn_search");

        b_log_login.onclick=function (){
            let id_str = document.getElementById("inputPassword").value;
            let page = 1;
            let id_str2=document.getElementById("fengge").value;
            let id_str3=document.getElementById("fengge2").value;
            let id_str4=document.getElementById("fenggeh").value;
            let id_str5=document.getElementById("fengges").value;
            let id_str6=document.getElementById("fenggev").value;
            window.location.href ="search?name1="+id_str2+"&name3="+id_str3+"&name2="+id_str+"&h="+id_str4+"&s="+id_str5+"&v="+id_str6+"&page="+page;
            window.location.href ="search?styleName="+id_str2+"&contentName="+id_str+"&regionName="+id_str3+"&h="+id_str4+"&s="+id_str5+"&v="+id_str6+"&page="+page+"&size=12";
        }

    </script>
</div>
</div>

</body>
</html>
