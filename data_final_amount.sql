delimiter $$

CREATE TABLE `data_final_amount` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `billing_operator` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `billing_operator_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `component_direction` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `event_duration_minutes` double(15,2) NOT NULL,
  `average_rate` double(15,2) NOT NULL,
  `total_amount` double(15,2) NOT NULL,
  `service_id` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `data_final_amount_service_id_index` (`service_id`),
  CONSTRAINT `data_final_amount_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci$$

