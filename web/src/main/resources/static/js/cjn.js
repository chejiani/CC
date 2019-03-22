/*
* image zoom
*/
(function($) {
    /**
     * 1, 缩略图大小和父容器大小一致
     * 2, 父容器 href 属性为高清图片路径
     */
    $.fn.zoomImage = function(paras) {
        /**
         * 默认参数
         */
        var defaultParas = {
            layerW: 300, // 遮罩宽度
            layerH: 300, // 遮罩高度
            layerOpacity: 0.2, // 遮罩透明度
            layerBgc: '#000', // 遮罩背景颜色
            showPanelW: 500, // 显示放大区域宽
            showPanelH: 500, // 显示放大区域高
            marginL: 10, // 放大区域离缩略图右侧距离
            marginT: 0 // 放大区域离缩略图上侧距离
        };

        paras = $.extend({}, defaultParas, paras);

        $(this).each(function() {
            var self = $(this).css({position: 'relative'});
            var selfOffset = self.offset();
            var imageW = self.width(); // 图片高度
            var imageH = self.height();

            // 宽放大倍数
            var wTimes = paras.showPanelW / paras.layerW;
            // 高放大倍数
            var hTimes = paras.showPanelH / paras.layerH;

            // 放大图片
            var img = $('<img>').attr('src', self.attr("href")).css({
                position: 'absolute',
                left: '0',
                top: '0',
                'z-index': "9999",
                width: imageW * wTimes,
                height: imageH * hTimes
            }).attr('id', 'big-img-show');

            // 遮罩
            var layer = $('<div>').css({
                display: 'none',
                position: 'absolute',
                left: '0',
                top: '0',
                backgroundColor: paras.layerBgc,
                width: paras.layerW,
                height: paras.layerH,
                opacity: paras.layerOpacity,
                border: '1px solid #ccc',
                cursor: 'move'
            });

            // 放大区域
            var showPanel = $('<div>').css({
                display: 'none',
                position: 'absolute',
                overflow: 'hidden',
                left: imageW + paras.marginL,
                top: paras.marginT,
                width: paras.showPanelW,
                height: paras.showPanelH
            }).append(img);

            self.append(layer).append(showPanel);

            self.on('mousemove', function(e) {
                // 鼠标相对于缩略图容器的坐标
                var x = e.pageX - selfOffset.left;
                var y = e.pageY - selfOffset.top;

                if(x <= paras.layerW / 2) {
                    x = 0;
                }else if(x >= imageW - paras.layerW / 2) {
                    x = imageW - paras.layerW;
                }else {
                    x = x - paras.layerW / 2;
                }

                if(y < paras.layerH / 2) {
                    y = 0;
                } else if(y >= imageH - paras.layerH / 2) {
                    y = imageH - paras.layerH;
                } else {
                    y = y - paras.layerH / 2;
                }

                layer.css({
                    left: x,
                    top: y
                });

                img.css({
                    left: -x * wTimes,
                    top: -y * hTimes
                });
            }).on('mouseenter', function() {
                layer.show();
                showPanel.show();
            }).on('mouseleave', function() {
                layer.hide();
                showPanel.hide();
            });
        });
    };

    $('.bid_click').click(function () {
        var goods = $(this).attr('goods_no');
        var newPrice = prompt("输入本轮出价:", "");
        $.get('/bid/' + goods + '/' + newPrice, function (response, status, xhr) {
            if (xhr.status === 200){
                if (response.code === '200'){
                    alert('叫价成功');
                    window.location.reload();
                } else if (response.code === '500'){
                    alert('叫价失败');
                    window.location.reload();
                }
            } else if (xhr.status === '302') {
                window.location.href = '${ctx}/user/login'
            } else {
                alert('叫价失败');
                window.location.reload();
            }
        })
    });
    $(document).ajaxComplete(function(event, xhr, settings) {
        if (xhr.getResponseHeader('REQUIRE_AUTH') === 'true') {
            window.location.href = "/user/login";
        }
    });
})(jQuery);

function boolFormat(value, row, index){
    if (value === true){
        return '是';
    } else {
        return '否';
    }
}

$('.show').zoomImage();
$('.show-small-img:first-of-type').css({'border': 'solid 1px #951b25', 'padding': '2px'});
$('.show-small-img:first-of-type').attr('alt', 'now').siblings().removeAttr('alt');
$('.show-small-img').click(function () {
    $('#show-img').attr('src', $(this).attr('src'));
    $('#big-img').attr('src', $(this).attr('src'));
    $('#big-img-show').attr('src', $(this).attr('src'));
    $(this).attr('alt', 'now').siblings().removeAttr('alt');
    $(this).css({'border': 'solid 1px #951b25', 'padding': '2px'}).siblings().css({'border': 'none', 'padding': '0'});
    if ($('#small-img-roll').children().length > 4) {
        if ($(this).index() >= 3 && $(this).index() < $('#small-img-roll').children().length - 1){
            $('#small-img-roll').css('left', -($(this).index() - 2) * 76 + 'px')
        } else if ($(this).index() == $('#small-img-roll').children().length - 1) {
            $('#small-img-roll').css('left', -($('#small-img-roll').children().length - 4) * 76 + 'px')
        } else {
            $('#small-img-roll').css('left', '0')
        }
    }
});
// 点击 '>' 下一张
$('#next-img').click(function (){
    $('#show-img').attr('src', $(".show-small-img[alt='now']").next().attr('src'));
    $('#big-img').attr('src', $(".show-small-img[alt='now']").next().attr('src'));
    $('#big-img-show').attr('src', $(".show-small-img[alt='now']").next().attr('src'));
    $(".show-small-img[alt='now']").next().css({'border': 'solid 1px #951b25', 'padding': '2px'}).siblings().css({'border': 'none', 'padding': '0'});
    $(".show-small-img[alt='now']").next().attr('alt', 'now').siblings().removeAttr('alt');
    if ($('#small-img-roll').children().length > 4) {
        if ($(".show-small-img[alt='now']").index() >= 3 && $(".show-small-img[alt='now']").index() < $('#small-img-roll').children().length - 1){
            $('#small-img-roll').css('left', -($(".show-small-img[alt='now']").index() - 2) * 76 + 'px')
        } else if ($(".show-small-img[alt='now']").index() == $('#small-img-roll').children().length - 1) {
            $('#small-img-roll').css('left', -($('#small-img-roll').children().length - 4) * 76 + 'px')
        } else {
            $('#small-img-roll').css('left', '0')
        }
    }
});
// 点击 '<' 上一张
$('#prev-img').click(function (){
    $('#show-img').attr('src', $(".show-small-img[alt='now']").prev().attr('src'));
    $('#big-img').attr('src', $(".show-small-img[alt='now']").prev().attr('src'));
    $('#big-img-show').attr('src', $(".show-small-img[alt='now']").prev().attr('src'));
    $(".show-small-img[alt='now']").prev().css({'border': 'solid 1px #951b25', 'padding': '2px'}).siblings().css({'border': 'none', 'padding': '0'});
    $(".show-small-img[alt='now']").prev().attr('alt', 'now').siblings().removeAttr('alt');
    if ($('#small-img-roll').children().length > 4) {
        if ($(".show-small-img[alt='now']").index() >= 3 && $(".show-small-img[alt='now']").index() < $('#small-img-roll').children().length - 1){
            $('#small-img-roll').css('left', -($(".show-small-img[alt='now']").index() - 2) * 76 + 'px')
        } else if ($(".show-small-img[alt='now']").index() == $('#small-img-roll').children().length - 1) {
            $('#small-img-roll').css('left', -($('#small-img-roll').children().length - 4) * 76 + 'px')
        } else {
            $('#small-img-roll').css('left', '0')
        }
    }
});
