package com.rt.DTO;

public class RequestDTO {
    private int id;          // request id
    private String status;   // Accepted / Rejected / Pending
    private String providerEmail; // optional: show provider name/email

    public RequestDTO(int id, String status, String providerEmail) {
        this.id = id;
        this.status = status;
        this.providerEmail = providerEmail;
    }

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getProviderEmail() {
		return providerEmail;
	}

	public void setProviderEmail(String providerEmail) {
		this.providerEmail = providerEmail;
	}
}
    

    
