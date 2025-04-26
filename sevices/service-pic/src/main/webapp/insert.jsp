<%@ page import="com.pichub.login.bean.User" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <title>add</title>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="./bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="./bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="./jquery/jquery-ui.min.css"> <!-- 此处根据你自己的路径进行设置 -->
    <script src="./jquery/jquery-3.6.4.min.js"></script> <!-- 此处根据你自己的路径进行设置 -->
    <script src="./jquery/jquery-ui.min.js"></script> <!-- 此处根据你自己的路径进行设置 -->
    <link href="bootstrap/css/fileinput.min.css" rel="stylesheet">

    <script src="bootstrap/js/fileinput.min.js"></script>
    <script>
        $(function() {
            var availableTags = ["fish","Alpaca","Bear","bird","butterfly","camel","Cat","Cattle","chicken","conch","coral","crab","crocodile","dog","dragonfly","duck","eagle","Elephant","fox","frog","gecko","Goose","Groundhog","Hedgehog","Hermit+crab","hippo","horse","Jellyfish","kangaroo","Koala","leopard","lion","lobster","monkey","mouse","ostrich","owl","panda","peacock","penguin","pig","platypus","rabbit","Raccoon","Scorpion","Sea+lion","sheep","snake","spider","squirrel","starfish","tiger","turtle","whale","Wolf","zebra"
                ,"boots","gloves","hat","jeans","necklace","scarf","Shoes","skirt","sock","sunglasses","Sweater","Watch"
                ,"camera","computer","hair+dryer","iron","light","Mobile+phone","oven","pot","radio","refrigerator","sound","Telephone","television","typewriter","vacuum+cleaner","washing+machine"
                ,"apple","banana","bread","Burger","cake","chestnut","corn","cucumber","Durian","green+pepper","hot+dog","Ice+cream","lemon","mushroom","orange","Pine+cone","pineapple","Pizza","pomegranate","pumpkin","spaghetti","Strawberry"
                ,"Bathtub","bed","bench","bowl","clock","pillow","Rocking+chair","Sewing+machine","sofa","Spatula","Toilet"
                ,"accordion","Cello","drum","Flute","guitar","harp","piano","Saxophone","violin"
                ,"Barbell","baseball","basketball","Billiard","Bow+and+arrow","fishing+rod","football","parachute","tennis","tent","volleyball","wheelbarrow"
                ,"pen","Piggy+bank","ruler","scales","Screw","screwdriver","Spoon","stapler","telescope","Tire","traffic+light","umbrella","Wallet"
                ,"aircraft","bicycle","car","carriage","Fire+truck","hot+air+balloon","motorcycle","Racing+car","sailboat","submarine","tank","train"
            ];
            $( "#inputPassword" ).typeahead({
                source: availableTags,
                minLength:2
            });
        });
    </script>
    <script>
        $(function() {
            var fenggeTags = ["art_paint","cartoon","real","sketch","statue"];
            $( "#inputEmail" ).typeahead({
                source: fenggeTags,
                minLength:2
            });
        });
    </script>

    <script>
        $(function() {
            var groupTags = ["eastern","western"];
            $( "#inputgroup" ).typeahead({
                source: groupTags,
                minLength:2
            });
        });
    </script>

    <script>
        $(function() {
            var c1Tags = ["animal","cloth","demostic_application","food","houseware","musical_instrument","sport_equipment","tool","vehicle"];
            $( "#inputc1" ).typeahead({
                source: c1Tags,
                minLength:2
            });
        });
    </script>

    <link rel="stylesheet" href="./css/insert.css">
    <link rel="stylesheet" href="./css/index1.css">
</head>
<body style="background-image: url(./images/whiteearth.jpg)">
<script src="./dtree/dtree.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="./bootstrap/js/bootstrap.min.js"></script>
<script src="jquery/jquery-3.6.4.min.js"></script>
<script src="./bootstrap/js/bootstrap3-typeahead.min.js"></script>

<div class="header1">
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">Project</a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="search.jsp">Search
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

<%
    User user=(User)session.getAttribute("user");
    if(user==null){
%>
<meta http-equiv="refresh" content="0;url=http://localhost:8080/art_picture_war/login.jsp">
<%
}else{
%>
<div class="container_lg right-panel-active">
    <section  class="layout">
        <form action="http://localhost:8080/art_picture_war/insert" method="post" enctype="multipart/form-data" id="post_form" class="form-signin">
            <section class="layout">
                <div class="pic1">
                    <label for="inputEmail" class="control-label">Style</label>
                    <input value="art_paint"  type="text" name='s_id' class="form-control" required="" autofocus="" id="inputEmail">
                    <br>
                    <label for="inputc1" class="control-label">Content Division</label>
                    <input value="animal" type="text" name='c1_id' id="inputc1" class="form-control" required="">
                    <br>
                    <label for="inputPassword" class="control-label">Content class</label>
                    <br>
                    <input value="bird" type="text" name='c2_id' id="inputPassword" class="form-control" required="">
                    <br>
                    <label for="inputgroup" class="control-label">District</label>
                    <br>
                    <input value="eastern" type="text" name='g_id' id="inputgroup" class="form-control" required="">
                    <br>
                </div>

                <div class="body1">
                    <input  class="file"  type="file" name="file1" class="form-control" required="">
                </div>


                <br>
                <script>
                    let in_s = document.getElementById("inputEmail");
                    in_s.value="${names}";
                    let in_c1 = document.getElementById("inputc1");
                    in_c1.value="${namec1}";
                    let in_c2 = document.getElementById("inputPassword");
                    in_c2.value="${namec}";
                    let in_g = document.getElementById("inputgroup");
                    in_g.value="${nameg}";
                </script>
            </section>
        </form>
    </section>

</div>

<%
    }
%>




</body>
</html>
