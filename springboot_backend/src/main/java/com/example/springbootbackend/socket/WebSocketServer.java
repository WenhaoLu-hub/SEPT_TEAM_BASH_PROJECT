package com.myshop.socket;


import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSONArray;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArraySet;


@ServerEndpoint("/websocket/{sid}/{id}")
@Component
public class WebSocketServer {
    //Static variable used to record the current number of online connections. It should be designed to be thread safe.
    private static int onlineCount = 0;
    //The thread-safe Set of the concurrent package is used to store the MyWebSocket object corresponding to each client.
    private static CopyOnWriteArraySet<WebSocketServer> webSocketSet = new CopyOnWriteArraySet<WebSocketServer>();

    //A connection session with a client, which needs to be used to send data to the client
    private Session session;

    //receive sid
    private String sid="";

    //send id
    private String id="";


    @OnOpen
    public void onOpen(Session session, @PathParam("sid") String sid, @PathParam("id") String id) {
        this.session = session;
        webSocketSet.add(this);     //add to set
        addOnlineCount();           //Add 1 to the online count
        System.out.println("sender id："+sid+",recipient id："+id+",Online count" + getOnlineCount());
        this.sid = sid;
        this.id =id;
        try {
            sendMessage("connected successful");
        } catch (IOException e) {
            System.out.println("websocket IO error");
        }
    }


    @OnClose
    public void onClose() {
        webSocketSet.remove(this);  //remove from set
        subOnlineCount();           //Online count minus 1
        System.out.println("Number of online account" + getOnlineCount());
    }


    @OnMessage
    public void onMessage(String message, Session session) {
        System.out.println("reseaved"+sid+"message:"+message);
        //群发消息
        for (WebSocketServer item : webSocketSet) {
            try {
                item.sendMessage(message);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }


    @OnError
    public void onError(Session session, Throwable error) {
        System.out.println("error");
        error.printStackTrace();
    }


    public void sendMessage(String message) throws IOException {
        this.session.getBasicRemote().sendText(message);
    }


    public static void sendInfo(String message,@PathParam("sid") String sid,@PathParam("id") String id) throws IOException {
        System.out.println("sender id:"+sid+"，text:"+message);
        System.out.println("recipient id:"+id);
        for (WebSocketServer item : webSocketSet) {
            try {
                Map<String,Object> map = new HashMap<String,Object>();
                map.put("id", id);//recipient
                map.put("sid", sid);//sender
                map.put("message", message);//text
                item.sendMessage(JSONArray.toJSON(map).toString());
            } catch (IOException e) {
                continue;
            }
        }
    }
    public static synchronized int getOnlineCount() {
        return onlineCount;
    }
    public static synchronized void addOnlineCount() {
        WebSocketServer.onlineCount++;
    }
    public static synchronized void subOnlineCount() {
        WebSocketServer.onlineCount--;
    }
    public static CopyOnWriteArraySet<WebSocketServer> getWebSocketSet() {
        return webSocketSet;
    }
}