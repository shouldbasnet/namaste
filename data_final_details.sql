delimiter $$

create table if not exists `data_final_details` (
  `id` int(10) unsigned not null auto_increment,
  `uniqueid` varchar(255) collate utf8_unicode_ci not null,
  `data_final_id` int(10) unsigned default null,
  `component_direction` varchar(2) default null,
  `tier` varchar(255) collate utf8_unicode_ci not null,
  `product` varchar(255) collate utf8_unicode_ci not null,
  `rate_profile_detail_id` int(10) unsigned not null,
  `rate` double(15,2) not null,
  `rate_type` varchar(20) collate utf8_unicode_ci not null,
  `hybrid_type` varchar(20) collate utf8_unicode_ci not null,
  `ceiling` double(15,2) not null,
  `amount` double(15,2) not null,
  `volume` double(15,2) default null,
  `call_minutes` double(15,2) not null,
  `is_vbr` varchar(5) collate utf8_unicode_ci not null,
  `deleted_at` timestamp null default null,
  `created_at` timestamp null default null,
  `updated_at` timestamp null default null,
  `billing_operator` varchar(255) collate utf8_unicode_ci not null,
  `service_id` int(10) unsigned not null,
  `start_date` date not null,
  `end_date` date not null,
  primary key (`id`),
  key `data_final_details_data_final_id_index` (`data_final_id`),
  constraint `data_final_details_data_final_id_foreign` foreign key (`data_final_id`) references `data_final_amount` (`id`) on delete no action on update no action
) engine=innodb auto_increment=5 default charset=utf8 collate=utf8_unicode_ci$$

/*-----------------------------------------------------*/
create table if not exists `query_log` (
  `callvolumeid` varchar(200) default null,
  `v_query` varchar(2000) default null,
  `execdate` datetime default null
);
/*-----------------------------------------------------*/
alter table data_final_amount add (start_date date, end_date date);