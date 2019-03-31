package edu.jxau.cjn.service.goods;

import com.fasterxml.jackson.databind.ObjectMapper;
import edu.jxau.cjn.infrastructure.entity.Album;
import edu.jxau.cjn.infrastructure.entity.Goods;
import edu.jxau.cjn.infrastructure.repositories.AlbumRepository;
import edu.jxau.cjn.infrastructure.repositories.GoodsRepository;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.MatchMode;
import org.hibernate.type.Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.*;
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
            if (null == pics){
                pics = new String[0];
            }
            List<String> pic = Arrays.stream(pics)
                    .filter(StringUtils::isNoneBlank)
                    .map(item -> item.substring(item.lastIndexOf("\\") + 1))
                    .collect(Collectors.toList());
            Album album;
            if (goods.getGoodsId() != 0){
                Optional<Album> optionalAlbum = albumRepository.findById(goods.getGoodsId());
                if (optionalAlbum.isPresent()){
                    album = optionalAlbum.get();
                    album.setPicAddr(objectMapper.writeValueAsString(pic));
                    if (pic.size() > 0){
                        album.setMainPic(pic.get(0));
                    }
                    albumRepository.save(album);
                    goods.setAlbum(album);
                } else {
                    album = new Album();
                    album.setPicAddr(objectMapper.writeValueAsString(pic));
                    if (pic.size() > 0){
                        album.setMainPic(pic.get(0));
                    }
                    albumRepository.save(album);
                    goods.setAlbum(album);
                }
            } else {
                album = new Album();
                album.setPicAddr(objectMapper.writeValueAsString(pic));
                if (pic.size() > 0){
                    album.setMainPic(pic.get(0));
                }
                albumRepository.save(album);
                goods.setAlbum(album);
            }
            if (goods.getFixedPrice() == null || goods.getFixedPrice().compareTo(BigDecimal.ZERO) == 0){
                goods.setFixed(false);
            } else {
                goods.setFixed(true);
            }
            Calendar calendar = Calendar.getInstance();
            calendar.set(Calendar.DATE, calendar.get(Calendar.DATE) + 1);
            goods.setAuctionDeadline(calendar.getTime());
            goods = goodsRepository.save(goods);
            return goods != null;
        } catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    public boolean obtained(long id){
        try {
            Optional<Goods> optionalGoods = goodsRepository.findById(id);
            if (optionalGoods.isPresent()){
                Goods goods = optionalGoods.get();
                goods.setObtained(true);
                goodsRepository.save(goods);
            } else {
                return false;
            }
            return true;
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

    public List<Goods> getAlL(String keywords){
        return goodsRepository.findByGoodsNameLike(keywords);
    }
}
