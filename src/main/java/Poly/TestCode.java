package Poly;

import java.util.List;

import Entity.Report;

public class TestCode {

	public TestCode() {
		// TODO Auto-generated constructor stub
		
	}
	public static void main(String[] args) {
		ReportDAO Rdap = new ReportDAO();
		List<Report> report = Rdap.reportToYear(2023);
		System.out.println(report.get(0).getNewest());
		
	}

}
