<%@ page import="com.example.scs.bean.User" %><%--
  Created by IntelliJ IDEA.
  User: 10638
  Date: 2023/2/16
  Time: 15:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Pictures</title>
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

    <link rel="stylesheet" href="./css/picture.css">
    <link rel="stylesheet" href="./css/treecontainer.css">
    <link rel="stylesheet" href="./css/pagelayout.css">

</head>
<body style="background-image: url(./images/yuhangyuan.jpg)">
<script src="./dtree/dtree.js"></script>
<script src="./bootstrap/js/jquery-3.6.0.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="./bootstrap/js/bootstrap.min.js"></script>

    <section class="pagelayout">
        <div class="leader">
            <nav class="navbar navbar-inverse">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="#">Project</a>
                    </div>

                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="search.jsp">Search
                                <span class="glyphicon glyphicon-search" aria-hidden="true"></span></a></li>
                            <li class="active"><a href="demo.jsp">Picture
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
        <div class="treeside" background="./pic/treebk.PNG">
            <div class="container">
                <section class="treecontainer">
                    <div class="title1">
                        <div class="card">
                            <div class="card-header bg-info" id="header1">
                                <h4 class="mb-0 justify-content-between d-flex align-items-center">
                                    <a href="#" class="card-link text-warning" style="text-decoration: none">

                                        Content
                                    </a>
                                    <span class="glyphicon glyphicon-plus"></span>
                                </h4>
                            </div>
                        </div>
                    </div>
                    <div class="firsttree" style="overflow-y: auto">

                                <script>
                                    // <!--
                                    <%
                                        String[] dalei={"animal","cloth","demostic_application","food","houseware","musical_instrument","sport_equipment","tool","vehicle"};
                                        String[][] cata={{"Alpaca","Bear","bird","butterfly","camel","Cat","Cattle","chicken","conch","coral","crab","crocodile","dog","dragonfly","duck","eagle","Elephant","fish","fox","frog","gecko","Goose","Groundhog","Hedgehog","Hermit+crab","hippo","horse","Jellyfish","kangaroo","Koala","leopard","lion","lobster","monkey","mouse","ostrich","owl","panda","peacock","penguin","pig","platypus","rabbit","Raccoon","Scorpion","Sea+lion","sheep","snake","spider","squirrel","starfish","tiger","turtle","whale","Wolf","zebra"}
                                                ,{"boots","gloves","hat","jeans","necklace","scarf","Shoes","skirt","sock","sunglasses","Sweater","Watch"}
                                                ,{"camera","computer","hair+dryer","iron","light","Mobile+phone","oven","pot","radio","refrigerator","sound","Telephone","television","typewriter","vacuum+cleaner","washing+machine"}
                                                ,{"apple","banana","bread","Burger","cake","chestnut","corn","cucumber","Durian","green+pepper","hot+dog","Ice+cream","lemon","mushroom","orange","Pine+cone","pineapple","Pizza","pomegranate","pumpkin","spaghetti","Strawberry"}
                                                ,{"Bathtub","bed","bench","bowl","clock","pillow","Rocking+chair","Sewing+machine","sofa","Spatula","Toilet"}
                                                ,{"accordion","Cello","drum","Flute","guitar","harp","piano","Saxophone","violin"}
                                                ,{"Barbell","baseball","basketball","Billiard","Bow+and+arrow","fishing+rod","football","parachute","tennis","tent","volleyball","wheelbarrow"}
                                                ,{"abacus", "alarm clock", "ax", "broom", "candle", "compass", "hook", "hourglass", "knife", "lighthouse", "lock", "magnifier", "mailbox", "matches", "mop", "pen","Piggy+bank","ruler","scales","Screw","screwdriver","Spoon","stapler","telescope","Tire","traffic+light","umbrella","Wallet"}
                                                ,{"aircraft","bicycle","car","carriage","Fire+truck","hot+air+balloon","motorcycle","Racing+car","sailboat","submarine","tank","train"}
                                            };
                                    %>
                                    d = new dTree('d');
                                    d.add(0,-1,'content');
                                    <%
                                        int num=1;
                                        int cnum=1;
                                        int snum=3;
                                        String uri;
                                        String id;
                                        for(String[] erji:cata){
                                            cnum=1;
                                            uri="get?c_id="+snum+"&page=1&uname1="+dalei[num-1];
                                            snum++;
                                            id=String.valueOf(num);
                                    %>
                                    d.add('<%=id%>',0,'<%=dalei[num-1]%>',"<%=uri%>"+"&s_id=${s_id}&g_id=${g_id}&uname2=${uname2}&h=${h}&s=${s}&v=${v}");
                                    <%

                                            for(String name:erji){
                                                if(cnum==24){
                                                    int j=0;
                                                }
                                                id=num+"0"+cnum;
                                                String fatherid=String.valueOf(num);
                                                uri="get?c_id="+snum+"&page=1&uname1="+name;
                                                snum++;
                                    %>
                                    d.add('<%=id%>','<%=fatherid%>','<%=name%>',"<%=uri%>"+"&s_id=${s_id}&g_id=${g_id}&uname2=${uname2}&h=${h}&s=${s}&v=${v}")
                                    <%
                                                cnum++;
                                            }
                                            num++;
                                        }
                                    %>

                                    document.write(d);

                                    //-->
                                </script>

                    </div>
                    <div class="title2">
                        <div class="card">
                            <div class="card-header bg-info" id="header2">
                                <h4 class="mb-0 justify-content-between d-flex align-items-center">
                                    <a href="#" class="card-link text-warning" style="text-decoration: none">

                                        District
                                    </a>
                                    <span class="glyphicon glyphicon-plus"></span>
                                </h4>
                            </div>
                        </div>
                    </div>
                    <div class="secondtree" style="overflow-y: auto">

                        <script>
                            // <!--
                            d1 = new dTree('d1');
                            d1.add(0,-1,'all',"get?c_id=${c_id}&s_id=${s_id}&page=1&uname1=${uname1}&uname2=&h=${h}&s=${s}&v=${v}");

                            d1.add(1,0,'eastern',"get?c_id=${c_id}&s_id=${s_id}&g_id=2&page=1&uname1=${uname1}&uname2=eastern&h=${h}&s=${s}&v=${v}");
                            d1.add(2,0,'western',"get?c_id=${c_id}&s_id=${s_id}&g_id=190&page=1&uname1=${uname1}&uname2=western&h=${h}&s=${s}&v=${v}");

                            document.write(d1);

                            //-->
                        </script>

                    </div>
                    <div class="title3">
                        <div class="card">
                            <div class="card-header bg-info" id="header1">
                                <h4 class="mb-0 justify-content-between d-flex align-items-center">
                                    <a href="#" class="card-link text-warning" style="text-decoration: none">

                                        HSV
                                    </a>
                                    <span class="glyphicon glyphicon-plus"></span>
                                </h4>
                            </div>
                        </div>
                    </div>
                    <div class="thirdtree" style="overflow-y: auto">

                        <script>
                            // <!--

                            d2 = new dTree('d2');
                            d2.add(0,-1,'all',"get?c_id=${c_id}&s_id=${s_id}&g_id=${g_id}&page=1&uname1=${uname1}&uname2=${uname2}&h=&s=&v=");

                            d2.add(1,0,'Hue',"get?c_id=${c_id}&s_id=${s_id}&g_id=${g_id}&page=1&uname1=${uname1}&uname2=${uname2}&h=&s=${s}&v=${v}");
                            d2.add(2,0,'Saturation',"get?c_id=${c_id}&s_id=${s_id}&g_id=${g_id}&page=1&uname1=${uname1}&uname2=${uname2}&h=${h}&s=&v=${v}");
                            d2.add(3,0,'Value',"get?c_id=${c_id}&s_id=${s_id}&g_id=${g_id}&page=1&uname1=${uname1}&uname2=${uname2}&h=${h}&s=${s}&v=");

                            d2.add(4,1,'warm',"get?c_id=${c_id}&s_id=${s_id}&g_id=${g_id}&page=1&uname1=${uname1}&uname2=${uname2}&h=1&s=${s}&v=${v}");
                            d2.add(5,1,'cold',"get?c_id=${c_id}&s_id=${s_id}&g_id=${g_id}&page=1&uname1=${uname1}&uname2=${uname2}&h=2&s=${s}&v=${v}");
                            d2.add(6,2,'colorful',"get?c_id=${c_id}&s_id=${s_id}&g_id=${g_id}&page=1&uname1=${uname1}&uname2=${uname2}&h=${h}&s=1&v=${v}");
                            d2.add(7,2,'colorless',"get?c_id=${c_id}&s_id=${s_id}&g_id=${g_id}&page=1&uname1=${uname1}&uname2=${uname2}&h=${h}&s=2&v=${v}");
                            d2.add(8,3,'light',"get?c_id=${c_id}&s_id=${s_id}&g_id=${g_id}&page=1&uname1=${uname1}&uname2=${uname2}&h=${h}&s=${s}&v=1");
                            d2.add(9,3,'dim',"get?c_id=${c_id}&s_id=${s_id}&g_id=${g_id}&page=1&uname1=${uname1}&uname2=${uname2}&h=${h}&s=${s}&v=2");

                            document.write(d2);

                            //-->
                        </script>

                    </div>
                </section>
            </div>
        </div>
        <div class="picside">
            <nav class="navbar navbar-inverse">
                <div class="container-fluid">
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
                        <ul class="nav navbar-nav navbar-left">
                            <li id="artpaint_li"><a id="nav_artpaint">art_paint
                                <span class="glyphicon glyphicon-list" aria-hidden="true"></span></a></li>
                            <li id="cartoon_li"><a id="nav_cartoon">cartoon
                                <span class="glyphicon glyphicon-list" aria-hidden="true"></span></a></li>
                            <li id="real_li"><a id="nav_real">real
                                <span class="glyphicon glyphicon-list" aria-hidden="true"></span></a></li>
                            <li id="sketch_li"><a id="nav_sketch">sketch
                                <span class="glyphicon glyphicon-list" aria-hidden="true"></span></a></li>
                            <li id="statue_li"><a id="nav_statue">statue
                                <span class="glyphicon glyphicon-list" aria-hidden="true"></span></a></li>
                            <li id="delete_li"><a id="nav_delete">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a></li>

                        </ul>
                        <ul class="nav navbar-nav navbar-right">
<%--                            <label id="sort_result" class="label-default"></label>--%>
                            <li class="active"><a  id="sort_result1">
                                <span class="glyphicon glyphicon-list" aria-hidden="true"></span></a></li>
                            <li class="active"><a  id="sort_result2">
                                 <span class="glyphicon glyphicon-list" aria-hidden="true"></span></a></li>
                            <li class="active"><a  id="sort_resulth">
                                <span  aria-hidden="true"></span></a></li>
                            <li class="active"><a  id="sort_results">
                                <span  aria-hidden="true"></span></a></li>
                            <li class="active"><a  id="sort_resultv">
                                <span  aria-hidden="true"></span></a></li>
                        </ul>
                        <script>
                            let nav_artpaint=document.getElementById("nav_artpaint");
                            nav_artpaint.href="get?c_id=${c_id}&s_id=1&g_id=${g_id}&page=1&uname1=${uname1}&uname2=${uname2}&h=${h}&s=${s}&v=${v}";
                            let nav_cartoon=document.getElementById("nav_cartoon");
                            nav_cartoon.href="get?c_id=${c_id}&s_id=191&g_id=${g_id}&page=1&uname1=${uname1}&uname2=${uname2}&h=${h}&s=${s}&v=${v}";
                            let nav_real=document.getElementById("nav_real");
                            nav_real.href="get?c_id=${c_id}&s_id=192&g_id=${g_id}&page=1&uname1=${uname1}&uname2=${uname2}&h=${h}&s=${s}&v=${v}";
                            let nav_sketch=document.getElementById("nav_sketch");
                            nav_sketch.href="get?c_id=${c_id}&s_id=193&g_id=${g_id}&page=1&uname1=${uname1}&uname2=${uname2}&h=${h}&s=${s}&v=${v}";
                            let nav_statue=document.getElementById("nav_statue");
                            nav_statue.href="get?c_id=${c_id}&s_id=194&g_id=${g_id}&page=1&uname1=${uname1}&uname2=${uname2}&h=${h}&s=${s}&v=${v}";
                            let nav_delete=document.getElementById("nav_delete");
                            nav_delete.href="get?c_id=${c_id}&s_id=&g_id=${g_id}&page=1&uname1=${uname1}&uname2=${uname2}&h=${h}&s=${s}&v=${v}";
                            let sort_result1=document.getElementById("sort_result1");
                            sort_result1.textContent="${uname1}";
                            sort_result1.href="get?c_id=&s_id=${s_id}&g_id=${g_id}&page=1&uname1=&uname2=${uname2}&h=${h}&s=${s}&v=${v}";
                            let sort_result2=document.getElementById("sort_result2");
                            sort_result2.textContent="${uname2}";
                            sort_result2.href="get?c_id=${c_id}&s_id=${s_id}&g_id=&page=1&uname1=${uname1}&uname2=&h=${h}&s=${s}&v=${v}";
                            sort_resulth.href="get?c_id=${c_id}&s_id=${s_id}&g_id=${g_id}&page=1&uname1=${uname1}&uname2=${uname2}&h=&s=${s}&v=${v}";
                            sort_results.href="get?c_id=${c_id}&s_id=${s_id}&g_id=${g_id}&page=1&uname1=${uname1}&uname2=${uname2}&h=${h}&s=&v=${v}";
                            sort_resultv.href="get?c_id=${c_id}&s_id=${s_id}&g_id=${g_id}&page=1&uname1=${uname1}&uname2=${uname2}&h=${h}&s=${s}&v=";
                            // let sort_resulth=document.getElementById("sort_resulth");
                            // sort_resulth.textContent="";
                            // let sort_results=document.getElementById("sort_results");
                            // sort_results.textContent="";
                            // let sort_resultv=document.getElementById("sort_resultv");
                            // sort_resultv.textContent="";
                            let uname3="";
                        </script>
                        <c:if test="${h==1}">
                            <script>let sort_resulth=document.getElementById("sort_resulth");sort_resulth.textContent="warm"</script>
                        </c:if>
                        <c:if test="${s==1}">
                            <script>let sort_results=document.getElementById("sort_results");sort_results.textContent="colorful"</script>
                        </c:if>
                        <c:if test="${v==1}">
                            <script>let sort_resultv=document.getElementById("sort_resultv");sort_resultv.textContent="light"</script>
                        </c:if>
                        <c:if test="${h==2}">
                            <script>let sort_resulth=document.getElementById("sort_resulth");sort_resulth.textContent="cold"</script>
                        </c:if>
                        <c:if test="${s==2}">
                            <script>let sort_results=document.getElementById("sort_results");sort_results.textContent="colorless"</script>
                        </c:if>
                        <c:if test="${v==2}">
                            <script>let sort_resultv=document.getElementById("sort_resultv");sort_resultv.textContent="dim"</script>
                        </c:if>

                        <c:if test="${s_id==1}">
                            <script>uname3="art_paint";let artpaint_li=document.getElementById("artpaint_li");artpaint_li.className="active"</script>
                        </c:if>
                        <c:if test="${s_id==191}">
                            <script>uname3="cartoon";let cartoon_li=document.getElementById("cartoon_li");cartoon_li.className="active"</script>
                        </c:if>
                        <c:if test="${s_id==192}">
                            <script>uname3="real";let real_li=document.getElementById("real_li");real_li.className="active"</script>
                        </c:if>
                        <c:if test="${s_id==193}">
                            <script>uname3="sketch";let sketch_li=document.getElementById("sketch_li");sketch_li.className="active"</script>
                        </c:if>
                        <c:if test="${s_id==194}">
                            <script>uname3="statue";let statue_li=document.getElementById("statue_li");statue_li.className="active"</script>
                        </c:if>
                    </div>
                </div>
            </nav>
            <div class="container content_img" style="overflow-y: auto">
                <div class="row">
                        <script>
                            let label_result1=document.getElementById("sort_result1");
                            label_result1.textContent = "${uname1}";
                            let label_result2=document.getElementById("sort_result2");
                            label_result2.textContent = "${uname2}";
                            let pic_num=0
                        </script>
                        <%int pic_num=0;%>
                    <c:forEach items="${arr}" var="item">
                        <%pic_num=pic_num+1;%>
                        <div class="col-md-3">
                            <button id="btn_pic<%=pic_num%>" data-html="true" type="button" data-placement="bottom" class="c_b_img" data-toggle="popover" title="Features:">
                                <img class="c_img" src="${item.getP_str()}"></button>
                            <script>

                                $(function(){

                                    // $("[data-toggle='popover']").popover({
                                    $("[id='btn_pic<%=pic_num%>']").popover({
                                        id:"pop",
                                        html: true,
                                        placement: "bottom",
                                        content: "<h5>Intuitive Features</h5>" +
                                            "<h6>Hue:${item.getHue()}</h6>" +
                                            "<h6>Saturation:${item.getSaturation()}</h6>"+
                                            "<h6>Value:${item.getValue()}</h6>"+
                                            "<hr>" +
                                            "<h5>Sort</h5>" +
                                            "<h6>Style:${item.getSn()}</h6>"+
                                            "<h6>Content:${item.getCn()}</h6>"+
                                            "<h6>district:${item.getGn()}</h6>"+
                                            "<hr>"+
                                            "<h5>Discribe</h5>" +
                                            "<h6>${item.getDiscribe()}</h6>"+
                                            "<img id='penImg<%=pic_num%>' src='./pic/pen.PNG' width='100' height='27.6px'><br>"+
                                            "<img id='captchaImg<%=pic_num%>' src='./pic/delete.PNG' width='100' height='27.6px'>"
                                    });
                                }).click(function (){
                                    $("#penImg<%=pic_num%>").click(function (){
                                        <%
                                            User user1=(User)session.getAttribute("user");
                                            if(user1!=null){
                                        %>
                                        window.location.href="toupdate?p_id=${item.getP_id()}&src=${item.getP_str()}&s=${item.getSn()}&c=${item.getCn()}&g=${item.getGn()}&s_id=${s_id}&c_id=${c_id}&g_id=${g_id}&discribe=${item.getDiscribe()}";
                                        <%
                                            }else{
                                        %>
                                        let wm=document.getElementById("wrongModal");
                                        $(wm).modal("show");
                                        <%
                                            }
                                        %>
                                    });

                                    $("#captchaImg<%=pic_num%>").click(function (){
                                        <%
                                            User user2=(User)session.getAttribute("user");
                                            if(user2!=null){
                                        %>
                                        let m=document.getElementById("myModal<%=pic_num%>");
                                        $(m).modal("show");
                                        <%
                                            }else{
                                        %>
                                        let wm=document.getElementById("wrongModal");
                                        $(wm).modal("show");
                                        <%
                                            }
                                        %>
                                    });
                                });

                            </script>
                            <div class="modal fade" id="wrongModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" aria-hidden="true">×</button>
                                            <h4 class="modal-title" id="mm">please login in</h4>
                                        </div>
                                        <div class="modal-body">
                                            <button id="btn_w_close" type="button" class="btn btn-success" data-dismiss="modal">Ok</button>
                                            <script>
                                                let btn_w_close=document.getElementById("btn_w_close");
                                                btn_w_close.onclick=function () {
                                                    $('#wrongModal').modal('hide')
                                                    return;
                                                }
                                            </script>
                                        </div>
                                    </div><!-- /.modal-content -->
                                </div><!-- /.modal-dialog -->
                            </div>
                            <div class="modal fade" id="myModal<%=pic_num%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" aria-hidden="true">×</button>
                                            <h4 class="modal-title" id="myModalLabel<%=pic_num%>">Delete?</h4>
                                        </div>
                                        <div class="modal-body">
                                            <button id="btn_close<%=pic_num%>" type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                            <button id="btn_ok<%=pic_num%>" type="button" class="btn btn-danger">Yes</button>
                                            <script>
                                                let btn_close<%=pic_num%>=document.getElementById("btn_close<%=pic_num%>");
                                                btn_close<%=pic_num%>.onclick=function () {
                                                    $('#myModal<%=pic_num%>').modal('hide')
                                                    return;
                                                }
                                                let btn_ok<%=pic_num%>=document.getElementById("btn_ok<%=pic_num%>");
                                                btn_ok<%=pic_num%>.onclick=function () {
                                                    $('#myModal<%=pic_num%>').modal('hide')
                                                    window.location.href ="delete?p_id=${item.getP_id()}&str=${item.getP_str()}&url="+location.href;
                                                }
                                            </script>
                                        </div>
                                    </div><!-- /.modal-content -->
                                </div><!-- /.modal-dialog -->
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <c:if test="${arr!=null}">
                <div class="page_con">
                    <button id="btn_add" class="btn btn-success"><span class="glyphicon glyphicon-plus"></span>Add</button>
                    <button id="btn_pre_page" type="button" class="btn btn-primary">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                    </button>
                    <input style="display: inline" id="page_input" type="text" class="form-control input-sm input_len">
                    <button id="btn_page_jump" type="button" class="btn btn-warning">
                        <span class="glyphicon glyphicon-arrow-up"></span>
                    </button>
                    <button id="btn_next_page" type="button" class="btn btn-primary">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                    </button>
                </div>
                <script>
                    let page_input=document.getElementById("page_input");
                    let btn_page_jump=document.getElementById("btn_page_jump");
                    let b_add = document.getElementById("btn_add");
                    let limit=parseInt(${limit});
                    let inputpage;
                    page_input.value="${page}";
                    btn_page_jump.onclick=function (){
                        if(isNaN(page_input.value)||page_input.value==""){
                            alert("the input is invalid");
                            return;
                        }
                        inputpage=parseInt(page_input.value);
                        if(inputpage>=1&&(inputpage-1)*16<limit){
                            window.location.href ="get?s_id="+s_id+"&g_id="+g_id+"&c_id="+c_id+"&page="+inputpage+"&uname1=${uname1}&uname2=${uname2}&h=${h}&s=${s}&v=${v}";
                        }else{
                            alert("no this page");
                        }
                    }
                    b_add.onclick=function (){//6666666666666666
                        window.location.href ="jump?&unamec=${uname1}&unameg=${uname2}&unames="+uname3;
                    }
                </script>
            </c:if>
        </div>
    </section>


    <script>
        let b_next_page = document.getElementById("btn_next_page");
        let b_pre_page = document.getElementById("btn_pre_page");
        let page=${page};
        let s_id=${s_id};
        let g_id=${g_id};
        let c_id=${c_id};
        let page_int=parseInt(page);
        <%--let limit=parseInt(${limit});--%>
        b_next_page.onclick=function (){
            if(page_int*16<limit){
                page_int=page_int+1;
                window.location.href ="get?s_id="+s_id+"&g_id="+g_id+"&c_id="+c_id+"&page="+page_int+"&uname1=${uname1}&uname2=${uname2}&h=${h}&s=${s}&v=${v}";
            }else{
                alert("it is the last page");
            }
        }
        b_pre_page.onclick=function (){
            if(page_int>1){
                page_int=page_int-1;
                window.location.href ="get?s_id="+s_id+"&g_id="+g_id+"&c_id="+c_id+"&page="+page_int+"&uname1=${uname1}&uname2=${uname2}&h=${h}&s=${s}&v=${v}";
            }else{
                alert("it is the first page");
            }
        }
    </script>

</body>

</body>
</html>
