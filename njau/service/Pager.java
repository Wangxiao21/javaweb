package njau.service;

import java.util.List;

public class Pager {
	private int rowCount;
	private int pageNo;
	private int pageSize;
	private List result;
	
	public Pager(int pageSize,int pageNo,int rowCount,List result){
		this.pageSize=pageSize;
		this.pageNo=pageNo;
		this.result=result;
		this.rowCount=rowCount;
	}

	public int getRowCount() {
		return rowCount;
	}

	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public List getResult() {
		return result;
	}

	public void setResult(List result) {
		this.result = result;
	}
	
	
}
