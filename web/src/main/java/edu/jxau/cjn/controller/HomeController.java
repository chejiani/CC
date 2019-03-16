package edu.jxau.cjn.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectReader;
import edu.jxau.cjn.infrastructure.entity.Goods;
import edu.jxau.cjn.service.Log;
import edu.jxau.cjn.service.goods.GoodsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

@Controller
public class HomeController implements Log {

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private ObjectMapper objectMapper;

    @GetMapping(value = {"index", ""})
    public String index(Model model){
        model.addAttribute("goodsList", goodsService.getAlL());
        return "index";
    }

    @GetMapping(value = "search/{keyWords}")
    public String search(@PathVariable(name = "keyWords") String keyWords){
        return "goods/search";
    }

    @GetMapping(value = "details/{id}")
    public String detail(@PathVariable(value = "id") String id, Model model) throws JsonProcessingException {
        Goods goods = goodsService.getOne(Long.valueOf(id));
        if (goods == null){
             return "redirect:404";
        } else {
            model.addAttribute("goods", goods);
            if (goods.getAlbum() != null){
                try {
                    model.addAttribute("albums", objectMapper.readValue(goods.getAlbum().getPicAddr(), List.class));
                } catch (IOException e) {
                    model.addAttribute("albums", Collections.emptyList());
                    error("获取相册数据异常：[{}]", e, e.getMessage());
                }
            }
            return "goods/detail";
        }
    }

}
