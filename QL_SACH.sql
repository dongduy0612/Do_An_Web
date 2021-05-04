--------------------------------------------------------------------TẠO DATABASE---------------------------------------------------------------------
CREATE DATABASE QL_SACH
GO 
USE QL_SACH
GO

---------------------------------------------------------------TẠO BẢNG,KHOÁ CHÍNH,KHOÁ NGOẠI--------------------------------------------------------
------TẠO BẢNG NHAXUATBAN
CREATE TABLE NHAXUATBAN
(
	MANXB CHAR(10) NOT NULL PRIMARY KEY,
	TENNXB NVARCHAR(50) NOT NULL
)
------TẠO BẢNG THELOAI
CREATE TABLE THELOAI
(
	MATHELOAI CHAR(10) NOT NULL PRIMARY KEY,
	TENTHELOAI NVARCHAR(50)
)
------TẠO BẢNG SACH
CREATE TABLE SACH
(
	MASACH CHAR(10) NOT NULL PRIMARY KEY, 
	TENSACH NVARCHAR(200),
	DONGIA FLOAT,
	DONVITINH NVARCHAR(10),
	MOTA NTEXT,
	HINHMINHHOA NVARCHAR(50),
	NAMXB DATE,
	NGAYCAPNHAT DATE,
	TENTACGIA NVARCHAR(100),
	MATHELOAI CHAR(10),
	MANXB CHAR(10),
	CONSTRAINT FK_SACH_THELOAI FOREIGN KEY (MATHELOAI) REFERENCES THELOAI(MATHELOAI),
	CONSTRAINT FK_SACH_NHAXUATBAN FOREIGN KEY (MANXB) REFERENCES NHAXUATBAN (MANXB)
)

------TẠO BẢNG KHACHHANG
CREATE TABLE KHACHHANG
(
	EMAIL VARCHAR(30) not null primary key,	
	MATKHAU VARCHAR(20),	
	TENKH NVARCHAR(30) NOT NULL,
	DIACHI NVARCHAR(50),
	SDT CHAR(12),
	GIOITINH NVARCHAR(5),
	QUYEN CHAR(5) DEFAULT 'KH'
)

------TẠO BẢNG QUANTRI
CREATE TABLE QUANTRI
(
	EMAIL VARCHAR(30) NOT NULL PRIMARY KEY,
	MATKHAU VARCHAR(20),
	TENHIENTHI NVARCHAR(50),
	QUYEN CHAR(5) DEFAULT 'admin'
)
------TẠO BẢNG NHANVIEN
CREATE TABLE NHANVIEN
(
	MANV CHAR(10) NOT NULL PRIMARY KEY,
	TENNV NVARCHAR(30) NOT NULL,
	DIACHI NVARCHAR(50),
	SDT CHAR(12),
	GIOITINH NVARCHAR(5),
	NGAYVL DATE NOT NULL,
	LUONG MONEY
)
------TẠO BẢNG HOADON
CREATE TABLE HOADON
(
	MAHD CHAR(10) NOT NULL PRIMARY KEY,
	NGAYLAP DATE NOT NULL,
	THANHTIEN FLOAT,
	EMAIL VARCHAR(30),
	MANV CHAR(10),
	CONSTRAINT FK_HOADON_KHACHHANG FOREIGN KEY(EMAIL) REFERENCES KHACHHANG(EMAIL),
	CONSTRAINT FK_HOADON_NHANVIEN FOREIGN KEY(MANV) REFERENCES NHANVIEN(MANV)
)

------TẠO BẢNG DONDATHANG
CREATE TABLE DONDATHANG
(
	MADONHANG CHAR(10) NOT NULL PRIMARY KEY,
	NGAYTAO DATE,
	THANHTIEN MONEY,
	TINHTRANG NVARCHAR(30),
	EMAIL VARCHAR(30),
	CONSTRAINT FK_DONDATHANG_KHACHHANG FOREIGN KEY (EMAIL) REFERENCES KHACHHANG(EMAIL)
)
------TẠO BẢNG CHITIETDONHANG
CREATE TABLE CHITIETDONDATHANG
(
	MADONDATHANG CHAR(10) NOT NULL,
	MASACH CHAR(10) NOT NULL,
	SOLUONG INT,
	DONGIA FLOAT,
	MADONHANG CHAR(10),
	CONSTRAINT PK_CHITITETDONDATHANG PRIMARY KEY(MADONDATHANG,MASACH),
	CONSTRAINT FK_CHITIETDONDATHANG_DONDATHANG FOREIGN KEY(MADONHANG) REFERENCES DONDATHANG(MADONHANG),
	CONSTRAINT FK_CHITIETDONDATHANG_SACH FOREIGN KEY(MASACH) REFERENCES SACH(MASACH)
)
------TẠO BẢNG CHITIETHD
CREATE TABLE CHITIETTHD
(
	MAHD CHAR(10) NOT NULL,
	MASACH CHAR(10) NOT NULL,
	SOLUONG INT,
	DONGIA FLOAT,
	CONSTRAINT PK_CHITIETHD PRIMARY KEY(MAHD,MASACH),
	CONSTRAINT FK_CHITIETHD_SACH FOREIGN KEY(MASACH) REFERENCES SACH(MASACH),
	CONSTRAINT FK_CHITIETHD_HOADON FOREIGN KEY(MAHD) REFERENCES HOADON(MAHD)
)

select *from SACH
-------------------------------------------------------------TẠO RÀNG BUỘC TOÀN VẸN------------------------------------------------------------------
-----------------Bảng NHAXUATBAN
----TÊN NHÀ XUẤT BẢN LÀ DUY NHẤT
ALTER TABLE NHAXUATBAN ADD CONSTRAINT UNI_TENNXB UNIQUE(TENNXB)
-----------------Bảng THELOAI
----TÊN THỂ LOẠI LÀ DUY NHẤT
ALTER TABLE THELOAI ADD CONSTRAINT UNI_TENTHELOAI UNIQUE(TENTHELOAI)
----TÊN THỂ LOẠI NẰM TRONG CÁC GIÁ TRỊ: CHÍNH TRỊ – PHÁP LUẬT, KHOA HỌC CÔNG NGHỆ - KINH TẾ, VĂN HỌC NGHỆ THUẬT, VĂN HÓA XÃ HỘI - LỊCH SỬ, GIÁO TRÌNH, TRUYỆN - TIỂU THUYẾT, TÂM LÝ - TÂM LINH - TÔN GIÁO, THIẾU NHI.
ALTER TABLE THELOAI ADD CONSTRAINT CHK_TENTHELOAI CHECK(TENTHELOAI IN(N'CHÍNH TRỊ – PHÁP LUẬT', N'KHOA HỌC CÔNG NGHỆ - KINH TẾ', N'VĂN HỌC NGHỆ THUẬT', N'VĂN HÓA XÃ HỘI - LỊCH SỬ', N'GIÁO TRÌNH', N'TRUYỆN - TIỂU THUYẾT', N'TÂM LÝ - TÂM LINH - TÔN GIÁO', N'THIẾU NHI'))
-----------------Bảng SACH
----ĐƠN GIÁ PHẢI LỚN HƠN 0
ALTER TABLE SACH ADD CONSTRAINT CHK_DONGIA CHECK(DONGIA>0)
----TÊN SÁCH LÀ DUY NHẤT
ALTER TABLE SACH ADD CONSTRAINT UNI_TENSACH UNIQUE(TENSACH)
-----------------Bảng KHACHHANG
----GIỚI TÍNH THUỘC NAM HOẶC NỮ
ALTER TABLE KHACHHANG ADD CONSTRAINT CHK_GIOITINH_KH CHECK(GIOITINH IN(N'NAM', N'NỮ'))
----EMAIL LÀ DUY NHẤT
ALTER TABLE KHACHHANG ADD CONSTRAINT UNI_EMAIL UNIQUE(EMAIL)
-----------------Bảng NHANVIEN
----GIỚI TÍNH THUỘC NAM HOẶC NỮ
ALTER TABLE NHANVIEN ADD CONSTRAINT CHK_GIOITINH_NV CHECK(GIOITINH IN(N'NAM', N'NỮ'))
----LƯƠNG PHẢI LỚN HƠN 0
ALTER TABLE NHANVIEN ADD CONSTRAINT CHK_LUONG CHECK(LUONG>0)
-----------------Bảng HOADON
----THÀNH TIỀN PHẢI LỚN HƠN 0
ALTER TABLE HOADON ADD CONSTRAINT CHK_THANHTIEN_HD CHECK(THANHTIEN>0)
-----------------Bảng DONDATHANG
----THÀNH TIỀN PHẢI LỚN HƠN 0
ALTER TABLE DONDATHANG ADD CONSTRAINT CHK_THANHTIEN_DDH CHECK(THANHTIEN>0)
------TẠO RÀNG BUỘC BẢNG CHITIETDONDATHANG
----SỐ LƯỢNG PHẢI LỚN HƠN 0

ALTER TABLE CHITIETDONDATHANG ADD CONSTRAINT CHK_SOLUONG_CTDDH CHECK(SOLUONG>0)
----ĐƠN GIÁ PHẢI LỚN HƠN 0
ALTER TABLE CHITIETDONDATHANG ADD CONSTRAINT CHK_DONGIA_CTDDH CHECK(DONGIA>0)
-----------------Bảng CHITIETTHD
----SỐ LƯỢNG PHẢI LỚN HƠN 0
ALTER TABLE CHITIETTHD ADD CONSTRAINT CHK_SOLUONG_CTHD CHECK(SOLUONG>0)
----ĐƠN GIÁ PHẢI LỚN HƠN 0
ALTER TABLE CHITIETTHD ADD CONSTRAINT CHK_DONGIA_CTHD CHECK(DONGIA>0)

------------------------------------------------------------INSERT DỮ LIỆU---------------------------------------------------------------------------
-----------------Bảng NHAXUATBAN
SET DATEFORMAT DMY
INSERT INTO NHAXUATBAN
VALUES
('NXB01',N'NHÀ XUẤT BẢN KIM ĐỒNG'),
('NXB02',N'NHÀ XUẤT BẢN TRẺ'),
('NXB03',N'NHÀ XUẤT BẢN TỔNG HỢP TPHCM'),
('NXB04',N'NHÀ XUẤT BẢN CHÍNH TRỊ QUỐC GIA SỰ THẬT'),
('NXB05',N'NHÀ XUẤT BẢN GIÁO DỤC'),
('NXB06',N'NHÀ XUẤT BẢN HỘI NHÀ VĂN'),
('NXB07',N'NHÀ XUẤT BẢN TƯ PHÁP'),
('NXB08',N'NHÀ XUẤT BẢN THÔNG TIN VÀ TRUYỀN THÔNG'),
('NXB09',N'NHÀ XUẤT BẢN LAO ĐỘNG'),
('NXB10',N'NHÀ XUẤT BẢN GIAO THÔNG VẬN TẢI')
------TẠO BẢNG THELOAI
INSERT INTO THELOAI
VALUES
('TL01',N'CHÍNH TRỊ – PHÁP LUẬT'),
('TL02',N'KHOA HỌC CÔNG NGHỆ - KINH TẾ'),
('TL03',N'VĂN HỌC NGHỆ THUẬT'),
('TL04',N'VĂN HÓA XÃ HỘI - LỊCH SỬ'),
('TL05',N'GIÁO TRÌNH'),
('TL06',N'TRUYỆN - TIỂU THUYẾT'),
('TL07',N'TÂM LÝ - TÂM LINH - TÔN GIÁO'),
('TL08',N'THIẾU NHI')
------TẠO BẢNG SACH
INSERT INTO SACH
VALUES
('MS01',N'Bộ Luật Dân Sự',63000,N'Quyển',N'Bộ luật dân sự bao gồm 689 điều, có những nội dung nổi bật về chuyển đổi giới tính. Thực hiện hợp đồng khi hoàn cảnh thay đổi cơ bản. Các nghĩa vụ tài sản và các khoản chi phí liên quan đến thừa kế...',N'Hinh1.jpg','01/01/2019','01/05/2020',N'QUỐC HỘI','TL01','NXB04'),
('MS02',N'Luật Doanh Nghiệp',49000,N'Quyển',N'Giới thiệu toàn văn Luật Doanh nghiệp bao gồm những qui định chung và qui định cụ thể về thành lập doanh nghiệp; công ty trách nhiệm hữu hạn; doanh nghiệp nhà nuớc; công ty cổ phần; công ty hợp danh; doanh nghiệp tư nhân; nhóm công ti; tổ chức lại, giải thể và phá sản doanh nghiệp; tổ chức thực hiện',N'Hinh2.jfif','01/05/2019','01/02/2020',N'QUỐC HỘI','TL01','NXB07'),
('MS03',N'Luật Đất Đai (Hiện Hành, Sửa Đổi Bsung 2018)',51000,N'Quyển',N'Luật đất đai (hiện hành, sửa đổi bsung 2018)',N'Hinh3.jpg','19/05/2018','01/03/2019',N'QUỐC HỘI','TL01','NXB04'),
('MS04',N'Bách khoa toàn thư về Khoa học',450000,N'Quyển',N'Cuốn sách như một kho tri thức tuyệt vời với cách tiếp cận trực quan mới lạ cung cấp những thông tin toàn diện & chuẩn xác nhất về Khoa học dành cho cả gia đình.',N'Hinh4.jpg','10/04/2019','19/06/2019',N'Thế Tuấn','TL02','NXB02'),
('MS05',N'Các Thế Giới Song Song',80000,N'Quyển',N'Một chuyến du hành đầy trí tuệ qua các vũ trụ, được dẫn dắt tài tình bởi "thuyền trưởng" Michio Kaku và độc giả có dịp chiêm ngưỡng vẻ đẹp kỳ vĩ của vũ trụ kể từ vụ nổ lớn, vượt qua những hố đen, lỗ sâu, bước vào các thế giới lượng tử từ muôn màu kỳ lạ nằm ngay trước mũi chúng ta, vốn dĩ tồn tại song song trên một màng bên ngoài không - thời gian bốn chiều, ngắm nhìn thực tại vật chất quen thuộc hoà quyện với thế giới của những điều kỳ diệu như năng lượng và vật chất tối, sự nảy chồi của các vũ trụ, những chiều không gian bí ẩn và sự biến ảo của các dây rung siêu nhỏ',N'Hinh5.jpg','04/06/2017','03/05/2019',N'Michio Kaku','TL02','NXB06'),
('MS06',N'Cách Nền Kinh Tế Vận Hành - How The Economy Works',90000,N'Quyển',N'Tiền chảy vào đâu là THIÊN THỜI sáng ở đó. Khi lãi suất huy động 20% tiền sẽ chảy vào ngân hàng lợi nhuận nhiều hơn mua bất động sản. Khi lãi suất tiền gửi giảm về 6% (2013-nay) thì người dân sẽ rút tiền ngân hàng về mua bất động sản, chứng khoán tích trữ => Bất động sản, chứng khoán sẽ bắt đầu có thanh khoản, dễ bán, nhiều người quan tâm, đó là giai đoạn bắt đầu phục hồi',N'Hinh6.jpg','01/07/2017','04/05/2019',N'Roger E.A.Farmer','TL02','NXB05'),
('MS07',N'Cây Cam Ngọt Của Tôi',79800,N'Quyển',N'Tiền chảy vào đâu là THIÊN THỜI sáng ở đó. Khi lãi suất huy động 20% tiền sẽ chảy vào ngân hàng lợi nhuận nhiều hơn mua bất động sản. Khi lãi suất tiền gửi giảm về 6% (2013-nay) thì người dân sẽ rút tiền ngân hàng về mua bất động sản, chứng khoán tích trữ => Bất động sản, chứng khoán sẽ bắt đầu có thanh khoản, dễ bán, nhiều người quan tâm, đó là giai đoạn bắt đầu phục hồi',N'Hinh7.jpg','23/07/2016','04/07/2019',N'Nguyễn Bích Lan','TL03','NXB06'),
('MS08',N'Biên Niên Cô Đơn',64000,N'Quyển',N'Sau khi chia tay người cũ, mình mất hết một năm loay hoay trong mớ bòng bong cảm xúc trong lòng. Lúc đó không buồn, cũng chẳng quá đau khổ dằn vặt gì, vẫn cứ sống và làm việc bình thường, thậm chí làm việc còn nhiều hơn trước và thành công hơn trước.',N'Hinh8.jpg','11/11/2020','05/01/2021',N'Nguyễn Ngọc Thạch','TL04','NXB01'),
('MS09',N'Từ Điển Tiếng “Em”',48200,N'Quyển',N'Bạn sẽ bất ngờ, khi cầm cuốn “từ điển” xinh xinh này trên tay. Và sẽ còn ngạc nhiên hơn nữa, khi bắt đầu đọc từng trang sách…Dĩ nhiên là vì “Từ điển tiếng “Em” không phải là một cuốn từ điển thông thường rồi!.',N'Hinh9.jpg','11/10/2020','05/02/2021',N'Khotudien','TL03','NXB08'),
('MS10',N'Phù Thuật Và Tín Ngưỡng An Nam',229100,N'Quyển',N'Phù thuật và tín ngưỡng An Nam không chỉ là một tác phẩm thuần chất nghiên cứu tôn giáo, mà còn là một dẫn nhập về triết lý văn minh của người An Nam!',N'Hinh10.jpg','03/03/2020','05/04/2021',N'Paul Giran','TL04','NXB01'),
('MS11',N'Phân Tích Báo Cáo Tài Chính - Hướng Dẫn Thực Hành',169000,N'Quyển',N'Phân Tích Báo Cáo Tài Chính là một kỹ năng cơ bản của những ai liên quan đến quản lý đầu tư, tài chính doanh nghiệp, tín dụng thương mại và gia hạn tín dụng. Nhiều năm qua, nó trở thành một nỗ lực ngày càng phức tạp vì báo cáo tài chính doanh nghiệp ngày càng trở nên khó giải mã. Nhưng với quyền Phân tích báo cáo tài chính ấn bản lần thứ tư này, bạn đọc sẽ học cách thức xử lý những thách thức mà là một phần của doanh nghiệp trong thực tiễn!',N'Hinh11.jpg','11/03/2013','05/08/2015',N'Fernando Alvarez, Martin Fridson','TL05','NXB03'),
('MS12',N'Giáo Trình Luật Hiến Pháp Việt Nam',110000,N'Quyển',N'GIÁO TRÌNH LUẬT HIẾN PHÁP VIỆT NAM (TÁI BẢN LẦN THỨ 6 CÓ SỬA CHỮA, BỔ SUNG)',N'Hinh12.jpg','11/12/2017','05/08/2018',N'Nhiều tác giả','TL05','NXB04'),
('MS13',N'Giáo Trình Các Lí Thuyết Phát Triển Tâm Lí Người',99750,N'Quyển',N'Giáo trình Các lí thuyết phát triển tâm lí người Phan Trọng Ngọ (Chủ biên) - Lê Minh Nguyệt',N'Hinh13.jpg','11/9/2016','05/03/2019',N'Phan Trọng Ngọ','TL05','NXB08'),
('MS14',N'All In Love - Ngập Tràn Yêu Thương',79600,N'Quyển',N'All in love - Ngập tràn yêu thương là cuốn sách nổi tiếng nhất trong sự nghiệp của tác giả Cố Tây Tước, cuốn sách được xuất bản lần đầu tại Việt Nam vào 2014, liên tục được tái bản và lọt Top sách văn học lãng mạn bán chạy của Tiki trong nhiều năm.',N'Hinh14.jpg','11/9/2017','05/03/2020',N'Cố Tây Tước','TL06','NXB03'),
('MS15',N'Ếch Ộp',56000,N'Quyển',N'Hài hước, mặn mà, bắt sóng nhanh chóng các xu hướng được giới trẻ quan tâm chính là những gì có trong cuốn sách “Ếch ộp – Tuyển tập truyện siêu ngắn”.',N'Hinh15.jpg','01/12/2020','05/03/2021',N' Nguyễn Hưng','TL06','NXB04'),
('MS16',N'Doraemon - Chú Mèo Máy Đến Từ Tương Lai',39900,N'Quyển',N'Doraemon là một trong những nhân vật truyện tranh nổi tiếng nhất thế giới, tại Việt Nam, tác phẩm cũng đã có gần 30 năm đồng hành cùng nhiều thế hệ độc giả.',N'Hinh16.jpg','01/12/1978','15/03/2020',N'Fujiko F Fujio','TL06','NXB04'),
('MS17',N'Muôn Kiếp Nhân Sinh-(Many Lives - Many Times)',67200,N'Quyển',N'“Muôn kiếp nhân sinh” là một bức tranh lớn với vô vàn mảnh ghép cuộc đời, là một cuốn phim đồ sộ, sống động về những kiếp sống huyền bí, trải dài từ nền văn minh Atlantis hùng mạnh đến vương quốc Ai Cập cổ đại của các Pharaoh quyền uy, đến Hợp Chủng Quốc Hoa Kỳ ngày nay.',N'Hinh17.jfif','01/12/2020','01/03/2021',N'Fujiko F Fujio','TL07','NXB05'),
('MS18',N'Giận',95900,N'Quyển',N'Giận là một cuốn sách hay của Thiền sư Thích Nhất Hạnh, nó mở ra cho ta những khả năng kỳ diệu, nhưng lại rất dễ thực hành để ta tự mình từng bướ thoát khỏi cơn giận và sống đẹp với xã hội quanh mình.',N'Hinh18.png','01/05/2020','01/01/2021',N'Thích Nhất Hạnh','TL07','NXB06'),
('MS19',N'Thiền Sư Và Em Bé 5 Tuổi',76600,N'Quyển',N'Trong lòng chúng ta ai cũng có một em bé đang đau khổ. Ai cũng có một thời gian khó khăn khi còn thơ ấu và nhiều người đã trải qua những chấn động tâm lý, những tổn thương lớn mà vết thương còn lưu lại đến bây giờ. Để tự bảo vệ và phòng hộ trước những khổ đau trong tương lai, chúng ta thường cố quên đi thời gian đau lòng đó. Mỗi khi tiếp xúc với những kinh nghiệm khổ đau ấy, chúng ta nghĩ rằng chúng ta sẽ không chịu đựng nổi, sẽ không có khả năng xử lý nên chúng ta nén chặt những cảm xúc và ký ức của mình vào đáy sâu vô thức. Đó có thể là do đã từ lâu chúng ta không đủ can đảm để đối diện với em bé đó.',N'Hinh19.jpg','01/10/2020','01/02/2021',N'Thích Nhất Hạnh','TL07','NXB07'),
('MS20',N'Hoàng Tử Bé',50800,N'Quyển',N'Hoàng tử bé được viết ở New York trong những ngày tác giả sống lưu vong và được xuất bản lần đầu tiên tại New York vào năm 1943, rồi đến năm 1946 mới được xuất bản tại Pháp. Không nghi ngờ gì, đây là tác phẩm nổi tiếng nhất, được đọc nhiều nhất và cũng được yêu mến nhất của Saint-Exupéry. Cuốn sách được bình chọn là tác phẩm hay nhất thế kỉ 20 ở Pháp, đồng thời cũng là cuốn sách Pháp được dịch và được đọc nhiều nhất trên thế giới. Với 250 ngôn ngữ dịch khác nhau kể cả phương ngữ cùng hơn 200 triệu bản in trên toàn thế giới, Hoàng tử bé được coi là một trong những tác phẩm bán chạy nhất của nhân loại.',N'Hinh20.jfif','29/05/2019','01/08/2020',N'Antoine De Saint-Exupéry','TL07','NXB08'),
('MS21',N'Đại Việt Sử Ký Toàn Thư Trọn Bộ',143900,N'Quyển',N'Trong các sách lịch sử cũ của ta , thì " Đại Việt sử ký toàn thư " là một bộ sử lớn chép từ Hồng Bàng đến Ất Mão ( 1675) đời vua Gia Tôn nhà Lê. " Đại Việt sử ký toàn thư " là bộ sách lịch sử quý báu trong tủ sách sử cũ của nước Việt Nam , rất cần thiết cho những người nghiên cứu lịch sử dân tộc.',N'Hinh21.jpg','29/05/2020','01/02/2021',N'Cao Huy Giu','TL04','NXB09'),
('MS22',N'Sapiens Lược Sử Loài Người',223600,N'Quyển',N'Sapiens là một câu chuyện lịch sử lớn về nền văn minh nhân loại – cách chúng ta phát triển từ xã hội săn bắt hái lượm thuở sơ khai đến cách chúng ta tổ chức xã hội và nền kinh tế ngày nay.',N'Hinh22.jpg','30/05/2020','01/03/2021',N' Nina Shapiro, Kristin Loberg','TL04','NXB10')
------TẠO BẢNG QUANTRI

INSERT INTO QUANTRI(EMAIL,MATKHAU,TENHIENTHI)
VALUES
('trungthanh200156@gmail.com','0798783624',N'Nguyễn Thành Trung'),
('dongduy0612@gmail.com','123456789',N'Dương Đông Duy'),
('thuha10032001@gmail.com','123456789',N'Võ Thị Thu Hà')
select *from quantri

------TẠO BẢNG NHAVIEN
INSERT INTO NHANVIEN
VALUES
('NV01',N'Trương Đình Văn',N'TP.HCM','0123.456.789',N'NAM','03/05/2021',11000000),
('NV02',N'Nguyễn Tuấn Kiệt',N'TP.HCM','0789.632.456',N'NAM','01/04/2021',10000000),
('NV03',N'Lê Quang Tuấn',N'TPHCM','1239.568.956',N'Nam','01/02/2021',9000000),
('NV04',N'Trần Khánh Ngọc',N'TPHCM','0785.568.156',N'Nữ','31/03/2020',20000000),
('NV05',N'Nguyễn Nhật My',N'TPHCM','0125.325.635',N'Nữ','14/12/2020',14000000),
('NV06',N'Lê Bảo Hoàng Việt',N'TPHCM','1245.369.852',N'Nam','14/12/2019',15000000),
('NV07',N'Hà Anh Tuấn',N'TPHCM','7856.369.752',N'Nam','14/12/2018',50000000),
('NV08',N'Nguyễn Trần Yến Nhi',N'TPHCM','1247.369.752',N'Nữ','14/12/2017',100000000),
('NV09',N'Trương Văn Tấn Trung',N'TPHCM','784.325.965',N'Nam','14/11/2020',300000000),
('NV10',N'Nguyễn Ngọc Hương',N'TPHCM','4478.325.639',N'Nữ','29/12/2017',400000000)
