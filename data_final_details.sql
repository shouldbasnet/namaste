delimiter $$

CREATE TABLE `data_final_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniqueid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data_final_id` int(10) unsigned DEFAULT NULL,
  `component_direction` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tier` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rate_profile_detail_id` int(10) unsigned NOT NULL,
  `rate` double(15,2) NOT NULL,
  `rate_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `hybrid_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `ceiling` double(15,2) NOT NULL,
  `amount` double(15,2) NOT NULL,
  `volume` double(15,2) DEFAULT NULL,
  `call_minutes` double(15,2) NOT NULL,
  `is_vbr` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `billing_operator` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `service_id` int(10) unsigned NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `data_final_details_data_final_id_index` (`data_final_id`),
  CONSTRAINT `data_final_details_data_final_id_foreign` FOREIGN KEY (`data_final_id`) REFERENCES `data_final_amount` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci$$


/*-----------------------------------------------------
create table if not exists `query_log` (
  `callvolumeid` varchar(200) default null,
  `v_query` varchar(2000) default null,
  `execdate` datetime default null
);
/*-----------------------------------------------------
alter table data_final_amount add (start_date date, end_date date); */