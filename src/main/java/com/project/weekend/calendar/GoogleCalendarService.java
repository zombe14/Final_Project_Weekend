package com.project.weekend.calendar;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.List;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.extensions.java6.auth.oauth2.AuthorizationCodeInstalledApp;
import com.google.api.client.extensions.jetty.auth.oauth2.LocalServerReceiver;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.util.DateTime;
import com.google.api.client.util.store.FileDataStoreFactory;
import com.google.api.services.calendar.Calendar;
import com.google.api.services.calendar.CalendarScopes;
import com.google.api.services.calendar.model.Event;
import com.google.api.services.calendar.model.EventDateTime;

@Service
public class GoogleCalendarService {
	private static final String APPLICATION_NAME = "Google Calendar API Java Quickstart";

	private static final java.io.File DATA_STORE_DIR = new java.io.File(
			System.getProperty("user.home"),
			".credentials/calendar-java-quickstart");

	private static FileDataStoreFactory DATA_STORE_FACTORY;

	private static final JsonFactory JSON_FACTORY = JacksonFactory
			.getDefaultInstance();

	private static HttpTransport HTTP_TRANSPORT;

	private static final List<String> SCOPES = Arrays
			.asList(CalendarScopes.CALENDAR);

	@Inject
	private GoogleCalendarDAO calendarDAO;


	static {
		try {
			HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();
			DATA_STORE_FACTORY = new FileDataStoreFactory(DATA_STORE_DIR);
		} catch (Throwable t) {
			t.printStackTrace();
			System.exit(1);
		}
	}

	public static Credential authorize() throws IOException {
		InputStream in = GoogleCalendarService.class
				.getResourceAsStream("/client_secret.json");
		GoogleClientSecrets clientSecrets = GoogleClientSecrets.load(
				JSON_FACTORY, new InputStreamReader(in));

		GoogleAuthorizationCodeFlow flow = new GoogleAuthorizationCodeFlow.Builder(
				HTTP_TRANSPORT, JSON_FACTORY, clientSecrets, SCOPES)
				.setDataStoreFactory(DATA_STORE_FACTORY)
				.setAccessType("offline").build();
		Credential credential = new AuthorizationCodeInstalledApp(flow,
				new LocalServerReceiver()).authorize("user");
		System.out.println("Credentials saved to "
				+ DATA_STORE_DIR.getAbsolutePath());
		return credential;
	}

	public static Calendar getCalendarService() throws IOException {
		Credential credential = authorize();
		return new Calendar.Builder(HTTP_TRANSPORT, JSON_FACTORY, credential)
				.setApplicationName(APPLICATION_NAME).build();
	}

	// 일정 저장 처리
	public void calendarEventAdd(GoogleCalendarDTO calDTO) throws Exception {
		Calendar service = GoogleCalendarService.getCalendarService();
		Event event = new Event().setSummary(calDTO.getSummary()).setDescription(calDTO.getDescription());
		//시작일
		DateTime startDateTime = new DateTime(calDTO.getStartDateTime());
		EventDateTime start = new EventDateTime().setDateTime(startDateTime).setTimeZone("Asia/Seoul");
		event.setStart(start);
		//종료일
		DateTime endDateTime = new DateTime(calDTO.getEndDateTime());
		EventDateTime end = new EventDateTime().setDateTime(endDateTime).setTimeZone("Asia/Seoul");
		event.setEnd(end);
		event = service.events().insert("euecreof8ipii55sr38dqagcao@group.calendar.google.com", event).execute();
		calDTO.setEid(event.getId());
		calendarDAO.addCalendar(calDTO);
	}    

	// 일정 삭제
	public void calendarEventRemoveOne(GoogleCalendarDTO calDTO) throws Exception {        
		Calendar service = GoogleCalendarService.getCalendarService();
		service.events().delete("euecreof8ipii55sr38dqagcao@group.calendar.google.com", calDTO.getEid()).execute();
		calendarDAO.deleteCalendar(calDTO.getEid());
	}

	// 일정 수정
	public void calendarEventModify(GoogleCalendarDTO calDTO) throws Exception {        
		Calendar service = GoogleCalendarService.getCalendarService();
		Event event = service.events().get("euecreof8ipii55sr38dqagcao@group.calendar.google.com", calDTO.getEid()).execute();
		event.setSummary(calDTO.getSummary()).setDescription(calDTO.getDescription());
		service.events().update("euecreof8ipii55sr38dqagcao@group.calendar.google.com", event.getId(), event).execute();
		calendarDAO.updateCalendar(calDTO);
	}
}
