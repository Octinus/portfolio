package com.portfolio.motors.helpers;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.Thumbnails.Builder;
import net.coobird.thumbnailator.geometry.Positions;
import com.portfolio.motors.models.UploadItem;

@Slf4j
@Component
public class UploadHelper {

  @Value("${upload.dir}")
  private String uploadDir;

  @Value("${upload.url}")
  private String uploadUrl;

  @Value("${thumbnail.width}")
  private int thumbnailWidth;

  @Value("${thumbnail.height}")
  private int thumbnailHeight;

  @Value("${thumbnail.crop}")
  private boolean thumbnailCrop;

  /**
   * 컨트롤러로부터 업로드 된 파일의 정보를 전달받아 지정된 위치에 저장한다.
   * 이 때, 파일 덮어쓰기를 방지하기 위해 파일의 이름을 변경하고 이름 중복 검사를 수행한다.
   * 
   * @param multipartFile - 업로드 된 파일 정보
   * @return - 파일 정보를 담고 있는 객체
   * @throws NullPointerException - 업로드 된 파일이 없는 경우
   * @throws Exception            - 파일 저장에 실패한 경우
   */
  public UploadItem saveMultipartFile(MultipartFile multipartFile) throws NullPointerException, Exception {

    // 1) 업로드 파일 저장하기
    // 파일의 원본 이름 추출
    String originName = multipartFile.getOriginalFilename();

    // 업로드 된 파일이 존재하는지 확인한다.
    if (originName != null && originName.isEmpty()) {
      throw new NullPointerException("업로드 된 파일이 없음");
    }

    // 업로드 된 파일의 정보를 로그로 기록
    log.debug("===============================");
    log.debug("원본파일이름: " + originName);
    log.debug("<input type='file'>의 이름: " + multipartFile.getName());
    log.debug("파일형식: " + multipartFile.getContentType());
    log.debug("파일크기: " + multipartFile.getSize());

    // 2) 저장될 파일 이름을 생성한다.
    // 파일의 원본 이름에서 확장자만 추출
    String ext = originName.substring(originName.lastIndexOf("."));
    String fileName = null; // 웹 서버에 저장될 파일이름
    File targetFile = null; // 저장된 파일 정보를 담기 위한 file객체
    int count = 0; // 중복된 파일 수

    // 무한 루프
    while (true) {
      // 저장될 파일 이름 -> 현재시각 + 카운트값 + 확장자
      fileName = String.format("%d%d%s", System.currentTimeMillis(), count, ext);
      // 업로드 파일이 저장될 폴더 + 파일이름으로 파일객체를 생성한다.
      targetFile = new File(this.uploadDir, fileName);

      // 동일한 이름의 파일이 없다면 반복 중단.
      if (!targetFile.exists()) {
        break;
      }
      // if문을 빠져나올 경우 중복된 이름의 파일이 존재한다는 의미이므로 count를 1증가
      count++;
    } // 무한루프 끝!!!

    // 3) 업로드 된 파일을 결정된 파일 경로로 저장
    multipartFile.transferTo(targetFile);

    // 4) 업로드 경로 정보 처리하기
    // 복사된 파일이 절대경로를 추출한다.
    // -> 운영체제 호환을 위해 역슬래시를 슬래시로 변환한다.
    String absPath = targetFile.getAbsolutePath().replace("\\", "/");

    // 업로드 된 파일의 절대경로(absPath)에서 환경설정 파일에 명시된 폴더까지의 위치는 삭제하여
    // 환경설정 파일에 명시된 upload.dir 이후의 위치만 추출한다.(Window만!!!)
    String filePath = null;

    if (absPath.substring(0, 1).equals("/")) {
      // Mac, Linux용 경로 처리
      filePath = absPath.replace(uploadDir, "");
    } else {
      // Window용 경로 처리 -> 설정 파일에 명시한 첫 글자(/)를 제거해야함
      filePath = absPath.replace(uploadDir.substring(1), "");
    }

    log.debug("업로드 폴더 내에서의 최종 경로 : " + filePath);

    // 4) 업로드 결과를 Beans에 저장
    UploadItem item = new UploadItem();
    item.setContentType(multipartFile.getContentType());
    item.setFieldName(multipartFile.getName());
    item.setFileSize(multipartFile.getSize());
    item.setOriginName(originName);
    item.setFilePath(filePath);

    // 업로드 경로를 웹 상에서 접근 가능한 경로 문자열로 변환하여 Beans에 추가한다.
    String fileUrl = String.format("%s%s", uploadUrl, filePath);
    item.setFileUrl(fileUrl);
    log.debug("파일의 URL : " + fileUrl);
    log.debug("===============================");


    // 5) 썸네일 이미지 생성하기
    // 파일의 종류가 이미지를 의미한다면?
    if(item.getContentType().startsWith("image")){

      // 썸네일 이미지를 생성한다.
      String thumbnailPath = this.createThumbnail(filePath, thumbnailWidth, thumbnailHeight, thumbnailCrop);
      item.setThumbnailPath(thumbnailPath);

      String thumbnailUrl = String.format("%s%s", uploadUrl, thumbnailPath);
      item.setThumbnailUrl(thumbnailUrl);
    }

    return item;
  }

  /**
   * 컨트롤러부터 업로드 된 파일의 정보를 전달받아 지정된 위치에 저장한다.
   * 
   * @param uploadFiles - 업로드 된 파일 정보
   * @return - 파일 정보를 담고 있는 객체들을 저장하는 컬렉션
   * @throws NullPointerException - 업로드 된 파일이 없는 경우
   * @throws Exception            - 파일 저장에 실패한 경우
   */
  public List<UploadItem> saveMultipartFile(MultipartFile[] uploadFiles) throws NullPointerException, Exception {

    if (uploadFiles.length < 1) {
      throw new NullPointerException("업로드 된 파일이 없음");
    }

    List<UploadItem> uploadList = new ArrayList<UploadItem>();

    for (int i = 0; i < uploadFiles.length; i++) {
      try {
        UploadItem item = this.saveMultipartFile(uploadFiles[i]);
        uploadList.add(item);
      } catch (NullPointerException e) {
        log.error(String.format("%d번째 항목이 업로드 되지 않음", i));
      } catch (Exception e) {
        log.error(String.format("%d번째 항목 저장 실패 ::: %s", e.getLocalizedMessage()));
      }
    }

    if (uploadList.size() == 0) {
      throw new Exception("업로드 실패");
    }

    return uploadList;
  }

  public String createThumbnail(String path, int width, int height, boolean crop) throws Exception {

    log.debug(
        String.format("[Thubnail] path : %s, size : %dX%d, crop : %s", path, width, height, String.valueOf(crop)));

    File loadFile = new File(this.uploadDir, path);
    String dirPath = loadFile.getParent();
    String fileName = loadFile.getName();
    int p = fileName.lastIndexOf(".");
    String name = fileName.substring(0, p);
    String ext = fileName.substring(p + 1);

    String thumbName = name + "_" + width + "X" + height + "." + ext;

    File f = new File(dirPath, thumbName);
    String saveFile = f.getAbsolutePath();

    log.debug(String.format("[Thumbnail] saveFile : %s", saveFile));

    if (!f.exists()) {

      Builder<File> builder = Thumbnails.of(loadFile);

      if (crop == true) {
        builder.crop(Positions.CENTER);
      }

      builder.size(width, height);
      builder.useExifOrientation(true);
      builder.outputFormat(ext);
      builder.toFile(saveFile);
    }

    String saveFilePath = null;
    saveFile = saveFile.replace("\\", "/");
    if(saveFile.substring(0, 1).equals("/")){
      saveFilePath = saveFile.replace(uploadDir, "");
    } else {
      saveFilePath = saveFile.replace(uploadDir.substring(1), "");
    }

    return saveFilePath;
  }


  
}
