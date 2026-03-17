package com.rt.Login;

public class ServiceRequest {
	   private int id;
	    private int providerId;
	    private String userEmail;
	    private String status;
	    private String requestDate;
	    private int user_id;
	    
	    public ServiceRequest() {}
	    
		public ServiceRequest(int id, int providerId, String userEmail, String status, String requestDate , int user_id) {
			super();
			this.id = id;
			this.providerId = providerId;
			this.userEmail = userEmail;
			this.status = status;
			this.requestDate = requestDate;
		}

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public int getProviderId() {
			return providerId;
		}

		public void setProviderId(int providerId) {
			this.providerId = providerId;
		}

		public String getUserEmail() {
			return userEmail;
		}

		public void setUserEmail(String userEmail) {
			this.userEmail = userEmail;
		}

		public String getStatus() {
			return status;
		}

		public void setStatus(String status) {
			this.status = status;
		}

		public String getRequestDate() {
			return requestDate;
		}

		public void setRequestDate(String requestDate) {
			this.requestDate = requestDate;
		}
		
		public int getUser_id() {
			return user_id;
		}

		public void  setUser_id(int user_id) {
			this.user_id = user_id;
		}
		
		
	    
	    


}
