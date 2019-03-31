package edu.jxau.cjn.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import edu.jxau.cjn.infrastructure.entity.Goods;
import edu.jxau.cjn.service.Log;
import edu.jxau.cjn.service.goods.GoodsService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.io.IOException;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class HomeController implements Log {

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private ObjectMapper objectMapper;

    @GetMapping(value = {"index", ""})
    public String index(Model model) {
        List<Goods> goodsList = goodsService
                .getAlL()
                .parallelStream()
                .filter(item -> !item.isObtained() && item.getStock() > 0)
                .collect(Collectors.toList());
        model.addAttribute("goodsList", goodsList);
        return "index";
    }

    @GetMapping(value = "search")
    public String search(String keyWords, Model model) {
        if (!StringUtils.isBlank(keyWords)){
            List<Goods> goodsList = goodsService
                    .getAlL()
                    .parallelStream()
                    .filter(item -> !item.isObtained() && item.getStock() > 0)
                    .filter(item -> keyWords.contains(item.getGoodsName()) || keyWords.contains(item.getGoodsDesc()))
                    .collect(Collectors.toList());
            model.addAttribute("goodsList", goodsList);
        }
        return "goods/search";
    }

    @GetMapping(value = "details/{id}")
    public String detail(@PathVariable(value = "id") String id, Model model) throws JsonProcessingException {
        Goods goods = goodsService.getOne(Long.valueOf(id));
        if (goods == null) {
            return "redirect:404";
        } else {
            model.addAttribute("goods", goods);
            if (goods.getAlbum() != null) {
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
