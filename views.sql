/*------------------------------------------------------------------*/
create or replace view vw_contracts_ranking as
select a.id, a.operator_id, a.service_id, a.start_date, a.end_date, a.component_direction,
        count(b.end_date)+1 as rank
from  
    contracts a 
left join 
    contracts b 
on 
    a.end_date<b.end_date 
and 
    a.operator_id=b.operator_id 
and 
    a.service_id=b.service_id 
and 
	a.component_direction =b.component_direction
group by 
    a.id, a.operator_id, a.service_id, a.start_date, a.end_date, a.component_direction;
/*------------------------------------------------------------------*/
create or replace view vw_contract_recent
as select * from vw_contracts_ranking where rank=1;
/*------------------------------------------------------------------*/
create or replace view vw_rate_profile_link as
select distinct a.operator_id, a.service_id, a.contract_id, v.tier_detail_id, v.product_id, v.rate_profile_detail_id, is_vbr, rate_type
from 
    rate_profile_details a 
left join 
    vbr_combinations v 
on 
    v.rate_profile_detail_id = a.id
left join
    (select distinct rate_profile_detail_id, rate_type from rate_profiles) rp
on  
    v.rate_profile_detail_id=rp.rate_profile_detail_id
where 
    a.deleted_at is null;
/*-------------------------------------------------------------------*/
create or replace view vw_call_volume_link as
select distinct  
	v.id as uniqueid,
	v.call_duration as duration,
	c.id as contractid,
	o.id as operatorid,
	o.code as operator_code,
	t.id as tierid,
	t.tier_code as tier_code,
	s.id as serviceid,
	s.code as service_code,
	mx.id as recentcontractid,
	p.id as productid,
	p.code as product_code,
	ifnull(vrp.is_vbr,'no') as is_vbr,
	vrp.rate_profile_detail_id,
	vrp.rate_type,
	v.start_date,
	v.end_date,
	v.component_direction
from 
    data_call_volumes v
left join
    operators o
on
    v.operator_code=o.code
left join
    tier_details t
on
    v.tier=t.tier_code
left join
    services s
on
    v.service= s.code
left join
	products p
on
	v.product_code=p.code
left join
    contracts c
on 
    v.start_date >= c.start_date 
and 
    v.end_date<= c.end_date
and 
    o.id= c.operator_id
and
    s.id=c.service_id
and 
	v.component_direction=c.component_direction
left join
    vw_contract_recent mx
on
    mx.operator_id=o.id
and
    mx.service_id=s.id 
and	
	mx.component_direction=v.component_direction
left join 
	vw_rate_profile_link vrp
on	
	vrp.operator_id=o.id
and 
	vrp.service_id=s.id
and	
	vrp.contract_id= coalesce(c.id, mx.id)
and
	vrp.tier_detail_id=t.id
and 
	vrp.product_id = p.id
where 
    v.calculate_flag;
/*-------------------------------------------------------------------*/