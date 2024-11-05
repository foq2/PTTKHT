create database qlnh;
use qlnh;
create table tblThanhVien584 (
	`id` INT NOT NULL AUTO_INCREMENT,
	`username` VARCHAR(45) NOT NULL,
	`password` VARCHAR(45) NOT NULL,
	`ho` varchar(255) not null,
    `ten` varchar(255) not null,
    `ngaysinh` date not null,
    `email` varchar(255) not null,
    `soDienThoai` varchar(255) not null,
    `vaitro` varchar(255) not null,
	primary key(`id`)
);
create table tblKhachHang584 (
	`id` int not null auto_increment,
    `tblThanhVien584id` int not null,
    foreign key(tblThanhVien584id) references tblThanhVien584(id),
    primary key(`id`)
);
create table tblMonAn584 (
	`id` INT NOT NULL AUTO_INCREMENT,
	`ten` VARCHAR(45) NOT NULL,
	`gia` float NOT NULL,
    `mota` varchar(255),
	primary key(`id`)
);
create table tblDonHang584 (
	`id` int not null auto_increment,
    `ngay` date not null,
    `mota` varchar(255) not null,
    `tblKhachHang584id` int not null,
    foreign key (tblKhachHang584id) references tblKhachHang584(id),
    primary key(`id`)
);
create table tblHoaDon584 (
	`id` int not null auto_increment,
    `tongTien` float not null,
    `ngay` date not null,
    `mota` varchar(255),
    `tblDonHang584id` int not null,
    foreign key (tblDonHang584id) references tblDonHang584(id),
    primary key(`id`)
);
create table tblMonAnDonHang584 (
	`id` int not null auto_increment,
    `soLuong` int not null,
    `tongTien` float not null,
    `tblMonAn584id` int not null,
    `tblDonHang584id` int not null,
    foreign key(tblMonAn584id) references tblMonAn584(id),
    foreign key(tblDonHang584id) references tblDonHang584(id),
    primary key(`id`)
);
-- Thêm dữ liệu vào bảng tblThanhVien584
INSERT INTO tblThanhVien584 (username, password, ho, ten, ngaysinh, email, soDienThoai, vaitro) VALUES
('1', '1', 'Nguyen', 'An', '1990-05-15', 'an.nguyen@example.com', '0123456789', 'khachHang'),
('2', '2', 'Tran', 'Binh', '1985-08-20', 'binh.tran@example.com', '0987654321', 'khachHang'),
('3', '3', 'Le', 'Cao', '1988-01-25', 'cao.le@example.com', '0111222333', 'khachHang'),
('4', '4', 'Bui', 'Phong', '2003-07-26', 'phong.bui@example.com', '0123456789', 'quanLy');

-- Thêm dữ liệu vào bảng tblKhachHang584
INSERT INTO tblKhachHang584 (tblThanhVien584id) VALUES
(1), 
(2),
(3); 

-- Thêm dữ liệu vào bảng tblMonAn584
INSERT INTO tblMonAn584 (ten, gia, mota) VALUES
('Pho', 30000, 'Phở bò tái chín với hành lá'),
('BunCha', 40000, 'Bún chả Hà Nội với nem rán'),
('ComTam', 35000, 'Cơm tấm sườn bì chả'), 
('Bo xao toi', 200000, 'Đắm chìm trong hương vị thơm lừng của món Bò Xào Tỏi – một sự kết hợp hoàn hảo giữa thịt bò tươi ngon và tỏi băm nhỏ'),
('Bo bit tet', 500000, 'Bò bít tết ngol tuỵt'),
('Bo sot tieu den', 250000, 'Thịt bò tươi ngon kết hợp nước sốt tiêu đen ngon hết nước chấm, ăn kèm cùng bánh bao'),
('Bo xao nam', 250000, ' một món ăn đậm đà, thơm ngon, được chế biến từ thịt bò mềm kết hợp với nấm tươi');

-- Thêm dữ liệu vào bảng tblDonHang584
INSERT INTO tblDonHang584 (ngay, mota, tblKhachHang584id) VALUES
('2024-11-01', 'Đặt món ăn sáng', 1),
('2024-11-02', 'Đặt bữa trưa', 2), 
('2024-11-03', 'Đặt online', 3),
('2024-11-03', 'Đặt online', 1),
('2024-11-05', 'Đặt bữa tối', 2),
('2024-11-07', 'Đặt bữa sáng', 3),
('2024-11-08', 'Đặt bữa trưa', 1),
('2024-11-10', 'Đặt online', 2),
('2024-11-10', 'Đặt bữa tối', 3);

-- Thêm dữ liệu vào bảng tblHoaDon584
INSERT INTO tblHoaDon584 (tongTien, ngay, mota, tblDonHang584id) VALUES
(60000, '2024-11-01', 'Hóa đơn cho đơn hàng ngày 01-11', 1),
(40000, '2024-11-02', 'Hóa đơn cho đơn hàng ngày 02-11', 2),
(60000, '2024-11-03', 'Hóa đơn cho đơn hàng ngày 01-11', 1),
(60000, '2024-11-03', 'Hóa đơn cho đơn hàng ngày 01-11', 1),
(60000, '2024-11-05', 'Hóa đơn cho đơn hàng ngày 01-11', 1),
(60000, '2024-11-07', 'Hóa đơn cho đơn hàng ngày 01-11', 1),
(60000, '2024-11-08', 'Hóa đơn cho đơn hàng ngày 01-11', 1),
(60000, '2024-11-10', 'Hóa đơn cho đơn hàng ngày 01-11', 1),
(60000, '2024-11-10', 'Hóa đơn cho đơn hàng ngày 01-11', 1);

-- Thêm dữ liệu vào bảng tblMonAnDonHang584
INSERT INTO tblMonAnDonHang584 (soLuong, tongTien, tblMonAn584id, tblDonHang584id) VALUES
(2, 60000, 1, 1),
(1, 40000, 2, 2),
(2, 70000, 3, 3),
(2, 400000, 4, 4),
(1, 500000, 5, 5),
(2, 500000, 6, 6),
(2, 500000, 7, 7),
(3, 90000, 1, 8),
(2, 80000, 2, 9),
(4, 140000, 3, 1),
(1, 200000, 4, 2),
(2, 1000000, 5, 3),
(1, 200000, 6, 4),
(3, 750000, 7, 5),
(1, 30000, 1, 6),
(4, 160000, 2, 7),
(1, 35000, 3, 8),
(2, 400000, 4, 9); 

-- Tạo procedure
DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `kiemtraDN`(IN usr VARCHAR(255), IN pwd VARCHAR(255))
BEGIN 
    SELECT * FROM tblThanhVien584
    WHERE username = usr AND password = pwd;
END; //
DELIMITER ;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `MonAnTheoTuKhoa`(IN tuKhoa VARCHAR(255))
BEGIN 
    SELECT * FROM tblMonAn584
    WHERE ten LIKE CONCAT('%', tuKhoa, '%');
END;
//
DELIMITER ;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `TTMonAn`(IN `Id` INT)
BEGIN 
    SELECT * FROM tblMonAn584 as ma 
    WHERE ma.id = Id;
END;
//
DELIMITER ;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `HDcuaKH`(IN ID INT, IN dayStart VARCHAR(255), IN dayEnd VARCHAR(255))
BEGIN 
    select hd.*
    from tblHoaDon584 as hd, tblDonHang584 as dh
    where hd.ngay between dayStart and dayEnd
    and hd.tblDonHang584id = dh.id
    and dh.tblKhachHang584id = ID
    
    union all
    
    select null as id,
			SUM(hd.tongTien) as tongTien,
			'Tổng' as ngay,
			null as mota,
			null as tblDonHang584id
    from tblHoaDon584 as hd, tblDonHang584 as dh
    where hd.ngay between dayStart and dayEnd
    and hd.tblDonHang584id = dh.id
    and dh.tblKhachHang584id = ID;
END;
//
DELIMITER ;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `TKKHtheoDT`(IN dayStart VARCHAR(255), IN dayEnd VARCHAR(255))
BEGIN 
    select 	kh.id as id, 
			tv.ten as ten, 
            sum(hd.tongTien) as doanhthu
    from tblHoaDon584 as hd
    join tblDonHang584 as dh on hd.tblDonHang584id = dh.id
    join tblKhachHang584 as kh on dh.tblKhachHang584id = kh.id
    join tblThanhVien584 as tv on kh.tblThanhVien584id = tv.id
    where hd.ngay between dayStart and dayEnd
    group by kh.id
    
    union all
    SELECT NULL AS id, 
           'Tổng' AS ten, 
           SUM(hd.tongTien) AS doanhthu
    FROM tblHoaDon584 AS hd
    WHERE hd.ngay BETWEEN dayStart AND dayEnd;
END;
//
DELIMITER ;
DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `HD`(IN IDHD INT)
BEGIN
    SELECT *
    FROM tblHoaDon584
    WHERE id=IDHD;
END //
DELIMITER ;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `KH`(IN IDKH INT)
BEGIN 
    SELECT tv.ho, tv.ten
    FROM tblKhachHang584 as kh
    join tblThanhVien584 as tv on kh.tblThanhVien584id = tv.id
    WHERE kh.id = IDKH;
END //
DELIMITER ;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `MonAnTheoTuKhoa`(IN tuKhoa VARCHAR(255))
BEGIN 
    SELECT * FROM tblMonAn584
    WHERE ten LIKE CONCAT('%', tuKhoa, '%');
END;
//
DELIMITER ;