package com.ccut.ytzhuang.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.ccut.ytzhuang.model.Goods;
import com.ccut.ytzhuang.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "goods")
public class GoodsAction {

    private Goods goods = new Goods();
    private static final long serialVersionUID = 2495498540796769368L;

    @Autowired
    private GoodsService GoodsServiceImpl;
    private String goodsid;
    private String goodsname;
    private File upload;
    private String uploadContentType;
    private String uploadFileName;
    private String savePath;
    private String ownerName;

    public String getSavePath(HttpServletRequest request) {
        return request.getServletContext().getRealPath("\\");
    }

    public void setSavePath(String value) {
        this.savePath = value;
    }

    public File getUpload() {
        return upload;
    }

    public void setUpload(File upload) {
        this.upload = upload;
    }

    public String getUploadContentType() {
        return uploadContentType;
    }

    public void setUploadContentType(String uploadContentType) {
        this.uploadContentType = uploadContentType;
    }

    public String getUploadFileName() {
        return uploadFileName;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }

    public String getGoodsid() {
        return goodsid;
    }

    public void setGoodsid(String goodsid) {
        this.goodsid = goodsid;
    }

    public String getGoodsname() {
        return goodsname;
    }

    public void setGoodsname(String goodsname) {
        this.goodsname = goodsname;
    }

    public String getOwnerName() {
        return ownerName;
    }

    public void setOwnerName(String ownerName) {
        this.ownerName = ownerName;
    }

    //获取所以商品
    @GetMapping(value = "query")
    public String query(HttpServletRequest request) {
//		ArrayList<Goods>list = GoodsServiceImpl.getGoodsByName(ownerName);
        List<Goods> list = GoodsServiceImpl.getAllGoods();
        request.getSession().setAttribute("goodsList", list);
        return "Goods_query_success";
    }

    //我的拍卖
    @GetMapping(value = "myGoods")
    public String myGoods(HttpServletRequest request) {
        List<Goods> list = GoodsServiceImpl.getGoodsByName(ownerName);
        request.getSession().setAttribute("mygoods", list);
        return "Goods_myGoods_success";
    }

    //根据现在时间更改商品状态
    @GetMapping(value = "status")
    public void state(Goods goods) {
        Date date = null;
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            date = df.parse(df.format(new Date()));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        if (date.getTime() < goods.getAddTime().getTime()) {
            goods.setGoodsState("还未开始竞拍");
        } else if (date.getTime() > goods.getAddTime().getTime() && date.getTime() < goods.getEndTime().getTime()) {
            goods.setGoodsState("竞拍中");
        } else if (date.getTime() > goods.getEndTime().getTime() && goods.getBidPrice() != goods.getInitPrice()) {
            goods.setGoodsState("已出售");
        } else {
            goods.setGoodsState("已过期");
        }
    }

    //添加商品
    @PostMapping(value = "add")
    public String add(HttpServletRequest request) {
        try {
            FileOutputStream fos = new FileOutputStream(getSavePath(request)
                    + "\\" + getUploadFileName());
            FileInputStream fis = new FileInputStream(getUpload());

            byte[] buffer = new byte[1024];
            int len = 0;
            while ((len = fis.read(buffer)) > 0) {
                fos.write(buffer, 0, len);
            }
            fos.close();
            fis.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        String a = this.getSavePath(request) + "\\" + this.getUploadFileName();
        // 给文件名进行截取
        String fileName = a.substring(a.indexOf("upload"), a.length());
        System.out.println(fileName);
        //保存图片的路径
        goods.setGoodsPicture(fileName);
        System.out.println(goods.getGoodsPicture());
        //设置商品状态
        state(goods);
        //设置默认拍卖价为起拍价
        goods.setBidPrice(goods.getInitPrice());
        //添加商品
        System.out.println(goods);
        if (GoodsServiceImpl.add(goods)) {
            System.out.println("添加成功");
//			session.setAttribute("goods", goods);
            return "Goods_add_success";
        } else {
            System.out.println("添加失败");
            return "Goods_add_failure";
        }
    }

    @PostMapping(value = "modify")
    public String modify(HttpServletRequest request) {
        System.out.println(goodsid);
        Goods goods = GoodsServiceImpl.getGoodsByid(goodsid);
        System.out.println("1234" + goods);
        if (goods != null) {
            request.getSession().setAttribute("mod", goods);
            return "Goods_modify_success";
        } else {
            return "Goods_modify_failure";
        }
    }

    //保存修改后的商品资料
    @PostMapping(value = "save")
    public String save() {
        System.out.println("4321" + goods);
        state(goods);
        if (GoodsServiceImpl.save(goods)) {
            System.out.println("修改成功");
            return "Goods_save_success";
        } else {
            System.out.println("修改失败");
            return "Goods_save_failure";
        }
    }

    //删除商品
    @PostMapping(value = "delete")
    public String delete() {
        if (GoodsServiceImpl.delete(goodsid)) {
            System.out.println("删除成功");
            return "Goods_delete_success";
        } else {
            System.out.println("删除失败");
            return "Goods_delete_failure";
        }
    }

    //搜索功能
    @GetMapping(value = "search")
    public String search(HttpServletRequest request) {
        request.getSession().setAttribute("search_list", null);
        List<Goods> list = GoodsServiceImpl.search(goodsname);
        System.out.println(list);
        /*
         * 	在查询结果中找到商品的id，并通过id找到商品，然后实时更改商品状态
         */
        if (list.size() != 0) {
            System.out.println("111111" + list.toString().split(",")[0].split("=")[1]);
            String id = list.toString().split(",")[0].split("=")[1];
            goods = GoodsServiceImpl.getGoodsByid(id);
            System.out.println(goods.getGoodsState());
            state(goods);
            System.out.println(goods.getGoodsState());
            //修改后需要提交事务
            GoodsServiceImpl.save(goods);
            request.getSession().setAttribute("search_list", goods);
        }
        return "Goods_search_success";
    }

    @GetMapping(value = "detail")
    public String detail(HttpServletRequest request) {
        System.out.println(goodsid);
        Goods goods = GoodsServiceImpl.getGoodsByid(goodsid);

        if (goods != null) {
            //更改商品状态
            state(goods);
            System.out.println(goods);
            GoodsServiceImpl.save(goods);
            request.getSession().setAttribute("goods", goods);
            System.out.println(request.getSession().getAttribute("goods").toString());
            return "Goods_detail_success";
        } else {
            return "Goods_detail_failure";
        }
    }

}
