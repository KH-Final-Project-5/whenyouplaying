package com.commons;

public class Criteria {
    private int page;
    private int perPageNum;
    private int rowStart;
    private int rowEnd;
    private int usNo;
    private String startDate;
    private String endDate;
	private String change;
	private String prTalent;
    
    public String getPrTalent() {
		return prTalent;
	}

	public void setPrTalent(String prTalent) {
		this.prTalent = prTalent;
	}

	public String getChange() {
        return change;
    }

    public void setChange(String change) {
        this.change = change;
    }

    public Criteria() {
        this.page = 1;
        this.perPageNum = 10;
    }

    public void setPage(int page) {
        if (page <= 0) {
            this.page = 1;
            return;
        }
        this.page = page;
    }

    public void setPerPageNum(int perPageNum) {
        if (perPageNum <= 0 || perPageNum > 100) {
            this.perPageNum = 10;
            return;
        }
        this.perPageNum = perPageNum;
    }

    public int getPage() {
        return page;
    }

    public int getPageStart() {
        return (this.page - 1) * perPageNum;
    }

    public int getPerPageNum() {
        return this.perPageNum;
    }

    public int getRowStart() {
        rowStart = ((page - 1) * perPageNum) + 1;
        return rowStart;
    }

    public int getRowEnd() {
        rowEnd = rowStart + perPageNum - 1;
        return rowEnd;
    }

	public int getUsNo() {
		return usNo;
	}

	//유저
	public void setUsNo(int usNo) {
		this.usNo = usNo;
	}
	//달력
    public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
    
    
    
    
    
}
	