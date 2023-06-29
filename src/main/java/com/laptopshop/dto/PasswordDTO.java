package com.laptopshop.dto;

import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Length;

public class PasswordDTO {

	@NotEmpty(message = "The old password must be entered")
	private String oldPassword;

	@NotEmpty(message = "New password must be entered")
	@Length(min=8, max=32, message="The password must be 8-32 characters long")
	private String newPassword;

	@NotEmpty(message = "New password must be re-confirmed")
	private String confirmNewPassword;

	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public String getConfirmNewPassword() {
		return confirmNewPassword;
	}

	public void setConfirmNewPassword(String confirmNewPassword) {
		this.confirmNewPassword = confirmNewPassword;
	}

	@Override
	public String toString() {
		return "PasswordDTO [oldPassword=" + oldPassword + ", newPassword=" + newPassword + ", confirmNewPassword="
				+ confirmNewPassword + "]";
	}
}
