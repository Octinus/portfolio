package com.portfolio.motors.helpers;

import java.io.IOException;

import org.springframework.stereotype.Component;

import okhttp3.Interceptor;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.logging.HttpLoggingInterceptor;
import okhttp3.logging.HttpLoggingInterceptor.Level;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

@Component
public class RetrofitHelper {	

	/**
	 * Retrofit 객체를 생성하고 기본 설정들을 적용한 후 리턴한다.
	 * 
	 * @param baseUrl - 접근하고자 하는 API의 기본 주소(ex http://도메인)
	 * @return - Retrofit 객체
	 */
	public Retrofit getRetrofit(String baseUrl) {
		// 통신 객체를 생성하기 위한 Builder 객체 정의 -> import okhttp3.okHttpClient;
		OkHttpClient.Builder httpClientBuilder = new OkHttpClient.Builder();

		//----------------------------------------------------------------------
		//통신과정을 문자열로 개로채는 객체를 연결한다.
		HttpLoggingInterceptor logging = new HttpLoggingInterceptor(new HttpLoggingInterceptor.Logger() {
			
			@Override
			public void log(String arg0) {
				System.out.println(arg0);				
			}
		});
		logging.level(Level.BODY); // ok3를 import 해준다!!!!!
		httpClientBuilder.addInterceptor(logging);
		
		//-------------------------------------------------------------
		// 통신 데이터를 개로채는 객체를 연결한다.
		httpClientBuilder.addNetworkInterceptor(new Interceptor() {
			
			@Override
			public Response intercept(Chain chain) throws IOException {
				//요청정보(URL+변수+Header)를 담고 있는 객체 추출 -> import okhttp3.Request
				Request originalRequest = chain.request();
				//요청 정보 객체를 복제해서 새로운 객체 생성
				Request.Builder builder = originalRequest.newBuilder();
				//기본으로 포함되어 있는 브라우저 정보 삭제
				builder.removeHeader("User-Agent");
				//임의의 웹 브라우저 정보로 설정(ex 크롬)
				builder.header("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36");				
				//구성된 정보로 요청정보 객체 새로 생성
				Request newRequest = builder.build();				
				//요청 객체를 사용하여 응답객체 생성 후 리턴
				return chain.proceed(newRequest);
			}
		});
		//-------------------------------------------------------------
		
		// Builder를 통해 통신객체 생성 -> import okhttp3.OkhttpClient;
		OkHttpClient httpClient = httpClientBuilder.build();

		// Retrofit을 생성하는 기능을 수행하는 객체 정의
		Retrofit.Builder builder = new Retrofit.Builder();

		// 기본 주소를 지정한다.
		builder.baseUrl(baseUrl);

		// 통신 결과를 Gson 객체를 통해 처리하도록 Gson을 연결한다. -> Json 파싱 자동화
		// -> import retrofit2.converter.gson.GsonConverterFactory;
		builder.addConverterFactory(GsonConverterFactory.create());

		// 통신 객체를 연결한다.
		builder.client(httpClient);

		// 모든 설정이 반영된 Retrofit 객체 생성 -> import retrofit2.Retrofit;
		Retrofit retrofit = builder.build();

		return retrofit;
	}
}
