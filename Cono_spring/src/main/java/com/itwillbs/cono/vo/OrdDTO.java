package com.itwillbs.cono.vo;

public class OrdDTO {
   
   private String ord_idx;
   private String item_idx;
   private String member_id;
   private String ord_date;
   private String ord_reqContent;
   private String ord_quantity;
   private String ord_status;
   
   public String getOrd_idx() {
	   return ord_idx;
   }
   public void setOrd_idx(String ord_idx) {
	   this.ord_idx = ord_idx;
   }
   public String getItem_idx() {
      return item_idx;
   }
   public void setItem_idx(String item_idx) {
      this.item_idx = item_idx;
   }
   public String getMember_id() {
      return member_id;
   }
   public void setMember_id(String member_id) {
      this.member_id = member_id;
   }
   public String getOrd_date() {
      return ord_date;
   }
   public void setOrd_date(String ord_date) {
      this.ord_date = ord_date;
   }
   public String getOrd_reqContent() {
      return ord_reqContent;
   }
   public void setOrd_reqContent(String ord_reqContent) {
      this.ord_reqContent = ord_reqContent;
   }
   public String getOrd_quantity() {
      return ord_quantity;
   }
   public void setOrd_quantity(String ord_quantity) {
      this.ord_quantity = ord_quantity;
   }

   public String getOrd_status() {
      return ord_status;
   }
   public void setOrd_status(String ord_status) {
      this.ord_status = ord_status;
   }
	@Override
	public String toString() {
		return "OrdDTO [ord_idx=" + ord_idx + ", item_idx=" + item_idx + ", member_id=" + member_id + ", ord_date="
				+ ord_date + ", ord_reqContent=" + ord_reqContent + ", ord_quantity=" + ord_quantity + ", ord_status="
				+ ord_status + "]";
	}
   
   
}
