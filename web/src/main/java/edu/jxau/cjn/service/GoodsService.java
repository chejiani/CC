package edu.jxau.cjn.service;

import java.util.List;

import edu.jxau.cjn.model.Goods;

public interface GoodsService {
	//查询所以商品
	public List<Goods> getAllGoods();
	//根据id删除商品
	public boolean delete(String goods_id);
	//添加商品
	public boolean add(Goods goods);
	//根据编号查询商品
	public Goods getGoodsByid(String goods_id);
	//根据编号查询商品
	public List<Goods> getGoodsByName(String ownerName);
	//保存修改后商品的信息
	public boolean save(Goods goods);
	//迷糊查询商品
	public List<Goods>search(String goods_name);
}
