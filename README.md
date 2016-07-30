# namaste
bhoj and sajjan

## vw_contracts_ranking
this view will list all the operators, serviceid and component_direction and rank them in the order of latest to oldest..

## vw_contract_recent
this view will simply pull the records from the first view where rank is 1st (ie; the latest one).

## vw_rate_profile_link
this view will link vbr_combinations, rate_profile_details and rate_profiles tables to pull all the information linking rate_profile to all the ids (operator, service, tier, product)

## vw_call_volume_link
this view contains all the ID and Code information availble in the data.
