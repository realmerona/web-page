package org.zerock.jdbcex.controller;

import org.zerock.jdbcex.entity.Interview;
import org.zerock.jdbcex.entity.InterviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Date;

@RestController
@RequestMapping("/api")
public class UploadController {

    @Autowired
    private InterviewRepository interviewRepository;

    // 파일 저장 경로 설정
    private static final String UPLOAD_DIR = "uploads/";

    @PostMapping("/upload")
    public String uploadVideo(@RequestParam("video") MultipartFile videoFile, @RequestParam("userId") String userId) {
        // 파일 저장 디렉터리가 없으면 생성
        File uploadDir = new File(UPLOAD_DIR);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        // 파일 저장
        String fileName = "interview_" + System.currentTimeMillis() + ".webm";
        File file = new File(UPLOAD_DIR + fileName);
        try {
            videoFile.transferTo(file);
        } catch (IOException e) {
            e.printStackTrace();
            return "파일 저장 중 오류가 발생했습니다.";
        }

        // 데이터베이스에 파일 경로 저장
        Interview interview = new Interview();
        interview.setUserId(userId);
        interview.setPath(file.getAbsolutePath());
        interview.setInterviewDate(new Date());

        interviewRepository.save(interview);

        return "파일이 성공적으로 업로드되었습니다.";
    }
}