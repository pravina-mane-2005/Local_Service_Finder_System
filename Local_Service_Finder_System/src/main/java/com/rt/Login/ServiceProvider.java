package com.rt.Login;

public class ServiceProvider {

	    private int providerId;
	    private String name;
	    private String email;
	    private String password;
	    private String serviceType;
	    private String city;
	    private String phone;
	    private int experience;
	    private int status;
	    
	    public ServiceProvider() {};
	    
		public ServiceProvider(int providerId, String name, String email, String password, String serviceType,
				String city, String phone, int experience,int status) {
			super();
			this.providerId = providerId;
			this.name = name;
			this.email = email;
			this.password = password;
			this.serviceType = serviceType;
			this.city = city;
			this.phone = phone;
			this.experience = experience;
			this.status= status;
		}

		public int getProviderId() {
			return providerId;
		}

		public void setProviderId(int providerId) {
			this.providerId = providerId;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}

		public String getServiceType() {
			return serviceType;
		}

		public void setServiceType(String serviceType) {
			this.serviceType = serviceType;
		}

		public String getCity() {
			return city;
		}

		public void setCity(String city) {
			this.city = city;
		}

		public String getPhone() {
			return phone;
		}

		public void setPhone(String phone) {
			this.phone = phone;
		}

		public int getExperience() {
			return experience;
		}

		public void setExperience(int experience) {
			this.experience = experience;
		}
		
		public int getStatus() {
		    return status;
		}

		public void setStatus(int status) {
		    this.status = status;
		}

		


	}



