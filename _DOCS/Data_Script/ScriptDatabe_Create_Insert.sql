DROP DATABASE IF EXISTS `MOVIETICKET`;

CREATE DATABASE IF NOT EXISTS `MOVIETICKET` CHARACTER SET utf8 COLLATE utf8_unicode_ci;

USE `MOVIETICKET`;

SET
    time_zone = '+07:00';

DROP TABLE IF EXISTS `nguoi_dung`;

CREATE TABLE IF NOT EXISTS `nguoi_dung`(
    `nguoi_dung_id` INT AUTO_INCREMENT,
    `ten_nguoi_dung` VARCHAR(64) NOT NULL,
    `email` VARCHAR(64) NOT NULL,
    `mat_khau` VARCHAR(128) NOT NULL,
    `so_dien_thoai` VARCHAR(16),
    `dia_chi` VARCHAR(128),
    `vai_tro` TINYINT NOT NULL DEFAULT 1,
    PRIMARY KEY (`nguoi_dung_id`)
) ENGINE InnoDB;

DROP TABLE IF EXISTS `ve_dat`;



DROP TABLE IF EXISTS `ve_ban`;

CREATE TABLE IF NOT EXISTS `ve_ban`(
    `ve_ban_id` INT AUTO_INCREMENT,
    `id_phim`VARCHAR(15) NOT NULL,
    `id_phong_chieu` INT UNSIGNED NOT NULL,
    `id_ghe_ngoi` INT UNSIGNED NOT NULL,
    `id_suat_chieu` INT UNSIGNED NOT NULL,
    `ngay_ban` DATETIME NOT NULL,
    `tong_tien` INT(16) UNSIGNED NOT NULL,
    `id_nguoi_dung` INT UNSIGNED NOT NULL,
        `ma_xac_thuc`VARCHAR(15) NOT NULL,
      `trang_thai` bit(1) DEFAULT b'0',
    `ten_phim`VARCHAR(100) NOT NULL,
    `ten_nguoi_dat`VARCHAR(100) NOT NULL,




    PRIMARY KEY (`ve_ban_id`)
) ENGINE InnoDB;

DROP TABLE IF EXISTS `loai_ghe`;

CREATE TABLE IF NOT EXISTS `loai_ghe`(
    `loai_ghe_id` VARCHAR(2) NOT NULL,
    `ten_ghe` VARCHAR(64) NOT NULL,
    `phu_phi` INT(16) UNSIGNED NOT NULL,

    PRIMARY KEY (`loai_ghe_id`)
) ENGINE InnoDB;

DROP TABLE IF EXISTS `ghe_ngoi`;

CREATE TABLE IF NOT EXISTS `ghe_ngoi`(
    `ghe_ngoi_id` INT AUTO_INCREMENT,
    `vi_tri_day` VARCHAR(1) NOT NULL,
    `vi_tri_cot` INT(8),
    `id_phong_chieu` INT UNSIGNED NOT NULL,
    `id_loai_ghe` VARCHAR(2) NOT NULL,
    PRIMARY KEY (`ghe_ngoi_id`)
) ENGINE InnoDB;

DROP TABLE IF EXISTS `phong_chieu`;

CREATE TABLE IF NOT EXISTS `phong_chieu`(
    `phong_chieu_id` INT AUTO_INCREMENT,
    `so_luong_cot` INT(8),
    `so_luong_day` INT(8),
    PRIMARY KEY (`phong_chieu_id`)
) ENGINE InnoDB;

DROP TABLE IF EXISTS `suat_chieu`;

CREATE TABLE IF NOT EXISTS `suat_chieu`(
    `suat_chieu_id` INT AUTO_INCREMENT,
    `gio_bat_dau` DATETIME NOT NULL,
    `gio_ket_thuc` DATETIME NOT NULL,
    `ngay_chieu` DATETIME NOT NULL,
    `id_phim` VARCHAR(15) NOT NULL,
    `id_phong_chieu` INT UNSIGNED NOT NULL,
    `id_dinh_dang_phim` VARCHAR(5) NOT NULL,
    `tien_suat_chieu` INT(16) UNSIGNED NOT NULL,
    PRIMARY KEY (`suat_chieu_id`)
) ENGINE InnoDB;

DROP TABLE IF EXISTS `dinh_dang_phim`;

CREATE TABLE IF NOT EXISTS `dinh_dang_phim`(
    `dinh_dang_phim_id` VARCHAR(5) NOT NULL,
    `ten_dinh_dang_phim` VARCHAR(64) NOT NULL,
    PRIMARY KEY (`dinh_dang_phim_id`)
) ENGINE InnoDB;
DROP TABLE IF EXISTS `phim`;

CREATE TABLE IF NOT EXISTS `phim`(
    `phim_id` VARCHAR(15) NOT NULL,
  `ten_phim` varchar(100) NOT NULL,
  `thoi_luong` int(10) unsigned NOT NULL,
  `gioi_han_tuoi` int(10) unsigned NOT NULL,
  `ngay_cong_chieu` date NOT NULL,
  `ngon_ngu` varchar(20) NOT NULL,
  `dien_vien` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `quoc_gia` varchar(45) NOT NULL,
  `nha_san_xuat` varchar(45) NOT NULL,
  `tom_tat` varchar(1000) DEFAULT NULL,
  `trang_thai` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `da_xoa` bit(1) DEFAULT b'0',
  `hinh_anh` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_loai_phim` int(10) unsigned NOT NULL,

    PRIMARY KEY (`phim_id`)
) ENGINE InnoDB;

DROP TABLE IF EXISTS `binh_luan`;

CREATE TABLE IF NOT EXISTS `binh_luan`(
    `binh_luan_id` INT AUTO_INCREMENT,
    `id_phim` VARCHAR(11) NOT NULL,
    `noi_dung_binh_luan` varchar(1000) DEFAULT NULL,
    `ten_nguoi_binh_luan` varchar(100) NOT NULL,
    `email_nguoi_binh_luan` varchar(100) NOT NULL,
    PRIMARY KEY (`binh_luan_id`)
) ENGINE InnoDB;

DROP TABLE IF EXISTS `loai_phim`;

CREATE TABLE IF NOT EXISTS `loai_phim`(
    `loai_phim_id` INT AUTO_INCREMENT,
    `ten_loai_phim` VARCHAR(64) NOT NULL,
    PRIMARY KEY (`loai_phim_id`)
) ENGINE InnoDB;

#password default Abc@1234
INSERT INTO
    `nguoi_dung` (
        nguoi_dung_id,
        ten_nguoi_dung,
        email,
        mat_khau,
        so_dien_thoai,
        dia_chi,
        vai_tro
    )
VALUES
    (
        1,
        'Nguyễn Văn A',
        'nguyenvana@gmail.com',
        '10b8e822d03fb4fd946188e852a4c3e2',
        '022110456',
        'Hà Nội',
        1
    );

INSERT INTO
    `nguoi_dung` (
        nguoi_dung_id,
        ten_nguoi_dung,
        email,
        mat_khau,
        so_dien_thoai,
        dia_chi,
        vai_tro
    )
VALUES
    (
        2,
        'admin',
        'admin@gmail.com',
        '10b8e822d03fb4fd946188e852a4c3e2',
        '022110456',
        'Hà Nội',
        2
    );

INSERT INTO
    `loai_ghe`
VALUES
    ('GT', 'Ghế thường',0);

INSERT INTO
    `loai_ghe`
VALUES
    ('GV', 'Ghế đặc biệt',35000);

INSERT INTO
    `ghe_ngoi`
VALUES
    (1, 'A', 1, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (2, 'A', 2, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (3, 'A', 3, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (4, 'A', 4, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (5, 'A', 5, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (6, 'A', 6, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (7, 'A', 7, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (8, 'A', 8, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (9, 'A', 9, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (10, 'A', 10, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (11, 'A', 11, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (12, 'A', 12, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (13, 'A', 13, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (14, 'A', 14, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (15, 'A', 15, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (16, 'A', 16, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (17, 'A', 17, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (18, 'A', 18, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (19, 'B', 1, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (20, 'B', 2, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (21, 'B', 3, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (22, 'B', 4, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (23, 'B', 5, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (24, 'B', 6, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (25, 'B', 7, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (26, 'B', 8, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (27, 'B', 9, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (28, 'B', 10, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (29, 'B', 11, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (30, 'B', 12, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (31, 'B', 13, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (32, 'B', 14, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (33, 'B', 15, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (34, 'B', 16, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (35, 'B', 17, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (36, 'B', 18, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (37, 'C', 1, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (38, 'C', 2, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (39, 'C', 3, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (40, 'C', 4, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (41, 'C', 5, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (42, 'C', 6, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (43, 'C', 7, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (44, 'C', 8, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (45, 'C', 9, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (46, 'C', 10, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (47, 'C', 11, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (48, 'C', 12, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (49, 'C', 13, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (50, 'C', 14, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (51, 'C', 15, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (52, 'C', 16, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (53, 'C', 17, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (54, 'C', 18, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (55, 'D', 1, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (56, 'D', 2, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (57, 'D', 3, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (58, 'D', 4, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (59, 'D', 5, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (60, 'D', 6, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (61, 'D', 7, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (62, 'D', 8, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (63, 'D', 9, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (64, 'D', 10, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (65, 'D', 11, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (66, 'D', 12, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (67, 'D', 13, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (68, 'D', 14, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (69, 'D', 15, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (70, 'D', 16, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (71, 'D', 17, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (72, 'D', 18, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (73, 'E', 1, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (74, 'E', 2, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (75, 'E', 3, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (76, 'E', 4, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (77, 'E', 5, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (78, 'E', 6, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (79, 'E', 7, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (80, 'E', 8, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (81, 'E', 9, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (82, 'E', 10, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (83, 'E', 11, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (84, 'E', 12, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (85, 'E', 13, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (86, 'E', 14, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (87, 'E', 15, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (88, 'E', 16, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (89, 'E', 17, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (90, 'E', 18, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (91, 'F', 1, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (92, 'F', 2, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (93, 'F', 3, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (94, 'F', 4, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (95, 'F', 5, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (96, 'F', 6, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (97, 'F', 7, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (98, 'F', 8, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (99, 'F', 9, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (100, 'F', 10, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (101, 'F', 11, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (102, 'F', 12, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (103, 'F', 13, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (104, 'F', 14, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (105, 'F', 15, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (106, 'F', 16, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (107, 'F', 17, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (108, 'F', 18, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (109, 'G', 1, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (110, 'G', 2, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (111, 'G', 3, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (112, 'G', 4, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (113, 'G', 5, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (114, 'G', 6, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (115, 'G', 7, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (116, 'G', 8, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (117, 'G', 9, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (118, 'G', 10, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (119, 'G', 11, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (120, 'G', 12, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (121, 'G', 13, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (122, 'G', 14, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (123, 'G', 15, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (124, 'G', 16, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (125, 'G', 17, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (126, 'G', 18, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (127, 'H', 1, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (128, 'H', 2, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (129, 'H', 3, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (130, 'H', 4, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (131, 'H', 5, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (132, 'H', 6, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (133, 'H', 7, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (134, 'H', 8, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (135, 'H', 9, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (136, 'H', 10, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (137, 'H', 11, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (138, 'H', 12, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (139, 'H', 13, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (140, 'H', 14, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (141, 'H', 15, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (142, 'H', 16, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (143, 'H', 17, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (144, 'H', 18, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (145, 'I', 1, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (146, 'I', 2, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (147, 'I', 3, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (148, 'I', 4, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (149, 'I', 5, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (150, 'I', 6, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (151, 'I', 7, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (152, 'I', 8, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (153, 'I', 9, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (154, 'I', 10, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (155, 'I', 11, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (156, 'I', 12, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (157, 'I', 13, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (158, 'I', 14, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (159, 'I', 15, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (160, 'I', 16, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (161, 'I', 17, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (162, 'I', 18, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (163, 'J', 1, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (164, 'J', 2, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (165, 'J', 3, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (166, 'J', 4, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (167, 'J', 5, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (168, 'J', 6, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (169, 'J', 7, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (170, 'J', 8, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (171, 'J', 9, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (172, 'J', 10, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (173, 'J', 11, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (174, 'J', 12, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (175, 'J', 13, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (176, 'J', 14, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (177, 'J', 15, 1, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (178, 'J', 16, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (179, 'J', 17, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (180, 'J', 18, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (181, 'K', 1, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (182, 'K', 2, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (183, 'K', 3, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (184, 'K', 4, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (185, 'K', 5, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (186, 'K', 6, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (187, 'K', 7, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (188, 'K', 8, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (189, 'K', 9, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (190, 'K', 10, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (191, 'K', 11, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (192, 'K', 12, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (193, 'K', 13, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (194, 'K', 14, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (195, 'K', 15, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (196, 'K', 16, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (197, 'K', 17, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (198, 'K', 18, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (199, 'L', 1, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (200, 'L', 2, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (201, 'L', 3, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (202, 'L', 4, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (203, 'L', 5, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (204, 'L', 6, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (205, 'L', 7, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (206, 'L', 8, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (207, 'L', 9, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (208, 'L', 10, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (209, 'L', 11, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (210, 'L', 12, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (211, 'L', 13, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (212, 'L', 14, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (213, 'L', 15, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (214, 'L', 16, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (215, 'L', 17, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (216, 'L', 18, 1, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (217, 'A', 1, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (218, 'A', 2, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (219, 'A', 3, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (220, 'A', 4, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (221, 'A', 5, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (222, 'A', 6, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (223, 'A', 7, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (224, 'A', 8, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (225, 'A', 9, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (226, 'A', 10, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (227, 'A', 11, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (228, 'A', 12, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (229, 'A', 13, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (230, 'A', 14, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (231, 'A', 15, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (232, 'A', 16, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (233, 'B', 1, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (234, 'B', 2, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (235, 'B', 3, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (236, 'B', 4, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (237, 'B', 5, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (238, 'B', 6, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (239, 'B', 7, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (240, 'B', 8, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (241, 'B', 9, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (242, 'B', 10, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (243, 'B', 11, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (244, 'B', 12, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (245, 'B', 13, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (246, 'B', 14, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (247, 'B', 15, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (248, 'B', 16, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (249, 'C', 1, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (250, 'C', 2, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (251, 'C', 3, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (252, 'C', 4, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (253, 'C', 5, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (254, 'C', 6, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (255, 'C', 7, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (256, 'C', 8, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (257, 'C', 9, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (258, 'C', 10, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (259, 'C', 11, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (260, 'C', 12, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (261, 'C', 13, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (262, 'C', 14, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (263, 'C', 15, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (264, 'C', 16, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (265, 'D', 1, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (266, 'D', 2, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (267, 'D', 3, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (268, 'D', 4, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (269, 'D', 5, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (270, 'D', 6, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (271, 'D', 7, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (272, 'D', 8, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (273, 'D', 9, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (274, 'D', 10, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (275, 'D', 11, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (276, 'D', 12, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (277, 'D', 13, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (278, 'D', 14, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (279, 'D', 15, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (280, 'D', 16, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (281, 'E', 1, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (282, 'E', 2, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (283, 'E', 3, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (284, 'E', 4, 2, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (285, 'E', 5, 2, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (286, 'E', 6, 2, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (287, 'E', 7, 2, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (288, 'E', 8, 2, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (289, 'E', 9, 2, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (290, 'E', 10, 2, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (291, 'E', 11, 2, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (292, 'E', 12, 2, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (293, 'E', 13, 2, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (294, 'E', 14, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (295, 'E', 15, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (296, 'E', 16, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (297, 'F', 1, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (298, 'F', 2, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (299, 'F', 3, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (300, 'F', 4, 2, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (301, 'F', 5, 2, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (302, 'F', 6, 2, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (303, 'F', 7, 2, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (304, 'F', 8, 2, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (305, 'F', 9, 2, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (306, 'F', 10, 2, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (307, 'F', 11, 2, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (308, 'F', 12, 2, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (309, 'F', 13, 2, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (310, 'F', 14, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (311, 'F', 15, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (312, 'F', 16, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (313, 'G', 1, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (314, 'G', 2, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (315, 'G', 3, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (316, 'G', 4, 2, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (317, 'G', 5, 2, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (318, 'G', 6, 2, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (319, 'G', 7, 2, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (320, 'G', 8, 2, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (321, 'G', 9, 2, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (322, 'G', 10, 2, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (323, 'G', 11, 2, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (324, 'G', 12, 2, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (325, 'G', 13, 2, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (326, 'G', 14, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (327, 'G', 15, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (328, 'G', 16, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (329, 'H', 1, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (330, 'H', 2, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (331, 'H', 3, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (332, 'H', 4, 2, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (333, 'H', 5, 2, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (334, 'H', 6, 2, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (335, 'H', 7, 2, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (336, 'H', 8, 2, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (337, 'H', 9, 2, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (338, 'H', 10, 2, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (339, 'H', 11, 2, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (340, 'H', 12, 2, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (341, 'H', 13, 2, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (342, 'H', 14, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (343, 'H', 15, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (344, 'H', 16, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (345, 'I', 1, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (346, 'I', 2, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (347, 'I', 3, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (348, 'I', 4, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (349, 'I', 5, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (350, 'I', 6, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (351, 'I', 7, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (352, 'I', 8, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (353, 'I', 9, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (354, 'I', 10, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (355, 'I', 11, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (356, 'I', 12, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (357, 'I', 13, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (358, 'I', 14, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (359, 'I', 15, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (360, 'I', 16, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (361, 'J', 1, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (362, 'J', 2, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (363, 'J', 3, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (364, 'J', 4, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (365, 'J', 5, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (366, 'J', 6, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (367, 'J', 7, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (368, 'J', 8, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (369, 'J', 9, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (370, 'J', 10, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (371, 'J', 11, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (372, 'J', 12, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (373, 'J', 13, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (374, 'J', 14, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (375, 'J', 15, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (376, 'J', 16, 2, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (377, 'A', 1, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (378, 'A', 2, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (379, 'A', 3, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (380, 'A', 4, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (381, 'A', 5, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (382, 'A', 6, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (383, 'A', 7, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (384, 'A', 8, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (385, 'A', 9, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (386, 'A', 10, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (387, 'A', 11, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (388, 'A', 12, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (389, 'A', 13, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (390, 'A', 14, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (391, 'B', 1, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (392, 'B', 2, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (393, 'B', 3, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (394, 'B', 4, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (395, 'B', 5, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (396, 'B', 6, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (397, 'B', 7, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (398, 'B', 8, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (399, 'B', 9, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (400, 'B', 10, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (401, 'B', 11, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (402, 'B', 12, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (403, 'B', 13, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (404, 'B', 14, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (405, 'C', 1, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (406, 'C', 2, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (407, 'C', 3, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (408, 'C', 4, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (409, 'C', 5, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (410, 'C', 6, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (411, 'C', 7, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (412, 'C', 8, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (413, 'C', 9, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (414, 'C', 10, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (415, 'C', 11, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (416, 'C', 12, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (417, 'C', 13, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (418, 'C', 14, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (419, 'D', 1, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (420, 'D', 2, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (421, 'D', 3, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (422, 'D', 4, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (423, 'D', 5, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (424, 'D', 6, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (425, 'D', 7, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (426, 'D', 8, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (427, 'D', 9, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (428, 'D', 10, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (429, 'D', 11, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (430, 'D', 12, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (431, 'D', 13, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (432, 'D', 14, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (433, 'E', 1, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (434, 'E', 2, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (435, 'E', 3, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (436, 'E', 4, 3, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (437, 'E', 5, 3, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (438, 'E', 6, 3, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (439, 'E', 7, 3, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (440, 'E', 8, 3, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (441, 'E', 9, 3, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (442, 'E', 10, 3, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (443, 'E', 11, 3, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (444, 'E', 12, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (445, 'E', 13, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (446, 'E', 14, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (447, 'F', 1, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (448, 'F', 2, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (449, 'F', 3, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (450, 'F', 4, 3, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (451, 'F', 5, 3, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (452, 'F', 6, 3, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (453, 'F', 7, 3, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (454, 'F', 8, 3, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (455, 'F', 9, 3, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (456, 'F', 10, 3, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (457, 'F', 11, 3, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (458, 'F', 12, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (459, 'F', 13, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (460, 'F', 14, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (461, 'G', 1, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (462, 'G', 2, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (463, 'G', 3, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (464, 'G', 4, 3, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (465, 'G', 5, 3, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (466, 'G', 6, 3, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (467, 'G', 7, 3, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (468, 'G', 8, 3, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (469, 'G', 9, 3, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (470, 'G', 10, 3, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (471, 'G', 11, 3, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (472, 'G', 12, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (473, 'G', 13, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (474, 'G', 14, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (475, 'H', 1, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (476, 'H', 2, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (477, 'H', 3, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (478, 'H', 4, 3, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (479, 'H', 5, 3, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (480, 'H', 6, 3, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (481, 'H', 7, 3, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (482, 'H', 8, 3, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (483, 'H', 9, 3, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (484, 'H', 10, 3, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (485, 'H', 11, 3, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (486, 'H', 12, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (487, 'H', 13, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (488, 'H', 14, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (489, 'I', 1, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (490, 'I', 2, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (491, 'I', 3, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (492, 'I', 4, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (493, 'I', 5, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (494, 'I', 6, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (495, 'I', 7, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (496, 'I', 8, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (497, 'I', 9, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (498, 'I', 10, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (499, 'I', 11, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (500, 'I', 12, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (501, 'I', 13, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (502, 'I', 14, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (503, 'J', 1, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (504, 'J', 2, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (505, 'J', 3, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (506, 'J', 4, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (507, 'J', 5, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (508, 'J', 6, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (509, 'J', 7, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (510, 'J', 8, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (511, 'J', 9, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (512, 'J', 10, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (513, 'J', 11, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (514, 'J', 12, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (515, 'J', 13, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (516, 'J', 14, 3, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (517, 'A', 1, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (518, 'A', 2, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (519, 'A', 3, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (520, 'A', 4, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (521, 'A', 5, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (522, 'A', 6, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (523, 'A', 7, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (524, 'A', 8, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (525, 'A', 9, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (526, 'A', 10, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (527, 'A', 11, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (528, 'A', 12, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (529, 'A', 13, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (530, 'A', 14, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (531, 'A', 15, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (532, 'A', 16, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (533, 'B', 1, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (534, 'B', 2, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (535, 'B', 3, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (536, 'B', 4, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (537, 'B', 5, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (538, 'B', 6, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (539, 'B', 7, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (540, 'B', 8, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (541, 'B', 9, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (542, 'B', 10, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (543, 'B', 11, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (544, 'B', 12, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (545, 'B', 13, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (546, 'B', 14, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (547, 'B', 15, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (548, 'B', 16, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (549, 'C', 1, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (550, 'C', 2, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (551, 'C', 3, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (552, 'C', 4, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (553, 'C', 5, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (554, 'C', 6, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (555, 'C', 7, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (556, 'C', 8, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (557, 'C', 9, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (558, 'C', 10, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (559, 'C', 11, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (560, 'C', 12, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (561, 'C', 13, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (562, 'C', 14, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (563, 'C', 15, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (564, 'C', 16, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (565, 'D', 1, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (566, 'D', 2, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (567, 'D', 3, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (568, 'D', 4, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (569, 'D', 5, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (570, 'D', 6, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (571, 'D', 7, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (572, 'D', 8, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (573, 'D', 9, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (574, 'D', 10, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (575, 'D', 11, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (576, 'D', 12, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (577, 'D', 13, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (578, 'D', 14, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (579, 'D', 15, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (580, 'D', 16, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (581, 'E', 1, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (582, 'E', 2, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (583, 'E', 3, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (584, 'E', 4, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (585, 'E', 5, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (586, 'E', 6, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (587, 'E', 7, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (588, 'E', 8, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (589, 'E', 9, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (590, 'E', 10, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (591, 'E', 11, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (592, 'E', 12, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (593, 'E', 13, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (594, 'E', 14, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (595, 'E', 15, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (596, 'E', 16, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (597, 'F', 1, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (598, 'F', 2, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (599, 'F', 3, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (600, 'F', 4, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (601, 'F', 5, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (602, 'F', 6, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (603, 'F', 7, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (604, 'F', 8, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (605, 'F', 9, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (606, 'F', 10, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (607, 'F', 11, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (608, 'F', 12, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (609, 'F', 13, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (610, 'F', 14, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (611, 'F', 15, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (612, 'F', 16, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (613, 'G', 1, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (614, 'G', 2, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (615, 'G', 3, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (616, 'G', 4, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (617, 'G', 5, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (618, 'G', 6, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (619, 'G', 7, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (620, 'G', 8, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (621, 'G', 9, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (622, 'G', 10, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (623, 'G', 11, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (624, 'G', 12, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (625, 'G', 13, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (626, 'G', 14, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (627, 'G', 15, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (628, 'G', 16, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (629, 'H', 1, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (630, 'H', 2, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (631, 'H', 3, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (632, 'H', 4, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (633, 'H', 5, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (634, 'H', 6, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (635, 'H', 7, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (636, 'H', 8, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (637, 'H', 9, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (638, 'H', 10, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (639, 'H', 11, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (640, 'H', 12, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (641, 'H', 13, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (642, 'H', 14, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (643, 'H', 15, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (644, 'H', 16, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (645, 'I', 1, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (646, 'I', 2, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (647, 'I', 3, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (648, 'I', 4, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (649, 'I', 5, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (650, 'I', 6, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (651, 'I', 7, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (652, 'I', 8, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (653, 'I', 9, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (654, 'I', 10, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (655, 'I', 11, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (656, 'I', 12, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (657, 'I', 13, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (658, 'I', 14, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (659, 'I', 15, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (660, 'I', 16, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (661, 'J', 1, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (662, 'J', 2, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (663, 'J', 3, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (664, 'J', 4, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (665, 'J', 5, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (666, 'J', 6, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (667, 'J', 7, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (668, 'J', 8, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (669, 'J', 9, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (670, 'J', 10, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (671, 'J', 11, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (672, 'J', 12, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (673, 'J', 13, 4, 'GV');

INSERT INTO
    `ghe_ngoi`
VALUES
    (674, 'J', 14, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (675, 'J', 15, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (676, 'J', 16, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (677, 'K', 1, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (678, 'K', 2, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (679, 'K', 3, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (680, 'K', 4, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (681, 'K', 5, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (682, 'K', 6, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (683, 'K', 7, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (684, 'K', 8, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (685, 'K', 9, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (686, 'K', 10, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (687, 'K', 11, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (688, 'K', 12, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (689, 'K', 13, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (690, 'K', 14, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (691, 'K', 15, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (692, 'K', 16, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (693, 'L', 1, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (694, 'L', 2, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (695, 'L', 3, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (696, 'L', 4, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (697, 'L', 5, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (698, 'L', 6, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (699, 'L', 7, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (700, 'L', 8, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (701, 'L', 9, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (702, 'L', 10, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (703, 'L', 11, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (704, 'L', 12, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (705, 'L', 13, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (706, 'L', 14, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (707, 'L', 15, 4, 'GT');

INSERT INTO
    `ghe_ngoi`
VALUES
    (708, 'L', 16, 4, 'GT');

INSERT INTO
    `phong_chieu`
VALUES
    (1, 12, 18);

INSERT INTO
    `phong_chieu`
VALUES
    (2, 10, 16);

INSERT INTO
    `phong_chieu`
VALUES
    (3, 10, 14);

INSERT INTO
    `phong_chieu`
VALUES
    (4, 12, 16);

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000001',
        '2018-05-01 08:30:00',
        '2018-05-01 10:30:00',
        '2018-05-01',
        'PH00001',
        1,
        'IMAX'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000002',
        '2018-05-01 10:45:00',
        '2018-05-01 12:45:00',
        '2018-05-01',
        'PH00006',
        1,
        '2D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000003',
        '2018-05-01 13:00:00',
        '2018-05-01 15:00:00',
        '2018-05-01',
        'PH00001',
        1,
        '3D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000004',
        '2018-05-01 15:15:00',
        '2018-05-01 17:15:00',
        '2018-05-01',
        'PH00006',
        1,
        'IMAX'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000005',
        '2018-05-01 17:30:00',
        '2018-05-01 19:30:00',
        '2018-05-01',
        'PH00001',
        1,
        '2D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000006',
        '2018-05-01 19:45:00',
        '2018-05-01 21:45:00',
        '2018-05-01',
        'PH00006',
        1,
        '4D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000007',
        '2018-05-01 22:00:00',
        '2018-05-02 00:00:00',
        '2018-05-01',
        'PH00001',
        1,
        'IMAX'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000008',
        '2018-05-01 08:30:00',
        '2018-05-01 10:40:00',
        '2018-05-01',
        'PH00002',
        2,
        '3D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000009',
        '2018-05-01 10:55:00',
        '2018-05-01 13:05:00',
        '2018-05-01',
        'PH00002',
        2,
        '2D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000010',
        '2018-05-01 13:20:00',
        '2018-05-01 15:30:00',
        '2018-05-01',
        'PH00002',
        2,
        '2D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000011',
        '2018-05-01 15:45:00',
        '2018-05-01 17:55:00',
        '2018-05-01',
        'PH00002',
        2,
        '2D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000012',
        '2018-05-01 18:10:00',
        '2018-05-01 20:20:00',
        '2018-05-01',
        'PH00002',
        2,
        '2D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000013',
        '2018-05-01 20:35:00',
        '2018-05-01 22:45:00',
        '2018-05-01',
        'PH00002',
        2,
        '3D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000014',
        '2018-05-01 08:30:00',
        '2018-05-01 10:10:00',
        '2018-05-01',
        'PH00003',
        3,
        '3D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000015',
        '2018-05-01 10:25:00',
        '2018-05-01 12:05:00',
        '2018-05-01',
        'PH00003',
        3,
        '2D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000016',
        '2018-05-01 12:20:00',
        '2018-05-01 14:00:00',
        '2018-05-01',
        'PH00003',
        3,
        'IMAX'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000017',
        '2018-05-01 14:15:00',
        '2018-05-01 15:55:00',
        '2018-05-01',
        'PH00003',
        3,
        'IMAX'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000018',
        '2018-05-01 16:10:00',
        '2018-05-01 17:50:00',
        '2018-05-01',
        'PH00003',
        3,
        '4D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000019',
        '2018-05-01 18:05:00',
        '2018-05-01 19:45:00',
        '2018-05-01',
        'PH00003',
        3,
        '3D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000020',
        '2018-05-01 20:00:00',
        '2018-05-01 21:40:00',
        '2018-05-01',
        'PH00003',
        3,
        '2D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000021',
        '2018-05-01 21:55:00',
        '2018-05-01 23:35:00',
        '2018-05-01',
        'PH00003',
        3,
        '2D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000022',
        '2018-05-01 08:30:00',
        '2018-05-01 10:10:00',
        '2018-05-01',
        'PH00004',
        4,
        '4D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000023',
        '2018-05-01 10:25:00',
        '2018-05-01 12:05:00',
        '2018-05-01',
        'PH00004',
        4,
        '3D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000024',
        '2018-05-01 12:20:00',
        '2018-05-01 14:00:00',
        '2018-05-01',
        'PH00004',
        4,
        '3D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000025',
        '2018-05-01 14:15:00',
        '2018-05-01 15:55:00',
        '2018-05-01',
        'PH00004',
        4,
        '2D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000026',
        '2018-05-01 16:10:00',
        '2018-05-01 17:50:00',
        '2018-05-01',
        'PH00004',
        4,
        '4D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000027',
        '2018-05-01 18:05:00',
        '2018-05-01 19:45:00',
        '2018-05-01',
        'PH00004',
        4,
        '2D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000028',
        '2018-05-01 20:00:00',
        '2018-05-01 21:40:00',
        '2018-05-01',
        'PH00004',
        4,
        '2D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000029',
        '2018-05-01 21:55:00',
        '2018-05-01 23:35:00',
        '2018-05-01',
        'PH00004',
        4,
        '2D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000030',
        '2018-05-02 08:30:00',
        '2018-05-02 10:30:00',
        '2018-05-02',
        'PH00001',
        1,
        '3D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000031',
        '2018-05-02 10:45:00',
        '2018-05-02 12:45:00',
        '2018-05-02',
        'PH00006',
        1,
        'IMAX'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000032',
        '2018-05-02 13:00:00',
        '2018-05-02 15:00:00',
        '2018-05-02',
        'PH00001',
        1,
        '2D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000033',
        '2018-05-02 15:15:00',
        '2018-05-02 17:15:00',
        '2018-05-02',
        'PH00006',
        1,
        '3D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000034',
        '2018-05-02 17:30:00',
        '2018-05-02 19:30:00',
        '2018-05-02',
        'PH00001',
        1,
        '2D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000035',
        '2018-05-02 19:45:00',
        '2018-05-02 21:45:00',
        '2018-05-02',
        'PH00006',
        1,
        '2D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000036',
        '2018-05-02 22:00:00',
        '2018-05-03 00:00:00',
        '2018-05-02',
        'PH00001',
        1,
        'IMAX'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000037',
        '2018-05-02 08:30:00',
        '2018-05-02 10:40:00',
        '2018-05-02',
        'PH00002',
        2,
        '2D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000038',
        '2018-05-02 10:55:00',
        '2018-05-02 13:05:00',
        '2018-05-02',
        'PH00002',
        2,
        '4D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000039',
        '2018-05-02 13:20:00',
        '2018-05-02 15:30:00',
        '2018-05-02',
        'PH00002',
        2,
        '2D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000040',
        '2018-05-02 15:45:00',
        '2018-05-02 17:55:00',
        '2018-05-02',
        'PH00002',
        2,
        '4D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000041',
        '2018-05-02 18:10:00',
        '2018-05-02 20:20:00',
        '2018-05-02',
        'PH00002',
        2,
        '2D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000042',
        '2018-05-02 20:35:00',
        '2018-05-02 22:45:00',
        '2018-05-02',
        'PH00002',
        2,
        'IMAX'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000043',
        '2018-05-02 08:30:00',
        '2018-05-02 10:10:00',
        '2018-05-02',
        'PH00003',
        3,
        'IMAX'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000044',
        '2018-05-02 10:25:00',
        '2018-05-02 12:05:00',
        '2018-05-02',
        'PH00003',
        3,
        'IMAX'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000045',
        '2018-05-02 12:20:00',
        '2018-05-02 14:00:00',
        '2018-05-02',
        'PH00003',
        3,
        'IMAX'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000046',
        '2018-05-02 14:15:00',
        '2018-05-02 15:55:00',
        '2018-05-02',
        'PH00003',
        3,
        '3D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000047',
        '2018-05-02 16:10:00',
        '2018-05-02 17:50:00',
        '2018-05-02',
        'PH00003',
        3,
        '4D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000048',
        '2018-05-02 18:05:00',
        '2018-05-02 19:45:00',
        '2018-05-02',
        'PH00003',
        3,
        '2D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000049',
        '2018-05-02 20:00:00',
        '2018-05-02 21:40:00',
        '2018-05-02',
        'PH00003',
        3,
        '2D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000050',
        '2018-05-02 21:55:00',
        '2018-05-02 23:35:00',
        '2018-05-02',
        'PH00003',
        3,
        'IMAX'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000051',
        '2018-05-02 08:30:00',
        '2018-05-02 10:10:00',
        '2018-05-02',
        'PH00004',
        4,
        '2D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000052',
        '2018-05-02 10:25:00',
        '2018-05-02 12:05:00',
        '2018-05-02',
        'PH00004',
        4,
        '4D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000053',
        '2018-05-02 12:20:00',
        '2018-05-02 14:00:00',
        '2018-05-02',
        'PH00004',
        4,
        '4D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000054',
        '2018-05-02 14:15:00',
        '2018-05-02 15:55:00',
        '2018-05-02',
        'PH00004',
        4,
        '3D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000055',
        '2018-05-02 16:10:00',
        '2018-05-02 17:50:00',
        '2018-05-02',
        'PH00004',
        4,
        '3D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000056',
        '2018-05-02 18:05:00',
        '2018-05-02 19:45:00',
        '2018-05-02',
        'PH00004',
        4,
        '3D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000057',
        '2018-05-02 20:00:00',
        '2018-05-02 21:40:00',
        '2018-05-02',
        'PH00004',
        4,
        '4D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000058',
        '2018-05-02 21:55:00',
        '2018-05-02 23:35:00',
        '2018-05-02',
        'PH00004',
        4,
        'IMAX'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000059',
        '2018-05-03 08:30:00',
        '2018-05-03 10:30:00',
        '2018-05-03',
        'PH00001',
        1,
        '3D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000060',
        '2018-05-03 10:45:00',
        '2018-05-03 12:45:00',
        '2018-05-03',
        'PH00006',
        1,
        '3D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000061',
        '2018-05-03 13:00:00',
        '2018-05-03 15:00:00',
        '2018-05-03',
        'PH00001',
        1,
        'IMAX'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000062',
        '2018-05-03 15:15:00',
        '2018-05-03 17:15:00',
        '2018-05-03',
        'PH00006',
        1,
        '3D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000063',
        '2018-05-03 17:30:00',
        '2018-05-03 19:30:00',
        '2018-05-03',
        'PH00001',
        1,
        '2D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000064',
        '2018-05-03 19:45:00',
        '2018-05-03 21:45:00',
        '2018-05-03',
        'PH00006',
        1,
        '4D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000065',
        '2018-05-03 22:00:00',
        '2018-05-04 00:00:00',
        '2018-05-03',
        'PH00001',
        1,
        '3D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000066',
        '2018-05-03 08:30:00',
        '2018-05-03 10:40:00',
        '2018-05-03',
        'PH00002',
        2,
        '3D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000067',
        '2018-05-03 10:55:00',
        '2018-05-03 13:05:00',
        '2018-05-03',
        'PH00002',
        2,
        '3D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000068',
        '2018-05-03 13:20:00',
        '2018-05-03 15:30:00',
        '2018-05-03',
        'PH00002',
        2,
        'IMAX'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000069',
        '2018-05-03 15:45:00',
        '2018-05-03 17:55:00',
        '2018-05-03',
        'PH00002',
        2,
        '3D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000070',
        '2018-05-03 18:10:00',
        '2018-05-03 20:20:00',
        '2018-05-03',
        'PH00002',
        2,
        'IMAX'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000071',
        '2018-05-03 20:35:00',
        '2018-05-03 22:45:00',
        '2018-05-03',
        'PH00002',
        2,
        '2D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000072',
        '2018-05-03 08:30:00',
        '2018-05-03 10:10:00',
        '2018-05-03',
        'PH00003',
        3,
        '3D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000073',
        '2018-05-03 10:25:00',
        '2018-05-03 12:05:00',
        '2018-05-03',
        'PH00003',
        3,
        '4D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000074',
        '2018-05-03 12:20:00',
        '2018-05-03 14:00:00',
        '2018-05-03',
        'PH00003',
        3,
        '3D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000075',
        '2018-05-03 14:15:00',
        '2018-05-03 15:55:00',
        '2018-05-03',
        'PH00003',
        3,
        '3D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000076',
        '2018-05-03 16:10:00',
        '2018-05-03 17:50:00',
        '2018-05-03',
        'PH00003',
        3,
        '4D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000077',
        '2018-05-03 18:05:00',
        '2018-05-03 19:45:00',
        '2018-05-03',
        'PH00003',
        3,
        '3D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000078',
        '2018-05-03 20:00:00',
        '2018-05-03 21:40:00',
        '2018-05-03',
        'PH00003',
        3,
        '3D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000079',
        '2018-05-03 21:55:00',
        '2018-05-03 23:35:00',
        '2018-05-03',
        'PH00003',
        3,
        '2D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000080',
        '2018-05-03 08:30:00',
        '2018-05-03 10:10:00',
        '2018-05-03',
        'PH00004',
        4,
        '4D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000081',
        '2018-05-03 10:25:00',
        '2018-05-03 12:05:00',
        '2018-05-03',
        'PH00004',
        4,
        '4D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000082',
        '2018-05-03 12:20:00',
        '2018-05-03 14:00:00',
        '2018-05-03',
        'PH00004',
        4,
        '3D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000083',
        '2018-05-03 14:15:00',
        '2018-05-03 15:55:00',
        '2018-05-03',
        'PH00004',
        4,
        '4D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000084',
        '2018-05-03 16:10:00',
        '2018-05-03 17:50:00',
        '2018-05-03',
        'PH00004',
        4,
        'IMAX'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000085',
        '2018-05-03 18:05:00',
        '2018-05-03 19:45:00',
        '2018-05-03',
        'PH00004',
        4,
        'IMAX'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000086',
        '2018-05-03 20:00:00',
        '2018-05-03 21:40:00',
        '2018-05-03',
        'PH00004',
        4,
        'IMAX'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000087',
        '2018-05-03 21:55:00',
        '2018-05-03 23:35:00',
        '2018-05-03',
        'PH00004',
        4,
        '2D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000088',
        '2018-05-04 08:30:00',
        '2018-05-04 10:30:00',
        '2018-05-04',
        'PH00001',
        1,
        '2D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000089',
        '2018-05-04 10:45:00',
        '2018-05-04 12:45:00',
        '2018-05-04',
        'PH00006',
        1,
        '3D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000090',
        '2018-05-04 13:00:00',
        '2018-05-04 15:00:00',
        '2018-05-04',
        'PH00001',
        1,
        '3D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000091',
        '2018-05-04 15:15:00',
        '2018-05-04 17:15:00',
        '2018-05-04',
        'PH00006',
        1,
        '3D'
   ,100000 );

INSERT INTO
    `suat_chieu`
VALUES
    (
        'SC00000092',
        '2018-05-04 17:30:00',
        '2018-05-04 19:30:00',
        '2018-05-04',
        'PH00001',
        1,
        '3D',
        100000
    );

INSERT INTO
    `dinh_dang_phim`
VALUES
    ('2D', 'Định dạng 2D');

INSERT INTO
    `dinh_dang_phim`
VALUES
    ('3D', 'Định dạng 3D');

INSERT INTO
    `dinh_dang_phim`
VALUES
    ('4D', 'Định dạng 4D');

INSERT INTO
    `dinh_dang_phim`
VALUES
    ('IMAX', 'Định dạng IMAX');


INSERT INTO `phim` VALUES ('PH00001', 'Thám Tử Conan :Kẻ Hành Pháp Zero', 120, 13, '2018-01-01', 'Tiếng Anh', 'Đang cập nhật.', 'Mỹ', 'George Lucas', 'Conan Movie 22 xoay quanh nhân vật Tooru \"Zero\" Amuro và nghi vấn cảnh sát trưởng Kuroda là một trong những thành phần của tổ chức áo đen.', 'Ngừng chiếu', b'0', '1-201804928.jpg', 27);
INSERT INTO `phim` VALUES ('PH00002', 'Cớm Tốt Cớm Xấu 2', 130, 13, '2018-01-01', 'Tiếng Anh', 'Colm Feore, Erik Knudsen, Lucie Laurier, Patrick Huard, Noam Jenkins.', 'Mỹ', 'Steven Spielberg', '8 năm trước, Martin Ward và David Bouchard dã gặp nhau một cách đầy ngoạn mục tại biên giới giữa Quebec và Ontario. Hai người đàn ông vẫn còn làm bạn với nhau nhưng thời gian dần trôi, họ đã không còn trò chuyện cả năm trời. Trong phần này, Ward và Bouchard phải đối mặt với một vụ trộm cắp xe hơi lớn mà hóa ra ẩn chứa trong đó còn rất nhiều uẩn khúc.', 'Ngừng chiếu', b'0', '1-201710810.jpg', 28);
INSERT INTO `phim` VALUES ('PH00003', 'Cô Gái Báo Thù', 100, 16, '2018-01-01', 'Tiếng Nhật Bản', 'Kiritani Mirei, Suzuki Nobuyuki, Kiyohara Sho.', 'Nhật Bản', 'Michael Bay', 'Câu chuyện kể về Miki Takaraishi, một cô gái xinh đẹp 24 tuổi tốt nghiệp đại học Tokyo danh tiếng với thứ hạng đầu và từng đoạt danh hiệu Miss Campus, vì vậy Miki được xem là một cô gái hoàn hảo cả về ngoại hình lẫn trí tuệ ngoại trừ tính cách có vấn đề. Cô ấy đang hẹn hò với Yuga Saito,một anh chàng đẹp trai giàu có và xuất thân từ một gia đình chính trị gia.', 'Ngừng chiếu', b'0', '64a285864e7b14302ef7ce5dee395601d73a1df5349feffa92pimgpshfullsizedistr-201810802.jpg', 29);
INSERT INTO `phim` VALUES ('PH00004', 'Sự Thanh Trừng 4: Cuộc Thanh Trừng Đầu Tiên', 100, 18, '2018-01-01', 'Tiếng Anh', 'Marisa Tomei, Mo McRae, Steve Harris, Patch Darragh, Luna Lauren Velez.', 'Mỹ', 'Peter Jackson', 'Phim hành động kinh dị này của đạo diễn Gerard McMurray đóng vai trò như một prequel kể lại những sự kiện dẫn đến sự kiện Thanh trừng đầu tiên. Để đẩy tỷ lệ tội phạm xuống dưới một phần trăm trong thời gian còn lại của năm, Tổ chức sáng lập mới của Hoa Kỳ (NFFA) kiểm tra một lý thuyết xã hội học nhằm chọc giận một cộng đồng bị cô lập trong một đêm để họ sát hại lẫn nhau.', 'Ngừng chiếu', b'0', '1-201809561.jpg', 27);
INSERT INTO `phim` VALUES ('PH00005', 'Kẻ Cắp Giáng Sinh', 90, 18, '2018-01-12', 'Tiếng Anh', 'Benedict Cumberbatch, Cameron Seely, Rashida Jones.', 'Mỹ', 'Peter Jackson', 'The Grinch kể về một gã cau có, hay hoài nghi đang tiến hành nhiệm vụ ăn cắp Giáng sinh, chỉ khi trái tim bị khuất phục bởi tinh thần Giáng sinh hào phóng của một cô gái trẻ gã mới thay đổi. Hài hước, ấm áp và tràn đầy những hình ảnh tuyệt đẹp về thị giác, The Grinch là một câu chuyện về tinh thần Giáng sinh và sức mạnh không thể lay chuyển của sự lạc quan.', 'Ngừng chiếu', b'0', '1-201811284.jpg', 28);
INSERT INTO `phim` VALUES ('PH00006', 'Vượt Qua Ranh Giới', 120, 18, '2018-01-01', 'Tiếng Nhật Bản', 'Joe Odagiri, Yû Aoi.', 'Nhật Bản', 'James Cameron', 'Yoshio Shiraiwa đã ly hôn với vợ, người đã từ chối anh đến thăm con gái duy nhất của mình. Anh trở về quê hương Hakodate và đăng ký học tại một trường dạy nghề chuyên về nghề mộc trong khi nhận tiền thất nghiệp. Một ngày nọ, anh tình cờ gặp một người phụ nữ có tên Tamura Satoshi, anh bị say nắng ngay cô nàng. Và rồi duyên phận đưa hai người cùng tham gia một buổi tiệc, mối lương duyên bắt đầu từ đó...', 'Ngừng chiếu', b'0', '1-201810413.jpg', 29);
INSERT INTO `phim` VALUES ('PH00007', 'Kẻ Không Ngủ', 100, 13, '2018-01-14', 'Tiếng Anh', 'Olga Kurylenko, Javier Botet.', 'Mỹ', 'Jerry Bruckheimer', 'xoay quanh một nhà tâm lý học hình sự tên là Kate Fuller, đang điều tra vụ án một người đàn ông bị bóp cổ chết trong giấc ngủ của mình. Nhân chứng duy nhất là con gái ông ta, cô bé nói với Kate rằng Mara đã sát hại cha mình.', 'Ngừng chiếu', b'0', '1-201809962.jpg', 29);
INSERT INTO `phim` VALUES ('PH00008', 'Tân Ô Long Viện : Tiếu Ngạo Giang Hồ', 102, 16, '2018-02-27', 'Tiếng Trung Quốc', 'Diệp Toàn Chân, Hác Thiệu Văn, Ngô Mạnh Đạt.', 'Trung Quốc', 'James Cameron', 'Bộ phim sẽ đưa khán giả quay lại với kí ức về một Ô Long Viện với những trò nghịch ngợm quỷ quái của các chú tiểu. Đến với Tân Ô Long Viện – Tiếu Ngạo Giang Hồ, 2 trong số 3 nhân vật chính của phần 1 sẽ quay trở lại trong phần này, đó là “sư huynh” Ngô Mạnh Đạt – “cặp bài trùng” một thời của Châu Tinh Trì và “sư đệ” mập mạp đáng yêu – Hác Thiệu Văn. Trong phần này, Ô Long Viện mở một đợt nhập môn, nhưng một số đối tượng xấu lợi dụng cơ hội này để tìm cách đột nhập và gây một số bất lợi cho Ô Long Viện.', 'Ngừng chiếu', b'0', '1-201810950.jpg', 28);
INSERT INTO `phim` VALUES ('PH00009', 'Hiển Linh', 90, 13, '2018-02-08', 'Tiếng Anh', 'Vincent Lindon, Galatéa Bellugi, Patrick d\'Assumçao.', 'Mỹ', 'Steven Spielberg', 'Danh tiếng của Jacques - là phóng viên kỳ cựu của một nhật báo lớn tại Pháp - đã được Thánh Bộ Vatican chú ý và tuyển dụng để làm việc cùng với một uỷ ban nghiên cứu xác thực về sự kiện đã xảy ra tại một ngôi làng trên dãy Alpes. Nơi có tin đồn một cô gái tên là Anna đã nhiều lần nhìn thấy Đức Mẹ hiện ra.', 'Ngừng chiếu', b'0', '1-201810547.jpg', 29);
INSERT INTO `phim` VALUES ('PH00010', 'Bạn Cùng Phòng Vượt Thời Gian', 90, 18, '2018-02-19', 'Tiếng Trung Quốc', 'Đồng Lệ Á, Xu Zheng, Tao Hong, Jiayin Lei.', 'Trung Quốc', '', 'Cốc Tiểu Tiêu, một cô gái đến từ năm 2018 đi lừa tiền người ta nhưng lại bị lừa lại. Lục Minh, một chàng trai đến từ năm 1999 vì dốc hết sức lôi kéo đầu tư mà bị cuốn vào chuyện ông chủ bị hãm hại. Một sáng thức dậy và họ nhận ra không gian thời gian bị ghép lại, hai người họ cùng nằm trên một chiếc giường. Điều ngạc nhiên là họ có thể đưa đối phương đến thời đại của mình thông qua cánh cửa phòng của mình.', 'Ngừng chiếu', b'0', '1-201809277.jpg', 28);
INSERT INTO `phim` VALUES ('PH00011', 'Công Phá Châu Âu', 100, 13, '2018-02-21', 'Tiếng Việt', 'Đường Yên, Ngô Diệc Phàm, Lương Triều Vỹ, Đỗ Quyên.', 'Trung Quốc', 'Hãng phim A', 'là một câu chuyện về Lâm Tại Phong (Lương Triều Vỹ) - một trong những điệp viên hàng đầu thế giới. Anh cùng các trợ thủ như Vương Đình Anh (Đường Yên), hacker Lạc Kỳ (Ngô Diệc Phàm) truy tìm công nghệ “bàn tay của Chúa” bị đánh cắp tại Châu Âu. Trong quá trình săn tìm, họ đã nhận phải sự truy lùng của các băng đản Châu Âu, CIA Mỹ và Liên minh chống tội phạm Châu Âu.', 'Ngừng chiếu', b'0', 'cong-201810167.jpg', 27);
INSERT INTO `phim` VALUES ('PH00012', 'Cuộc Tình Chốn Phồn Hoa', 100, 18, '2018-02-17', 'Tiếng Anh', 'Steve Carell, Jesse Eisenberg, Kristen Stewart.', 'Mỹ', 'Peter Jackson', 'là một bộ phim của đạo diễn Woody Allen kể về mối tình không biết bao giờ thành của Vonnie Sybil và Bobby Dorfman trong lòng xã hội Hollywood những năm 1930s - thời kì hoàng kim của xứ điện ảnh.', 'Ngừng chiếu', b'0', '1-201810599.jpg', 28);
INSERT INTO `phim` VALUES ('PH00013', 'Giữa Chín Tầng Mây', 90, 0, '2018-02-22', 'Tiếng Ấn Độ', 'Ishaan Khattar, Malavika Mohanan, Goutam Ghose.', 'Ấn Độ', 'Brian Grazer', 'Lấy bối cảnh ở khu ổ chuột nghèo khó Mumbai. Người thanh niên Aamir buộc chọn nghề giao \"thuốc\" để kiếm cơm. Trong một lần đang làm việc Aamir bị cảnh sát truy đuổi, anh đã chạy vào tiệm giặt ủi nơi làm việc của người em gái Tara. Cô em Tara nhận tội và đi tù thay cho người anh trai của cô khi cảnh sát kiểm tra và phát hiển ra gói \"hàng\" ở đó. Chuỗi ngày dài về tình cảm anh em và nước mắt bắt đầu từ đây...', 'Ngừng chiếu', b'0', '1-201810494.jpg', 29);
INSERT INTO `phim` VALUES ('PH00014', 'Người Kiến Và Chiến Binh Ong', 100, 0, '2018-02-17', 'Tiếng Anh', 'Walton Goggins, Evangeline Lilly, Michelle Pfeiffer.', 'Mỹ', 'Jerry Bruckheimer', 'Hậu “Captain America: Civil War”, Scott Lang phải đấu tranh để cân bằng cuộc sống gia đình với trách nhiệm là Ant-Man. Anh gặp Hope van Dyne và Tiến sĩ Hank Pym với một nhiệm vụ mới cấp bách: học cách chiến đấu cùng với The Wasp để khám phá bí mật quá khứ của hai người. Avengers: Infinity War đã tạo ra một cú shock lịch sử chưa từng có trong vũ trụ điện ảnh Marvel.', 'Ngừng chiếu', b'0', '1-201809810.jpg', 27);
INSERT INTO `phim` VALUES ('PH00015', 'Chuyến Đi Của Những Cô Gái', 90, 0, '2018-02-06', 'Tiếng Anh', 'Jada Pinkett Smith, Mike Colter, Tiffany Haddish, Queen Latifah, Larenz Tate.', 'Mỹ', '', 'Khi bốn người bạn thời thơ ấu - Regina Hall, Queen Latifah, Jada Pinkett Smith và Tiffany Haddish - du lịch đến New Orleans để tham dự Liên hoan Essence hàng năm, họ gặp nhau và tình chị em đã được thắp lại cùng với sự hoang dã, những vũ điệu, rượu vang, và sự lãng mạn...', 'Ngừng chiếu', b'0', '1-201810732.jpg', 28);
INSERT INTO `phim` VALUES ('PH00016', 'Bậc Thầy Phong Thủy', 126, 18, '2018-03-27', 'Tiếng Hàn Quốc', 'Ji Sung, Cho Seung Woo, Kim Sung Kyun, Baek Yoon Sik, Moon Chae-Won Cho-Sun.', 'Hàn Quốc', '', 'đánh dấu sự trở lại của tài tử Jo Seung Woo sau ba năm vắng bóng màn ảnh rộng kể từ hit 18+ Inside Men. Dự án này có kinh phí 12 tỉ won (khoảng 249 tỉ VND) và là phần phim cuối cùng trong một bộ ba phim lịch sử Hàn Quốc, hai tác phẩm trước là The Face Reader (2013) và The Princess and the Matchmaker (2018).', 'Ngừng chiếu', b'0', '1-201811345.jpg', 30);
INSERT INTO `phim` VALUES ('PH00017', 'Nạn Đói Năm 47', 100, 16, '2018-03-17', 'Tiếng Anh', 'Stephen Rea, Hugo Weaving, Barry Keoghan, Moe Dunford, James Frecheville.', 'Mỹ', 'Kathleen Kennedy', 'Trong thời kỳ nạn đói xảy ra ở Ai-Len, một người Ai-Len tên là Ranger đã chiến đấu trong quân đội Anh ở nước ngoài, ông từ bỏ vị trí của mình để trở về đoàn tụ với gia đình. Mặc dù trải qua những kinh hoàng trong chiến tranh nhưng ông vẫn bị sốc khi chứng kiến nạn đói ở quê hương ảnh hưởng đến người dân cũng như với gia đình của mình.', 'Ngừng chiếu', b'0', '1-201811131.jpg', 27);
INSERT INTO `phim` VALUES ('PH00018', 'Cuồng Tín', 45, 18, '2018-03-26', 'Tiếng Anh', 'Panos Cosmatos, Chris \'Casper\' Kelly.', 'Mỹ', 'Kathleen Kennedy', 'Diễn ra vào năm 1983, Red là một thợ gỗ sống trong một cabin hẻo lánh trong rừng. Bạn gái nghệ sĩ của anh, Mandy, dành cả ngày đọc những cuốn sách bìa mềm. Rồi một ngày nọ, cô lọt vào mắt của một kẻ lãnh đạo giáo phái điên cuồng, toàn những kẻ cưỡi xe máy. Hắn đã sai chúng đi bắt cóc cô nhưng không được thuận theo nên đã thiêu cô trước mặt Red. Bừng tỉnh trong cơn giận dữ và nỗi đau, Red trang bị vũ khí rồi lên đường săn tìm lũ cuồng tín.', 'Ngừng chiếu', b'0', '1-201809184.jpg', 29);
INSERT INTO `phim` VALUES ('PH00019', 'Những Cô Nàng Hắc Ám', 100, 0, '2018-03-12', 'Tiếng Nhật Bản', 'Đang cập nhật.', 'Nhật Bản', 'Harvey Weinstein', 'Một ngày nọ, Itsumi Shiraishi (Marie Iitoyo) chết tại trường THPT Nữ sinh Seibo Maria. Cô ngã từ sân thượng của trường. Itsumi là nữ sinh ưu tú và nổi tiếng nhất trường nên mọi người đều quan tâm đến cái chết kỳ lạ của cô ấy.', 'Ngừng chiếu', b'0', '1-201810694.jpg', 29);
INSERT INTO `phim` VALUES ('PH00020', 'Vũ Khí Bí Ẩn', 100, 0, '2018-03-13', 'Tiếng Anh', 'James Franco, Dennis Quaid, Zoë Kravitz, Jack Reynor, Carrie Coon.', 'Mỹ', 'Steven Spielberg', 'là một bộ phim khoa học viễn tưởng (Sci-fi) kể về hành trình chạy trốn của một cậu bé da màu (14 tuổi) và người anh trai nuôi khỏi sự truy sát của một tên tội phạm khát máu và hai kẻ “giấu mặt”.', 'Ngừng chiếu', b'0', '1-201811267.jpg', 27);
INSERT INTO `phim` VALUES ('PH00021', 'Chuyện Kỳ Bí Ở Kamakura', 100, 13, '2018-03-19', 'Tiếng Nhật Bản', 'Mitsuki Takahata, Masato Sakai, Sakura Ando.', 'Nhật Bản', 'Joel Silver', 'dựa trên bộ manga có tuổi đời hơn 30 năm Kamakura Monogatari kể về Isshiki Nasakazu (Masato Sakai) - một tác giả viết truyện kỳ bí thích mặc trang phục truyền thống, anh sống cùng người vợ trẻ Akiko (Mitsuki Takahata). ở Kamakura, Nhật Bản. Isshiki Nasakazu có rất nhiều mối quan tâm khác như sưu tầm mô hình đường sắt, mô hình nhựa và cổ vật, nghiên cứu tội phạm và điều tra các hiện tượng diêu nhiên.', 'Ngừng chiếu', b'0', '64a285864e7b14302ef7ce5dee395601d73a1df5349feffa92pimgpshfullsizedistr-201811361.jpg', 28);
INSERT INTO `phim` VALUES ('PH00022', 'Lời Nhắn Của Oan Hồn', 120, 13, '2018-03-20', 'Tiếng Anh', 'Bella Thorne, Louis Herthum.', 'Mỹ', 'Michael Bay', 'Mười năm sau thảm hoạ hạt nhân tại Chicago, thế giới tồn tại khe nứt giữa người sống và người chết. Ronnie (Bella Thorne) nhận được một thông điệp đe dọa từ một hồn ma xa lạ. Cô cùng một người bạn bí ẩn, Kirk, rơi vào thế giới bóng ma, và bắt đầu một cuộc đua tuyệt vọng với thời gian đối đầu một tên giết người xảo quyệt.', 'Ngừng chiếu', b'0', '1-201811727.jpg', 31);
INSERT INTO `phim` VALUES ('PH00023', 'Tình Yêu Tuổi Mới Lớn', 100, 18, '2018-03-23', 'Tiếng Trung Quốc', 'Khương Thụy Giai, Nhan Mạn Tư, Thuận Nhiên.', 'Trung Quốc', 'Jerry Bruckheimer', 'Vì muốn trả thù Kiều – cậu bạn cùng bàn vì đã làm mình bị phạt, Vương Khải biệt ra thư tình gửi cho cậu ta nhưng không ngờ Kiều  tin thật. Vì không muốn làm bạn bị tổn thương, Vương Khải đã nhờ 1 bạn nữ mà cậu cũng có tình cảm làm bạn gái tạm thời với Kiều. Mọi việc trở nên rắc rối khi nhà trường ban lệnh cấm yêu đương.', 'Ngừng chiếu', b'0', '64a285864e7b14302ef7ce5dee395601d73a1df5349feffa92pimgpshfullsizedistr-201810303.jpg', 29);
INSERT INTO `phim` VALUES ('PH00024', 'Săn Bão', 102, 13, '2018-04-15', 'Tiếng Hồng Kông', 'Cổ Thiên Lạc, Kai Chung.', 'Hồng Kông', 'Steven Spielberg', 'Trong một vụ án tưởng chừng như đi vào bế tắc của điều tra viên Lục Chí Liêm (Cổ Thiên Lạc) cùng đồng nghiệp, thì anh ta bị cáo buộc dính đến vụ việc quan liêu nhũng nhiễu ngay trong chính vụ án của mình. Để minh oan cho bản thân, Lục Chí Liêm đã dấn thân điều tra và phát hiện hàng loạt những đường dây bất hợp pháp. Từ đó, anh bắt đầu bước vào nhiều phen hiểm nguy cũng như những màn đấu trí đến nghẹt thở.', 'Ngừng chiếu', b'0', '1-201811746.jpg', 27);
INSERT INTO `phim` VALUES ('PH00025', 'Anh Yêu Em, Beth Cooper', 110, 0, '2018-04-24', 'Tiếng Anh', 'Hayden Panettiere, Jack Carpenter, Paul Rust.', 'Mỹ', 'Michael Bay', 'Một anh chàng mọt sách tuyên bố yêu cô gái nổi tiếng nhất trường – Beth Cooper – ngay trong bài diễn văn tốt nghiệp trung học. Hơn cả sự kinh ngạc, Beth tới trước cửa nhà anh chàng vào đêm đó và quyết định dành cho cậu bạn một đêm tuyệt nhất trong đời.', 'Ngừng chiếu', b'0', '2-201811186.jpg', 28);
INSERT INTO `phim` VALUES ('PH00026', 'Pripara: Cùng Nhau Đến Priparis', 73, 18, '2018-04-29', 'Tiếng Nhật Bản', 'Himika Akaneya, Chinatsu Akasaki, Yuu Serizawa.', 'Nhật Bản', 'Joel Silver', 'Priparis được đặt tại Pháp và là trụ sở của Pripara toàn cầu dần mất đi ánh sáng. Nhận được thông điệp cầu cứu của Falulu, Laala và các thần tượng ở khắp nơi trên thế giới lập tức lên đường tới Priparis. Nếu ánh sáng không trở lại, Priparis sẽ biến mất buộc Laala và bạn bè cùng nhau nổ lực hết sức giúp Falulu, cứu lấy thế giới.', 'Ngừng chiếu', b'0', '1-201811961.jpg', 28);
INSERT INTO `phim` VALUES ('PH00027', 'Sát Thủ Nhân Tạo', 125, 0, '2018-04-13', 'Tiếng Hàn Quốc', 'Park Hee Soon, Choi Woo Sik, Jo Min Soo, Kim Da-Mi, Go Min-Si.', 'Hàn Quốc', 'Harvey Weinstein', 'là bộ phim hành động li kì kể về Koo Ja-yoon – một cô bé được nuôi dưỡng trong một tổ chức đáng sợ - nơi diễn ra các cuộc thí nghiệm y học được thực hiện trên chính cơ thể con người nhằm biến họ thành những cỗ máy giết người. Sau khi chạy trốn khỏi tổ chức, Ja-yoon bị mất trí nhớ và được một cặp vợ chồng già nhận nuôi.', 'Ngừng chiếu', b'0', '1-201810546.jpg', 27);
INSERT INTO `phim` VALUES ('PH00028', 'Cô Gái Có Hình Xăm Rồng', 120, 0, '2018-04-06', 'Tiếng Anh', 'Noomi Rapace, Michael Nyqvist, Ewa Fröling.', 'Mỹ', 'James Cameron', 'là bộ phim chuyển thể từ cuốn sách đầu tiên trong bộ ba tiểu thuyết trinh thám Millennium của nhà văn Thụy Điển Stieg Larsson. Nhân vật chính Lisbeth Salander được ví như là một Sherlock Holmes phiên bản nữ bởi khả năng điều tra, phá án tài tình như một thám tử chuyên nghiệp. Lisbeth Salander là một cô gái 24 tuổi xăm trổ, bấm khuyên đầy mình nhưng lại sở hữu một trí tuệ phi phàm. Cô là một hacker thiên tài có thể đột nhập vào mạng lưới điều tra của cảnh sát để tìm thông tin về những bí ẩn chết người và lịch sử của một dòng họ giàu có trong thế giới tài chính.', 'Ngừng chiếu', b'0', 'thegirlwiththedragontattooposter-201612606.jpg', 27);
INSERT INTO `phim` VALUES ('PH00029', 'Quỷ Nhập Hồn', 105, 13, '2018-04-20', 'Tiếng Anh', 'Sandra Escacena, Bruna González, Claudia Placer.', 'Mỹ', 'Jerry Bruckheimer', 'Chuyện phim dựa trên câu chuyện có thật về cô bé Veronica (Sandra Escacena) đang ở tuổi 15. Là con gái lớn trong gia đình, cô bé phải vật lộn chăm sóc ba đứa em nhỏ sau cái chết của bố, giúp mẹ có thêm thời gian kiếm tiền nuôi sống gia đình.', 'Ngừng chiếu', b'0', '1-201811435.jpg', 31);
INSERT INTO `phim` VALUES ('PH00030', 'Ông Bác Siêu Nhân', 100, 13, '2018-04-01', 'Tiếng Nhật Bản', 'Yûsuke Iseya, Kanata Hongô, Mari Hamada, Ayaka Miyoshi.', 'Nhật Bản', 'Joel Silver', 'Ông Inuyashiki là một lão già khốn khổ có công việc và đời sống gia đình không mấy tốt đẹp.. Bỗng một ngày, ông và một cậu học sinh tên Hiro chứng kiến một vụ nổ từ chiếc phi thuyền của người ngoài hành tinh và bị biến đổi thành một con người mới có sức mạnh siêu nhiên. Trong khi Hiro muốn hủy diệt thế giới thì ông Inuyashiki lại muốn dùng năng lực này để cứu người và ngăn cản Hiro.', 'Ngừng chiếu', b'0', '64a285864e7b14302ef7ce5dee395601d73a1df5349feffa92pimgpshfullsizedistr-201811500.jpg', 27);
INSERT INTO `phim` VALUES ('PH00031', 'Quái Thú Vô Hình', 100, 16, '2018-04-18', 'Tiếng Anh', 'Sterling K. Brown, Keegan Michael Key, Boyd Holbrook.', 'Mỹ', 'Jerry Bruckheimer', 'Những thợ săn bí ẩn từ không gian bỗng xuất hiện ở Trái Đất. Chính quyền cử một đội đặc nhiệm truy tìm và lùng bắt những thợ săn này nhưng liệu ai mới thật sự là kẻ đi săn. Bí ẩn về giống loài tiên tiến này dần được hé lộ.', 'Ngừng chiếu', b'0', '1-201810419.jpg', 27);
INSERT INTO `phim` VALUES ('PH00032', 'Charming: Hoàng Tử Đào Hoa', 100, 0, '2018-05-06', 'Tiếng Anh', 'Demi Lovato, Sia, Wilmer Valderrama.', 'Mỹ', 'Harvey Weinstein', 'mang đến cho khán giả một câu chuyện mới, một góc nhìn cực kỳ thú vị, sáng tạo và chưa bao giờ được kể của ba cô gái xinh đẹp trong xứ sở thần tiên nổi tiếng: Bạch Tuyết, Lọ Lem và Công Chúa Ngủ Trong Rừng. Một ngày nọ cả ba khám phá ra rằng những vị hôn phu mà các cô đính hôn thật ra đều là cùng một người đó là Hoàng Tử Charming. Bên cạnh đó còn có hàng triệu cô gái trong vương quốc thầm thương trộm nhớ muốn trở thành vợ của Hoàng Tử.', 'Ngừng chiếu', b'0', '1-201810648.jpg', 32);
INSERT INTO `phim` VALUES ('PH00033', 'Chiến Tranh Lạnh', 88, 0, '2018-05-08', 'Tiếng Pháp', 'Joanna Kulig, Tomasz Kot, Borys Szyc.', 'Pháp', 'Brian Grazer', 'Bộ phim hợp tác Ba Lan - Pháp - Anh này do đạo diễn Ba Lan sống ở Anh Pawel Pawlikowski đạo diễn hy vọng đoạt Cành cọ Vàng 2018. Cold War kể một câu chuyện tình tại châu Âu vào thập niên 1950 giữa hai người có xuất thân khác nhau. Đây cũng là phim mới nhất của Pawlikowski sau bộ phim Ida đoạt giải Bafta phim nước ngoài hay nhất năm 2015.', 'Ngừng chiếu', b'0', '64a285864e7b14302ef7ce5dee395601d73a1df5349feffa92pimgpshfullsizedistr-201811585.jpg', 29);
INSERT INTO `phim` VALUES ('PH00034', 'Bạn Trai Cũ Tôi Là Điệp Viên', 90, 18, '2018-05-02', 'Tiếng Anh', 'Justin Theroux, Mila Kunis, Sam Heughan, Kate McKinnon.', 'Mỹ', 'Steven Spielberg', 'Audrey và Morgan - đôi bạn thân tuổi băm bất ngờ rơi vào một âm mưu quốc tế khi phát hiện ra tay bạn trai đã “đá” Audrey là một điệp viên. Bị truy đuổi gay gắt bởi nhóm sát thủ theo dấu gã bạn trai, hai cô nàng bắt đầu hành trình vòng quanh Châu Âu và rơi vào hàng loạt tình huống cân não cười ra nước mắt để giải cứu thế giới.', 'Ngừng chiếu', b'0', '1-201810435.jpg', 27);
INSERT INTO `phim` VALUES ('PH00035', 'Sát Nhân Liên Hoàn', 120, 18, '2018-05-23', 'Tiếng Khác', 'Károly Hajduk, Gábor Jászberényi.', 'Khác', 'Harvey Weinstein', 'Một kẻ giết người hàng loạt gây kinh hoàng cả thị trấn Martfü ở Hungary, nạn nhân chỉ toàn nữ giới...', 'Ngừng chiếu', b'0', '1-201811587.jpg', 31);
INSERT INTO `phim` VALUES ('PH00036', 'Thế Giới Động Vật', 135, 18, '2018-05-29', 'Tiếng Trung Quốc', 'Michael Douglas, Dongyu Zhou, Yi Feng Li.', 'Trung Quốc', 'Joel Silver', 'được cải biên từ tác phẩm truyện tranh Ultimate Survivor Kaiji (Gambling Apocalypse Kaiji) của tác giả Nobuyuki Fukumoto. Chàng trai chẳng làm được chuyện gì nên hồn - Trịnh Khai Tư (Lý Dịch Phong) - tham gia vào một trò chơi sinh tử đầy bí ẩn trên con tàu hạng sang nhằm trả nợ. Cách tính điểm của cuộc đấu này được dựa trên phương thức \"oẳn tù tì\". Vì người mẹ đang hôn mê và cô bạn thanh mai trúc mã Lưu Thanh (Châu Đông Vũ), Trịnh Khai Tư buộc phải sống sót trở về.', 'Ngừng chiếu', b'0', '-201809686.jpg', 27);
INSERT INTO `phim` VALUES ('PH00037', 'Đứa Trẻ Bị Nguyền', 90, 13, '2018-05-21', 'Tiếng Anh', 'Jessica Mcleod, Hannah Chera, JOHN EMMET TRACY, Jana Mitsoula, Craig March, Mamie Laverock.', 'Mỹ', 'George Lucas', 'lấy bối cảnh khi bóng đêm phủ lên một thị trấn nhỏ, nơi Samantha, một cô gái tuổi teen rắc rối đang chật vật tìm cho mình một gia đình nuôi mà cô thực sự thuộc về. Gia đình bố mẹ nuôi hiện tại của cô gồm Liz, Garrett và em gái Olivia.', 'Ngừng chiếu', b'0', '1-201809706.jpg', 29);
INSERT INTO `phim` VALUES ('PH00038', 'Người Mẹ Khác', 100, 18, '2018-05-14', 'Tiếng Hàn Quốc', 'Lim Soo Jung, Han Joo Hwan, Seo Shin Ae, Lee Sang-Hee.', 'Hàn Quốc', 'Joel Silver', 'Phim trên tiểu thuyết \"Dangshinui Bootak - My Other Mother\" của Lee Dong-Eun. Hyo-Jin (Lim Soo-Jung) là một phụ nữ 32 tuổi. Hai năm trước, chồng cô qua đời trong một tai nạn để lại một cậu con trai 16 tuổi, Jong-Wook (Yoon Chan-Young), từ một cuộc hôn nhân trước đó, Hyo-Jin bắt đầu sống với Jong-Wook.', 'Ngừng chiếu', b'0', '1-201809358.jpg', 29);
INSERT INTO `phim` VALUES ('PH00039', 'Giữ Bóng Tối', 90, 13, '2018-05-08', 'Tiếng Anh', 'Jeffrey Wright, Issac Bird, Riley Keough, Beckam Crawford, Michael Tayles.', 'Mỹ', 'Jerry Bruckheimer', ' Sau cái chết của ba đứa trẻ bị nghi ngờ bị giết bởi những con sói, nhà văn Russell Core được thuê bởi cha mẹ của một cậu bé sáu tuổi mất tích để theo dõi và xác định vị trí con trai của họ trong vùng hoang dã Alaska.', 'Ngừng chiếu', b'0', '1-201809720.jpg', 29);
INSERT INTO `phim` VALUES ('PH00040', 'Bạch Vương', 100, 18, '2018-06-22', 'Tiếng Anh', 'Ólafur Darri Ólafsson, Olivia Williams.', 'Mỹ', 'Joel Silver', 'Djata - một cậu bé 12 tuổi lớn lên ở một vùng đất nơi được cai trị dưới chế độ độc tài, và cậu bé không được tiếp cận với phần còn lại của thế giới. Từ nhỏ cậu đã được cha mình kể về nguồn gốc thật sự của nơi mình sinh ra, và bí mật về một kho báu được canh giữ bởi một người đàn ông tên là Pickaxe. Cho đến một ngày cha cậu bị hai người của chính phủ bắt đi...', 'Ngừng chiếu', b'0', '1-201809527.jpg', 29);
INSERT INTO `phim` VALUES ('PH00041', 'Chàng Trai Mứt Cam', 90, 0, '2018-06-29', 'Tiếng Nhật Bản', 'Yoshizawa Ryo, Dan Rei, Tanihara Shosuke, Nakayama Miho, Tsutsui Michitaka, Sakurai Hinako.', 'Nhật Bản', 'George Lucas', ' Miki là một nữ sinh trung học.Một ngày, gia đình Koishikawa tan vỡ khi ba mẹ Miki thông báo rằng họ sẽ li dị và tái hôn với người khác. Người họ tái hôn là cặp vợ chồng Matsuuras mà họ đã gặp ở Hawaii, và cặp vợ chồng đó cũng có một đứa con trai bằng tuổi Miki tên gọi là Yuu.Thế là 2 gia đình quyết định sẽ sống chung dưới một mái nhà.', 'Ngừng chiếu', b'0', '1-201809281.jpg', 29);
INSERT INTO `phim` VALUES ('PH00042', 'Chữa Lành Nỗi Đau', 110, 16, '2018-06-01', 'Tiếng Anh', 'Jonathan Pryce, Oliver Jackson-Cohen.', 'Mỹ', 'Joel Silver', 'Một người đàn ông mang trong mình một căn bệnh đã bất ngờ nhận được một món quà đặc biệt từ một cô gái trẻ..', 'Ngừng chiếu', b'0', '1-201809182.jpg', 28);
INSERT INTO `phim` VALUES ('PH00043', 'Quý Bà Đóa Hoa', 90, 18, '2018-06-13', 'Tiếng Trung Quốc', 'Mã Tư Thuần, Trương Nhược Quân, Lý Hiện.', 'Trung Quốc', 'Jerry Bruckheimer', 'Một câu chuyện tuổi dậy thì xoay quanh một thiên tài lập dị, một cô gái bốc đồng và bạn cùng lớp của họ với những tính cách khác nhau. Huang Jian (Trương Nhược Quân) là một thiên tài trong lĩnh vực khoa học và công nghệ.', 'Ngừng chiếu', b'0', '1-201809258.jpg', 28);
INSERT INTO `phim` VALUES ('PH00044', 'Tòa Tháp Chọc Trời', 120, 13, '2018-06-11', 'Tiếng Anh', 'Dwayne Johnson, Kevin Rankin.', 'Mỹ', 'George Lucas', 'Dwayne Johnson sẽ vào vai cựu quân nhân và cựu trưởng nhóm đặc nhiệm giải cứu của FBI Will Ford đầy dũng cảm. Không may trong một nhiệm vụ nguy hiểm, tai nạn khủng khiếp xảy đến với Will làm anh mất đi chân trái của mình. Kể từ đó, Will Ford từ bỏ công việc tại FBI và trở thành chuyên gia đánh giá an ninh cho các tòa nhà.', 'Ngừng chiếu', b'0', '1-201804313.jpg', 27);
INSERT INTO `phim` VALUES ('PH00045', 'Lớp 8', 100, 18, '2018-06-08', 'Tiếng Anh', 'Josh Hamilton, Elsie Fisher, Emily Robinson.', 'Mỹ', 'Kathleen Kennedy', ': Một cô bé lớp 8 nhút nhát trong tuần cuối cùng của cấp hai để chuẩn bị lên học cấp ba.', 'Ngừng chiếu', b'0', '64a285864e7b14302ef7ce5dee395601d73a1df5349feffa92pimgpshfullsizedistr-201809442.jpg', 28);
INSERT INTO `phim` VALUES ('PH00046', 'Trận Chiến Cuối Cùng', 90, 0, '2018-06-15', 'Tiếng Hàn Quốc', 'Oh Ji-Ho, Son Eun Seo, Lee Jung Jin, Lee Joo-seung.', 'Hàn Quốc', 'Kathleen Kennedy', 'Poong Ho muốn trả thù Jae Hee, người đã khiến anh trai mình rơi vào tình trạng hôn mê nhưng cậu biết mình không phải là đối thủ. Cậu bắt đầu học kĩ năng chiến đầu từ trưởng lão Hwang trước khi thách đấu Jae Hee.', 'Ngừng chiếu', b'0', '1-201809121.jpg', 27);
INSERT INTO `phim` VALUES ('PH00047', 'Công Chúa Ma Cà Rồng', 100, 18, '2018-06-26', 'Tiếng Anh', 'Ivan Yankovskiy, Leonid Yarmolnik, Lyubov Aksyonova.', 'Mỹ', 'Harvey Weinstein', ' dana là công chúa cuối cùng của dòng họ ma cà rồng đầy quyền lực. Chính vì thế, cô luôn bị Liên minh tội ác săn đuổi. Pasha là chàng trai si tình, tốt bụng bỗng phát hiện ra khả năng siêu nhiên khi cùng cô vào sinh ra tử.', 'Ngừng chiếu', b'0', 'vampire-princessposter-27x39-01-709x1024-201703779.jpg', 27);
INSERT INTO `phim` VALUES ('PH00048', 'Điệp Viên Thiên Thần', 100, 13, '2018-07-28', 'Tiếng Anh', 'Toby Kebbell, Hannah Ware, Marwan Kenzari, Waleed Zuaiter, Sasson Gabai.', 'Mỹ', 'George Lucas', 'Câu chuyện thật về Ashraf Marwan, con rể của Tổng thống Nasser và cố vấn đặc biệt của người kế nhiệm Anwar Sadat - cũng là tài sản quý giá nhất của Cục Tình báo Israel trong thế kỷ 20. Dựa trên cuốn sách bán chạy nhất theo The New York Times &#39;Thiên Thần: Điệp Viên Ai Cập Cứu Israel&#39; của Uri Bar-Joseph.', 'Ngừng chiếu', b'0', 'diep-201809942.jpg', 29);
INSERT INTO `phim` VALUES ('PH00049', 'Di Truyền', 100, 13, '2018-07-07', 'Tiếng Anh', 'Ann Dowd, Alex Wolff.', 'Mỹ', 'Joel Silver', 'có sự tham gia của Toni Collette, Gabriel Byrne, Alex Wolff và Milly Shapiro trong vai một gia đình bị quỷ ám. Nói chính xác hơn, họ bị ám bởi người bà trong dòng họ đã chết.', 'Ngừng chiếu', b'0', '1-201808605.jpg', 27);
INSERT INTO `phim` VALUES ('PH00050', 'Giai Điệu Trên Triền Dốc', 90, 13, '2018-07-17', 'Tiếng Nhật Bản', 'Dean Fujioka, Mano Erina, Chinen Yuri, Komatsu Nana, Nakagawa Taishi, Komatsu Nana.', 'Nhật Bản', 'Harvey Weinstein', 'Lấy bối cảnh năm 1966, câu chuyện bắt đầu với nhân vật Kaoru Nishimi, khi cậu chuyển trường đến Kyushu (một trong 4 đảo chính ở Nhật Bản) để sống với họ hàng. Vốn là một người có sức khỏe yếu và bị chứng mất cân bằng tâm lý nên Kaoru không thể hòa nhập với môi trường mới một cách dễ dàng.', 'Ngừng chiếu', b'0', '1-201809514.jpg', 29);
INSERT INTO `phim` VALUES ('PH00051', 'Thử Thách Thần Chết 2: 49 Ngày Cuối Cùng', 90, 18, '2018-07-24', 'Tiếng Hàn Quốc', 'Ma Dong-Seok, Kim Dong-Wook, Lee Jung Jae, Han Jung Woo, Ju Ji-Hoon, Kim Hyang Gi.', 'Hàn Quốc', 'George Lucas', 'kể về chàng trai Su Hong đã được chọn là linh hồn thuần khiết thứ 49 cần giúp đỡ, cũng là linh hồn thuần khiết cuối cùng để cả 3 vệ thần hoàn thành sứ mệnh. Sau sứ mệnh này, họ cũng sẽ đầu thai làm kiếp người mới. Tuy nhiên trong cuộc hành trình 49 ngày cuối cùng này, thân phận của 3 vệ thần dần được hé lộ. Mọi thứ bắt đầu gay cấn hơn khi họ dần lấy lại những ký ức bi kịch của kiếp trước thông qua Gia Thần - một vị thần có quyền lực và vai trò không hề nhỏ ở dương thế.', 'Ngừng chiếu', b'0', '1-201809635.jpg', 29);
INSERT INTO `phim` VALUES ('PH00052', 'Cà Chua Bi', 120, 18, '2018-07-21', 'Tiếng Hàn Quốc', 'Kim Hyang Gi, Kim Byung-Chul, Shin Goo, Choi Ji-Yeon, Choi Dong-Kyun, Jang Dong-Mi.', 'Hàn Quốc', 'Peter Jackson', 'kể về Park Gu mưu sinh bằng nghề nhặt ve chai để cừng đứa cháu gái sống qua ngày. Tình cảnh của họ ngày càng tồi tệ hơn. Từ khi đứa con trai của ông ấy trở về và đã lấy đi số tiền mà ông ấy dành dụm mấy lâu và rồi chiếc xe ba gác của ông bị bọn côn đồ phá hỏng. Đó là phương tiện duy nhất giúp ông kiếm tiền. Ông ấy quyết định tới tìm người quản lý công trường. Nhưng không may, vì đứa cháu gái quá đói nên ông đành phải ăn cắp đồ ăn đứa bé. Không may đó là đồ ăn chó đã bị người giúp việc của quản lý công trường bỏ độc vì mối căm ghét của cô ta với ông chủ.', 'Ngừng chiếu', b'0', 'm0010001cherrytomatoposterx230330-201809238.jpg', 29);
INSERT INTO `phim` VALUES ('PH00053', 'Khách Sạn Huyền Bí 3: Kỳ Nghỉ Ma Cà Rồng', 100, 18, '2018-07-28', 'Tiếng Anh', 'Steve Buscemi, Selena Gomez, Adam Sandler, Kevin James, Andy Samberg.', 'Mỹ', 'James Cameron', 'lần này sẽ là “cuộc chơi lớn” với một phen tiệc tùng sang chảnh hết nấc của gia đình Dracula. Đã quá “ngán” với cường độ làm việc chăm chỉ 365 ngày không nghỉ, bá tước Dracula quyết định đòi “đình công”. Để khai sáng cho người cha trăm tuổi chưa bao giờ bước ra khỏi “lũy tre làng”, vợ chồng nhà Jonathan – Mavis lập một kế hoạch xả hơi táo bạo: Thuê đứt một du thuyền du lịch hạng sang để đưa tất thảy bộ xậu quái vật già trẻ lớn bé làm một chuyến ra khơi nhớ đời.', 'Ngừng chiếu', b'0', '64a285864e7b14302ef7ce5dee395601d73a1df5349feffa92pimgpshfullsizedistr-201809687.jpg', 27);
INSERT INTO `phim` VALUES ('PH00054', 'Thần Tốc', 120, 0, '2018-07-28', 'Tiếng Anh', 'Dwayne Johnson, Tom Berenger, Billy Bob Thornton, Courtney Gains, Michael Irby, Josh Clark.', 'Mỹ', 'Brian Grazer', 'sau khi ở tù mười năm, người đàn ông biệt danh Driver được trả tự do, vừa ra tù thì anh ta liền lấy xe chạy đến một công ty rồi dùng súng bắn chết ông nhân viên trong công ty này. Trước đây, hai anh em Driver từng bị một băng cướp xông vào nhà sát hại, anh trai Driver là Gary bị cắt cổ, còn Driver bị tên trùm bắn.', 'Ngừng chiếu', b'0', 'fastermovieposterbydgsway-d32yw08-201809953.jpg', 27);
INSERT INTO `phim` VALUES ('PH00055', 'Săn Lùng Quái Thú', 100, 13, '2018-07-27', 'Tiếng Hàn Quốc', 'Kim Myung Min, Hyeri, Kim In-Kwon, Choi Woo Sik.', 'Hàn Quốc', 'James Cameron', 'Năm Trung Tông thứ 22 khi triều đại Joseon đang bị càn quét bởi trận dịch hạch kinh hoàng, đó là khi dân chúng đang chìm trong cảnh đói khổ lầm than với những nỗi kinh hoàng tưởng như không bao giờ chấm dứt. Lòng dân như lửa đốt khi tin đồn về một con quái thú khát máu chỉ chực chờ uống máu và ăn tươi nuốt sống những ai dám bén mảng đến ngọn núi Inwangsan.', 'Ngừng chiếu', b'0', '1-201811261.jpg', 27);
INSERT INTO `phim` VALUES ('PH00056', 'Chỉ Có Thể Hình Dung', 100, 13, '2018-08-29', 'Tiếng Anh', 'Dennis Quaid, Madeline Carroll, J. Michael Finley.', 'Mỹ', 'James Cameron', 'Dựa trên một câu chuyện có thật đầy cảm hứng đằng sau ca khúc đình đám của nhóm MercyMe, một bài hát mang nhiều ý nghĩa, niềm hi vọng cuộc sống, và là sức mạnh để khiến ta có thể mở lòng bao dung tha thứ.', 'Ngừng chiếu', b'0', 'chi-201809227.jpg', 29);
INSERT INTO `phim` VALUES ('PH00057', 'Người Chứng Kiến', 100, 13, '2018-08-10', 'Tiếng Hàn Quốc', 'Lee Sung Min, Kwak Si-Yang, Kim Sang Ho, Jin Kyung, Kim Sung Kyun, Park Bom.', 'Hàn Quốc', 'Jerry Bruckheimer', 'xoay quanh một vụ án mạng xảy ra tại một căn hộ phức hợp. Mọi chuyện dần trở nên phức tạp khi người đàn ông tên Sang Hoon (Lee Sung Min) tình cờ nhìn vào mắt kẻ sát nhân.', 'Ngừng chiếu', b'0', '64a285864e7b14302ef7ce5dee395601d73a1df5349feffa92pimgpshfullsizedistr-201811722.jpg', 29);
INSERT INTO `phim` VALUES ('PH00058', 'Tháp Lửa', 120, 16, '2018-08-21', 'Tiếng Hàn Quốc', 'Ye jin Son.', 'Hàn Quốc', 'Peter Jackson', ' Đây là bộ phim hành động về thảm họa kinh hoàng nhất Hàn Quốc khi tòa tháp đôi 108 tầng Sky Tower ở Seoul bị chôn vùi trong biển lửa vào đúng đêm Giáng sinh khiến hàng nghìn người dân sống trong tòa nhà bị mắc kẹt trong sự hoảng loạn và nỗi sợ hãi tột độ.', 'Ngừng chiếu', b'0', '1-201811188.jpg', 27);
INSERT INTO `phim` VALUES ('PH00059', 'Venom', 120, 0, '2018-08-27', 'Tiếng Anh', 'Tom Hardy, Riz Ahmed, Michelle Williams.', 'Mỹ', 'George Lucas', 'đã hé lộ thân phận nhân vật phản diện cực kỳ nguy hiểm và kinh hãi khi tung trailer chính thức khắp thế giới làm điên đảo fan hâm mộ trong thế giới của Marvel. Chàng phóng viên Eddie Brock bí mật theo dõi âm mưu xấu xa của một tổ chức và bị nhiễm phải Symbiote và trở thành quái vật Venom đầy nguy hiểm.', 'Ngừng chiếu', b'0', '64a285864e7b14302ef7ce5dee395601d73a1df5349feffa92pimgpshfullsizedistr-201811263.jpg', 27);
INSERT INTO `phim` VALUES ('PH00060', 'Lời Thì Thầm', 120, 18, '2018-08-22', 'Tiếng Hàn Quốc', 'Kim Min-Jung, Song Joon Hee, choi hee jin.', 'Hàn Quốc', 'Harvey Weinstein', ' Sáu học sinh trung học đã hoàn thành kỳ thi tuyển sinh đại học của họ, vô tình khám phá một ngôi nhà ma ám trong một công viên giải trí với những tin đồn kỳ lạ về nó. Trong sự tò mò, các thanh thiếu niên bỏ qua các cảnh báo và đi vào. Bên trong đó, các học sinh bắt đầu nghe thấy những tiếng thì thầm của cái chết và biến mất từng người một, một nỗi kinh hoàng khủng khiếp không thể ngăn cản được.', 'Ngừng chiếu', b'0', '1-201811273.jpg', 29);
INSERT INTO `phim` VALUES ('PH00061', 'Cổ Kiếm Kì Đàn : Lưu Nguyệt Chiêu Minh', 120, 18, '2018-08-10', 'Tiếng Trung Quốc', 'Leehom Wang Yue Wuyi, Victoria Song.', 'Trung Quốc', 'James Cameron', 'Dù trùng tên nhưng Cổ Kiếm Kỳ Đàm bản điện ảnh và truyền hình không liên quan gì đến nhau. Bộ phim điện ảnh Cổ Kiếm Kỳ Đàm: Chi Lưu Nguyệt Chiêu Minh xoay quanh hành trình tìm thanh kiếm Chiêu Minh đầy gian nguy của Nhạc Vô Dị, Văn Nhân Vũ, Hạ Di Tắc và A Nguyễn để ngăn cản tai nạn sắp xảy ra ở thành Lưu Nguyệt.', 'Ngừng chiếu', b'0', '1-201811864.jpg', 27);
INSERT INTO `phim` VALUES ('PH00062', 'Thiên Thần Công Lý', 100, 13, '2018-08-19', 'Tiếng Anh', 'Jennifer Garner, Jeff Hephner, John Ortiz.', 'Mỹ', 'Harvey Weinstein', 'kể về Riley North (Jennifer Garner), một người vợ và cũng là một người mẹ có cuộc sống bị đảo lộn hoàn toàn sau vụ tấn công nhằm vào gia đình cô. Sau khi tỉnh dậy từ trong hôn mê và nhận ra hệ thống pháp luật và công lý đã trở nên vô năng trong việc trừng phạt những kẻ phạm tội, cô biến mất để rồi trở lại sau vài năm và lên kế hoạch trả thù.', 'Ngừng chiếu', b'0', '1-201811624.jpg', 27);
INSERT INTO `phim` VALUES ('PH00063', 'Đại Chiến Thành AnSi', 120, 18, '2018-08-21', 'Tiếng Hàn Quốc', 'Nam Joo-Hyuk, Sa-Mool.', 'Hàn Quốc', 'Kathleen Kennedy', 'Cuộc chiến kéo dài 88 ngày đêm giữa quân đội Goguryeo và quân xâm lược nhà Đường để bảo vệ thành chiến Ansi. Một cuộc chiến không cân sức tưởng chừng như đã có kết quả an bài, nhưng kết cục lại không ai ngờ tới và được ghi danh vào sử sách như một trận đánh tiêu biểu cho tinh thần chiến đấu mãnh liệt.', 'Ngừng chiếu', b'0', '1-201811268.jpg', 29);
INSERT INTO `phim` VALUES ('PH00064', 'Vợ Ma', 120, 13, '2018-09-04', 'Tiếng Ấn Độ', 'Amar Kaushik.', 'Ấn Độ', 'Joel Silver', 'Tại một thị trấn nhỏ ở Ấn Độ, những người đàn ông luôn sống trong sợ hãi bởi một hồn ma được gọi là \"Stree\" (Vợ) thường bắt cóc đàn ông vào ban đêm. Dựa trên truyền thuyết đô thị của \"Nale Ba\" đã lan truyền ở Karnataka vào những năm 1990.', 'Ngừng chiếu', b'0', '1-201811754.jpg', 28);
INSERT INTO `phim` VALUES ('PH00065', 'Trò Gắn Thẻ', 90, 16, '2018-09-12', 'Tiếng Anh', 'Ed Helms, Annabelle Wallis, Jon Hamm.', 'Mỹ', 'Harvey Weinstein', 'Một nhóm nhỏ các cậu bạn cùng lớp tổ chức một trò chơi phức tạp, thường niên suốt từ năm chín tuổi đến khi trưởng thành, yêu cầu họ phải đi khắp đất nước.', 'Ngừng chiếu', b'0', '1-201808143.jpg', 28);
INSERT INTO `phim` VALUES ('PH00066', 'Người Tù Khổ Sai', 130, 16, '2018-09-14', 'Tiếng Anh', 'Charlie Hunnam, Rami Malek, Christopher Fulford, Joe David Walters, Brian Vernel.', 'Mỹ', 'Peter Jackson', 'là câu chuyện sử thi của Henri \"Papillon\" Charrière (Charlie Hunnam), một kẻ chuyên đi phá két sắt từ thế giới ngầm Paris, người bị gài tội giết người và bị kết án tù chung thân tại nhà tù thuộc địa Đảo Quỷ. Quyết tâm giành lại quyền tự do của mình, Papillon đã “kết thân” với chuyên gia lừa đảo Louis Dega (Rami Malek) và cả hai đã lên một kế hoạch vượt ngục vĩ đại nhất trong lịch sử. Bộ phim được làm lại theo cốt truyện phim Papillon năm 1973 dựa cuốn hồi ký cùng tên bán chạy nhất nước Mỹ.', 'Ngừng chiếu', b'0', '1-201811546.jpg', 27);
INSERT INTO `phim` VALUES ('PH00067', 'A-X-L Chú Chó Robot', 100, 13, '2018-09-27', 'Tiếng Anh', 'Alex Neustaedter, Becky G, Alex MacNicoll.', 'Mỹ', 'Michael Bay', 'tiếp tục giúp khán giả có dịp tái ngộ tình bạn thiêng liêng đó trên màn ảnh rộng với A-X-L (tựa Việt hóa: A-X-L Chú Chó Robot) khi người bạn bốn chân của chúng ta nay đã trở thành một chú siêu khuyển bằng máy móc.', 'Ngừng chiếu', b'0', '1-201810393.jpg', 27);
INSERT INTO `phim` VALUES ('PH00068', 'Xác Chết Trở Về', 90, 18, '2018-09-12', 'Tiếng Hàn Quốc', 'Kim Kang Woo, Kim Sang Kyung, Lee Ji Hoon, Kim Hee Ae, Han Ji Sang, Seo Hyun-Woo.', 'Hàn Quốc', '', 'YOON Seol-hee, Chủ tịch của một tập đoàn lớn, được phát hiện đã tử vong trước đó. Xác của cô ta đặt trong nhà xác, đang chờ được khám nghiệm bởi Cục Pháp Y Quốc Gia, thì đột nhiên nó biến mất một cách bí ẩn không dấu vết. Trong khi người chồng cô ta đang bị nghi ngờ ra là thủ phạm, cảnh sát Joongsik quyết điều tra cho ra người đã đánh cắp cái xác và vì lí do gì...', 'Ngừng chiếu', b'0', '1-201804259.jpg', 31);
INSERT INTO `phim` VALUES ('PH00069', 'Bào Thai Quỷ', 100, 13, '2018-09-22', 'Tiếng Anh', 'Melissa Bolona, Bojana Novakovic, Josh Stewart.', 'Mỹ', 'Joel Silver', 'là bộ phim kinh dị khởi đầu cho mùa Halloween năm nay với nội dung phim xoay quanh một giáo sư đại học & người vợ mang thai đang chờ đứa con đầu lòng. Thế nhưng, sau một lần chạy bộ giữa rừng, người vợ liên tục bị tấn công bởi những hiện tượng kỳ lạ khiến cô bị sảy thai. Dường như cô đã vô tình giải thoát một thực thể ma quái khát máu ẩn náu trong rừng sâu.', 'Ngừng chiếu', b'0', '1-201810659.jpg', 31);
INSERT INTO `phim` VALUES ('PH00070', 'Cuộc Chiến Kim Cương Xanh', 90, 13, '2018-09-18', 'Tiếng Anh', 'Keanu Reeves, Ana Ularu, Boris Gulyarin.', 'Mỹ', 'Michael Bay', 'Keanu Reeves vào vai Lucas Hill một thương gia đến Nga để bán những viên kim cương quý hiếm. Tuy nhiên cuộc giao dịch không thành công và anh trở thành đối tượng bị săn đuổi của những băng nhóm tội phạm và nhiều lực lượng chức năng khác\\.', 'Ngừng chiếu', b'0', '1-201807113.jpg', 27);
INSERT INTO `phim` VALUES ('PH00071', 'Pháp Sư Côn Đồ', 127, 18, '2018-09-27', 'Tiếng Hàn Quốc', 'Kim Jung Tae, Park Shin Yang.', 'Hàn Quốc', 'Peter Jackson', ' kể về: Gwang Ho (Park Shin Yang) là cánh tay phải đáng tin cậy của một ông trùm xã hội đen. Trong một lần dùng tay đỡ lưỡi dao cho thủ lĩnh của mình, đường định mệnh trong lòng bàn tay của Gwang Ho đã thay đổi. Sau đó, một loạt các sự kiện kỳ lạ xảy đến khiến Gwang Ho quyết định tìm gặp các thầy bói.', 'Ngừng chiếu', b'0', 'manontheedge-p1-201605302.jpg', 28);
INSERT INTO `phim` VALUES ('PH00072', 'Người Dơi Ninja', 85, 18, '2018-10-06', 'Tiếng Nhật Bản', 'Rie Kugimiya, Wataru Takagi, Kôichi Yamadera, Ai Kakuma.', 'Nhật Bản', 'Michael Bay', 'Batman cùng những đồng minh và kẻ thù bị đưa từ thành phố Gotham hiện đại trở về thời phong kiến Nhật Bản.', 'Ngừng chiếu', b'0', 'vung-tu-dia-phan-3-into-the-badlands-season-3-2018-1-201804353.jpg', 27);
INSERT INTO `phim` VALUES ('PH00073', 'Hoa Của Quỷ', 100, 0, '2018-10-03', 'Tiếng Anh', 'Alexander Petrov, Taisiya Vilkova.', 'Mỹ', 'Joel Silver', 'Nằm trong series phim Gogol đình đám và đầy tham vọng của điện ảnh Nga, HOA CỦA QUỶ (tựa gốc: GOGOL: VIY) lấy bối cảnh tại một ngôi làng bí ẩn Dikanka trong quá khứ xa xôi, nơi mà một thế lực đen tối đã bắt và giết chết các cô gái trẻ. Nikolai Gogol (Alexander Petrov thủ vai) – một pháp sư từ St Petersburg đã nhập cuộc điều tra. Anh dần phát hiện ra hung thủ đứng sau tất cả là Kỵ Sỹ Hắc Ám. Nhưng cuộc chiến chống lại thế lực đen tối không hề suôn sẻ, lúc này vị pháp sư trẻ tuổi cần đến sự giúp đỡ của người bạn đồng hành tuyệt vời là là Thợ Săn Phù Thủy kiêm Nhà Thần Học Khoma Brutu..', 'Ngừng chiếu', b'0', '64a285864e7b14302ef7ce5dee395601d73a1df5349feffa92pimgpshfullsizedistr-201810350.jpg', 31);
INSERT INTO `phim` VALUES ('PH00074', 'Biệt Đội Cún Cưng', 100, 18, '2018-10-11', 'Tiếng Anh', 'Will Arnett, Natasha Lyonne, Alan Cumming.', 'Mỹ', 'James Cameron', 'là câu chuyện xoay quanh hành trình phá án của Max và người bạn đặc biệt – một chú chó có khả năng suy luận vô cùng tài tình.', 'Ngừng chiếu', b'0', 'biet-201811895.jpg', 32);
INSERT INTO `phim` VALUES ('PH00075', 'Không Kích', 120, 0, '2018-10-02', 'Tiếng Anh', 'Bruce Willis, Seung-Heon.', 'Mỹ', 'Brian Grazer', ' Lấy bối cảnh năm 1943 tại Trung Quốc thời Thế Chiến 2, Air Strike kể về cuộc đánh bom của Nhật Bản vào Trùng Khánh. 5 người Trung Quốc khác nhau chiến đấu theo cách của riêng họ xuyên suốt các cuộc tấn công của Không quân Nhật Bản để bảo vệ một cỗ máy quân sự quan trọng ở Trùng Khánh. Phim quy tụ dàn diễn viên toàn sao với Bruce Willis, Adrien Brody, Song Seung Hun, Lưu Diệp, Trần Vỹ Đình, Tạ Đình Phong và Phạm Băng Băng.', 'Ngừng chiếu', b'0', '1-201811559.jpg', 27);
INSERT INTO `phim` VALUES ('PH00076', 'Những Cô Gái Equestria: Tình Bạn Bị Lãng Quên', 45, 0, '2018-10-30', 'Tiếng Anh', 'Andrea Libman, Ashleigh Ball, Rebecca Shoichet.', 'Mỹ', 'George Lucas', 'Khi Sunset Shimmer phát hiện ra bạn bè của cô không nhớ gì về mình, cô bị sốc khi biết rằng sau khi Hunman Twilight được cải cách, tất cả dấu vết của SunSet đã biến mất. Tuyệt vọng, Sunset quyết tâm mang lại ký ức của bạn bè về mình. Nhưng để làm như vậy, trước tiên cô phải tìm ra thủ phạm đã làm việc này.', 'Ngừng chiếu', b'0', '1-201811551.jpg', 32);
INSERT INTO `phim` VALUES ('PH00077', 'Huynh Đệ Hoàng Kim', 120, 13, '2018-10-26', 'Tiếng Hồng Kông', 'Đang cập nhật.', 'Hồng Kông', 'Peter Jackson', 'Golden Job đánh dấu sự tái ngộ của dàn diễn viên đình đám Hong Kong trong một bộ phim sau 20 năm. Lần đầu tiên lên sóng vào năm 1996, bộ phim Người trong giang hồ (Young and Dangerous) đã nhận được sự quan tâm của dư luận. Năm anh em Sư Vương (Trịnh Y Kiện), Hỏa Sơn (Trần Tiểu Xuân), Bill (Tạ Thiên Hoa), Đàm Định (Tiền Gia Lạc), Lão Thử (Lâm Hiểu Phong), dưới sự chỉ đạo của ân sư Tào Sir (Tăng Chí Vĩ) cùng nhau vào sinh ra tử.', 'Ngừng chiếu', b'0', '1-201811732.jpg', 27);
INSERT INTO `phim` VALUES ('PH00078', 'Đường Đua Tử Thần 4', 100, 0, '2018-10-16', 'Tiếng Anh', 'Danny Glover, Cassie Clare, Christine Marzano, Diana Dimitrova.', 'Mỹ', 'Harvey Weinstein', 'Danny Trejo trở lại với tư cách là một Bookie tàn nhẫn, Goldberg, trong Death Race điên cuồng nhất, máu nhất. Sau một cuộc tấn công thất bại đối với tù nhân và người lái xe huyền thoại, Frankenstein, chuyên gia Black Ops, Connor Gibson (McGowan) xâm nhập vào một nhà tù liên bang tối đa với một mục tiêu – vào Death Race bất hợp pháp và bất hợp pháp và đưa Frankenstein xuống. Connor sử dụng sự trợ giúp của Baltimore Bob (Glover) và Lists (Koehler), và bất ngờ rơi vào tình yêu với vẻ đẹp bartending, Jane (Marzano).', 'Ngừng chiếu', b'0', 'duong-dua-tu-than-4-poster-201811151.jpg', 27);
INSERT INTO `phim` VALUES ('PH00079', 'Ẩn Thân', 100, 13, '2018-10-22', 'Tiếng Anh', 'Ben Foster, Thomasin McKenzie.', 'Mỹ', 'George Lucas', 'kể về hai cha con sống ẩn dật trong rừng, tránh xa phần còn lại của thế giới. Một sai lầm khiến họ bị chính quyền phát hiện, buộc phải chạy trốn và tìm nơi ở mới.', 'Đang chiếu', b'0', '1-201811242.jpg', 29);
INSERT INTO `phim` VALUES ('PH00080', 'Nhiệm Vụ Bất Khả Thi : Sụp Đổ', 120, 18, '2018-11-02', 'Tiếng Anh', 'Tom Cruise, Rebecca Ferguson, Henry Cavill August Walk.', 'Mỹ', 'James Cameron', 'Ba năm sau Mission: Impossible – Rogue Nation, chàng đặc vụ điển trai và hào hoa bậc nhất trên màn ảnh rộng Ethan Hunt sẽ tái xuất màn bạc trong mùa hè 2018. Trailer đầu tiên của Nhiệm Vụ Bất Khả Thi: Sụp Đổ (Tựa gốc: Mission: Impossible - Fallout) vừa được hãng phát hành Paramount tung ra ngay lập tức trở thành tâm điểm của đại chúng bởi sự trở lại của ngôi sao hành động hàng đầu thế giới Tom Cruise cùng những khoảnh khắc nghẹt thở bắt nguồn từ pha hành động đẳng cấp mang đậm dấu ấn cá nhân anh.', 'Đang chiếu', b'0', '1-201809546.jpg', 27);
INSERT INTO `phim` VALUES ('PH00081', 'Con Nhà Siêu Giàu Châu Á', 100, 13, '2018-11-03', 'Tiếng Anh', 'Michelle Yeoh, Constance Wu, Henry Golding.', 'Mỹ', 'George Lucas', 'Crazy Rich Asians theo chân cô gái người Mỹ gốc Á Rachel Chu cùng bạn trai Nick Young về quê nhà Singapore để dự đám cưới người bạn thân nhất. Khi đến nơi, Rachel sửng sốt khi phát hiện ra bạn trai là con của một trong những gia đình giàu có nhất châu Á, và là một trong những anh chàng độc thân hot nhất Singapore.', 'Đang chiếu', b'0', '64a285864e7b14302ef7ce5dee395601d73a1df5349feffa92pimgpshfullsizedistr-201811793.jpg', 29);
INSERT INTO `phim` VALUES ('PH00082', 'Trận Bóng Kinh Hoàng', 100, 0, '2018-11-16', 'Tiếng Anh', 'Pierce Brosnan, Ray Stevenson.', 'Mỹ', 'Joel Silver', 'Cho rằng gã anh trai phản bội Dimitri ( Pierce Brosnan) đang lẩn trốn đâu đó tại sân vận động Boleyn Ground nơi diễn ra trận bán kết tranh cúp Châu Âu giữa hai đội tuyển West Ham United và Dynamo FCC, Arkady ( Ray Stevenson), tên cầm đầu cuộc cách mạng tại bang Sukovia ở nước Nga đã phong tỏa toàn bộ sân vận động khiến nội bất xuất, ngoại bất nhập để truy tìm kẻ thù. Trong đám đông có mặt tại đó, Mike Knox ( Dave Bautista) và đứa cháu của mình Danni ( Lara Peake) đã vô tình có mặt tại trận cầu sống còn và phải đối mặt với băng nhóm nguy hiểm của tên Arkady. Liệu Mike có kịp thời ngăn chăn Arkady trước khi hắn tìm thấy Dimitri? Sự sống của 35,000 người có mặt tại sân vận động và người dân nước Nga phụ thuộc cả vào anh.', 'Đang chiếu', b'0', '1-201809342.jpg', 27);
INSERT INTO `phim` VALUES ('PH00083', 'Christopher Robin 2018', 104, 18, '2018-11-29', 'Tiếng Anh', 'Hayley Atwell, Ewan McGregor, Mark Gatiss, Roger Ashton-Griffiths, Tristan Sturrock, Adrian Scarborough, Oliver Ford Davies, Ken Nwosu.', 'Mỹ', 'Brian Grazer', ' là một tác phẩm live-action ấm áp về tình cảm gia đình của hãng phim Disney. Bộ phim xoay quanh chuyến phiêu lưu trở lại tuổi thơ cùng những người bạn thuở nhỏ đầy thân thuộc bao gồm Pooh, Tigger, Eeyore và Piglet ở Rừng Trăm Mẫu. Năm tháng trôi qua, Robin dần trưởng thành và quên đi những người bạn thời thơ ấu. Anh phải đối mặt với những khó khăn trong công việc và rời xa chính gia đình mình. Buổi hội ngộ tình cờ của họ tại London đã khơi dậy niềm vui cho hành trình mới đầy cảm xúc và giúp anh tìm lại ý nghĩa trong cuộc sống.', 'Đang chiếu', b'0', '1-201811400.jpg', 28);
INSERT INTO `phim` VALUES ('PH00084', 'Ông Trùm Phía Sau', 120, 16, '2018-11-12', 'Tiếng Trung Quốc', 'Kinlas Chan, Nhậm Đạt Hoa, Từ Tranh, Vương Lệ Khôn, Zhu Zhu, Xiao Bao.', 'Trung Quốc', 'Brian Grazer', 'Một ngày nọ, Zhong tỉnh dậy một mình trong biệt thự của mình: anh bị nhốt trong phòng ngủ của mình, và cửa sổ đã được xếp lên. Một người gọi bí ẩn thông báo cho anh ta rằng anh ta phải chơi một trò chơi: anh ta sẽ được đưa ra một loạt các lựa chọn không thể giữa một lựa chọn đau khổ A (ví dụ, công khai tiết lộ anh ta đang trốn thuế) và một lựa chọn không đau đớn B (chẳng hạn như hy sinh một bạn bè) - không chọn sẽ dẫn đến cả hai tùy chọn được thi hành. Trong khi cố gắng trốn thoát và khám phá danh tính của kẻ hành hạ.', 'Đang chiếu', b'0', '5b7c2c9469823-201811255.jpg', 29);
INSERT INTO `phim` VALUES ('PH00085', 'Người Lính Vô Danh', 100, 18, '2018-11-02', 'Tiếng Anh', 'Eero Aho, Johannes Holopainen, Jussi Vatanen.', 'Mỹ', 'Joel Silver', 'Tháng 6 năm 1941: Bị mắc kẹt giữa hai chế độ đàn áp, Phần Lan có ít sự lựa chọn nhưng phải đồng minh với Đức Quốc xã chống lại Liên Xô, kẻ thù không đội trời chung...', 'Đang chiếu', b'0', '64a285864e7b14302ef7ce5dee395601d73a1df5349feffa92pimgpshfullsizedistr-201811687.jpg', 29);
INSERT INTO `phim` VALUES ('PH00086', 'Chuyến Đi Của Cuộc Đời', 100, 18, '2018-11-15', 'Tiếng Anh', 'Sheila Hancock, Kevin Guthrie, Paul Brannigan.', 'Mỹ', 'James Cameron', 'Mặc dù đã 83 tuổi nhưng bà Edie tin rằng không gì là quá muộn. Bà bỏ lại mọi việc phía sau và vác ba lô lên bắt đầu chuyến phiêu lưu chinh phục ngọn núi Suliven hùng vĩ ở Scotland.', 'Đang chiếu', b'0', '1-201811955.jpg', 29);
INSERT INTO `phim` VALUES ('PH00087', 'Màn Sương Chết', 102, 18, '2018-11-18', 'Tiếng Anh', 'Đang cập nhật.', 'Mỹ', 'Joel Silver', 'Không được báo trước, một trận động đất vô cùng lớn tấn công Paris, cả thành phố sau đó bị bao phủ bởi một lớp sương mù dày đặc. Màn sương chết ấy đang lần lượt cướp đi tính mạng của rất nhiều những người dân nơi đây. Gia đình cô bé 11 tuổi Sarah - người được nuôi dưỡng trong lồng kính y tế đặc biệt từ khi vừa chào đời, may mắn là một trong số ít những người còn sống sót, nhưng họ cũng chỉ cách cái kết tàn nhẫn kia một làn hơi thở vô cùng mong manh.', 'Đang chiếu', b'0', '1-201811677.jpg', 29);
INSERT INTO `phim` VALUES ('PH00088', 'Mạng Lưới Ngầm', 100, 13, '2018-12-25', 'Tiếng Anh', 'Logan Huffman, Lucy Fry, Thomas Mann.', 'Mỹ', 'Harvey Weinstein', 'Một cậu học sinh bình thường, thậm chí vụng về, lại là đầu mối của mạng lưới buôn bán ma túy Columbia. “Mạng lưới ngầm” là một bộ phim đáng xem, có chiều sâu và để lại dấu ấn trong lòng khán giả.', 'Sắp chiếu', b'0', '1-201811738.jpg', 27);
INSERT INTO `phim` VALUES ('PH00089', 'Nô Lệ Của Quỷ', 100, 13, '2018-12-04', 'Tiếng Anh', 'Tara Basro, Bront Palarae.', 'Mỹ', 'Jerry Bruckheimer', 'nói về những điều kỳ lạ xảy ra trong một gia đình ba thế hệ sống ở vùng ngoại ô Jakarta. Người mẹ Mawarni là một nghệ sĩ nổi tiếng và có những ca khúc ăn khách. Một ngày nọ, Mawarni bị mắc một cơn bệnh lạ kéo dài hơn ba năm rồi qua đời. Và từ đây tấn bi kịch bắt đầu với những người ở lại. Điều đầu tiên là mẹ cô được phát hiện chết một cách bí ẩn trong giếng nước, tiếp theo đó là sự xuất hiện của những hồn ma lởn vởn trong nhà trêu ghẹo hăm dọa những đứa con, và đỉnh điểm là cái chết của người họ hàng đã giúp đỡ gia đình cô nhiệt tình lúc tang gia. Cô con gái lớn Rini sau khi đọc được di thư của bà ngoại thì biết được một sự thật kinh khủng là mẹ cô - bà Mawarni không thể có con, và bốn chị em cô được sinh ra là do mẹ cô tham gia một giáo phái Satanic bí ẩn để có thai.', 'Đang chiếu', b'0', '1-201811867.jpg', 29);
INSERT INTO `phim` VALUES ('PH00090', 'Ông Trăm Tuổi Chèo Qua Cửa Sổ Và Biến Mất', 120, 18, '2018-12-08', 'Tiếng Anh', 'Jens Hulté, Ralph Carlsso, Georg Nikoloff.', 'Mỹ', 'Peter Jackson', ' Vào ngày sinh nhật lần thứ 100 của mình, cụ ông Allan Karlsson đột nhiên trèo qua của sổ ngôi nhà dưỡng lão - Nhà Già - và biến mất. Ở cái tuổi 100 hiếm ai đạt tới thì cụ có thể đi đâu được? Một cuộc truy tìm trên khắp nước Thụy Điển diễn ra từ phía những người có trách nhiệm chăm nom cụ cũng như chính quyền sở tại. Song song với cuộc truy tìm nhân đạo ấy, một cuộc truy tìm đuổi bắt khác gay cấn hơn, xảy đến từ một tên tội phạm, kẻ đã ngớ ngẩn hoặc đúng hơn, bất cẩn trao vali 50 triệu crown vào tay cụ già này. Nhưng một người đã sống qua một thế kỷ thì không dễ gì tóm cụ ta được.', 'Sắp chiếu', b'0', '1-201811452.jpg', 28);
INSERT INTO `phim` VALUES ('PH00091', 'Binh Pháp II: Sự Phản Bội', 120, 13, '2018-12-21', 'Tiếng Anh', 'Wesley Snipes, Lochlyn Munro, Athena Karkanis.', 'Mỹ', 'Peter Jackson', 'khi điệp vụ Neil Shaw “lộ diện” để minh oan cho người được cho là đã giết chết người cố vấn cũ của anh, Neil đã phải đối mặt với một loạt các vụ trả thù. Dưới sự thuyết phục của một người bạn và một ứng cử viên cho chiếc ghế trong thượng viện, Neil Shaw một lần nữa phải dấn thân để lập lại trật tự.', 'Sắp chiếu', b'0', '1-201811780.jpg', 27);
INSERT INTO `phim` VALUES ('PH00092', 'Gia Đình Siêu Nhân 2', 102, 13, '2018-12-25', 'Tiếng Anh', 'Samuel L. Jackson, Holly Hunter.', 'Mỹ', 'Brian Grazer', 'đánh dấu những chuyến phiêu lưu anh hùng đầy hấp dẫn với sự đổi vai đầy táo bạo. Lần này, mẹ dẻo Helen (Elastigirl) sẽ đi thực chiến giải cứu thế giới trong khi bố khỏe Bob (Mr. Incredible) lùi về hậu phương trông nom những đứa con siêu nhân láu lỉnh gồm: con gái Violet ( siêu năng lực tàng hình và tạo ra từ trường làm chắn bảo vệ), con trai Dash (chạy siêu nhanh) và cậu út Jack-Jack với sức mạnh chưa được khám phá.', 'Sắp chiếu', b'0', '1-201810404.jpg', 28);
INSERT INTO `phim` VALUES ('PH00093', 'Thiện Ác Đối Đầu 2', 120, 0, '2018-12-28', 'Tiếng Anh', 'Denzel Washington.', 'Mỹ', 'Harvey Weinstein', 'à một bộ phim hành động cực kỳ gây cấn và kịch tính với sự tham gia diễn xuất trở lại của diễn viên gạo cội Denzel Washington. Trong phim, cựu đặc vụ CIA tiếp tục trở thành “người hùng thầm lặng” truy tìm công lý đặc biệt càng quyết liệt hơn sau cái chết của người bạn thân Susan.', 'Sắp chiếu', b'0', '1-201811787.jpg', 27);
INSERT INTO `phim` VALUES ('PH00094', 'Ác Quỷ Ma Sơ', 90, 16, '2018-12-09', 'Tiếng Anh', 'Taissa Farmiga, Demián Bichir, Charlotte Hope, Jonas Bloquet, Bonnie Aarons.', 'Mỹ', 'George Lucas', 'Lấy bối cảnh một tu viện thuộc Romania năm 1952, trước những sự kiện diễn ra trong \"The Conjuring\" và \"Annabelle\". Sau cái chết kỳ dị và bí ẩn của một nữ tu trẻ ở tu viện, một linh mục với quá khứ ám ảnh và một mục sư chưa thực hiện lời tuyên thệ cuối cùng được Vatican cử đến để điều tra sự việc.', 'Sắp chiếu', b'0', '1-201810775.jpg', 27);
INSERT INTO `phim` VALUES ('PH00095', 'Maquia: Chờ Ngày Lời Hứa Nở Hoa', 120, 13, '2018-12-11', 'Tiếng Nhật Bản', 'Đang cập nhật.', 'Nhật Bản', '', 'Câu chuyện bắt đầu với Maquia, người đến từ một gia đình, nơi tất cả các thành viên đều ngừng tuổi ở giữa những thiếu niên. Cô ấy không có cha mẹ và, mặc dù những ngày của cô ấy là bình thường, cô ấy cảm thấy cô đơn.', 'Sắp chiếu', b'0', '1-201811288.jpg', 29);
INSERT INTO `phim` VALUES ('PH00096', 'Những Câu Chuyện Bên Sông', 120, 13, '2019-01-09', 'Tiếng Nhật Bản', 'Yoshizawa Ryo, Shirasu Jin, Shuhei Uesugi, Nikaido Fumi, Morikawa Aoi.', 'Nhật Bản', 'Michael Bay', 'kể về mối quan hệ kì lạ nhưng bền chặt giữa ba thiếu niên khác biệt nhau mọi mặt. Wakakusa Haruna (Fumi Nikaido đóng), một cô nàng cá tính mạnh, thấy chuyện bất bình chẳng tha. Yamada Ichiro (Ryo Yoshizawa đóng), chàng học sinh gương mẫu và tử tế. Tuy chuyên bị bắt nạt nhưng cậu không hề run sợ trước hoàn cảnh. Ngược lại, cậu tỏ vẻ ngoan cường và ung dung. Một đứa đầy bí ẩn. Yoshikawa Kozue (Sumire đóng), cô bé người mẫu chuyên nghiệp mang dáng người mảnh khảnh và quyến rũ. Cô bé có thói quen ăn rất nhiều để rồi nôn ra hết. Ba người bọn họ gắn kết và san sẻ với nhau một báu vật tang tóc. Đó là một cái xác người chết khô vô danh trên đồng cỏ hoang bên bờ sông chảy ngang thành phố họ sống. Phim là bản nhạc ảm đạm và buồn bã của tuổi thanh xuân đầy những nỗi niềm băn khoăn về thực tại và tương lai, sự sống và cái chết, tình yêu và ích kỷ… Một chiến trường không súng hư.', 'Sắp chiếu', b'0', '1-201811528.jpg', 29);
INSERT INTO `phim` VALUES ('PH00097', 'Chân Nhỏ, Bạn Ở Đâu', 100, 13, '2019-01-29', 'Tiếng Anh', 'Channing Tatum,  Common, James Corden, ZENDAYA.', 'Mỹ', 'Peter Jackson', 'Sau lần chạm trán với Percy, một sinh vật với đôi chân bé nhỏ, người tuyết Migo quyết tâm thực hiện chuyến phiêu lưu của mình đến vùng đất xa xôi để chứng minh với cộng đồng của mình rằng Chân Nhỏ là có thật.', 'Sắp chiếu', b'0', '1-201811152.jpg', 32);
INSERT INTO `phim` VALUES ('PH00098', 'Thiên Hạ Đệ Nhất Tiêu Cục', 100, 13, '2019-01-11', 'Tiếng Trung Quốc', 'Phàn Thiếu Hoàng, Thích Ngạn Năng, Xa Vĩnh Lợi.', 'Trung Quốc', 'Harvey Weinstein', 'Ngô Tam Quới qua đời, tướng Mã Bảo vì bảo vệ truyền nhân của chủ tử đành phải nhờ giang hồ giúp sức. Chứng tỏ được năng lực, Thái Bình tiêu cục được Mã Bảo ủy thác hộ tống một người thần bí đến nới an toàn. Nhóm tiêu sư quả cảm do tiêu đầu Lục An chỉ huy phấn khởi lên đường nhưng không biết mình sẽ đối mặt với mối nguy hiểm khôn lường.', 'Sắp chiếu', b'0', '64a285864e7b14302ef7ce5dee395601d73a1df5349feffa92pimgpshfullsizedistr-201811271.jpg', 27);
INSERT INTO `phim` VALUES ('PH00099', 'Trò Chơi Giải Mã', 100, 0, '2019-01-18', 'Tiếng Trung Quốc', 'Hàn Canh, Rhydian Vaughan, Tomohisa Yamashita.', 'Trung Quốc', 'Brian Grazer', 'Thần đồng IT ẩn dạt Lý Hạo Minh bất ngờ bị cuốn vào một phi vụ bất chính. Anh vừa phải cùng hacker Kiều Phi và đả nữ Tô Nghi tấn công tập đoàn IT Oasis theo yêu cầu của Takeshi Mori, tay trùm người Nhật, vừa phải làm tình báo cho cảnh sát.', 'Sắp chiếu', b'0', '1-201810703.jpg', 27);
INSERT INTO `phim` VALUES ('PH00100', 'Cá Mập Siêu Bạo Chúa', 120, 13, '2019-01-26', 'Tiếng Anh', 'Bingbing Li, Jason Statham, Rainn Wilson.', 'Mỹ', 'Harvey Weinstein', 'Bộ phim Cá Mập Siêu Bạo Chúa dựa trên cuốn tiểu thuyết MEG: A Novel of Deep Terror của tác giả Steve Alten, lần đầu xuất bản năm 1997. Câu chuyện bắt đầu khi các nhà khoa học khám phá ra loài cá mập cổ đại Megalodon vẫn còn sống sót tại khu vực biển Mariana Trench nhờ dòng nước lạnh.', 'Sắp chiếu', b'0', '1-201809481.jpg', 27);
INSERT INTO `phim` VALUES ('PH00101', 'Johnny English 3: Tái Xuất Giang Hồ', 100, 13, '2019-01-10', 'Tiếng Anh', 'Rowan Atkinson.', 'Mỹ', 'Michael Bay', ' là phần thứ ba của loạt phim hài Johnny English, với Rowan Atkinson trong vai một gã bỗng dưng trở thành một điệp viên bí mật. Cuộc phiêu lưu mới bắt đầu khi một vụ điều tra hệ thống an ninh mạng cho thấy danh tính của tất cả các điệp viên đang hoạt động tại Anh, và Johnny là hy vọng cuối cùng để điều tra bí mật ấy.', 'Sắp chiếu', b'0', '1-201804959.jpg', 28);
INSERT INTO `phim` VALUES ('PH00102', 'Thôn Cổ Sơn', 85, 13, '2019-01-12', 'Tiếng Hồng Kông', 'Kai-Chung Cheung, Chu Nhân, Yao Tong, Fung Lee.', 'Hồng Kông', 'Peter Jackson', 'Vào đêm giao thừa âm lịch, Qingyi và con trai ông, Dawa, đợi chồng Shizi đi làm về nước. Thật không may, họ đã chờ một đêm nhưng Shizi chưa bao giờ xuất hiện. Trong khi đó, Dawa tiếp tục nhìn thấy một người xa lạ có vẻ vô hình với Qingyi. Dì Er, hàng xóm của Qingyi, đã đến thăm bà. Qingyi yêu cầu cô chăm sóc Dawa để cô có thể đến ủy ban làng và gọi Shizi tại nơi làm việc.', 'Sắp chiếu', b'0', '2-201810665.jpg', 31);
INSERT INTO `phim` VALUES ('PH00103', 'Gã Không Mặt', 100, 16, '2019-01-17', 'Tiếng Anh', 'Joey King, Julia Goldani Telles, Jaz Sinclair.', 'Mỹ', 'Jerry Bruckheimer', 'Được biết đến như một nhân vật kinh dị đầy hãi hùng, Slender Man hiện thân trong hình tượng của người đàn ông mặc vest lịch lãm nhưng đáng sợ với gương mặt trống trơn, thân người cao bất thường.', 'Sắp chiếu', b'0', 'ga-201810986.jpg', 31);
INSERT INTO `phim` VALUES ('PH00104', 'Alpha: Người Thủ Lĩnh', 120, 18, '2019-02-15', 'Tiếng Anh', 'Natassia Malthe, Leonor Varela, Kodi Smit-McPhee, Jóhannes Haukur Jóhannesson.', 'Mỹ', 'Harvey Weinstein', 'lấy bối cảnh 20.000 năm trước, đưa người xem theo chân một cậu bé thuộc tộc người hang động tại Châu Âu (do Kodi Smit-McPhee thủ vai) vào thời Đồ Đá Cũ. Trong lúc cùng các đồng bào của mình đi săn bò rừng, cậu đã bị rơi khỏi vách đá và lạc mất đoàn. Trong hành trình trở về bộ tộc đầy cam go, người chiến binh trẻ đã có một tình bạn kỳ lạ cùng một con sói tuyết hung dữ.', 'Sắp chiếu', b'0', '1-201810815.jpg', 27);
INSERT INTO `phim` VALUES ('PH00105', 'Tìm Kiếm', 120, 13, '2019-02-13', 'Tiếng Anh', 'John Cho David Kim.', 'Mỹ', 'Joel Silver', 'Sau khi cô con gái 16 tuổi bị mất tích, người cha tuyệt vọng truy cập vào máy tính cá nhân của cô con gái nhằm tìm ra các manh mối để tìm kiếm cô.', 'Sắp chiếu', b'0', '1-201810228.jpg', 29);
INSERT INTO `phim` VALUES ('PH00106', 'Bất Khả Xâm Phạm', 90, 0, '2019-02-28', 'Tiếng Nhật Bản', 'Erika Sawajiri, Tori Matsuzaka, Shotaro Mamiya, Mackenyu Arata, Tet Wada, Tetsuya Sugaya.', 'Nhật Bản', 'Brian Grazer', 'dựa trên manga cùng tên của tác giả Arata Miyatsuki và Yuya Kanzaki. Bản điện ảnh đổi giới tính của nhân vật Tomoko Tada trong nguyên tác từ nam sang nữ. Tadashi Usobuki là một sát thủ bí ẩn mặc đồ đen. Usobuki nhận hợp đồng từ những khách hàng chứa chất đầy căm uất. Tuy nhiên việc tìm ra chứng cứ để khép tội Usobuki là vô vọng bởi bởi anh ta có một khả năng đặc biệt. Những nạn nhân sau khi giao tiếp với Usobuki đều mất kiểm soát và bị anh ta chi phối tâm trí.', 'Sắp chiếu', b'0', '1-201810693.jpg', 27);
INSERT INTO `phim` VALUES ('PH00107', 'Vũ Điệu Tình Yêu', 90, 18, '2019-02-15', 'Tiếng Trung Quốc', 'Chu Ân, Đỗ Thiên Hạo, Vương Chí Phi.', 'Trung Quốc', 'Jerry Bruckheimer', 'Thời còn trẻ, Lộ Kiến Quốc hy sinh cơ hội trở thành vũ công xuất sắc, đổi lại được tình yêu đẹp với bạn gái Diệp Lan. 20 năm sau, vì tính toán của cuộc sống khiến tình cảm hai vợ chồng rạn nứt.', 'Sắp chiếu', b'0', '1-201810804.jpg', 29);
INSERT INTO `phim` VALUES ('PH00108', 'Mốc 22', 100, 0, '2019-02-13', 'Tiếng Anh', 'Mark Wahlberg, Iko Uwais, Lauren Cohan.', 'Mỹ', 'Joel Silver', 'Trong bối cảnh hoạt động tình báo trở nên căng thẳng và chính trị phức tạp với vô số âm mưu tấn công vào nước Mỹ, nhóm đặc nhiệm Ground Branch buộc phải nhận nhiệm vụ vận chuyển một “tài sản” bất đắc dĩ từ Đại sứ quán Mỹ ở một nước Đông Nam Á tới sân bay để về lại Mỹ. Tài sản này là một cảnh sát địa phương Li-Noor. Li-Noor là người nắm giữ thông tin khủng bố, hắn chỉ đồng ý trao đổi khi và chỉ khi hắn được an toàn tại Mỹ.', 'Sắp chiếu', b'0', '2-201810383.jpg', 27);
INSERT INTO `phim` VALUES ('PH00109', 'Miền Đất Thơ Mộng', 120, 13, '2019-02-12', 'Tiếng Pháp', 'Marion Cotillard, Alex Brendemühl, Louis Garrel.', 'Pháp', 'Harvey Weinstein', 'Cô gái Gabrielle đến từ ngôi làng nhỏ ở miền nam nước Pháp. Gabrielle có ước mơ về tình yêu được coi là thiếu thực tế và có phần điên rồ. Bố mẹ muốn cô kết hôn với Jose, một công nhân đang làm tại trang trại Tây Ban Nha. Anh ta rất chân thành và yêu mến phụ nữ. Hai ông bà nghĩ đây sẽ là chàng trai phù hợp với con gái của mình. Mặc dù sống cùng anh nhưng Gabrielle thề rằng sẽ không bao giờ đặt tình yêu của mình nơi Jose. Cô không muốn sống cuộc đời nhàm chán bị hạn chế bởi xã hội hậu chiến tranh.', 'Sắp chiếu', b'0', '64a285864e7b14302ef7ce5dee395601d73a1df5349feffa92pimgpshfullsizedistr-201810422.jpg', 29);
INSERT INTO `phim` VALUES ('PH00110', 'Sa Hải Ngoại Truyện: Bệnh Nhân', 100, 0, '2019-02-22', 'Tiếng Trung Quốc', 'Vương Uyên Tuệ, Đậu Bá Lâm.', 'Trung Quốc', 'Peter Jackson', 'Vì cái chết kì lạ của thủ hạ nên Hoắc Hữu Tâm đã đến Ngô Sơn Cư hỏi tội và sắp đặt khiến Bạch Xà của Ngô Sơn Cư bị mắc bệnh truyền nhiễm kì lạ là móng tay dài, nhưng không ngờ Bạch Xà lại đánh trả lại khiến cho cả hai đều bị mắc bệnh truyền nhiễm đó.', 'Sắp chiếu', b'0', 'sa-201810494.jpg', 27);
INSERT INTO `phim` VALUES ('PH00111', 'Bí Mật Phu Nhân Thị Trưởng', 120, 16, '2019-02-05', 'Tiếng Anh', 'Trần Kiều Ân, Chih-Hsiang Ma, Chia-Yen Ko.', 'Mỹ', 'Kathleen Kennedy', 'Một đoạn clip quay trộm cảnh Trình Kiến và vợ của thị trưởng hôn nhau say đắm đang được phát tán trên mạng khiến anh lâm vào cảnh “sống không bằng chết”.', 'Sắp chiếu', b'0', '1-201810879.jpg', 29);
INSERT INTO `phim` VALUES ('PH00112', 'Ngôi Nhà Có Chiếc Đồng Hồ Ma Thuật', 90, 16, '2019-03-11', 'Tiếng Anh', 'Cate Blanchett, Jack Black, Kyle MacLachla.', 'Mỹ', 'Michael Bay', 'Cậu bé 10 tuổi Lewis Barnavelt chuyển đến New Zebedee, Michigan sống với ông bác phù thủy Jonathan trong một căn nhà cổ xưa kỳ quái, nơi ẩn giấu một chiếc đồng hồ ma thuật đe dọa đến sự tồn vong của Trái Đất. Với sự giúp đỡ của ông bác Jonathan và pháp sư “hàng xóm” Zimmerman, Lewis nhát gan phải giành tất cả sự dũng cảm của mình để ngăn chặn các thế lực tà ác và phá hủy chiếc đồng hồ mang đến ngày tận thế cho toàn thế giới.', 'Sắp chiếu', b'0', '1-201810197.jpg', 27);
INSERT INTO `phim` VALUES ('PH00113', 'Mật Ngọt', 100, 18, '2019-03-30', 'Tiếng Nhật Bản', 'Kaho Mizutani, Ryusei Yokohama, Nana Asakawa, Yuna Taira.', 'Nhật Bản', 'Steven Spielberg', 'Nao Kogure là một nữ sinh trung học nhút nhát và dễ thương. Một ngày, Taiga Onise hỏi cô ấy \"Cậu có muốn hẹn hò với tôi và hứa rằng chúng ta sẽ kết hôn không?\" Nao Kogure không thể từ chối Onise, bởi vì cô sợ cậu ấy. Onise có mái tóc đỏ và đôi mắt đâm xuyên đáng sợ. Sự xuất hiện của cậu ấy tạo ấn tượng rằng cậu ấy là một người xấu, nhưng cậu ấy thực sự quan tâm đến người khác và rất thích nấu ăn. Sau khi tìm hiểu Taiga Onise, Nao Kogure bắt đầu có cảm xúc với cậu ấy và mối quan hệ dần này nở.....', 'Sắp chiếu', b'0', '1-201810592.jpg', 29);
INSERT INTO `phim` VALUES ('PH00114', 'Màn Đêm Kéo Đến', 45, 16, '2019-03-27', 'Tiếng Anh', 'Iko Uwais, Julie Estelle, Joe Taslim.', 'Mỹ', 'George Lucas', 'Sau khi tha mạng cho một cô bé trong một cuộc thảm sát do mình dẫn đầu, gã sát thủ của hội Tam Hoàng Ito (Joe Taslim) trở thành tầm ngắm của hàng loạt sát thủ khác. Phim nhiều cảnh bạo lực, máu me. Cân nhắc trước khi xem.', 'Sắp chiếu', b'0', '1-201810190.jpg', 27);
INSERT INTO `phim` VALUES ('PH00115', 'Cry - Baby 1990', 100, 0, '2019-03-21', 'Tiếng Anh', 'John Waters.', 'Mỹ', 'Michael Bay', 'Đây là bộ phim đầu tiên đánh dấu tên tuổi của Depp tại Hollywood và cũng là một trong những bộ phim hay nhất của anh, nên đã là Depphead thì không thể bỏ qua phim này.', 'Sắp chiếu', b'0', 'c-201810463.jpg', 28);
INSERT INTO `phim` VALUES ('PH00116', 'Biệt Đội Biển Xanh', 100, 18, '2019-03-21', 'Tiếng Anh', 'Jeff Bennett, Jess Harnell, PHIL LAMARR, Bob Bergen, Dave Fennoy.', 'Mỹ', 'Jerry Bruckheimer', ' Vào năm 2100, khi con người bỏ rơi trái đất, một quần thể sinh vật xa hoa vẫn còn phát triển mạnh trong vực thẳm sâu nhất của đại dương. Deep, một con bạch tuộc \"phiêu lưu\" thích mạo hiểm sống cùng với hai người bạn: Evo, một con cá sấu náo loạn và vụng về, và Alice, một con tôm sâu thần kinh.', 'Sắp chiếu', b'0', '1280x720-qh4-201706435.jpg', 29);
INSERT INTO `phim` VALUES ('PH00117', 'Lữ Đoàn Sói', 140, 13, '2019-03-09', 'Tiếng Hàn Quốc', 'Woo-sung Jung, Hyo-Joo Han.', 'Hàn Quốc', 'Michael Bay', 'Lấy bối cảnh tương lai năm 2029, Illang: The Wolf Brigade kể về một đội quân đặc nhiệm được lập ra để đàn áp tổ chức khủng bố chống lại sự hình thành tổ chức chính phủ chung giữa Nam Hàn và Bắc Hàn. Phim được chuyển thể từ phim hoạt hình Nhật Bản Jin-Roh: The Wolf Brigade (Lữ Đoàn Sói) của đạo diễn Hiroyuki Okiura.', 'Sắp chiếu', b'0', '1-201810497.jpg', 27);
INSERT INTO `phim` VALUES ('PH00118', 'Chiến Binh Bất Đắc Dĩ', 90, 13, '2019-03-04', 'Tiếng Anh', 'Olwen, Hannah Waddingham, Matt Hookings.', 'Mỹ', '', 'là bộ phim xoay quanh thám tử trẻ tuổi phải đối mặt với rất nhiều khó khăn nguy hiểm khi anh săn lùng những tên sát nhân máu lạnh giết người hàng loạt,trong khi đó vợ của anh lại đang hôn mê...', 'Sắp chiếu', b'0', '1-201810824.jpg', 27);
INSERT INTO `phim` VALUES ('PH00119', 'Mặt Nạ Quỷ Dữ', 90, 18, '2019-03-27', 'Tiếng Nhật Bản', 'Yoshizawa Ryo, Tamaki Hiroshi, Mitsuishi Ken, Araki Yuko, Nakamura Tatsuya, Emoto Akira.', 'Nhật Bản', 'James Cameron', 'là con trai út của tập đoàn tài phiệt Kuki. Vì công cuộc huấn luyện Fumihiro trở thành tên ác nhân máu lạnh, ba cậu đã nhận Kaori (Yuko Araki) làm con nuôi. “Tức cảnh Pác Bó”, Fumihiro chính tay giết ba mình để bảo vệ Kaori. Sau một thời gian mất tích, Fumihiro núp sau lớp da Shintani Koichi, người sở hữu gương mặt tuyệt vời của ác quỷ, để bảo vệ Kaori và dấn sâu vào âm mưu đen tối của gia tộc Kuki.', 'Sắp chiếu', b'0', '1-201810961.jpg', 29);
INSERT INTO `phim` VALUES ('PH00120', 'Phấn Chấn', 100, 13, '2019-04-07', 'Tiếng Anh', 'Charles Dance, Eva Green.', 'Mỹ', 'Jerry Bruckheimer', 'Hai chị em trong chuyến du lịch tới một biệt thự hẻo lánh ở vùng thôn quê châu Âu.  Emilie (Eva Green thủ vai) - một nhiếp ảnh gia hướng ngoại,  Ines (do Alicia Vikande thủ vai) một cô gái có tính cách hướng nội, hoàn toàn trái ngược với người chị em của mình. Xung đột nảy sinh trong tính cách cũng như những bí mật trong quá khứ trỗi dậy khiến cho hai cô gái phải đứng trước lựa chọn khó khăn...', 'Sắp chiếu', b'0', '1-201810995.jpg', 29);
INSERT INTO `phim` VALUES ('PH00121', 'Đại Sư Huynh', 90, 13, '2019-04-25', 'Tiếng Trung Quốc', 'Chân Tử Đan.', 'Trung Quốc', 'Joel Silver', 'Một giáo viên trung học mỗi ngày đều đặn tới trường gõ đầu trẻ cho đến một hôm…cậu học sinh do anh chủ nhiệm dính vào rắc rối với một băng đảng xã hội đen và bị bắt cóc. Đó cũng là lúc bí mật của“anh” thầy trước giờ luôn hiền lành, hết mực yêu thương học sinh và có tâm với nghề bị bộc lộ.', 'Sắp chiếu', b'0', '1-201809397.jpg', 27);
INSERT INTO `phim` VALUES ('PH00122', 'Quỷ Dữ Biết Yêu', 120, 13, '2019-04-13', 'Tiếng Anh', 'Muse, Jennie Fahn, Dave Vescio, Riley Egan.', 'Mỹ', 'George Lucas', 'Chàng hoạ sĩ Adam bị cuốn vào chuyện tình đầy ma mị với “Nàng Thơ” bước ra từ trong bức tranh do anh tự hoạ. Niềm vui chưa bao lâu, anh nhanh chóng nhận ra mối nguy hiểm kinh hoàng đến từ người tình bí ẩn này.', 'Sắp chiếu', b'0', '1-201810187.jpg', 27);
INSERT INTO `phim` VALUES ('PH00123', 'Trước Ngày Hủy Diệt Nhân Loại', 100, 13, '2019-04-25', 'Tiếng Nhật Bản', 'Hasegawa Hiroki, Nagasawa Masami, Matsuda Ryuhei, Takasugi Mahiro.', 'Nhật Bản', 'Steven Spielberg', 'Cuộc hôn nhân của Narumi Kase (Masami Nagasawa) và Shinji Kase (Ryuhei Matsuda) đã đến bờ vực rạn nứt. Một ngày nọ, Shinji Kase đột ngột mất tích. Vài ngày sau, anh xuất hiện nhưng có vẻ như đã trở thành một người hoàn toàn khác. Shinji bây giờ tử tế, ngây ngô và dịu dàng hơn trước.', 'Sắp chiếu', b'0', 'truoc-201810704.jpg', 29);
INSERT INTO `phim` VALUES ('PH00124', 'Chạm Đáy Giấc Mơ', 90, 13, '2019-04-21', 'Tiếng Nhật Bản', 'Ippei Sasaki, Masato Shinkawa, Junko Abe, Yuki Sakurai.', 'Nhật Bản', 'Joel Silver', 'Aki Oria (Yuki Sakurai) đến Tokyo vào mười năm trước để trở thành một nữ diễn viên. Nhưng hiện tại ở tuổi 29, cô vẫn chỉ là một phụ tá cho ảo thuật gia. Cô không còn đam mê với công việc và cũng chưa gặt hái thành công nào trong cuộc sống. Chán nản và lạc lối, cô sống vật vờ giữa lằn ranh của thực tại và mộng tưởng. Chuyện phim là sự trôi dạt tâm thức của Aki giữa hai thế giới đó.', 'Sắp chiếu', b'0', '1-201810996.jpg', 29);
INSERT INTO `phim` VALUES ('PH00125', 'Thất Nguyệt Và An Sinh', 100, 13, '2019-04-14', 'Tiếng Trung Quốc', 'Châu Đông Vũ, Mã Tư Thuần.', 'Trung Quốc', 'Steven Spielberg', 'hai cô gái có tính cách đối nghịch, số phận cũng đối nghịch. Nhưng duyên số đã định họ sẽ không bao giờ bị chia cắt dù cuộc đời của cả hai đầy giông bão. Câu chuyện bắt đầu từ cuộc chạm mặt giữa Thượng Hải rộng lớn của An Sinh và chàng trai tên Gia Minh – mối tình ngang trái đã làm sức mẻ tình bạn giữa An Sinh và Thất Nguyệt.', 'Sắp chiếu', b'0', '1-201810609.jpg', 29);
INSERT INTO `phim` VALUES ('PH00126', 'Trí Lực Siêu Phàm', 100, 13, '2019-04-15', 'Tiếng Anh', 'Mandy Moore, Harris Dickinson, Amandla Stenberg, Gwendoline Christie.', 'Mỹ', 'Jerry Bruckheimer', 'Một căn bệnh bí ẩn đã giết chết 98% số trẻ em trên toàn thế giới, 2% sống sót bắt đầu sở hữu những siêu năng lực nguy hiểm.', 'Sắp chiếu', b'0', 'tri-201810900.jpg', 27);
INSERT INTO `phim` VALUES ('PH00127', 'Con Mắt Thứ Ba', 100, 0, '2019-04-21', 'Tiếng Anh', 'Jessica Mila, Bianca Hello, Denny Sumargo.', 'Mỹ', 'Harvey Weinstein', 'Khi người mẹ qua đời, Alia cùng bạn trai David và người em gái Abel rời bỏ Bangkok để về lại ngôi nhà thờ ấu thơ ở Jakarta. Tại đây Abel luôn gặp những chuyện kỳ lạ liên quan đến những âm hồn nhưng không ai tin cô...', 'Sắp chiếu', b'0', '64a285864e7b14302ef7ce5dee395601d73a1df5349feffa92pimgpshfullsizedistr-201809444.jpg', 29);
INSERT INTO `phim` VALUES ('PH00128', 'Ngày Đông Năm Ấy Mình Chia Xa', 90, 13, '2019-05-05', 'Tiếng Nhật Bản', 'Asami Reina, Maiguma Katsuya, Saito Takumi, Yamamoto Mizuki, Kitamura Kazuki, Iwata Takanori.', 'Nhật Bản', 'Joel Silver', 'Kyosuke Yakumo (Takanori Iwata) làm việc như một người viết tự do. Anh có vị hôn thê là Yuriko Matsuda (Mizuki Yamamoto) và họ sắp kết hôn. Để đầu tư cho quyển sách tiếp theo, Kyosuke Yakumo bắt tay điều tra vụ án mạng một cô gái mù xinh đẹp bị thiêu sống. Nghi phạm trong vụ án này là nhiếp ảnh gia Zakayudai Kihara (Takumi Saito).', 'Sắp chiếu', b'0', '1-201810137.jpg', 29);
INSERT INTO `phim` VALUES ('PH00129', 'One And Tow 2018', 100, 18, '2019-05-05', 'Tiếng Anh', 'Elizabeth Reaser, Grant Bowler, Kiernan Shipka.', 'Mỹ', 'Jerry Bruckheimer', 'Zac và Eva sống cùng bố mẹ trong trang trại bí ẩn, được bao quanh bởi một bức tường đồ sộ. Gia đình họ sống và làm việc theo lối những năm 1800 xưa cũ. Khi mẹ của hai anh em bị bệnh nặng, họ khám phá ra những bí mật đen tối ẩn khuất của gia đình và sức mạnh siêu nhiên dịch chuyển tức thời của họ.', 'Sắp chiếu', b'0', 'one-201810562.jpg', 29);
INSERT INTO `phim` VALUES ('PH00130', 'Bố Đầu Nhỏ Con Đầu To: Thiên Tài Xuất Hiện', 100, 18, '2019-05-07', 'Tiếng Anh', 'Đang cập nhật.', 'Mỹ', 'Jerry Bruckheimer', 'Lo lắng cho tương lai của Đầu To ham chơi, mẹ Tạp Dề ủy thác mọi hi vonhj vào kế hoạch “một ngày thành tài” của tay tiến sĩ bí ẩn.', 'Sắp chiếu', b'0', '64a285864e7b14302ef7ce5dee395601d73a1df5349feffa92pimgpshfullsizedistr-201810888.jpg', 27);


INSERT INTO
    `loai_phim`
VALUES
    (27, 'Action movie');

INSERT INTO
    `loai_phim`
VALUES
    (28, 'Comedy');

INSERT INTO
    `loai_phim`
VALUES
    (29, 'Drama');

INSERT INTO
    `loai_phim`
VALUES
    (30, 'Costume dramas');

INSERT INTO
    `loai_phim`
VALUES
    (31, 'Horror');

INSERT INTO
    `loai_phim`
VALUES
    (32, 'Cartoon');

INSERT INTO
    `loai_phim`
VALUES
    (33, 'War');