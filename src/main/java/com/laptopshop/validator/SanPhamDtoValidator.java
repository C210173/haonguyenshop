package com.laptopshop.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.laptopshop.dto.SanPhamDto;
import com.laptopshop.service.DanhMucService;

@Component
public class SanPhamDtoValidator implements Validator{
	
	@Autowired
	private DanhMucService dmService;

	@Override
	public boolean supports(Class<?> clazz) {
		return SanPhamDto.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		SanPhamDto s = (SanPhamDto) target;
		
		ValidationUtils.rejectIfEmpty(errors, "tenSanPham", "error.tenSanPham", "Product name cannot be empty");
		ValidationUtils.rejectIfEmpty(errors, "donGia", "error.donGia", "Price cannot be empty");
		ValidationUtils.rejectIfEmpty(errors, "donViKho", "error.donViKho", "Warehouse unit cannot be empty");
		ValidationUtils.rejectIfEmpty(errors, "thongTinBaoHanh", "error.thongTinBaoHanh", "Warranty information cannot be empty");
		ValidationUtils.rejectIfEmpty(errors, "thongTinChung", "error.thongTinChung", "General information cannot be empty");
		
		if(Integer.parseInt(s.getDonGia()) < 0) {
			errors.rejectValue("donGia", "error.donGia", "price cannot be negative");
		}
		
		if(Integer.parseInt(s.getDonViKho()) < 0) {
			errors.rejectValue("donViKho", "error.donViKho", "Warehouse unit cannot be negative");
		}
		String tenDanhMuc = dmService.getDanhMucById(s.getDanhMucId()).getTenDanhMuc().toLowerCase();
		
		if(tenDanhMuc.contains("Laptop".toLowerCase())) {
			ValidationUtils.rejectIfEmpty(errors, "manHinh", "error.manHinh", "The screen should not be blank");
			ValidationUtils.rejectIfEmpty(errors, "heDieuHanh", "error.heDieuHanh", "The OS cannot be empty");
			ValidationUtils.rejectIfEmpty(errors, "cpu", "error.cpu", "CPU cannot be empty");
			ValidationUtils.rejectIfEmpty(errors, "ram", "error.ram", "Ram cannot be empty");
			ValidationUtils.rejectIfEmpty(errors, "thietKe", "error.thietKe", "Design can't be blank");
			ValidationUtils.rejectIfEmpty(errors, "dungLuongPin", "error.dungLuongPin", "Battery capacity is empty");			
		}
		
	}

}
