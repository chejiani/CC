package com.ccut.ytzhuang.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.ccut.ytzhuang.model.Bid;
import com.ccut.ytzhuang.model.Goods;
import com.ccut.ytzhuang.service.BidService;
import com.ccut.ytzhuang.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "bid")
public class BidAction {

    private Bid bid = new Bid();
    
    @Autowired
    private BidService bidService;
    private static final long serialVersionUID = 2495498540796769368L;
    private String bidid;
    private String username;
    private Goods goods = new Goods();
    
    @Autowired
    private GoodsService goodsService;
    private Double prices;

    public String getBidid() {
        return bidid;
    }

    public void setBidid(String bidid) {
        this.bidid = bidid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    

    public Double getPrices() {
        return prices;
    }

    public void setPrices(Double prices) {
        this.prices = prices;
    }

    //添加新订单
    @PostMapping(value = "add")
    public String add(HttpServletRequest request) {
        //设置生成订单时间为：当前时间，订单状态为：进行中
        //自动生成订单号为：S年月日
        Date date = null;
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            date = df.parse(df.format(new Date()));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        String[] bid_id = df.format(date).toString().substring(0, 10).split("-");
        int temp = Integer.parseInt(bid_id[0] + bid_id[1] + bid_id[2] + "00");
        //如果出现重复订单号，则将订单号加一然后再插入
        while (bidService.getBidById("s" + temp) != null) {
            temp++;
        }
        bid.setBidId("S" + temp);
        bid.setBidTime(date);
        bid.setBidState("交易完成");

        //修改商品状态
        goods = goodsService.getGoodsByid(bid.getGoodsId());
        goods.setEndTime(date);
        goods.setBidPrice(goods.getMaxPrice());
        goodsService.save(goods);
        System.out.println(bid);
        if (bidService.add(bid)) {
            System.out.println("订单成功生成");
            request.getSession().setAttribute("bid", bid);
            return "Bid_add_success";
        } else {
            System.out.println("订单生成失败");
            return "Bid_add_failure";
        }
    }

    //出价拍卖
    @PostMapping(value = "seal")
    public String bid(HttpServletRequest request) {
        //设置生成订单时间为：当前时间，订单状态为：进行中
        //自动生成订单号为：S年月日时分秒
        Date date = null;
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            date = df.parse(df.format(new Date()));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        System.out.println(df.format(date));

        List<Bid> list = bidService.getBidByGoodsId("");
        //强行找到订单号tempbid[1]---待完善
        String tbidid = null;
        if (list.size() != 0) {
            String[] tempbid = list.toString().split(",")[0].split("=");
            tbidid = tempbid[1];
            System.out.println(tempbid[1]);
        }
        if (tbidid != null) {
            bid.setBidId(bidService.getBidById(tbidid).getBidId());
        }
        //如果订单号为空，则生成订单号
        else {
            String[] bid_id = df.format(date).toString().substring(0, 10).split("-");
            int temp = Integer.parseInt(bid_id[0] + bid_id[1] + bid_id[2] + "00");
            //如果出现重复订单号，则将订单号加一然后再插入
            while (bidService.getBidById("s" + temp) != null) {
                temp++;
            }
            bid.setBidId("S" + temp);
//			session.setAttribute("bidid",bid.getBid_id());
//			System.out.println("12121"+session.getAttribute("bidid"));
        }
        bid.setBidTime(date);
        //修改商品状态
        goods = goodsService.getGoodsByid("");
        //商品的拍卖价格
        goods.setBidPrice(prices);
        bid.setPrice(prices);
        System.out.println(goods);
        if (goods.getEndTime().getTime() > date.getTime()) {
            bid.setBidState("正在拍卖");
            goods.setGoodsState("竞拍中");
        } else {
            bid.setBidState("交易完成");
            goods.setGoodsState("已出售");
        }
        goodsService.save(goods);
        if (date.getTime() <= goods.getEndTime().getTime()) {
            if (tbidid == null) {
                bidService.add(bid);
            } else {
                bidService.save(bid);
            }
            System.out.println("订单成功生成");
            request.getSession().setAttribute("bid", bid);
            return "Bid_bid_success";
        } else {
            System.out.println("商品拍卖已经过期...");
            return "Bid_bid_failure";
        }
    }

    //取消订单
    @GetMapping(value = "cancel")
    public String cancel() {
        Bid bid = bidService.getBidById(bidid);
        bid.setBidState("订单取消");
        System.out.println(bid.getBidState());
        if (bid != null && bidService.save(bid)) {
            bid.setBidState("订单取消");
            return "Bid_cancel_success";
        } else {
            System.out.println("订单取消失败");
            return "Bid_cancel_failure";
        }
    }

    //修改订单
    @PostMapping(value = "modify")
    public String modify(HttpServletRequest request) {
        Bid bid = bidService.getBidById(bidid);
        if (bid != null) {
            request.getSession().setAttribute("bid_mod", bid);
            return "Bid_modify_success";
        } else {
            return "Bid_modify_failure";
        }
    }

    //保存修改后的订单
    @PostMapping(value = "save")
    public String save() {
        if (bidService.save(bid)) {
            System.out.println("订单修改成功");
            return "Bid_save_success";
        } else {
            System.out.println("订单修改失败");
            return "Bid_save_failure";
        }
    }

    //删除订单
    @PostMapping(value = "delete")
    public String delete() {
        if (bidService.delete(bidid)) {
            System.out.println("订单删除成功");
            return "Bid_delete_success";
        } else {
            System.out.println("订单删除失败");
            return "Bid_delete_failure";
        }
    }

    //查询所有订单
    @GetMapping(value = "query")
    public String query(HttpServletRequest request) {
        List<Bid> list = bidService.getAllBid();
        request.getSession().setAttribute("bid", list);
        return "Bid_query_success";
    }

    //查询我的订单
    @GetMapping(value = "search")
    public String search(HttpServletRequest request) {
        System.out.println(username);
//		System.out.println(bid.getBid_id());
//		Date date = null;
//		
//		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		try {
//			date = df.parse(df.format(new Date()));
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}
//		
//		if(goods.getEnd_time().getTime() < date.getTime()){
//			bid.setBidState("进行中");
//			goods.setGoodsState("竞拍中");
//		}
//		else{
//			bid.setBidState("交易完成");
//			goods.setGoodsState("以出售");
//		}
//		bidService.save(bid);
//		GoodsServiceImpl.save(goods);
//		
        List<Bid> list = bidService.search(username);
        list.size();
        request.getSession().setAttribute("bid_list", list);
        return "Bid_search_success";
    }

}
