<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
    <%@ include file="../../static/head.jsp" %>
    <link href="http://www.bootcss.com/p/bootstrap-datetimepicker/bootstrap-datetimepicker/css/datetimepicker.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap-select.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" charset="utf-8">
        window.UEDITOR_HOME_URL = "${pageContext.request.contextPath}/resources/ueditor/"; //UEDITOR_HOME_URL、config、all这三个顺序不能改变
    </script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<style>
    .error {
        color: red;
    }
</style>
<body>
<!-- Pre Loader -->
<div class="loading">
    <div class="spinner">
        <div class="double-bounce1"></div>
        <div class="double-bounce2"></div>
    </div>
</div>
<!--/Pre Loader -->
<div class="wrapper">
    <!-- Page Content -->
    <div id="content">
        <!-- Top Navigation -->
        <%@ include file="../../static/topNav.jsp" %>
        <!-- Menu -->
        <div class="container menu-nav">
            <nav class="navbar navbar-expand-lg lochana-bg text-white">
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="ti-menu text-white"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul id="navUl" class="navbar-nav mr-auto">

                    </ul>
                </div>
            </nav>
        </div>
        <!-- /Menu -->
        <!-- Breadcrumb -->
        <!-- Page Title -->
        <div class="container mt-0">
            <div class="row breadcrumb-bar">
                <div class="col-md-6">
                    <h3 class="block-title">编辑志愿者</h3>
                </div>
                <div class="col-md-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/index.jsp">
                                <span class="ti-home"></span>
                            </a>
                        </li>
                        <li class="breadcrumb-item">志愿者管理</li>
                        <li class="breadcrumb-item active">编辑志愿者</li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- /Page Title -->

        <!-- /Breadcrumb -->
        <!-- Main Content -->
        <div class="container">

            <div class="row">
                <!-- Widget Item -->
                <div class="col-md-12">
                    <div class="widget-area-2 lochana-box-shadow">
                        <h3 class="widget-title">志愿者信息</h3>
                        <form id="addOrUpdateForm">
                            <div class="form-row">
                            <!-- 级联表的字段 -->
                            <!-- 当前表的字段 -->
                                    <input id="updateId" name="id" type="hidden">
                                    <div class="form-group col-md-6">
                                        <label>账户</label>
                                        <input id="username" name="username" class="form-control"
                                               placeholder="账户">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>姓名</label>
                                        <input id="zhiyuanzheName" name="zhiyuanzheName" class="form-control"
                                               placeholder="姓名">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>性别</label>
                                        <select id="zhiyuanzheSexTypesSelect" name="zhiyuanzheSexTypes" class="form-control">
                                        </select>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>年龄</label>
                                        <input id="zhiyuanzheAge" name="zhiyuanzheAge" class="form-control"
                                               onchange="zhiyuanzheAgeChickValue(this)"  placeholder="年龄">
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label>照片</label>
                                        <img id="zhiyuanzhePhotoImg" src="" width="100" height="100">
                                        <input name="file" type="file" id="zhiyuanzhePhotoupload"
                                               class="form-control-file">
                                        <input name="zhiyuanzhePhoto" id="zhiyuanzhePhoto-input" type="hidden">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>工作</label>
                                        <input id="zhiyuanzheGongzuo" name="zhiyuanzheGongzuo" class="form-control"
                                               placeholder="工作">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>收入</label>
                                        <input id="zhiyuanzheJine" name="zhiyuanzheJine" class="form-control"
                                               onchange="zhiyuanzheJineChickValue(this)"  placeholder="收入">
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label>家庭地址</label>
                                        <input id="zhiyuanzheAddress" name="zhiyuanzheAddress" class="form-control"
                                               placeholder="家庭地址">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>联系方式</label>
                                        <input id="zhiyuanzhePhone" name="zhiyuanzhePhone" class="form-control"
                                               onchange="zhiyuanzhePhoneChickValue(this)"  placeholder="联系方式">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>身份证号</label>
                                        <input id="zhiyuanzheIdNumber" name="zhiyuanzheIdNumber" class="form-control"
                                               onchange="zhiyuanzheIdNumberChickValue(this)"  placeholder="身份证号">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>爱好</label>
                                        <input id="zhiyuanzheAihao" name="zhiyuanzheAihao" class="form-control"
                                               placeholder="爱好">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>是否养过宠物</label>
                                        <select id="zhiyuanzheYesnoTypesSelect" name="zhiyuanzheYesnoTypes" class="form-control">
                                        </select>
                                    </div>
                                    <div class="form-group col-md-6 cccccc">
                                        <label>是否启用</label>
                                        <select id="zhiyuanzheTypesSelect" name="zhiyuanzheTypes" class="form-control">
                                        </select>
                                    </div>
                                    <div class="form-group col-md-12 mb-3">
                                        <button id="submitBtn" type="button" class="btn btn-primary btn-lg">提交</button>
                                        <button id="exitBtn" type="button" class="btn btn-primary btn-lg">返回</button>
                                    </div>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- /Widget Item -->
            </div>
        </div>
        <!-- /Main Content -->
    </div>
    <!-- /Page Content -->
</div>
<!-- Back to Top -->
<a id="back-to-top" href="#" class="back-to-top">
    <span class="ti-angle-up"></span>
</a>
<!-- /Back to Top -->
<%@ include file="../../static/foot.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.ui.widget.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.fileupload.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/jquery.validate.min.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/messages_zh.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/card.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/datetimepicker/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" charset="utf-8"
                 src="${pageContext.request.contextPath}/resources/js/bootstrap-select.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/laydate.js"></script>
<script>
    <%@ include file="../../utils/menu.jsp"%>
    <%@ include file="../../static/setMenu.js"%>
    <%@ include file="../../utils/baseUrl.jsp"%>

    var tableName = "zhiyuanzhe";
    var pageType = "add-or-update";
    var updateId = "";
    var crossTableId = -1;
    var crossTableName = '';
    var ruleForm = {};
    var crossRuleForm = {};


    // 下拉框数组
        <!-- 当前表的下拉框数组 -->
    var zhiyuanzheSexTypesOptions = [];
    var zhiyuanzheYesnoTypesOptions = [];
    var zhiyuanzheTypesOptions = [];
        <!-- 级联表的下拉框数组 -->

    var ruleForm = {};


    // 文件上传
    function upload() {

        <!-- 当前表的文件上传 -->
        $('#zhiyuanzhePhotoupload').fileupload({
            url: baseUrl + 'file/upload',
            headers: {token: window.sessionStorage.getItem("token")},
            dataType: 'json',
            done: function (e, data) {
                var photoUrl= baseUrl + 'file/download?fileName=' + data.result.file;
                document.getElementById('zhiyuanzhePhotoImg').setAttribute('src',photoUrl);
                document.getElementById('zhiyuanzhePhoto-input').setAttribute('value',photoUrl);
            }
        });


    }

    // 表单提交
    function submit() {
        if (validform() == true && compare() == true) {
            let data = {};
            getContent();
            let value = $('#addOrUpdateForm').serializeArray();
            $.each(value, function (index, item) {
                data[item.name] = item.value;
            });
            let json = JSON.stringify(data);
            var urlParam;
            var successMes = '';
            if (updateId != null && updateId != "null" && updateId != '') {
                urlParam = 'update';
                successMes = '修改成功';
            } else {
                urlParam = 'save';
                    successMes = '添加成功';
            }
            httpJson("zhiyuanzhe/" + urlParam, "POST", data, (res) => {
                if(res.code == 0){
                    window.sessionStorage.removeItem('addzhiyuanzhe');
                    window.sessionStorage.removeItem('updateId');
                    let flag = true;
                    if (flag) {
                        alert(successMes);
                    }
                    if (window.sessionStorage.getItem('onlyme') != null && window.sessionStorage.getItem('onlyme') == "true") {
                        window.sessionStorage.removeItem('onlyme');
                        window.sessionStorage.setItem("reload","reload");
                        window.parent.location.href = "${pageContext.request.contextPath}/index.jsp";
                    } else {
                        window.location.href="${pageContext.request.contextPath}/index.jsp";
                    }
                }
            });
        } else {
            alert("表单未填完整或有错误");
        }
    }

    // 查询列表
        <!-- 查询当前表的所有列表 -->
        function zhiyuanzheSexTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=zhiyuanzhe_sex_types", "GET", {}, (res) => {
                if(res.code == 0){
                    zhiyuanzheSexTypesOptions = res.data.list;
                }
            });
        }
        function zhiyuanzheYesnoTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=zhiyuanzhe_yesno_types", "GET", {}, (res) => {
                if(res.code == 0){
                    zhiyuanzheYesnoTypesOptions = res.data.list;
                }
            });
        }
        function zhiyuanzheTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=zhiyuanzhe_types", "GET", {}, (res) => {
                if(res.code == 0){
                    zhiyuanzheTypesOptions = res.data.list;
                }
            });
        }
        <!-- 查询级联表的所有列表 -->



    // 初始化下拉框
    <!-- 初始化当前表的下拉框 -->
        function initializationZhiyuanzhesextypesSelect(){
            var zhiyuanzheSexTypesSelect = document.getElementById('zhiyuanzheSexTypesSelect');
            if(zhiyuanzheSexTypesSelect != null && zhiyuanzheSexTypesOptions != null  && zhiyuanzheSexTypesOptions.length > 0 ){
                for (var i = 0; i < zhiyuanzheSexTypesOptions.length; i++) {
                    zhiyuanzheSexTypesSelect.add(new Option(zhiyuanzheSexTypesOptions[i].indexName,zhiyuanzheSexTypesOptions[i].codeIndex));
                }
            }
        }
        function initializationZhiyuanzheyesnotypesSelect(){
            var zhiyuanzheYesnoTypesSelect = document.getElementById('zhiyuanzheYesnoTypesSelect');
            if(zhiyuanzheYesnoTypesSelect != null && zhiyuanzheYesnoTypesOptions != null  && zhiyuanzheYesnoTypesOptions.length > 0 ){
                for (var i = 0; i < zhiyuanzheYesnoTypesOptions.length; i++) {
                    zhiyuanzheYesnoTypesSelect.add(new Option(zhiyuanzheYesnoTypesOptions[i].indexName,zhiyuanzheYesnoTypesOptions[i].codeIndex));
                }
            }
        }
        function initializationZhiyuanzhetypesSelect(){
            var zhiyuanzheTypesSelect = document.getElementById('zhiyuanzheTypesSelect');
            if(zhiyuanzheTypesSelect != null && zhiyuanzheTypesOptions != null  && zhiyuanzheTypesOptions.length > 0 ){
                for (var i = 0; i < zhiyuanzheTypesOptions.length; i++) {
                    zhiyuanzheTypesSelect.add(new Option(zhiyuanzheTypesOptions[i].indexName,zhiyuanzheTypesOptions[i].codeIndex));
                }
            }
        }



    // 下拉框选项回显
    function setSelectOption() {

        <!-- 当前表的下拉框回显 -->

        var zhiyuanzheSexTypesSelect = document.getElementById("zhiyuanzheSexTypesSelect");
        if(zhiyuanzheSexTypesSelect != null && zhiyuanzheSexTypesOptions != null  && zhiyuanzheSexTypesOptions.length > 0 ) {
            for (var i = 0; i < zhiyuanzheSexTypesOptions.length; i++) {
                if (zhiyuanzheSexTypesOptions[i].codeIndex == ruleForm.zhiyuanzheSexTypes) {//下拉框value对比,如果一致就赋值汉字
                        zhiyuanzheSexTypesSelect.options[i].selected = true;
                }
            }
        }

        var zhiyuanzheYesnoTypesSelect = document.getElementById("zhiyuanzheYesnoTypesSelect");
        if(zhiyuanzheYesnoTypesSelect != null && zhiyuanzheYesnoTypesOptions != null  && zhiyuanzheYesnoTypesOptions.length > 0 ) {
            for (var i = 0; i < zhiyuanzheYesnoTypesOptions.length; i++) {
                if (zhiyuanzheYesnoTypesOptions[i].codeIndex == ruleForm.zhiyuanzheYesnoTypes) {//下拉框value对比,如果一致就赋值汉字
                        zhiyuanzheYesnoTypesSelect.options[i].selected = true;
                }
            }
        }

        var zhiyuanzheTypesSelect = document.getElementById("zhiyuanzheTypesSelect");
        if(zhiyuanzheTypesSelect != null && zhiyuanzheTypesOptions != null  && zhiyuanzheTypesOptions.length > 0 ) {
            for (var i = 0; i < zhiyuanzheTypesOptions.length; i++) {
                if (zhiyuanzheTypesOptions[i].codeIndex == ruleForm.zhiyuanzheTypes) {//下拉框value对比,如果一致就赋值汉字
                        zhiyuanzheTypesSelect.options[i].selected = true;
                }
            }
        }
        <!--  级联表的下拉框回显  -->
    }


    // 填充富文本框
    function setContent() {

        <!-- 当前表的填充富文本框 -->
    }
    // 获取富文本框内容
    function getContent() {

        <!-- 获取当前表的富文本框内容 -->
    }
    //数字检查
        <!-- 当前表的数字检查 -->
        function zhiyuanzheAgeChickValue(e){
            var this_val = e.value || 0;
            var reg=/^[1-9][0-9]*$/;
            if(!reg.test(this_val)){
                e.value = "";
                alert("输入不合法");
                return false;
            }
        }
        function zhiyuanzheJineChickValue(e){
            var this_val = e.value || 0;
            var reg=/^[1-9][0-9]*$/;
            if(!reg.test(this_val)){
                e.value = "";
                alert("输入不合法");
                return false;
            }
        }
        function zhiyuanzhePhoneChickValue(e){
            var this_val = e.value || 0;
            var reg=/^(13[0-9]|14[01456879]|15[0-35-9]|16[2567]|17[0-8]|18[0-9]|19[0-35-9])\d{8}$/;
            if(!reg.test(this_val)){
                e.value = "";
                alert("手机号不正确");
                return false;
            }
        }
        function zhiyuanzheIdNumberChickValue(e){
            var this_val = e.value || 0;
            var reg=/^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;
            if(!reg.test(this_val)){
                e.value = "";
                alert("身份证号不正确");
                return false;
            }
        }



    function exit() {
        window.sessionStorage.removeItem("updateId");
        window.sessionStorage.removeItem('addzhiyuanzhe');
        window.location.href="${pageContext.request.contextPath}/index.jsp";
    }
    // 表单校验
    function validform() {
        return $("#addOrUpdateForm").validate({
            rules: {
                username: "required",
                password: "required",
                zhiyuanzheName: "required",
                zhiyuanzheSexTypes: "required",
                zhiyuanzheAge: "required",
                zhiyuanzhePhoto: "required",
                zhiyuanzheGongzuo: "required",
                zhiyuanzheJine: "required",
                zhiyuanzheAddress: "required",
                zhiyuanzhePhone: "required",
                zhiyuanzheIdNumber: "required",
                zhiyuanzheAihao: "required",
                zhiyuanzheYesnoTypes: "required",
                zhiyuanzheTypes: "required",
            },
            messages: {
                username: "账户不能为空",
                password: "密码不能为空",
                zhiyuanzheName: "姓名不能为空",
                zhiyuanzheSexTypes: "性别不能为空",
                zhiyuanzheAge: "年龄不能为空",
                zhiyuanzhePhoto: "照片不能为空",
                zhiyuanzheGongzuo: "工作不能为空",
                zhiyuanzheJine: "收入不能为空",
                zhiyuanzheAddress: "家庭地址不能为空",
                zhiyuanzhePhone: "联系方式不能为空",
                zhiyuanzheIdNumber: "身份证号不能为空",
                zhiyuanzheAihao: "爱好不能为空",
                zhiyuanzheYesnoTypes: "是否养过宠物不能为空",
                zhiyuanzheTypes: "是否启用不能为空",
            }
        }).form();
    }

    // 获取当前详情
    function getDetails() {
        var addzhiyuanzhe = window.sessionStorage.getItem("addzhiyuanzhe");
        if (addzhiyuanzhe != null && addzhiyuanzhe != "" && addzhiyuanzhe != "null") {
            //注册表单验证
            $(validform());
            $('#submitBtn').text('新增');

        } else {
            $('#submitBtn').text('修改');
            var userId = window.sessionStorage.getItem('userId');
            updateId = userId;//先赋值登录用户id
            var uId  = window.sessionStorage.getItem('updateId');//获取修改传过来的id
            if (uId != null && uId != "" && uId != "null") {
                //如果修改id不为空就赋值修改id
                updateId = uId;
            }
            window.sessionStorage.removeItem('updateId');
            http("zhiyuanzhe/info/" + updateId, "GET", {}, (res) => {
                if(res.code == 0)
                {
                    ruleForm = res.data
                    // 是/否下拉框回显
                    setSelectOption();
                    // 设置图片src
                    showImg();
                    // 设置视频src
                    showVideo();
                    // 数据填充
                    dataBind();
                    // 富文本框回显
                    setContent();
                    //注册表单验证
                    $(validform());
                }

            });
        }
    }

    // 清除可能会重复渲染的selection
    function clear(className) {
        var elements = document.getElementsByClassName(className);
        for (var i = elements.length - 1; i >= 0; i--) {
            elements[i].parentNode.removeChild(elements[i]);
        }
    }

    function dateTimePick() {
    }


    function dataBind() {


    <!--  级联表的数据回显  -->


    <!--  当前表的数据回显  -->
        $("#updateId").val(ruleForm.id);
        $("#username").val(ruleForm.username);
        $("#password").val(ruleForm.password);
        $("#zhiyuanzheName").val(ruleForm.zhiyuanzheName);
        $("#zhiyuanzheAge").val(ruleForm.zhiyuanzheAge);
        $("#zhiyuanzheGongzuo").val(ruleForm.zhiyuanzheGongzuo);
        $("#zhiyuanzheJine").val(ruleForm.zhiyuanzheJine);
        $("#zhiyuanzheAddress").val(ruleForm.zhiyuanzheAddress);
        $("#zhiyuanzhePhone").val(ruleForm.zhiyuanzhePhone);
        $("#zhiyuanzheIdNumber").val(ruleForm.zhiyuanzheIdNumber);
        $("#zhiyuanzheAihao").val(ruleForm.zhiyuanzheAihao);

    }
    <!--  级联表的数据回显  -->

    //图片显示
    function showImg() {
        <!--  当前表的图片  -->
        $("#zhiyuanzhePhotoImg").attr("src",ruleForm.zhiyuanzhePhoto);

        <!--  级联表的图片  -->
    }


    <!--  级联表的图片  -->


    //视频回显
    function showVideo() {
    <!--  当前表的视频  -->

    <!--  级联表的视频  -->
    }


    <!--  级联表的视频  -->



    $(document).ready(function () {
        //设置右上角用户名
        $('.dropdown-menu h5').html(window.sessionStorage.getItem('username'))
        //设置项目名
        $('.sidebar-header h3 a').html(projectName)
        //设置导航栏菜单
        setMenu();
        $('#exitBtn').on('click', function (e) {
            e.preventDefault();
            exit();
        });
        //初始化时间插件
        dateTimePick();
        //查询所有下拉框
            <!--  当前表的下拉框  -->
            zhiyuanzheSexTypesSelect();
            zhiyuanzheYesnoTypesSelect();
            zhiyuanzheTypesSelect();
            <!-- 查询级联表的下拉框(用id做option,用名字及其他参数做名字级联修改) -->



        // 初始化下拉框
            <!--  初始化当前表的下拉框  -->
            initializationZhiyuanzhesextypesSelect();
            initializationZhiyuanzheyesnotypesSelect();
            initializationZhiyuanzhetypesSelect();
            <!--  初始化级联表的下拉框  -->

        $(".selectpicker" ).selectpicker('refresh');
        getDetails();
        //初始化上传按钮
        upload();
    <%@ include file="../../static/myInfo.js"%>
                $('#submitBtn').on('click', function (e) {
                    e.preventDefault();
                    //console.log("点击了...提交按钮");
                    submit();
                });
        readonly();
        window.sessionStorage.removeItem('addzhiyuanzhe');
    });

    function readonly() {
        if (window.sessionStorage.getItem('role') == '志愿者') {
            //$('#jifen').attr('readonly', 'readonly');
            //$('#role').attr('style', 'pointer-events: none;');
            $(".cccccc").remove();
        }else if (window.sessionStorage.getItem('role') == '用户') {
            $(".aaaaaa").remove();
        }else{
            // alert("未知情况.......");
        }
    }

    //比较大小
    function compare() {
        var largerVal = null;
        var smallerVal = null;
        if (largerVal != null && smallerVal != null) {
            if (largerVal <= smallerVal) {
                alert(smallerName + '不能大于等于' + largerName);
                return false;
            }
        }
        return true;
    }


    // 用户登出
    <%@ include file="../../static/logout.jsp"%>
</script>
</body>

</html>