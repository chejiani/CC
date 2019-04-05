<!DOCTYPE html>
<#assign ctx=request.contextPath/>
<html lang="zn_CH">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>易拍平台管理系统</title>
    <link href="${ctx}/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/css/bootstrap-grid.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/css/bootstrap-reboot.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/css/datatables.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/css/all.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/wangEditor/wangEditor.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/bootstrap-fileinput/css/fileinput.min.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<#include '../common/nav-dashboard.ftl'>
<main role="main" class="container-fluid">
    <div class="row">
        <#include '../common/siderbar.ftl'>

        <div class="col-md-9 ml-sm-auto col-lg-10 px-4">
            <div class="container-fluid">
                <h2>添加新商品</h2>
                <hr/>
                <div class="row justify-content-center">
                    <div class="col-lg-11">
                        <form id="goods-form" class="needs-validation" method="post" action="${ctx}/manager/add/goods"
                              novalidate="">
                            <#if goods.goodsId??>
                                <input type="hidden" name="goodsId" value="${goods.goodsId}"/>
                                <#else>
                            </#if>
                            <div class="mb-3">
                                <label for="username">商品标题</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" value="${goods.goodsName!''}" name="goodsName" id="username">
                                    <div class="invalid-feedback" style="width: 100%;">
                                        Your username is required.
                                    </div>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label for="username">商品描述</label>
                                <div class="input-group">
                                    <textarea class="form-control" name="goodsDesc" aria-label="With textarea">${goods.goodsDesc!''}</textarea>
                                </div>
                            </div>
                            <hr class="mb-3"/>

                            <div class="mb-3">
                                <label for="username">商品图片</label>
                                <input id="goods-pic" name="multipartFile" type="file" class="file"
                                       data-browse-on-zone-click="true">
                            </div>

                            <hr class="mb-3"/>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="firstName">一口价(<B style="color: #ff0000">留空则不允许一口价成交</B>)</label>
                                    <input type="number" class="form-control" name="fixedPrice" id="firstName"
                                           placeholder="" value="${goods.fixedPrice!''}"
                                           required="">
                                    <div class="invalid-feedback">
                                        Valid first name is required.
                                    </div>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="lastName">竞拍底价</label>
                                    <input type="number" class="form-control" name="reservePrice" id="lastName"
                                           placeholder="" value="${goods.reservePrice!''}"
                                           required="">
                                    <div class="invalid-feedback">
                                        Valid last name is required.
                                    </div>
                                </div>
                            </div>

                            <hr class="mb-4"/>
                            <div class="mb-3">
                                <label for="editor" class="font-weight-bold">商品简介文档</label>
                                <div id="editor">
                                    <#if goods??>
                                        ${goods.article!''}
                                    </#if>
                                </div>
                                <input type="hidden" name="article" id="editor-input">
                            </div>
                            <hr class="mb-4">
                            <#if albums??>
                                <#list albums as album>
                                    <input type="hidden" value="${album}" name="pics" />
                                </#list>
                            </#if>
                        </form>
                        <button class="btn btn-primary btn-lg btn-block" onclick="submit_click()">提交</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
</body>
<script src="${ctx}/js/jquery-3.1.1.min.js"></script>
<script src="${ctx}/js/bootstrap.min.js"></script>
<script src="${ctx}/js/bootstrap.bundle.min.js"></script>
<script src="${ctx}/wangEditor/wangEditor.min.js"></script>
<script src="${ctx}/bootstrap-fileinput/js/fileinput.min.js"></script>
<script src="${ctx}/bootstrap-fileinput/themes/theme.min.js"></script>
<script src="${ctx}/bootstrap-fileinput/js/locales/zh.js"></script>
<script src="${ctx}/js/cjn.js"></script>
<script>
    var E = window.wangEditor;
    var editor = new E(document.getElementById('editor'));
    editor.customConfig.uploadImgServer = '${ctx}/upload/article';
    editor.customConfig.uploadImgMaxLength = 5;
    editor.create();
    function submit_click() {
        $('#editor-input').val(editor.txt.html());
        $('#goods-form').submit();
    }

    $('#goods-pic').fileinput({
        language: "zh",
        showCaption: false,
        allowedFileTypes: ['image'],
        theme: "fa",
        allowedFileExtensions: ["jpg", "jpeg", "png", "gif"],
        uploadUrl: '${ctx}/upload/image',
        overwriteInitial: false,
        initialPreview: [
            <#if albums??>
                <#list albums as album>
                    "<img src='${ctx}/${album}' class='file-preview-image' style='height:160px; width:213px'>",
                </#list>
            </#if>
        ],
        initialPreviewConfig: [
            <#if albums??>
                <#list albums as album>
                    { type: 'image', width: "120px", key: ${album_index} },
                </#list>
            </#if>
        ],
        initialPreviewShowDelete: true
    }).on('fileuploaded', function (event, data, previewId, index) {
        var response = data.response;
        var input = $('<input type="hidden" name="pics" />');
        input.attr('value', response.src);
        $('form').append(input);
    }).on('fileremoved', function (event, data, previewId, index) {
        var response = data.response;
        var input = $('<input type="hidden" id="'+previewId+'" name="pics" />');
        input.attr('value', response.src);
        $('form').append(input);
    })
</script>
</html>
