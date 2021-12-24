
DROP DATABASE IF EXISTS `MOVIETICKET`;

CREATE DATABASE IF NOT EXISTS `MOVIETICKET` CHARACTER SET utf8 COLLATE utf8_unicode_ci;

USE `MOVIETICKET`;

SET
    time_zone = '+07:00';

DROP TABLE IF EXISTS `nguoi_dung`;

CREATE TABLE IF NOT EXISTS `nguoi_dung`(
    `nguoi_dung_id` INT AUTO_INCREMENT,
    `full_name` VARCHAR(64) NOT NULL,
    `email` VARCHAR(64) NOT NULL,
    `password` VARCHAR(128) NOT NULL,
    `phone` VARCHAR(16),
    `address` VARCHAR(128),
    `vai_tro` TINYINT NOT NULL DEFAULT 1,
    PRIMARY KEY (`nguoi_dung_id`)
) ENGINE InnoDB;

DROP TABLE IF EXISTS `ve_dat`;

CREATE TABLE IF NOT EXISTS `ve_dat`(
    `ve_dat_id` INT AUTO_INCREMENT,
    `id_khach_hang` INT UNSIGNED NOT NULL,
    `id_ve_ban` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`ve_dat_id`)
) ENGINE InnoDB;

DROP TABLE IF EXISTS `ve_ban`;

CREATE TABLE IF NOT EXISTS `ve_ban`(
    `ve_ban_id` INT AUTO_INCREMENT,
    `id_phim` INT UNSIGNED NOT NULL,
    `id_phong_chieu` INT UNSIGNED NOT NULL,
    `id_ghe` INT UNSIGNED NOT NULL,
    `ngay_ban` DATETIME NOT NULL,
    `tong_tien` INT(16) UNSIGNED NOT NULL,
    PRIMARY KEY (`ve_ban_id`)
) ENGINE InnoDB;

DROP TABLE IF EXISTS `loai_ghe`;

CREATE TABLE IF NOT EXISTS `loai_ghe`(
    `loai_ghe_id` INT AUTO_INCREMENT,
    `ten_ghe` VARCHAR(64) NOT NULL,
    PRIMARY KEY (`loai_ghe_id`)
) ENGINE InnoDB;

DROP TABLE IF EXISTS `ghe_ngoi`;

CREATE TABLE IF NOT EXISTS `ghe_ngoi`(
    `ghe_ngoi_id` INT AUTO_INCREMENT,
    `id_phong_chieu` INT UNSIGNED NOT NULL,
    `id_loai_ghe` INT UNSIGNED NOT NULL,
    `da_chon` TINYINT NOT NULL DEFAULT 1,
    `vi_tri_cot` INT(8),
    `vi_tri_day` VARCHAR(64) NOT NULL,
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
    `id_phim` INT UNSIGNED NOT NULL,
    `id_phon_chieu` INT UNSIGNED NOT NULL,
    `gio_bat_dau` DATETIME NOT NULL,
    `gio_ket_thuc` DATETIME NOT NULL,
    `ngay_chieu` DATETIME NOT NULL,
    `gia_ve` INT(16) UNSIGNED NOT NULL,
    PRIMARY KEY (`suat_chieu_id`)
) ENGINE InnoDB;

DROP TABLE IF EXISTS `phim`;

CREATE TABLE IF NOT EXISTS `phim`(
    `phim_id` INT AUTO_INCREMENT,
    `id_loai_phim` INT UNSIGNED NOT NULL,
    `ten_phim` VARCHAR(64) NOT NULL,
    `thoi_luong` DATETIME NOT NULL,
    `gioi_han_tuoi` INT(16) UNSIGNED NOT NULL,
    `ngon_ngu` VARCHAR(64) NOT NULL,
    `quoc_gia` VARCHAR(64) NOT NULL,
    `tom_tat` VARCHAR(128),
    `trang_thai` TINYINT NOT NULL DEFAULT 1,
    `ngung_chieu` TINYINT NOT NULL DEFAULT 1,
    PRIMARY KEY (`phim_id`)
) ENGINE InnoDB;

DROP TABLE IF EXISTS `loai_phim`;

CREATE TABLE IF NOT EXISTS `loai_phim`(
    `loai_phim_id` INT AUTO_INCREMENT,
    `ten_loai_phim` VARCHAR(64) NOT NULL,
    PRIMARY KEY (`loai_phim_id`)
) ENGINE InnoDB;


