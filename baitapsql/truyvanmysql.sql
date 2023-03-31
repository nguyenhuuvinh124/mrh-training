-- Câu 1: Liệt kê MaDatPhong, MaDV, SoLuong của tất cả các dịch vụ có số lượng lớn hơn 3 và nhỏ hơn 10.
-- SELECT MaDatPhong, MaDV, SoLuong
-- FROM baitapmysql.chitietsudungdv
-- WHERE SoLuong > 3 AND SoLuong < 10;

-- Câu 2: Cập nhật dữ liệu trên trường GiaPhong thuộc bảng PHONG tăng lên 10,000 VNĐ so với giá phòng hiện tại, 
-- chỉ cập nhật giá phòng của những phòng có số khách tối đa lớn hơn 10.
--  UPDATE baitapmysql.phong
--  SET GiaPhong = GiaPhong + 10000
--  WHERE SoKhachToiDa > 10;

-- Câu 3: Xóa tất cả những đơn đặt phòng (từ bảng DAT_PHONG) có trạng thái đặt (TrangThaiDat) là “Da huy”.
--  DELETE FROM baitapmysql.datphong
--  WHERE TrangThaiDat = N'Đã hủy';

-- Câu 4: Hiển thị TenKH của những khách hàng có tên bắt đầu là một trong các ký tự “H”, “N”, “M” và có độ dài tối đa là 12 ký tự.
-- SELECT TenKH
-- FROM baitapmysql.khachhang
-- WHERE (TenKH LIKE 'H%' OR TenKH LIKE 'N%' OR TenKH LIKE 'M%')
-- AND LENGTH(TenKH) <= 12;

-- Câu 5: Hiển thị TenKH của tất cả các khách hàng có trong hệ thống, TenKH nào trùng nhau thì chỉ hiển thị một lần.
-- SELECT DISTINCT TenKH
-- FROM baitapmysql.khachhang;


-- Câu 6: Hiển thị MaDV, TenDV, DonViTinh, DonGia của những dịch vụ đi kèm có DonViTinh là “lon” và có DonGia lớn hơn 10,000 VNĐ 
-- hoặc những dịch vụ đi kèm có DonViTinh là “Cai” và có DonGia nhỏ hơn 5,000 VNĐ.
-- SELECT MaDV, TenDV, DonViTinh, DonGia
-- FROM baitapmysql.dichvu
-- WHERE (DonViTinh = 'lon' AND DonGia > 10000)
-- OR (DonViTinh = 'Cai' AND DonGia < 5000);

-- Câu 9: Hiển thị MaKH, TenKH, DiaChi, SoDT của những khách hàng đã từng đặt phòng karaoke có địa chỉ ở “Hoa xuan”.
-- SELECT MaKH, TenKH, DiaChi, SoDT
-- FROM baitapmysql.khachhang
-- WHERE MaKH IN (SELECT MaKH
-- FROM baitapmysql.datphong
-- WHERE MaPhong IN (SELECT MaPhong
-- FROM baitapmysql.phong
-- WHERE DiaChi LIKE N'%Hoa Xuân%'));

-- Câu 10: Hiển thị MaPhong, LoaiPhong, SoKhachToiDa, GiaPhong, SoLanDat của những phòng được 
-- khách hàng đặt có số lần đặt lớn hơn 1 lần và trạng thái đặt là “Da dat”.
-- SELECT p.MaPhong, p.LoaiPhong, p.SoKhachToiDa, p.GiaPhong, COUNT(dp.MaDatPhong) AS SoLanDat
-- FROM baitapmysql.phong p
-- JOIN baitapmysql.datphong dp ON p.MaPhong = dp.MaPhong
-- WHERE dp.TrangThaiDat = N'Đã đặt'
-- group by p.MaPhong, p.LoaiPhong, p.SoKhachToiDa, p.GiaPhong