package edu.jxau.cjn.service.goods;

import com.fasterxml.jackson.databind.ObjectMapper;
import edu.jxau.cjn.infrastructure.entity.Album;
import edu.jxau.cjn.infrastructure.entity.Goods;
import edu.jxau.cjn.infrastructure.repositories.AlbumRepository;
import edu.jxau.cjn.infrastructure.repositories.GoodsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

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
            Album album = new Album();
            album.setPicAddr(objectMapper.writeValueAsString(pics));
            albumRepository.save(album);
            goods.setAlbum(album);
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

    public List<Goods> getAlL(){
        return goodsRepository.findAll();
    }
}
