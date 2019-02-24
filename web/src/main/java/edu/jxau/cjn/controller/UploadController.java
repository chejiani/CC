package edu.jxau.cjn.controller;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.fasterxml.jackson.databind.util.JSONPObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;
import java.util.stream.Collectors;

@Controller
public class UploadController {

    private String savePath = "d://upload/";

    @Autowired
    private ObjectMapper objectMapper;

    @PostMapping(value = "upload/image")
    @ResponseBody
    public Map upload(MultipartFile multipartFile, HttpServletResponse response) {
        File file = new File(savePath + UUID.randomUUID().toString());
        Map<String, Object> resp = new HashMap<>();
        try {
            multipartFile.transferTo(file);
            resp.put("src", file.getAbsolutePath());
        } catch (IOException e) {
            e.printStackTrace();
        }
        return resp;
    }

    @PostMapping(value = "upload/article")
    @ResponseBody
    public Map upload(HttpServletRequest request) {
        Map<String, Object> resp = new HashMap<>();
        try {
            File file = new File(savePath + UUID.randomUUID().toString());
            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
            List<MultipartFile> fileList = new ArrayList<>(multipartRequest.getFileMap().values());
            List<String> filePathList = new LinkedList<>();
            for (MultipartFile mf : fileList) {
                if (!mf.isEmpty()) {
                    mf.transferTo(file);
                    filePathList.add(file.getName());
                }
            }
            resp.put("errno", 0);
            resp.put("data", filePathList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }

}
