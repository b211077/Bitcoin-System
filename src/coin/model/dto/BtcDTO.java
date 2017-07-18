package coin.model.dto;

public class BtcDTO {
	String day;
	int last_price;
	int volume;
	int eid;
	
	public BtcDTO() {
		super();
	}

	public BtcDTO(String day, int last_price, int volume, int eid) {
		super();
		this.day = day;
		this.last_price = last_price;
		this.volume = volume;
		this.eid = eid;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public int getLast_price() {
		return last_price;
	}

	public void setLast_price(int last_price) {
		this.last_price = last_price;
	}

	public int getVolume() {
		return volume;
	}

	public void setVolume(int volume) {
		this.volume = volume;
	}

	public int getEid() {
		return eid;
	}

	public void setEid(int eid) {
		this.eid = eid;
	}

	public String toString() {
		return "BtcDTO [day=" + day + ", last_price=" + last_price + ", volume=" + volume + ", eid=" + eid + "]";
	}
}
