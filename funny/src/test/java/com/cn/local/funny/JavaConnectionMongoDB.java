package com.cn.local.funny;

import java.net.UnknownHostException;
import java.util.Set;

import org.junit.Test;

import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import com.mongodb.util.JSON;

public class JavaConnectionMongoDB {

	static Mongo mongo = null;
	DB db = getConnection();

	@Test
	public void 获取所有数据库() {
		Set<String> collectionNames = db.getCollectionNames();
		
		for (String string : mongo.getDatabaseNames()) {
			System.out.println(string);
		}
		System.out.println("以上是所有数据库");
		System.out.println("链接的数据库是" + db);
		db.requestDone();
	}

	@Test
	public void 获取所有该数据库下所有的集合() {
		//获取不到。。。
		try {
			Mongo mongo2 = new Mongo("192.168.56.101", 27017);
			for(String name : mongo2.getDatabaseNames()) {
				System.out.println(name);
			}
			DB db2 = mongo.getDB("test");
			System.out.println(db2);
			for (String name : db2.getCollectionNames()) {
				System.err.println(name);
			}
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void 获取集合中数据() {
		DBCollection collection = db.getCollection("test");
		DBCursor find = collection.find();
		while(find.hasNext()) {
			System.out.println(find.next());
		}
		System.out.println(find.count());
		System.out.println(find.getCursorId());
		System.out.println(JSON.serialize(find));
	}
	
	@Test
	public void 删除该库下所有的集合() {
		DBCollection collection = db.getCollection("user");
		DBCursor find = collection.find();
		for (DBObject dbObject : find) {
			collection.remove(dbObject);
		}
		db.requestDone();
	}
	
	private static DB getConnection() {
		try {
			mongo = new Mongo("192.168.56.101", 27017);
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		DB db = mongo.getDB("test");
		return db;
	}
}
