package edu.jxau.cjn.service.goods;

import com.fasterxml.jackson.databind.ObjectMapper;
import edu.jxau.cjn.infrastructure.entity.Album;
import edu.jxau.cjn.infrastructure.entity.Goods;
import edu.jxau.cjn.infrastructure.repositories.AlbumRepository;
import edu.jxau.cjn.infrastructure.repositories.GoodsRepository;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class GoodsService {

    @Autowired
    private GoodsRepository goodsRepository;

    @Autowired
    private AlbumRepository albumRepository;

    @Autowired
    private ObjectMapper objectMapper;

    public boolean save(Goods goods, String[] pics){
        try {
            List<String> pic = Arrays.stream(pics)
                    .filter(StringUtils::isNoneBlank)
                    .map(item -> item.substring(item.lastIndexOf("\\") + 1))
                    .collect(Collectors.toList());
            if (pic != null){
                Album album = new Album();
                album.setPicAddr(objectMapper.writeValueAsString(pic));
                albumRepository.save(album);
                goods.setAlbum(album);
            }
            goods = goodsRepository.save(goods);
            return goods != null;
        } catch (Exception e){
            return false;
        }
    }

    public Page<Goods> getGoodsWithPagination(Pageable pageable){
        return goodsRepository.findAll(pageable);
    }

    public Goods getOne(long id){
        return goodsRepository.getOne(id);
    }

    public Goods goodsAuctionAvailable(long id){
        Goods goods = goodsRepository.getOne(id);
        if (goods != null && goods.getStock() > 0 && goods.isAuction() && !goods.isObtained()){
            return goods;
        } else {
            return null;
        }
    }

    public List<Goods> getAlL(){
        return goodsRepository.findAll();
    }
}
