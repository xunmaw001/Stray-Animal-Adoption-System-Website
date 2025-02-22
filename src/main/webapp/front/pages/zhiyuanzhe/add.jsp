<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page isELIgnored="true" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>注册</title>
    <!-- bootstrap样式，地图插件使用 -->
    <link rel="stylesheet" href="../../css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <!-- 样式 -->
    <link rel="stylesheet" href="../../css/style.css"/>
    <!-- 主题（主要颜色设置） -->
    <link rel="stylesheet" href="../../css/theme.css"/>
    <!-- 通用的css -->
    <link rel="stylesheet" href="../../css/common.css"/>
</head>
<body style="background: #EEEEEE; ">


<div id="app">

    <!-- 轮播图 -->
    <div class="layui-carousel" id="swiper">
        <div carousel-item id="swiper-item">
            <div v-for="(item,index) in swiperList" v-bind:key="index">
                <img class="swiper-item" :src="item.img">
            </div>
        </div>
    </div>
    <!-- 轮播图 -->

    <div class="data-add-container">

        <form class="layui-form layui-form-pane" lay-filter="myForm">
            <!-- 级联表的 -->


            <!-- 当前表的 -->
            <div class="layui-form-item" pane>
                <label class="layui-form-label">账户：</label>
                <div class="layui-input-block">
                    <input v-model="detail.username" type="text" name="username" id="username" placeholder="账户" lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>

            <div class="layui-form-item" pane>
                <label class="layui-form-label">姓名：</label>
                <div class="layui-input-block">
                    <input v-model="detail.zhiyuanzheName" type="text" name="zhiyuanzheName" id="zhiyuanzheName" placeholder="姓名" lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>


            <div class="layui-form-item" pane>
                <label class="layui-form-label">性别：</label>
                <div class="layui-input-block">
                    <select name="zhiyuanzheSexTypes" id="zhiyuanzheSexTypes" lay-filter="zhiyuanzheSexTypes">
                        <option v-for="item in zhiyuanzheSexTypesList" :value="item.codeIndex" :key="item.codeIndex">{{ item.indexName }}</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item" pane>
                <label class="layui-form-label">年龄：</label>
                <div class="layui-input-inline">
                    <input v-model="detail.zhiyuanzheAge" type="text" name="zhiyuanzheAge" id="zhiyuanzheAge" lay-verify="integer|required"   placeholder="年龄" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item" pane>
                <label class="layui-form-label">照片：</label>
                <div v-if="detail.zhiyuanzhePhoto" class="layui-input-block">
                    <img id="zhiyuanzhePhotoImg"
                         style="width: 100px;height: 100px;border-radius: 50%;border: 2px solid #EEEEEE;"
                         :src="detail.zhiyuanzhePhoto">
                    <input type="hidden" :value="detail.zhiyuanzhePhoto" id="zhiyuanzhePhoto" name="zhiyuanzhePhoto"/>
                </div>
                <div class="layui-input-block">
                    <button type="button" class="layui-btn btn-theme" id="zhiyuanzhePhotoUpload">
                        <i class="layui-icon">&#xe67c;</i>上传照片
                    </button>
                </div>
            </div>
                    <div class="layui-form-item" pane>
                <label class="layui-form-label">工作：</label>
                <div class="layui-input-block">
                    <input v-model="detail.zhiyuanzheGongzuo" type="text" name="zhiyuanzheGongzuo" id="zhiyuanzheGongzuo" placeholder="工作" lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>

            <div class="layui-form-item" pane>
                <label class="layui-form-label">收入：</label>
                <div class="layui-input-inline">
                    <input v-model="detail.zhiyuanzheJine" type="text" name="zhiyuanzheJine" id="zhiyuanzheJine" lay-verify="integer|required"   placeholder="收入" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" pane>
                <label class="layui-form-label">家庭地址：</label>
                <div class="layui-input-block">
                    <input v-model="detail.zhiyuanzheAddress" type="text" name="zhiyuanzheAddress" id="zhiyuanzheAddress" placeholder="家庭地址" lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>

<!-- 手机号 -->
            <div class="layui-form-item" pane>
                <label class="layui-form-label">联系方式：</label>
                <div class="layui-input-inline">
                    <input v-model="detail.zhiyuanzhePhone" type="text" name="zhiyuanzhePhone" id="zhiyuanzhePhone"  lay-verify="phone|required"   placeholder="联系方式" autocomplete="off" class="layui-input">
                </div>
            </div>
        <!-- 身份证号 -->

            <div class="layui-form-item" pane>
                <label class="layui-form-label">身份证号：</label>
                <div class="layui-input-inline">
                    <input v-model="detail.zhiyuanzheIdNumber" type="text" name="zhiyuanzheIdNumber" id="zhiyuanzheIdNumber"  lay-verify="identity|required"   placeholder="身份证号" autocomplete="off" class="layui-input">
                </div>
            </div>
                    <div class="layui-form-item" pane>
                <label class="layui-form-label">爱好：</label>
                <div class="layui-input-block">
                    <input v-model="detail.zhiyuanzheAihao" type="text" name="zhiyuanzheAihao" id="zhiyuanzheAihao" placeholder="爱好" lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>


            <div class="layui-form-item" pane>
                <label class="layui-form-label">是否养过宠物：</label>
                <div class="layui-input-block">
                    <select name="zhiyuanzheYesnoTypes" id="zhiyuanzheYesnoTypes" lay-filter="zhiyuanzheYesnoTypes">
                        <option v-for="item in zhiyuanzheYesnoTypesList" :value="item.codeIndex" :key="item.codeIndex">{{ item.indexName }}</option>
                    </select>
                </div>
            </div>

            <div class="layui-form-item" pane>
                <label class="layui-form-label">是否启用：</label>
                <div class="layui-input-block">
                    <select name="zhiyuanzheTypes" id="zhiyuanzheTypes" lay-filter="zhiyuanzheTypes">
                        <option v-for="item in zhiyuanzheTypesList" :value="item.codeIndex" :key="item.codeIndex">{{ item.indexName }}</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block" style="text-align: right;margin-right: 30px;">
                    <button class="layui-btn btn-submit" lay-submit lay-filter="thisSubmit">提交</button>
                </div>
            </div>
        </form>
    </div>
</div>

<script src="../../layui/layui.js"></script>
<script src="../../js/vue.js"></script>
<!-- 组件配置信息 -->
<script src="../../js/config.js"></script>
<!-- 扩展插件配置信息 -->
<script src="../../modules/config.js"></script>
<!-- 工具方法 -->
<script src="../../js/utils.js"></script>
<!-- 校验格式工具类 -->
<script src="../../js/validate.js"></script>
<!-- 地图 -->
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=ca04cee7ac952691aa67a131e6f0cee0"></script>
<script type="text/javascript" src="../../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../../js/bootstrap.AMapPositionPicker.js"></script>

<script>
    var jquery = $;

    var vue = new Vue({
        el: '#app',
        data: {
            // 轮播图
            swiperList: [{
                img: '../../img/banner.jpg'
            }],
            // 当前表数据
            detail: {
                username: '',
                password: '',
                zhiyuanzheName: '',
                zhiyuanzheSexTypes: '',
                zhiyuanzheAge: '',
                zhiyuanzhePhoto: '',
                zhiyuanzheGongzuo: '',
                zhiyuanzheJine: '',
                zhiyuanzheAddress: '',
                zhiyuanzhePhone: '',
                zhiyuanzheIdNumber: '',
                zhiyuanzheAihao: '',
                zhiyuanzheYesnoTypes: '',
                zhiyuanzheTypes: '',
                createTime: '',
            },

            // 级联表的

            // 下拉框
            zhiyuanzheSexTypesList: [],
            zhiyuanzheYesnoTypesList: [],
            zhiyuanzheTypesList: [],
            centerMenu: centerMenu
        },
        updated: function () {
            layui.form.render('select', 'myForm');
        },
        computed: {},
        methods: {
            jump(url) {
                jump(url)
            }
        }
    })


    layui.use(['layer', 'element', 'carousel', 'http', 'jquery', 'form', 'upload', 'laydate', 'tinymce'], function () {
        var layer = layui.layer;
        var element = layui.element;
        var carousel = layui.carousel;
        var http = layui.http;
        var jquery = layui.jquery;
        var form = layui.form;
        var upload = layui.upload;
        var laydate = layui.laydate;
        var tinymce = layui.tinymce

        // 获取轮播图 数据
        http.request('config/list', 'get', {
            page: 1,
            limit: 5
        }, function(res) {
            if (res.data.list.length > 0) {
                var swiperItemHtml = '';
                for (let item of res.data.list) {
                    if (item.value != "" && item.value != null) {
                        swiperItemHtml +=
                                '<div>' +
                                '<img class="swiper-item" src="' + item.value + '">' +
                                '</div>';
                    }
                }
                jquery('#swiper-item').html(swiperItemHtml);
                // 轮播图
                carousel.render({
                    elem: '#swiper',
                    width: swiper.width,height:swiper.height,
                    arrow: swiper.arrow,
                    anim: swiper.anim,
                    interval: swiper.interval,
                    indicator: "none"
                });
            }
        });


        // 下拉框
        // 性别的查询和初始化
       zhiyuanzheSexTypesSelect();
        // 是否养过宠物的查询和初始化
       zhiyuanzheYesnoTypesSelect();
        // 是否启用的查询和初始化
       zhiyuanzheTypesSelect();

        // 上传文件
            		// 照片的文件上传
        upload.render({
            //绑定元素
            elem: '#zhiyuanzhePhotoUpload',
            //上传接口
            url: http.baseurl + 'file/upload',
            // 请求头
            headers: {
                Token: localStorage.getItem('Token')
            },
            // 允许上传时校验的文件类型
            accept: 'images',
            before: function () {
                //loading层
                var index = layer.load(1, {
                    shade: [0.1, '#fff'] //0.1透明度的白色背景
                });
            },
            // 上传成功
            done: function (res) {
                console.log(res);
                layer.closeAll();
                if (res.code == 0) {
                    layer.msg("上传成功", {
                        time: 2000,
                        icon: 6
                    })
                    var url = http.baseurl + 'upload/' + res.file;
                    jquery('#zhiyuanzhePhoto').val(url);
                    jquery('#zhiyuanzhePhotoImg').attr('src', url);
                } else {
                    layer.msg(res.msg, {
                        time: 2000,
                        icon: 5
                    })
                }
            },
            //请求异常回调
            error: function () {
                layer.closeAll();
                layer.msg("请求接口异常", {
                    time: 2000,
                    icon: 5
                })
            }
        });
        // 日期效验规则及格式
        dateTimePick();
        // 表单效验规则
        form.verify({
            // 正整数效验规则
            integer: [
                /^[1-9][0-9]*$/
                ,'必须是正整数'
            ]
            // 小数效验规则
            ,double: [
                /^[1-9][0-9]{0,5}(\.[0-9]{1,2})?$/
                ,'最大整数位为6为,小数最大两位'
            ]
        });

        // session独取
        let table = localStorage.getItem("userTable");
        http.request(table+"/session", 'get', {}, function (data) {
            // 表单赋值
            //form.val("myForm", data.data);
            // data = data.data;
            for (var key in data) {
                vue.detail[table+"Id"] = data.id
            }
        });


        // 提交
        form.on('submit(thisSubmit)', function (data) {
            data = data.field;
            data["yonghuId"]= localStorage.getItem("userid");
            // 提交数据
            http.requestJson('zhiyuanzhe' + '/add', 'post', data, function (res) {
                layer.msg('提交成功', {
                    time: 2000,
                    icon: 6
                }, function () {
                    back();
                });
            });
            return false
        });


        // 日期框初始化
        function dateTimePick(){
            var myDate = new Date();  //获取当前时间
            /*
                ,change: function(value, date, endDate){
                    value       得到日期生成的值，如：2017-08-18
                    date        得到日期时间对象：{year: 2017, month: 8, date: 18, hours: 0, minutes: 0, seconds: 0}
                    endDate     得结束的日期时间对象，开启范围选择（range: true）才会返回。对象成员同上。
            */
        }




       // 性别的查询
       function zhiyuanzheSexTypesSelect() {
           //填充下拉框选项
           http.request("dictionary/page?page=1&limit=100&sort=&order=&dicCode=zhiyuanzhe_sex_types", "GET", {}, (res) => {
               if(res.code == 0){
                   vue.zhiyuanzheSexTypesList = res.data.list;
               }
           });
       }


       // 是否养过宠物的查询
       function zhiyuanzheYesnoTypesSelect() {
           //填充下拉框选项
           http.request("dictionary/page?page=1&limit=100&sort=&order=&dicCode=zhiyuanzhe_yesno_types", "GET", {}, (res) => {
               if(res.code == 0){
                   vue.zhiyuanzheYesnoTypesList = res.data.list;
               }
           });
       }


       // 是否启用的查询
       function zhiyuanzheTypesSelect() {
           //填充下拉框选项
           http.request("dictionary/page?page=1&limit=100&sort=&order=&dicCode=zhiyuanzhe_types", "GET", {}, (res) => {
               if(res.code == 0){
                   vue.zhiyuanzheTypesList = res.data.list;
               }
           });
       }



    });
</script>
</body>
</html